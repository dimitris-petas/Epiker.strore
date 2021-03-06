﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Epiker.api.Dto
{
    public class BasketItemDto
    {
        public int Id { get; set; }

        public string ProductName { get; set; }

        public decimal Price { get; set; }

        public int Quantity { get; set; }

        public string Picture { get; set; }

        public string Brand { get; set; }

        public string Type { get; set; }
    }
}
