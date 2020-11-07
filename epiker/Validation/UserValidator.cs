using Epiker.api.Dto;
using FluentValidation;

namespace Epiker.api.Validation
{
    public class UserValidator : AbstractValidator<UserDto>
    {
        public UserValidator()
        {
            RuleFor(x => x.DisplayName).Length(5, 50).WithMessage("User name must have 5 to 50 charachters");
            RuleFor(x => x.Email).NotEmpty().WithMessage("Email address is required")
                     .EmailAddress().WithMessage("A valid email is required");
        }
    }
}