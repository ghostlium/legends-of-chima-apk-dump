package zufflin.cobraBase
{
   public class GlaEnumSet
   {
       
      
      public var names:Vector.<String>;
      
      public function GlaEnumSet()
      {
         super();
         this.names = new Vector.<String>();
      }
      
      public function dispose() : void
      {
         this.names.length = 0;
         this.names = null;
      }
   }
}
