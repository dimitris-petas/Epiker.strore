using Core.Entities;
using System.Collections.Generic;

namespace Epiker.api.Dto
{
    public class CustomerBasketDto
    {
        public string Id { get; set; }

        public List<BasketItemDto> Items { get; set; }

        public int? DeliveryMethodId { get; set; }

        public string ClientSecret { get; set; }

        public string PaymentIntentId { get; set; }

        public decimal ShippingPrice { get; set; }
    }
}