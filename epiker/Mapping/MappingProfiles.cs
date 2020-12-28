using AutoMapper;
using Core.Entities;
using Core.Entities.OrderAggregate;
using Epiker.api.Dto;
using Epiker.api.Extensions;
using Epiker.api.Helpers;

namespace Epiker.api.Mapping
{
    public class MappingProfiles : Profile
    {
        public MappingProfiles()
        {
            CreateMap<Product, ProductDto>()
                .ForMember(d => d.ProductBrand, o => o.MapFrom(s => s.ProductBrand.Name))
                .ForMember(d => d.ProductType, o => o.MapFrom(s => s.ProductType.Name))
                .ForMember(d => d.Picture, o => o.MapFrom<ProductUrlResolver>());

            CreateMap<Core.Entities.Address, AddressDto>()
                .ReverseMap();

            CreateMap<CustomerBasketDto, CustomerBasket>();

            CreateMap<BasketItemDto, BasketItem>();

            CreateMap<AddressDto, Core.Entities.OrderAggregate.Address>();

            CreateMap<Order, OrderToReturnDto>()
                .ForMember(d => d.DeliveryMethod, o => o.MapFrom(s => s.DeliveryMethod.ShortName))
                .ForMember(d => d.ShippingPrice, o => o.MapFrom(s => s.DeliveryMethod.Price));

            CreateMap<OrderItem, OrderItemDto>()
                .ForMember(d => d.ProductId, o => o.MapFrom(s => s.ItemOrdered.ProductItemId))
                .ForMember(d => d.ProductName, o => o.MapFrom(s => s.ItemOrdered.ProductName))
                .ForMember(d => d.Picture, o => o.MapFrom(s => s.ItemOrdered.Picture))
                .ForMember(d => d.Picture, o => o.MapFrom<OrderItemUrlResolver>());
        }
    }
}