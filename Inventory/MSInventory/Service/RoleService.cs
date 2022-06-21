

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using MSInventory.Shared.Enum;

namespace MSInventory.Service
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
        public List<RoleDto> GetAllNonCustomerRoles()
        {
            var rolesDto = new List<RoleDto>();
            foreach (string role in Enum.GetNames(typeof(UserRoleEnum)))
            {
                if (role.ToLower() != "customer")
                    rolesDto.Add(new RoleDto { RoleName = role });
            }
            return rolesDto;
        }
    }
}
