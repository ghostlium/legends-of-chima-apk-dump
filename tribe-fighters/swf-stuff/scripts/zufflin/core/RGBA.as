package zufflin.core
{
   public class RGBA
   {
       
      
      public var r:uint;
      
      public var g:uint;
      
      public var b:uint;
      
      public var a:uint;
      
      public function RGBA(param1:uint = 0, param2:uint = 0, param3:uint = 0, param4:uint = 0)
      {
         super();
         this.r = param1;
         this.g = param2;
         this.b = param3;
         this.a = param4;
      }
      
      public static function mix(param1:RGBA, param2:RGBA, param3:Number, param4:RGBA = null) : RGBA
      {
         if(param4 == null)
         {
            param4 = new RGBA();
         }
         var _loc5_:Number = 1 - param3;
         param4.r = Math.min(param1.r * _loc5_ + param2.r * param3,255);
         param4.g = Math.min(param1.g * _loc5_ + param2.g * param3,255);
         param4.b = Math.min(param1.b * _loc5_ + param2.b * param3,255);
         param4.a = Math.min(param1.a * _loc5_ + param2.a * param3,255);
         return param4;
      }
      
      public function getDrawColour() : uint
      {
         return this.r << 16 | this.g << 8 | this.b;
      }
      
      public function getDrawAlpha() : Number
      {
         var _loc1_:Number = this.a;
         return Number(_loc1_ / 255);
      }
      
      public function setFromRGBA(param1:RGBA) : void
      {
         this.r = param1.r;
         this.g = param1.g;
         this.b = param1.b;
         this.a = param1.a;
      }
      
      public function setFromUint32(param1:uint) : void
      {
         this.a = param1 >> 24 & 255;
         this.r = param1 >> 16 & 255;
         this.g = param1 >> 8 & 255;
         this.b = param1 & 255;
      }
   }
}
