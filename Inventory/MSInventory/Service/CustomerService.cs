

using Microsoft.EntityFrameworkCore;
using MSInventory.Model;
using MSInventory.Model.Dtos;
using MSInventory.Repository.Interface;
using MSInventory.Service.Interface;
using MSInventory.Shared.Helpers;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;

namespace MSInventory.Service
{
    public class CustomerService : ICustomerService
    {

        private readonly ICustomerRepository _customerRepository;
        private IVendorService _vendorService;

        public CustomerService(ICustomerRepository customerRepository,
                                IVendorService vendorService)
        {
            _customerRepository = customerRepository;
            _vendorService = vendorService;
        }

        public async Task<CustomerDto> AddCustomer(CustomerDto customerDto)
        {

            var customerEmail = await _customerRepository.GetAll().FirstOrDefaultAsync(x => x.EmailAddress == customerDto.EmailAddress);
            if (customerEmail != null)
                throw new AppException($"Email Address Already Exist.");

            var customerPhone = await _customerRepository.GetAll().FirstOrDefaultAsync(x => x.CellphoneNo == customerDto.CellphoneNo);
            if (customerPhone != null)
                throw new AppException($"Phone Number Already Exist.");

            var vendorResponse = await _vendorService.GetVendorByName("Customer");
            if (vendorResponse == null)
                throw new AppException($"Customer Location Not Configured");
            customerDto.LocationId = vendorResponse.VendorId;

            var requestCustomer = new Customer
            {               
                Code = $"{DateTime.Now:yyyyMMddHHmmss}",
                FirstName = customerDto.FirstName,
                Surname = customerDto.Surname,
                CellphoneNo = customerDto.CellphoneNo,
                EmailAddress = customerDto.EmailAddress,
                LocationId = customerDto.LocationId
            };

            var responseCustomer = await _customerRepository.AddAsync(requestCustomer);
            return responseCustomer != null ? new CustomerDto(responseCustomer) : throw new AppException($"Failed To Create User");
        }

        public async Task<CustomerDto> GetCustomerById(Guid customerId)
        {
            var customer = await _customerRepository.GetAll().FirstOrDefaultAsync(x => x.Id == customerId);
            return customer != null ? new CustomerDto(customer) : throw new AppException($"Customer Not Found");
        }

        public async Task<List<CustomerDto>> GetCustomerBySearch(string searchParameter)
        {
            var customersDto = new List<CustomerDto>();
            var customers = await _customerRepository.GetAll().Where(c => c.FirstName.Contains(searchParameter)).ToListAsync();
            foreach (var customer in customers)
            {
                customersDto.Add(new CustomerDto(customer));
            }
            return customersDto;
        }

        public Task<CustomerDto> UpdateCustomer(CustomerDto customerDto)
        {
            throw new NotImplementedException();
        }

        //public async Task<VendorDto> AddVendor(VendorDto vendorDto)
        //{

        //    var branchResults = await _vendorRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(b => b.Name.Replace(" ", String.Empty) == vendorDto.VendorName.Replace(" ", String.Empty));
        //    if (branchResults != null)
        //        throw new AppException($"Vendor {vendorDto.VendorName} Already Exist");

        //    var requestBranch = new Vendor
        //    {
        //        Name = vendorDto.VendorName
        //    };

        //    var responseBranch = await _vendorRepository.AddAsync(requestBranch);
        //    return responseBranch != null ? new VendorDto(responseBranch) : throw new AppException($"Failed To Create Branch");
        //}

        //public async Task<VendorDto> UpdateVendor(VendorDto vendorDto)
        //{
        //    var branchResults = await _vendorRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(b => b.Name.Replace(" ", String.Empty) == vendorDto.VendorName.Replace(" ", String.Empty) && b.Id != vendorDto.VendorId);
        //    if (branchResults != null)
        //        throw new AppException($"Vendor {vendorDto.VendorName} Already Exist");

        //    var branch = await _vendorRepository.GetAll().AsNoTracking().FirstOrDefaultAsync(b => b.Id == vendorDto.VendorId);
        //    if (branch == null)
        //        throw new AppException($"Vendor {vendorDto.VendorName} Not Exist");

        //    var requestVendor = new Vendor
        //    {
        //        Id = vendorDto.VendorId,
        //        Name = vendorDto.VendorName
        //    };

        //    var responseBranch = await _vendorRepository.UpdateAsync(requestVendor);
        //    return responseBranch != null ? new VendorDto(responseBranch) : throw new AppException($"Failed To Update Vendor");
        //}
        //public async Task<VendorDto> GetVendorById(Guid vendorId)
        //{
        //    var vendor = await _vendorRepository.GetAll().FirstOrDefaultAsync(x => x.Id == vendorId);
        //    return new VendorDto(vendor);
        //}

        //public async Task<List<VendorDto>> GetAllVendors()
        //{
        //    var vendorsDto = new List<VendorDto>();
        //    var vendors = await _vendorRepository.GetAll().ToListAsync();
        //    foreach (var vendor in vendors)
        //    {
        //        vendorsDto.Add(new VendorDto(vendor));
        //    }
        //    return vendorsDto;
        //}
    }
}
