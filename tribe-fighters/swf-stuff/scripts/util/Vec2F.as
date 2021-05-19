package util
{
   import flash.geom.Point;
   
   public class Vec2F extends Point
   {
       
      
      public function Vec2F(param1:Number = 0, param2:Number = 0)
      {
         super(param1,param2);
      }
      
      public static function zDot(param1:Vec2F, param2:Vec2F) : Number
      {
         return param1.x * param2.x + param1.y * param2.y;
      }
      
      public static function zCross(param1:Vec2F, param2:Vec2F) : Number
      {
         return param1.x * param2.y - param1.y * param2.x;
      }
      
      public function clear() : void
      {
         x = 0;
         y = 0;
      }
      
      public function getAngle() : Number
      {
         return Math.atan2(this.x,-this.y);
      }
      
      public function rotate(param1:Number) : Vec2F
      {
         var _loc2_:Number = x;
         var _loc3_:Number = y;
         var _loc4_:Number = Math.cos(param1);
         var _loc5_:Number = Math.sin(param1);
         x = _loc2_ * _loc4_ - _loc3_ * _loc5_;
         y = _loc3_ * _loc4_ + _loc2_ * _loc5_;
         return this;
      }
      
      public function getNormal() : Vec2F
      {
         var _loc1_:Vec2F = new Vec2F(this.x,this.y);
         _loc1_.normalize(1);
         return _loc1_;
      }
      
      public function scaleBy(param1:Number) : void
      {
         this.x *= param1;
         this.y *= param1;
      }
      
      public function set(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      public function setV(param1:Vec2F) : void
      {
         this.x = param1.x;
         this.y = param1.y;
      }
      
      override public function clone() : Point
      {
         return new Vec2F(this.x,this.y);
      }
      
      public function getLengthSq() : Number
      {
         return this.x * this.x + this.y * this.y;
      }
      
      public function getRotated(param1:Number) : Vec2F
      {
         return new Vec2F(this.x,this.y).rotate(param1);
      }
      
      public function isNearZero(param1:Number = 1.0E-7) : Boolean
      {
         return x < param1 && x > -param1 && y < param1 && y > -param1;
      }
   }
}
