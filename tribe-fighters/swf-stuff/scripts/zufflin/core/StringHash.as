package zufflin.core
{
   public class StringHash
   {
      
      public static const FNV_32_PRIME:uint = 16777619;
      
      public static const FNV_OFFSET_BASIS:uint = 2166136261;
       
      
      public var hash:uint;
      
      public function StringHash(param1:String = null)
      {
         super();
         this.hash = 0;
         if(param1 != null)
         {
            this.set(param1);
         }
      }
      
      public function set(param1:String) : void
      {
      }
      
      public function set2() : void
      {
      }
   }
}
