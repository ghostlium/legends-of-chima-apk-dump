package zufflin.math
{
   import util.Vec2F;
   
   public class PointSet2f
   {
       
      
      public var _points:Vector.<Vec2F>;
      
      public function PointSet2f(param1:Vector.<Vec2F> = null)
      {
         var _loc2_:int = 0;
         super();
         this._points = new Vector.<Vec2F>();
         if(param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.length)
            {
               this._points.push(new Vec2F(param1[_loc2_].x,param1[_loc2_].y));
               _loc2_++;
            }
         }
      }
      
      public function reverse() : void
      {
         this._points.reverse();
      }
      
      public function scale(param1:Vec2F) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._points.length)
         {
            this._points[_loc2_].x *= param1.x;
            this._points[_loc2_].y *= param1.y;
            _loc2_++;
         }
      }
      
      public function isConvex() : Boolean
      {
         return !this.isConcave();
      }
      
      public function isConcave() : Boolean
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Number = NaN;
         var _loc1_:uint = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._points.length)
         {
            _loc3_ = (_loc2_ + 1) % this._points.length;
            _loc4_ = (_loc2_ + 2) % this._points.length;
            _loc5_ = Vec2F.zCross(new Vec2F(this._points[_loc3_].x - this._points[_loc2_].x,this._points[_loc3_].y - this._points[_loc2_].y),new Vec2F(this._points[_loc4_].x - this._points[_loc3_].x,this._points[_loc4_].y - this._points[_loc3_].y));
            _loc1_ |= _loc5_ < 0 ? 1 : 2;
            if(_loc1_ == 3)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function translate(param1:Vec2F) : void
      {
         var _loc2_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < this._points.length)
         {
            this._points[_loc2_].x += param1.x;
            this._points[_loc2_].y += param1.y;
            _loc2_++;
         }
      }
      
      public function calcBounds(param1:AABox2f) : void
      {
         var _loc2_:int = 0;
         param1.invalidate();
         _loc2_ = 0;
         while(_loc2_ < this._points.length)
         {
            param1.add(this._points[_loc2_]);
            _loc2_++;
         }
      }
   }
}
