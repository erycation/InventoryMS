using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
{
    public class CustomerDto
    {

        public CustomerDto()
        {

        }
        public CustomerDto(Customer customer)
        {
            CustomerId = customer.Id;
            DateInserted = customer.DateInserted;
            Code = customer.Code;
            FirstName = customer.FirstName;
            Surname = customer.Surname;
            CellphoneNo = customer.CellphoneNo;
            EmailAddress = customer.EmailAddress;
            LocationId = customer.LocationId;
        }

        public Guid CustomerId { get; set; }
        public DateTime DateInserted { set; get; }
        public string Code { get; set; }
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public string CellphoneNo { get; set; }
        public string EmailAddress { get; set; }
        public Guid? LocationId { get; set; }
        public string Fullnames
        {
            get
            { return $"{FirstName} {Surname}"; }

        }
    }
}
