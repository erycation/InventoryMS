using Microsoft.AspNetCore.Mvc;
using MSInventory.Model.Dtos;
using MSInventory.Service.Interface;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUsersService _usersService;

        public UserController(IUsersService usersService)
        {
            _usersService = usersService;
        }

        [HttpPost("Add")]
        public async Task<IActionResult> AddUser([FromBody] UserDto userDto)
        {
            var response = await _usersService.AddUser(userDto);
            return Ok(new { message = $"User Successfully Created.", data = response });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> UpdateUser([FromBody] UserDto userDto)
        {
            var response = await _usersService.UpdateUser(userDto);
            return Ok(new { message = $"User Successfully Updated.", data = response });
        }

        [HttpGet("Get/{userId}")]
        public async Task<UserDto> GetUserById(Guid userId)
        {
            return await _usersService.GetUserById(userId);
        }

        [HttpGet("GetAll")]
        public async Task<List<UserDto>> GetAllUsers()
        {
            return await _usersService.GetAllUsers();
        }

        [HttpGet("Role/{userRole}")]
        public async Task<List<UserDto>> GetUsersByRole(string userRole)
        {
            return await _usersService.GetUsersByRole(userRole);
        }
    }
}
