package zufflin.cobraBase
{
   import zufflin.core.RGBA;
   
   public class GlaPropRGBA extends GlaProp
   {
       
      
      protected var value:RGBA;
      
      public function GlaPropRGBA(param1:String, param2:RGBA)
      {
         super();
         setName(param1);
         this.value = param2;
      }
      
      public function getValue() : RGBA
      {
         return this.value;
      }
   }
}
