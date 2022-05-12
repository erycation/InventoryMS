

using Microsoft.EntityFrameworkCore;
using m2esolution.co.za.MSInventory.Model;
using m2esolution.co.za.MSInventory.Model.Dtos;
using m2esolution.co.za.MSInventory.Repository.Interface;
using m2esolution.co.za.MSInventory.Service.Interface;
using m2esolution.co.za.MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using m2esolution.co.za.MSInventory.Shared.Enum;

namespace m2esolution.co.za.MSInventory.Service
{
    public class RoleService : IRoleService
    {


        public RoleService()
        {

        }

        public List<RoleDto> GetAllRoles()
        {
            var rolesDto = new List<RoleDto>();
            foreach (string role in Enum.GetNames(typeof(UserRoleEnum)))
            {
                rolesDto.Add(new RoleDto { RoleName = role });
            }
            return rolesDto;
        }
    }
}
