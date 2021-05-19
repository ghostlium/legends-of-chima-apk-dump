package zufflin.physics2D
{
   import Box2D.Dynamics.b2ContactFilter;
   import Box2D.Dynamics.b2FilterData;
   import Box2D.Dynamics.b2Fixture;
   
   public class B2GridContactFilter extends b2ContactFilter
   {
       
      
      public var pSystem:PhysicsSystem2;
      
      public function B2GridContactFilter(param1:PhysicsSystem2)
      {
         super();
         this.pSystem = param1;
      }
      
      private function RETURN_IF_COLLISION_EXCLUSION(param1:Vector.<RigidBody2>, param2:RigidBody2) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = param1.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(param1[_loc3_] == param2)
            {
               return false;
            }
            _loc3_++;
         }
         return true;
      }
      
      override public function ShouldCollide(param1:b2Fixture, param2:b2Fixture) : Boolean
      {
         var _loc6_:uint = 0;
         var _loc7_:RigidBody2 = null;
         var _loc8_:RigidBody2 = null;
         var _loc3_:b2FilterData = param1.GetFilterData();
         var _loc4_:b2FilterData = param2.GetFilterData();
         var _loc5_:int = this.pSystem.getCollisionGridWidth();
         if(_loc3_.groupIndex < int(_loc5_) && _loc4_.groupIndex < int(_loc5_))
         {
            _loc6_ = _loc3_.groupIndex + _loc4_.groupIndex * _loc5_;
            if(this.pSystem.getCollisionGrid()[_loc6_] != 0)
            {
               _loc7_ = param1.GetUserData2() as RigidBody2;
               _loc8_ = param2.GetUserData2() as RigidBody2;
               if(this.RETURN_IF_COLLISION_EXCLUSION(_loc7_.getCollisionExclusions(),_loc8_) == false)
               {
                  return false;
               }
               if(this.RETURN_IF_COLLISION_EXCLUSION(_loc8_.getCollisionExclusions(),_loc7_) == false)
               {
                  return false;
               }
               return true;
            }
         }
         return false;
      }
   }
}
