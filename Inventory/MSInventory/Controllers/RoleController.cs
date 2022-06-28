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
    public class RoleController : ControllerBase
    {
        private readonly IRoleService _roleService;

        public RoleController(IRoleService roleService)
        {
            _roleService = roleService;
        }

        [HttpGet("GetAll")]       
        public ActionResult<List<RoleDto>> GetAllRoles()
        {
            return _roleService.GetAllRoles();
        }

        [HttpGet("Get/{vendorType}")]
        public ActionResult<List<RoleDto>> GetAllRolesByVendorType(string vendorType)
        {
            return _roleService.GetAllRolesByVendorType(vendorType);
        }

        [HttpGet("NonCustomer/All")]
        public ActionResult<List<RoleDto>> GetAllNonCustomerRoles()
        {
            return _roleService.GetAllNonCustomerRoles();
        }
    }
}
