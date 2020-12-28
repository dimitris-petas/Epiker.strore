using Epiker.api.Dto;
using FluentValidation;

namespace Epiker.api.Validation
{
    public class BasketItemValidator : AbstractValidator<BasketItemDto>
    {
        public BasketItemValidator()
        {
            RuleFor(x => x.Id).NotEmpty();
            RuleFor(x => x.ProductName).NotEmpty();
            RuleFor(x => x.Price).GreaterThan(0.000001m).NotEmpty();
            RuleFor(x => x.Quantity).GreaterThanOrEqualTo(1).NotEmpty();
            RuleFor(x => x.Picture).NotEmpty();
            RuleFor(x => x.Brand).NotEmpty();
            RuleFor(x => x.Type).NotEmpty();
        }
    }
}