using AutoMapper;
using Epiker.api.Extensions;
using Epiker.api.Mapping;
using Epiker.api.Middleware;
using Infrastructure.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

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

            services.AddSwaggerDocumentation();

            services.AddDbContext<StoreContext>(x => x.UseSqlite(_config.GetConnectionString("DefaultConnection")));

            services.AddAutoMapper(typeof(MappingProfiles));
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

            app.UseAuthorization();

            app.UseSwaggerDocumentation();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}