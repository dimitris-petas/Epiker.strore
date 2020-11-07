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
            RuleFor(x => x.Price).GreaterThan(0.1m).NotEmpty();
            RuleFor(x => x.Quantity).GreaterThan(1).NotEmpty();
            RuleFor(x => x.PictureUrl).NotEmpty();
            RuleFor(x => x.Brand).NotEmpty();
            RuleFor(x => x.Type).NotEmpty();
        }
    }
}