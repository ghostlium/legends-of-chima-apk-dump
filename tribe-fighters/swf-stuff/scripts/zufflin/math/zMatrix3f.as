package zufflin.math
{
   import util.Vec3F;
   
   public class zMatrix3f
   {
       
      
      public var xa:Vec3F;
      
      public var ya:Vec3F;
      
      public var za:Vec3F;
      
      public function zMatrix3f()
      {
         super();
         this.xa = new Vec3F();
         this.ya = new Vec3F();
         this.za = new Vec3F();
      }
      
      public static function mult(param1:zMatrix3f, param2:zMatrix3f, param3:zMatrix3f) : void
      {
         param3.xa.x = param1.xa.x * param2.xa.x + param1.xa.y * param2.ya.x + param1.xa.z * param2.za.x;
         param3.xa.y = param1.xa.x * param2.xa.y + param1.xa.y * param2.ya.y + param1.xa.z * param2.za.y;
         param3.xa.z = param1.xa.x * param2.xa.z + param1.xa.y * param2.ya.z + param1.xa.z * param2.za.z;
         param3.ya.x = param1.ya.x * param2.xa.x + param1.ya.y * param2.ya.x + param1.ya.z * param2.za.x;
         param3.ya.y = param1.ya.x * param2.xa.y + param1.ya.y * param2.ya.y + param1.ya.z * param2.za.y;
         param3.ya.z = param1.ya.x * param2.xa.z + param1.ya.y * param2.ya.z + param1.ya.z * param2.za.z;
         param3.za.x = param1.za.x * param2.xa.x + param1.za.y * param2.ya.x + param1.za.z * param2.za.x;
         param3.za.y = param1.za.x * param2.xa.y + param1.za.y * param2.ya.y + param1.za.z * param2.za.y;
         param3.za.z = param1.za.x * param2.xa.z + param1.za.y * param2.ya.z + param1.za.z * param2.za.z;
      }
      
      public function setIdentity() : void
      {
         this.xa.x = 1;
         this.xa.y = 0;
         this.xa.z = 0;
         this.ya.x = 0;
         this.ya.y = 1;
         this.ya.z = 0;
         this.za.x = 0;
         this.za.y = 0;
         this.za.z = 1;
      }
      
      public function setRotate(param1:Number, param2:Vec3F) : void
      {
         var _loc3_:Number = Math.cos(param1);
         var _loc4_:Number = Math.sin(param1);
         var _loc5_:Number = 1 - _loc3_;
         var _loc6_:Number = param2.x;
         var _loc7_:Number = param2.y;
         var _loc8_:Number = param2.z;
         this.xa.x = _loc5_ * _loc6_ * _loc6_ + _loc3_;
         this.xa.y = _loc5_ * _loc6_ * _loc7_ + _loc8_ * _loc4_;
         this.xa.z = _loc5_ * _loc6_ * _loc8_ - _loc7_ * _loc4_;
         this.ya.x = _loc5_ * _loc6_ * _loc7_ - _loc8_ * _loc4_;
         this.ya.y = _loc5_ * _loc7_ * _loc7_ + _loc3_;
         this.ya.z = _loc5_ * _loc7_ * _loc8_ + _loc6_ * _loc4_;
         this.za.x = _loc5_ * _loc6_ * _loc8_ + _loc7_ * _loc4_;
         this.za.y = _loc5_ * _loc7_ * _loc8_ - _loc6_ * _loc4_;
         this.za.z = _loc5_ * _loc8_ * _loc8_ + _loc3_;
      }
      
      public function setFromMat(param1:zMatrix3f) : void
      {
         this.xa.x = param1.xa.x;
         this.xa.y = param1.xa.y;
         this.xa.z = param1.xa.z;
         this.ya.x = param1.ya.x;
         this.ya.y = param1.ya.y;
         this.ya.z = param1.ya.z;
         this.za.x = param1.za.x;
         this.za.y = param1.za.y;
         this.za.z = param1.za.z;
      }
      
      public function rotate(param1:Number, param2:Vec3F) : void
      {
         var _loc3_:zMatrix3f = new zMatrix3f();
         _loc3_.setRotate(param1,param2);
         var _loc4_:zMatrix3f;
         (_loc4_ = new zMatrix3f()).setFromMat(this);
         mult(_loc4_,_loc3_,this);
      }
      
      public function transform2(param1:Vec3F, param2:Vec3F) : void
      {
         param2.x = this.xa.x * param1.x + this.ya.x * param1.y + this.za.x * param1.z;
         param2.y = this.xa.y * param1.x + this.ya.y * param1.y + this.za.y * param1.z;
         param2.z = this.xa.z * param1.x + this.ya.z * param1.y + this.za.z * param1.z;
      }
      
      public function transform(param1:Vec3F) : void
      {
         var _loc2_:Vec3F = new Vec3F();
         this.transform2(param1,_loc2_);
         param1.x = _loc2_.x;
         param1.y = _loc2_.y;
         param1.z = _loc2_.z;
      }
   }
}
