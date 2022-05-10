using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
{
    public class UserDto
    {

        public UserDto()
        {

        }
        public UserDto(User user)
        {
            UserId = user.Id;
            Firstname = user.Firstname;
            Surname = user.Surname;
            Username = user.Username;
            Active = user.Active;
            VendorId = user.VendorId;
            RoleDescription = user.RoleDescription;
            VendorName = user.Vendor?.Name;
        }

        public Guid UserId { get; set; }
        public string Firstname { get; set; }
        public string Surname { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public bool Active { get; set; }
        public Guid VendorId { get; set; }
        public string RoleDescription { get; set; }
        public string VendorName { get; set; }
        public string UserStatus
        {
            get
            {
                return Active == true? "Active" : "Not Active";
            }
        }
    }
}
