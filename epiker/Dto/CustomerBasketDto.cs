using Core.Entities;
using System.Collections.Generic;

namespace Epiker.api.Dto
{
    public class CustomerBasketDto
    {
        public string Id { get; set; }

        public IList<BasketItemDto> BasketItems { get; set; } = new List<BasketItemDto>();
    }
}