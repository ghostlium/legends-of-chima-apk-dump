package zufflin.physics2D
{
   import Box2D.Dynamics.b2ContactFilter;
   import Box2D.Dynamics.b2FilterData;
   import Box2D.Dynamics.b2Fixture;
   import zufflin.world2D.World2Obj;
   
   public class B2ContactFilter extends b2ContactFilter
   {
       
      
      public function B2ContactFilter()
      {
         super();
      }
      
      override public function ShouldCollide(param1:b2Fixture, param2:b2Fixture) : Boolean
      {
         var _loc5_:RigidBody2 = null;
         var _loc6_:RigidBody2 = null;
         var _loc7_:World2Obj = null;
         var _loc8_:World2Obj = null;
         var _loc3_:b2FilterData = param1.GetFilterData();
         var _loc4_:b2FilterData = param2.GetFilterData();
         if((_loc3_.maskBits & _loc4_.categoryBits) != 0 && (_loc3_.categoryBits & _loc4_.maskBits) != 0)
         {
            _loc5_ = (param1.GetUserData() as CollisionFixture2).getRigidBody();
            _loc6_ = (param2.GetUserData() as CollisionFixture2).getRigidBody();
            _loc7_ = _loc5_.getWorldObj();
            _loc8_ = _loc6_.getWorldObj();
            if(_loc7_.getParentRoot() != _loc8_.getParentRoot() || _loc7_.getParentRoot() == _loc8_.getParentRoot() && (_loc7_.collidesWithGroup() || _loc8_.collidesWithGroup()))
            {
               return true;
            }
         }
         return false;
      }
   }
}
