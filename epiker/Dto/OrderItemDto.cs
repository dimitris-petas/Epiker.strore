using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Epiker.api.Dto
{
    public class OrderItemDto
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Picture { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
    }
}