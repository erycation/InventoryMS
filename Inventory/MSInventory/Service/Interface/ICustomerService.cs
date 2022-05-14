
using m2esolution.co.za.MSInventory.Model.Dtos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace m2esolution.co.za.MSInventory.Service.Interface
{
    public interface ICustomerService
    {
        Task<CustomerDto> AddCustomer(CustomerDto customerDto);
        Task<CustomerDto> UpdateCustomer(CustomerDto customerDto);
        Task<CustomerDto> GetCustomerById(Guid customerId);
        Task<List<CustomerDto>> GetCustomerBySearch(string searchParameter);
    }
}
