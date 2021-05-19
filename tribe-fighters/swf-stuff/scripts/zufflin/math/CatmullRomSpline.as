package zufflin.math
{
   import util.MathsHelper;
   import zufflin.core.RGBA;
   
   public class CatmullRomSpline
   {
       
      
      public function CatmullRomSpline()
      {
         super();
      }
      
      public static function calc(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         return param1 * ((-param5 + 2) * param5 - 1) * param5 / 2 + param2 * ((3 * param5 - 5) * param5 * param5 + 2) / 2 + param3 * ((-3 * param5 + 4) * param5 + 1) * param5 / 2 + param4 * ((param5 - 1) * param5 * param5) / 2;
      }
      
      public static function calcRGBA(param1:RGBA, param2:RGBA, param3:RGBA, param4:RGBA, param5:Number) : RGBA
      {
         return new RGBA(MathsHelper.Clamp(calc(param1.r,param2.r,param3.r,param4.r,param5),0,255),MathsHelper.Clamp(calc(param1.g,param2.g,param3.g,param4.g,param5),0,255),MathsHelper.Clamp(calc(param1.b,param2.b,param3.b,param4.b,param5),0,255),MathsHelper.Clamp(calc(param1.a,param2.a,param3.a,param4.a,param5),0,255));
      }
      
      public static function calcA(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         return MathsHelper.Clamp(calc(param1,param2,param3,param4,param5),0,255);
      }
      
      public static function calcNumberList(param1:Vector.<Number>, param2:uint, param3:Number) : Number
      {
         var _loc4_:int = param2 - 1;
         if(param3 >= 1)
         {
            return param1[_loc4_];
         }
         var _loc5_:Number = 1 / _loc4_;
         var _loc6_:int = param3 * _loc4_;
         var _loc7_:int = Math.min(_loc4_,_loc6_ + 1);
         return calcA(param1[Math.max(0,_loc6_ - 1)],param1[_loc6_],param1[_loc7_],param1[Math.min(_loc4_,_loc7_ + 1)],(param3 - _loc6_ * _loc5_) * _loc4_);
      }
      
      public static function calcRGBAList(param1:Vector.<RGBA>, param2:uint, param3:Number) : RGBA
      {
         var _loc4_:int = param2 - 1;
         if(param3 >= 1)
         {
            return param1[_loc4_];
         }
         var _loc5_:Number = 1 / _loc4_;
         var _loc6_:int = param3 * _loc4_;
         var _loc7_:int = Math.min(_loc4_,_loc6_ + 1);
         return calcRGBA(param1[Math.max(0,_loc6_ - 1)],param1[_loc6_],param1[_loc7_],param1[Math.min(_loc4_,_loc7_ + 1)],(param3 - _loc6_ * _loc5_) * _loc4_);
      }
   }
}
