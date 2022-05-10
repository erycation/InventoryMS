
using System.Collections;

namespace m2esolution.co.za.MSInventory.Shared.Utils
{
    public static class ObjectUtil
    {
        public static bool IsCollectionValid(this ICollection collection)
        {
            if (collection == null)
                return false;
            if (collection.Count == 0)
                return false;
            return true;
        }
    }
}