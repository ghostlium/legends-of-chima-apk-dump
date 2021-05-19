package zufflin.core
{
   public class zObject
   {
       
      
      public var name:String;
      
      public function zObject()
      {
         super();
      }
      
      public function setName(param1:String) : void
      {
         this.name = param1;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function dispose() : void
      {
         this.name = null;
      }
   }
}
