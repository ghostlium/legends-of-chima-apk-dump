package zufflin.cobraBase
{
   public class GlaPropBool extends GlaProp
   {
       
      
      public var value:Boolean;
      
      public function GlaPropBool(param1:String, param2:Boolean)
      {
         super();
         setName(param1);
         this.value = param2;
      }
      
      public function getValue() : Boolean
      {
         return this.value;
      }
   }
}
