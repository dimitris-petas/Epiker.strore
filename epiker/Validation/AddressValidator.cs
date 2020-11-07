using Epiker.api.Dto;
using FluentValidation;

namespace Epiker.api.Validation
{
    public class AddressValidator : AbstractValidator<AddressDto>
    {
        public AddressValidator()
        {
            RuleFor(x => x.Zipcode).NotEmpty().Length(4, 7).WithMessage("Zipcode must have 4 to 7 charachters");
            RuleFor(x => x.FirstName).NotEmpty().WithMessage("FirstName is required");
            RuleFor(x => x.LastName).NotEmpty().WithMessage("LastName is required");
            RuleFor(x => x.State).NotEmpty().WithMessage("State is required");
            RuleFor(x => x.Street).NotEmpty().WithMessage("Street is required");
            RuleFor(x => x.City).NotEmpty().WithMessage("City is required");
        }
    }
}