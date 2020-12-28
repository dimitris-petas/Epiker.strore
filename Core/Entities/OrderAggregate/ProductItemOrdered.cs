using System;
using System.Collections.Generic;
using System.Text;

namespace Core.Entities.OrderAggregate
{
    public class ProductItemOrdered
    {
        public ProductItemOrdered()
        {

        }

        public ProductItemOrdered(int productItemId, string productName, string picture)
        {
            ProductItemId = productItemId;
            ProductName = productName;
            Picture = picture;
        }

        public int ProductItemId { get; set; }
        public string ProductName { get; set; }
        public string Picture { get; set; }
    }
}
