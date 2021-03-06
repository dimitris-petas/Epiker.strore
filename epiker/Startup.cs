using AutoMapper;
using Epiker.api.Dto;
using Epiker.api.Extensions;
using Epiker.api.Mapping;
using Epiker.api.Middleware;
using Epiker.api.Validation;
using FluentValidation;
using FluentValidation.AspNetCore;
using Infrastructure.Data;
using Infrastructure.Identity;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using StackExchange.Redis;

namespace epiker
{
    public class Startup
    {
        private readonly IConfiguration _config;

        //We can acceess appsettings values from the configuration
        public Startup(IConfiguration config)
        {
            _config = config;
        }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //Enything that has to do with controller must be bellow the AddControllers
            services.AddControllers();

            //We have create a static function that makes some part of the registrations
            services.AddApplicationServices();

            services.AddIdentityServices(_config);

            services.AddSwaggerDocumentation();

            services.AddDbContext<StoreContext>(x => x.UseSqlite(_config.GetConnectionString("DefaultConnection")));

            services.AddDbContext<AppIdentityDbContext>(x =>
            {
                x.UseSqlite(_config.GetConnectionString("IdentityConnection"));
            });

            services.AddSingleton<IConnectionMultiplexer>(c =>
            {
                var coonfiguration = ConfigurationOptions.Parse(_config.GetConnectionString("Redis"), true);
                return ConnectionMultiplexer.Connect(coonfiguration);
            });

            services.AddMvc(setup =>
            {
            }).AddFluentValidation(fv =>
            {
                fv.ImplicitlyValidateChildProperties = true;
            });

            services.AddTransient<IValidator<UserDto>, UserValidator>();
            services.AddTransient<IValidator<RegisterDto>, RegisterValidator>();
            services.AddTransient<IValidator<AddressDto>, AddressValidator>();
            services.AddTransient<IValidator<BasketItemDto>, BasketItemValidator>();

            services.AddAutoMapper(typeof(MappingProfiles));

            services.AddCors(opt =>
            {
                opt.AddPolicy("CorsPolicy", policy =>
                 {
                     policy.AllowAnyHeader().AllowAnyMethod().WithOrigins("https://localhost:4200");
                 });
            });
        }

        //Midleware
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            //If we are in the dev mode then we will se a development fliendly exception page
            app.UseMiddleware<ExceptionMiddleware>();

            app.UseStatusCodePagesWithRedirects("/errors/{0}");

            //Redirect us to the https address
            app.UseHttpsRedirection();

            //Get us to the controller
            app.UseRouting();

            //We need this in order to server static content from our api
            app.UseStaticFiles();

            app.UseCors("CorsPolicy");

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseSwaggerDocumention();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}