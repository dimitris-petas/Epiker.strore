using Epiker.api.Dto;
using FluentValidation;

namespace Epiker.api.Validation
{
    public class RegisterValidator : AbstractValidator<RegisterDto>
    {
        public RegisterValidator()
        {
            RuleFor(x => x.DisplayName).Length(5, 50).WithMessage("User name must have 3 to 50 charachters");
            RuleFor(x => x.Password).NotEmpty();//.Matches(@"(?= ^.{ 6,10}$)(?=.*\\d)(?=.*[a - z])(?=.*[A - Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\\s).*$");
            RuleFor(x => x.Email).NotEmpty().WithMessage("Email address is required")
                     .EmailAddress().WithMessage("A valid email is required");
        }
    }
}