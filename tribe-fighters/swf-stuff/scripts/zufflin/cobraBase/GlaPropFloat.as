package zufflin.cobraBase
{
   public class GlaPropFloat extends GlaProp
   {
       
      
      protected var value:Number;
      
      public function GlaPropFloat(param1:String, param2:Number)
      {
         super();
         setName(param1);
         this.value = param2;
      }
      
      public function getValue() : Number
      {
         return this.value;
      }
   }
}
