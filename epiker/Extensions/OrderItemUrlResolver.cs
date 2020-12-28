using AutoMapper;
using Core.Entities.OrderAggregate;
using Epiker.api.Dto;
using Microsoft.Extensions.Configuration;

namespace Epiker.api.Extensions
{
    public class OrderItemUrlResolver : IValueResolver<OrderItem, OrderItemDto, string>
    {
        private readonly IConfiguration _config;

        public OrderItemUrlResolver(IConfiguration config)
        {
            _config = config;
        }

        public string Resolve(OrderItem source, OrderItemDto destination, string destMember, ResolutionContext context)
        {
            if (!string.IsNullOrEmpty(source.ItemOrdered.Picture))
            {
                return _config["ApiUrl"] + source.ItemOrdered.Picture;
            }

            return null;
        }
    }
}