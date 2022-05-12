

using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Shared.Utils;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface IUsersService
    {        
        Task<User> GetUserByCredentials(string userName);
        Task<UserDto> AddUser(UserDto userDto);
        Task<UserDto> UpdateUser(UserDto userDto);
        Task<UserDto> GetUserById(Guid userId);
        Task<List<UserDto>> GetAllUsers();
        Task<List<UserDto>> GetUsersByRole(string userRole);
    }
}
