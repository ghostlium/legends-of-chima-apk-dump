package zufflin.math
{
   import util.Vec2F;
   
   public class BSpline
   {
       
      
      public function BSpline()
      {
         super();
      }
      
      public static function calcF(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         return param1 * (((-param5 + 3) * param5 - 3) * param5 + 1) / 6 + param2 * ((3 * param5 - 6) * param5 * param5 + 4) / 6 + param3 * (((-3 * param5 + 3) * param5 + 3) * param5 + 1) / 6 + param4 * (param5 * param5 * param5) / 6;
      }
      
      public static function calcV(param1:Vec2F, param2:Vec2F, param3:Vec2F, param4:Vec2F, param5:Number) : Vec2F
      {
         var _loc6_:Number = NaN;
         _loc6_ = (((-param5 + 3) * param5 - 3) * param5 + 1) / 6;
         var _loc7_:Number = ((3 * param5 - 6) * param5 * param5 + 4) / 6;
         var _loc8_:Number = (((-3 * param5 + 3) * param5 + 3) * param5 + 1) / 6;
         var _loc9_:Number = param5 * param5 * param5 / 6;
         var _loc10_:Vec2F;
         (_loc10_ = new Vec2F()).x = param1.x * _loc6_ + param2.x * _loc7_ + param3.x * _loc8_ + param4.x * _loc9_;
         _loc10_.y = param1.y * _loc6_ + param2.y * _loc7_ + param3.y * _loc8_ + param4.y * _loc9_;
         return _loc10_;
      }
      
      public static function calcVecList(param1:Vector.<Vec2F>, param2:uint, param3:Number) : Vec2F
      {
         var _loc4_:int = param2 - 1;
         if(param3 >= 1)
         {
            return param1[_loc4_];
         }
         var _loc5_:Number = 1 / _loc4_;
         var _loc6_:int = param3 * _loc4_;
         var _loc7_:int = Math.min(_loc4_,_loc6_ + 1);
         return calcV(param1[Math.max(0,_loc6_ - 1)],param1[_loc6_],param1[_loc7_],param1[Math.min(_loc4_,_loc7_ + 1)],(param3 - _loc6_ * _loc5_) * _loc4_);
      }
   }
}
