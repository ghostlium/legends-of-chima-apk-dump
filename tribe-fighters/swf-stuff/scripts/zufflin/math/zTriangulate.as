package zufflin.math
{
   import util.Vec2F;
   
   public class zTriangulate
   {
      
      public static var contour:Vector.<Vec2F> = null;
      
      public static var contourSize:int = 0;
       
      
      public function zTriangulate()
      {
         super();
      }
      
      public static function area() : Number
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:int = contourSize;
         var _loc2_:Number = 0;
         _loc3_ = _loc1_ - 1;
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            _loc2_ += contour[_loc3_].x * contour[_loc4_].y - contour[_loc4_].x * contour[_loc3_].y;
            _loc3_ = _loc4_++;
         }
         return _loc2_ * 0.5;
      }
      
      public static function insideTriangle(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number) : Boolean
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         _loc9_ = param5 - param3;
         _loc10_ = param6 - param4;
         _loc11_ = param1 - param5;
         _loc12_ = param2 - param6;
         _loc13_ = param3 - param1;
         _loc14_ = param4 - param2;
         _loc15_ = param7 - param1;
         _loc16_ = param8 - param2;
         _loc17_ = param7 - param3;
         _loc18_ = param8 - param4;
         _loc19_ = param7 - param5;
         _loc20_ = param8 - param6;
         _loc23_ = _loc9_ * _loc18_ - _loc10_ * _loc17_;
         _loc21_ = _loc13_ * _loc16_ - _loc14_ * _loc15_;
         _loc22_ = _loc11_ * _loc20_ - _loc12_ * _loc19_;
         return _loc23_ >= 0 && _loc22_ >= 0 && _loc21_ >= 0;
      }
      
      public static function snip(param1:int, param2:int, param3:int, param4:int, param5:Vector.<int>) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         _loc7_ = contour[param5[param1]].x;
         _loc8_ = contour[param5[param1]].y;
         _loc9_ = contour[param5[param2]].x;
         _loc10_ = contour[param5[param2]].y;
         _loc11_ = contour[param5[param3]].x;
         _loc12_ = contour[param5[param3]].y;
         if(1e-10 > (_loc9_ - _loc7_) * (_loc12_ - _loc8_) - (_loc10_ - _loc8_) * (_loc11_ - _loc7_))
         {
            return false;
         }
         _loc6_ = 0;
         while(_loc6_ < param4)
         {
            if(!(_loc6_ == param1 || _loc6_ == param2 || _loc6_ == param3))
            {
               _loc13_ = contour[param5[_loc6_]].x;
               _loc14_ = contour[param5[_loc6_]].y;
               if(insideTriangle(_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_,_loc14_))
               {
                  return false;
               }
            }
            _loc6_++;
         }
         return true;
      }
      
      public static function Triangulate(param1:Vector.<Vec2F>, param2:Vector.<int>) : Boolean
      {
         return Triangulate2(param1,param1.length,param2);
      }
      
      public static function Triangulate2(param1:Vector.<Vec2F>, param2:int, param3:Vector.<int>) : Boolean
      {
         var _loc6_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         contour = param1;
         contourSize = param2;
         var _loc4_:int;
         if((_loc4_ = contourSize) < 3)
         {
            return false;
         }
         var _loc5_:Vector.<int> = new Vector.<int>(_loc4_,true);
         if(0 < area())
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_[_loc6_] = _loc6_;
               _loc6_++;
            }
         }
         else
         {
            _loc6_ = 0;
            while(_loc6_ < _loc4_)
            {
               _loc5_[_loc6_] = _loc4_ - 1 - _loc6_;
               _loc6_++;
            }
         }
         var _loc7_:int = _loc4_;
         var _loc8_:int = 2 * _loc7_;
         _loc9_ = 0;
         _loc6_ = _loc7_ - 1;
         while(_loc7_ > 2)
         {
            if(0 >= _loc8_--)
            {
               return false;
            }
            _loc10_ = _loc6_;
            if(_loc7_ <= _loc10_)
            {
               _loc10_ = 0;
            }
            _loc6_ = _loc10_ + 1;
            if(_loc7_ <= _loc6_)
            {
               _loc6_ = 0;
            }
            _loc11_ = _loc6_ + 1;
            if(_loc7_ <= _loc11_)
            {
               _loc11_ = 0;
            }
            if(snip(_loc10_,_loc6_,_loc11_,_loc7_,_loc5_))
            {
               _loc12_ = _loc5_[_loc10_];
               _loc13_ = _loc5_[_loc6_];
               _loc14_ = _loc5_[_loc11_];
               param3.push(_loc12_);
               param3.push(_loc13_);
               param3.push(_loc14_);
               _loc9_++;
               _loc15_ = _loc6_;
               _loc16_ = _loc6_ + 1;
               while(_loc16_ < _loc7_)
               {
                  _loc5_[_loc15_] = _loc5_[_loc16_];
                  _loc15_++;
                  _loc16_++;
               }
               _loc7_--;
               _loc8_ = 2 * _loc7_;
            }
         }
         return true;
      }
   }
}
