package zufflin.cobraBase
{
   public class GlaPropString extends GlaProp
   {
       
      
      public var value:String;
      
      public function GlaPropString(param1:String, param2:String)
      {
         super();
         setName(param1);
         this.value = param2;
      }
      
      public function getValue() : String
      {
         return this.value;
      }
   }
}
