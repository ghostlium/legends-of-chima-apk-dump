package zufflin.cobraBase
{
   public class GlaPropEnum extends GlaProp
   {
       
      
      protected var value:int;
      
      public function GlaPropEnum(param1:String, param2:int)
      {
         super();
         setName(param1);
         this.value = param2;
      }
      
      public function getValue() : int
      {
         return this.value;
      }
   }
}
