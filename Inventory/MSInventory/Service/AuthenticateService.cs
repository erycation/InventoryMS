using BCryptNet = BCrypt.Net.BCrypt;
using MSInventory.Model.Dtos;
using MSInventory.Model.Request;
using MSInventory.Service.Interface;
using System.Threading.Tasks;

namespace MSInventory.Service
{
    public class AuthenticateService : IAuthenticateService
    {

        private IUsersService _userService;
        private IAuthManager _authManager;

        public AuthenticateService(IUsersService userService,
                                     IAuthManager authManager)
        {

            _userService = userService;
            _authManager = authManager;

        }

        public async Task<AuthToken> Login(Credentials credentials)
        {
            var authToken = new AuthToken();

            var userResponse = await _userService.GetUserByCredentials(credentials.Username);

            if (userResponse == null || !BCryptNet.Verify(credentials.Password, userResponse.Password))
            {
                authToken.Message = $"Username or password is incorrect";
            }
            else if(userResponse.Active == false)
            {
                authToken.Message = $"Account is locked";
            }
            else
            {
                authToken.Username = userResponse.Username;
                authToken.UserId = userResponse.Id;
                authToken.Success = true;
                authToken.Firstname = userResponse.Firstname;
                authToken.Surname = userResponse.Surname;
                authToken.RoleDescription = userResponse.RoleDescription;
                authToken.VendorId = userResponse.Vendor.Id;
                authToken.VendorName = userResponse.Vendor.Name;
                authToken.VendorType = userResponse.Vendor.Type;                
                authToken.Token = _authManager.Authenticate(credentials.Username);
            }

            return authToken;
        }
    }
}
