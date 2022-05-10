
using BCryptNet = BCrypt.Net.BCrypt;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using m2esolution.co.za.MSInventory.Shared.Helpers;
using Microsoft.EntityFrameworkCore;
using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Repository.Interface;
using m2esolution.co.za.MSInventory.Service.Interface;

namespace m2esolution.co.za.MSInventory.Service
{
    public class UsersService : IUsersService
    {
        private readonly IUserRepository _userRepository;

        public UsersService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<User> GetUserByCredentials(string userName)
        {
            return await _userRepository.GetAll().FirstOrDefaultAsync(x => x.Username == userName);
        }

        public async Task<UserDto> AddUser(UserDto userDto)
        {

            if (await GetUserByCredentials(userDto.Username) != null)
                throw new AppException($"Username {userDto.Username} Already Exist.");

            var requestUser = new User
            {
                Firstname = userDto.Firstname,
                Surname = userDto.Surname,
                Username = userDto.Username,
                Password = BCryptNet.HashPassword(userDto.Password),
                Active = true,
                VendorId = userDto.VendorId,
                RoleDescription = userDto.RoleDescription

            };

            var responseUser = await _userRepository.AddAsync(requestUser);
            return responseUser != null ? new UserDto(responseUser) : throw new AppException($"Failed to create user");
        }
     
        public async Task<UserDto> UpdateUser(UserDto userDto)
        {

            var user = await _userRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(x => x.Id == userDto.UserId);
            if (user == null)
                throw new AppException($"User Not Found");

            var requestUser = new User
            {
                Id = userDto.UserId,
                Firstname = userDto.Firstname,
                Surname = userDto.Surname,
                Username = userDto.Username,
                Active = userDto.Active,
                VendorId = userDto.VendorId,
                RoleDescription = userDto.RoleDescription,
                Password = user.Password
            };

            var responseUser = await _userRepository.UpdateAsync(requestUser);
            return responseUser != null ? new UserDto(responseUser) : throw new AppException($"Failed to update user");           
        }

        public async Task<UserDto> GetUserById(Guid userId)
        {
            var responseUser = await _userRepository.GetAll().FirstOrDefaultAsync(x => x.Id == userId);
            return responseUser != null ? new UserDto(responseUser) : throw new AppException($"Cannot find user");
        }

        public async Task<List<UserDto>> GetAllUsers()
        {
            var usersDto = new List<UserDto>();
            var users = await _userRepository.GetAll().ToListAsync();
            foreach(var user in users)
            {
                usersDto.Add(new UserDto(user));
            }
            return usersDto;
        }        
    }
}
