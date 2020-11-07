using AutoMapper;
using Core.Entities;
using Epiker.api.Dto;
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
                .ForMember(d => d.PictureUrl, o => o.MapFrom<ProductUrlResolver>());

            CreateMap<AddressDto, Address>()
                .ReverseMap();

            CreateMap<CustomerBasketDto, CustomerBasket>()
                .ReverseMap();

            CreateMap<BasketItemDto, BasketItem>()
                .ReverseMap();

        }
    }
}