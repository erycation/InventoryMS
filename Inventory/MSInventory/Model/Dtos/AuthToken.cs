
using System;

namespace m2esolution.co.za.MSInventory.Model.Dtos
{
    public class AuthToken
    {
        public Guid UserId { get; set; }
        public string Username { get; set; }
        public string FullName { get; set; }
        public string Firstname { get; set; }
        public string Surname { get; set; }
        public bool Success { get; set; }
        public string Message { get; set; }
        public string Token { get; set; }
        public string RoleDescription { get; set; }
        public Guid VendorId { get; set; }
        public string VendorName { get; set; }
    }
}
