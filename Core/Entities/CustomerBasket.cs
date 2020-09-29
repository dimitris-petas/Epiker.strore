using System;
using System.Collections.Generic;
using System.Text;

namespace Core.Entities
{
    public class CustomerBasket
    {
        public CustomerBasket()
        {

        }

        public CustomerBasket(string id)
        {
            Id = id;
        }

        public string Id { get; set; }

        public IList<BasketItems> Items { get; set; } = new List<BasketItems>();
    }
}
