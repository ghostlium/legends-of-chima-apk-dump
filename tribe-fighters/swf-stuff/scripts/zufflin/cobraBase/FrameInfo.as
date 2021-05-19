package zufflin.cobraBase
{
   public class FrameInfo
   {
       
      
      public var globalFrameI:int;
      
      public var frameI:int;
      
      public var frac:Number;
      
      public function FrameInfo(param1:int = 0)
      {
         super();
         this.globalFrameI = param1;
         this.frameI = param1;
         this.frac = 0;
      }
   }
}
