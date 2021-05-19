package zufflin.physics2D
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2ContactListener;
   
   public class B2ContactListener extends b2ContactListener
   {
       
      
      public var pPhysicsSystem:PhysicsSystem2;
      
      public function B2ContactListener(param1:PhysicsSystem2)
      {
         super();
         this.pPhysicsSystem = param1;
      }
      
      override public function BeginContact(param1:b2Contact) : void
      {
         this.pPhysicsSystem.beginContact(param1);
      }
      
      override public function PreSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         this.pPhysicsSystem.preSolve(param1,param2);
      }
      
      override public function EndContact(param1:b2Contact) : void
      {
         this.pPhysicsSystem.endContact(param1);
      }
   }
}
