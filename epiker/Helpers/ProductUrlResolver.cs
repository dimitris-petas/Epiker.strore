using AutoMapper;
using Core.Entities;
using Epiker.api.Dto;
using Microsoft.Extensions.Configuration;

namespace Epiker.api.Helpers
{
    public class ProductUrlResolver : IValueResolver<Product, ProductDto, string>
    {
        private readonly IConfiguration _config;

        public ProductUrlResolver(IConfiguration config)
        {
            _config = config;
        }

        public string Resolve(Product source, ProductDto destination, string destMember, ResolutionContext context)
        {
            if (!string.IsNullOrEmpty(source.Picture))
            {
                return _config["ApiUrl"] + source.Picture;
            }

            return null;
        }
    }
}