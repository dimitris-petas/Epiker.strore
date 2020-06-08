namespace Epiker.api.Errors
{
    public class ApiResponse
    {
        public ApiResponse(int statusCode, string message = null)
        {
            StatusCode = statusCode;
            Message = message ?? GetDefaultMessageForStatusCode(statusCode);
        }

        public int StatusCode { get; set; }

        public string Message { get; set; }

        private string GetDefaultMessageForStatusCode(int statuScode)
        {
            return statuScode switch
            {
                400 => "A bad request, you have made",
                401 => "Authorized, you are not",
                404 => "Authorized, you are not",
                500 => "Errors are the path to the dark side.Errors leads to ange." +
                " Anger leads to hate. Hate leads to career change",
                _ => null
            };
        }
    }
}