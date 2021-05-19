package Box2D.Common.Math
{
   public class b2Mat33
   {
       
      
      public var col1:b2Vec3;
      
      public var col2:b2Vec3;
      
      public var col3:b2Vec3;
      
      public function b2Mat33(param1:b2Vec3 = null, param2:b2Vec3 = null, param3:b2Vec3 = null)
      {
         this.col1 = new b2Vec3();
         this.col2 = new b2Vec3();
         this.col3 = new b2Vec3();
         super();
         if(!param1 && !param2 && !param3)
         {
            this.col1.SetZero();
            this.col2.SetZero();
            this.col3.SetZero();
         }
         else
         {
            this.col1.SetV(param1);
            this.col2.SetV(param2);
            this.col3.SetV(param3);
         }
      }
      
      public function SetVVV(param1:b2Vec3, param2:b2Vec3, param3:b2Vec3) : void
      {
         this.col1.SetV(param1);
         this.col2.SetV(param2);
         this.col3.SetV(param3);
      }
      
      public function Copy() : b2Mat33
      {
         return new b2Mat33(this.col1,this.col2,this.col3);
      }
      
      public function SetM(param1:b2Mat33) : void
      {
         this.col1.SetV(param1.col1);
         this.col2.SetV(param1.col2);
         this.col3.SetV(param1.col3);
      }
      
      public function AddM(param1:b2Mat33) : void
      {
         this.col1.x += param1.col1.x;
         this.col1.y += param1.col1.y;
         this.col1.z += param1.col1.z;
         this.col2.x += param1.col2.x;
         this.col2.y += param1.col2.y;
         this.col2.z += param1.col2.z;
         this.col3.x += param1.col3.x;
         this.col3.y += param1.col3.y;
         this.col3.z += param1.col3.z;
      }
      
      public function SetIdentity() : void
      {
         this.col1.x = 1;
         this.col2.x = 0;
         this.col3.x = 0;
         this.col1.y = 0;
         this.col2.y = 1;
         this.col3.y = 0;
         this.col1.z = 0;
         this.col2.z = 0;
         this.col3.z = 1;
      }
      
      public function SetZero() : void
      {
         this.col1.x = 0;
         this.col2.x = 0;
         this.col3.x = 0;
         this.col1.y = 0;
         this.col2.y = 0;
         this.col3.y = 0;
         this.col1.z = 0;
         this.col2.z = 0;
         this.col3.z = 0;
      }
      
      public function Solve22(param1:b2Vec2, param2:Number, param3:Number) : b2Vec2
      {
         var _loc4_:Number = NaN;
         var _loc6_:Number = NaN;
         _loc4_ = this.col1.x;
         var _loc5_:Number = this.col2.x;
         _loc6_ = this.col1.y;
         var _loc7_:Number = this.col2.y;
         var _loc8_:Number;
         if((_loc8_ = _loc4_ * _loc7_ - _loc5_ * _loc6_) != 0)
         {
            _loc8_ = 1 / _loc8_;
         }
         param1.x = _loc8_ * (_loc7_ * param2 - _loc5_ * param3);
         param1.y = _loc8_ * (_loc4_ * param3 - _loc6_ * param2);
         return param1;
      }
      
      public function Solve33(param1:b2Vec3, param2:Number, param3:Number, param4:Number) : b2Vec3
      {
         var _loc5_:Number = this.col1.x;
         var _loc6_:Number = this.col1.y;
         var _loc7_:Number = this.col1.z;
         var _loc8_:Number = this.col2.x;
         var _loc9_:Number = this.col2.y;
         var _loc10_:Number = this.col2.z;
         var _loc11_:Number = this.col3.x;
         var _loc12_:Number = this.col3.y;
         var _loc13_:Number = this.col3.z;
         var _loc14_:Number;
         if((_loc14_ = _loc5_ * (_loc9_ * _loc13_ - _loc10_ * _loc12_) + _loc6_ * (_loc10_ * _loc11_ - _loc8_ * _loc13_) + _loc7_ * (_loc8_ * _loc12_ - _loc9_ * _loc11_)) != 0)
         {
            _loc14_ = 1 / _loc14_;
         }
         param1.x = _loc14_ * (param2 * (_loc9_ * _loc13_ - _loc10_ * _loc12_) + param3 * (_loc10_ * _loc11_ - _loc8_ * _loc13_) + param4 * (_loc8_ * _loc12_ - _loc9_ * _loc11_));
         param1.y = _loc14_ * (_loc5_ * (param3 * _loc13_ - param4 * _loc12_) + _loc6_ * (param4 * _loc11_ - param2 * _loc13_) + _loc7_ * (param2 * _loc12_ - param3 * _loc11_));
         param1.z = _loc14_ * (_loc5_ * (_loc9_ * param4 - _loc10_ * param3) + _loc6_ * (_loc10_ * param2 - _loc8_ * param4) + _loc7_ * (_loc8_ * param3 - _loc9_ * param2));
         return param1;
      }
   }
}
