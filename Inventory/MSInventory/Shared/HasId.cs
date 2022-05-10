using System;

namespace MSPOSAdmin.Shared
{
    public abstract class HasId
    {
        public Guid Id { set; get; } = Guid.NewGuid(); 
    }
}
