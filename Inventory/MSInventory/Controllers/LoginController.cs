
using Microsoft.AspNetCore.Mvc;
using m2esolution.co.za.MSInventory.Model.Request;
using m2esolution.co.za.MSInventory.Service.Interface;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {

        private IAuthenticateService _authenticateService;

        public LoginController(IAuthenticateService authenticateService)
        {

            _authenticateService = authenticateService;

        }

        [HttpPost]
        public async Task<IActionResult> Login([FromBody] Credentials credentials)
        {
            var token =  await _authenticateService.Login(credentials);

            if (!token.Success)
                return BadRequest(new { message = token.Message });

            return Ok(token);
        }
    }
}
