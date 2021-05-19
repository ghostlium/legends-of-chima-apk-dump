package zufflin.physics2D
{
   import Box2D.Dynamics.Contacts.b2Contact;
   import util.Vec2F;
   import zufflin.world2D.World2Obj;
   
   public class B2ContactProxy
   {
       
      
      public var bHasCollisionVetos:Boolean;
      
      public var type:int;
      
      public var objA:World2Obj;
      
      public var objB:World2Obj;
      
      public var rigidA:RigidBody2;
      
      public var rigidB:RigidBody2;
      
      public var position:Vec2F;
      
      public var normal:Vec2F;
      
      public var velocity:Vec2F;
      
      public var vPreSolveCalled:Boolean;
      
      public var bDelete:Boolean;
      
      public var fixA:CollisionFixture2;
      
      public var fixB:CollisionFixture2;
      
      public var pContact:b2Contact;
      
      public function B2ContactProxy()
      {
         super();
         this.pContact = null;
         this.bHasCollisionVetos = false;
         this.bDelete = false;
         this.vPreSolveCalled = false;
         this.type = EventContact2.Z_CONTACT_BEGIN;
         this.objA = null;
         this.objB = null;
         this.position = new Vec2F();
         this.normal = new Vec2F();
         this.velocity = new Vec2F();
      }
      
      public function dispose() : void
      {
         this.pContact = null;
         this.objA = null;
         this.objB = null;
         this.position = null;
         this.normal = null;
         this.velocity = null;
         this.fixA = null;
         this.fixB = null;
         this.rigidA = null;
         this.rigidB = null;
      }
      
      public function getObjA() : World2Obj
      {
         return this.objA;
      }
      
      public function getObjB() : World2Obj
      {
         return this.objB;
      }
   }
}
