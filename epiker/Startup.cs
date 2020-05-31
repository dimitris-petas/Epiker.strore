using AutoMapper;
using Epiker.api.Mapping;
using Infrastructure;
using Infrastructure.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

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
            //Register Generics interfaces
            services.AddScoped(typeof(IGenericRepository<>),(typeof(GenericRepository<>)));
            
            services.AddScoped<IProductRepository, ProductRepository>();
            
            services.AddControllers();
            
            services.AddDbContext<StoreContext>(x => x.UseSqlite(_config.GetConnectionString("DefaultConnection")));

            services.AddAutoMapper(typeof(MappingProfiles));
        }

        //Midleware
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            //If we are in the dev mode then we will se a development fliendly exception page
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            //Redirect us to the https address
            app.UseHttpsRedirection();

            //Get us to the controller
            app.UseRouting();

            //We need this in order to server static content from our api
            app.UseStaticFiles();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}