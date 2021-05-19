package zufflin.math
{
   import util.Vec2F;
   
   public class zMatrix2f
   {
       
      
      public var xa:Vec2F;
      
      public var ya:Vec2F;
      
      public function zMatrix2f(param1:zMatrix2f = null)
      {
         super();
         this.xa = new Vec2F();
         this.ya = new Vec2F();
         if(param1 != null)
         {
            this.xa.x = param1.xa.x;
            this.xa.y = param1.xa.y;
            this.ya.x = param1.ya.x;
            this.ya.y = param1.ya.y;
         }
      }
      
      public static function mult(param1:zMatrix2f, param2:zMatrix2f, param3:zMatrix2f) : void
      {
         param3.xa.x = param1.xa.x * param2.xa.x + param1.xa.y * param2.ya.x;
         param3.xa.y = param1.xa.x * param2.xa.y + param1.xa.y * param2.ya.y;
         param3.ya.x = param1.ya.x * param2.xa.x + param1.ya.y * param2.ya.x;
         param3.ya.y = param1.ya.x * param2.xa.y + param1.ya.y * param2.ya.y;
      }
      
      public function setIdentity() : zMatrix2f
      {
         this.xa.x = 1;
         this.xa.y = 0;
         this.ya.x = 0;
         this.ya.y = 1;
         return this;
      }
      
      public function setRotation(param1:Number) : zMatrix2f
      {
         var _loc2_:Number = Math.cos(param1);
         var _loc3_:Number = Math.sin(param1);
         this.xa.x = _loc2_;
         this.xa.y = _loc3_;
         this.ya.x = -_loc3_;
         this.ya.y = _loc2_;
         return this;
      }
      
      public function timesEquals(param1:zMatrix2f) : zMatrix2f
      {
         var _loc2_:zMatrix2f = new zMatrix2f(this);
         mult(param1,_loc2_,this);
         return this;
      }
      
      public function rotate(param1:Number) : zMatrix2f
      {
         var _loc2_:zMatrix2f = new zMatrix2f();
         _loc2_.setRotation(param1);
         this.timesEquals(_loc2_);
         return this;
      }
      
      public function transform(param1:Vec2F, param2:Vec2F) : void
      {
         param2.x = this.xa.x * param1.x + this.ya.x * param1.y;
         param2.y = this.xa.y * param1.x + this.ya.y * param1.y;
      }
      
      public function getTransform(param1:Vec2F) : Vec2F
      {
         var _loc2_:Vec2F = new Vec2F();
         this.transform(param1,_loc2_);
         return _loc2_;
      }
   }
}
