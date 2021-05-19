package zufflin.world2D
{
   import zufflin.core.RigidBody;
   
   public class CollisionFixture
   {
       
      
      protected var pRigidBody:RigidBody;
      
      protected var userData:uint;
      
      public function CollisionFixture()
      {
         super();
         this.userData = 0;
         this.pRigidBody = null;
      }
      
      public function dispose() : void
      {
      }
      
      public function setRigidBody(param1:RigidBody) : void
      {
         this.pRigidBody = param1;
      }
      
      public function setUserData(param1:uint) : void
      {
         this.userData = param1;
      }
      
      public function getUserData() : uint
      {
         return this.userData;
      }
   }
}
