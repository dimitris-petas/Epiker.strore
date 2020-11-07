using System.ComponentModel.DataAnnotations;

namespace Epiker.api.Dto
{
    public class AddressDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Street { get; set; }

        public string City { get; set; }

        public string State { get; set; }

        public string Zipcode { get; set; }
    }
}