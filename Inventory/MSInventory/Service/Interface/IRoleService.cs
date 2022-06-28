
using MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MSInventory.Service.Interface
{
    public interface IRoleService
    {
        List<RoleDto> GetAllRoles();
        List<RoleDto> GetAllRolesByVendorType(string vendorType);
        List<RoleDto> GetAllNonCustomerRoles();
    }
}
