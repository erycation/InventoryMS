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
    public class CustomerController : ControllerBase
    {
        private readonly ICustomerService _customerService;

        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] CustomerDto customerDto)
        {
            var response = await _customerService.AddCustomer(customerDto);
            return Ok(new { message = $"Customer Code {response.Code}", data = response });
        }

        [HttpGet("Get/{customerId}")]
        public async Task<CustomerDto> GetCustomerById(Guid customerId)
        {
            return await _customerService.GetCustomerById(customerId);
        }

        [HttpGet("Search/{searchParameter}")]
        public async Task<List<CustomerDto>> GetCustomerBySearch(string searchParameter)
        {
            return await _customerService.GetCustomerBySearch(searchParameter);
        }
    }
}
