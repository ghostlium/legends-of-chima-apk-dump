package zufflin.physics2D
{
   import starling.events.Event;
   import util.Vec2F;
   import zufflin.world2D.World2Obj;
   
   public class EventContact2 extends Event
   {
      
      public static const EVENT_CONTACT2:String = "EVENT_CONTACT2";
      
      public static const Z_CONTACT_BEGIN:int = 0;
      
      public static const Z_CONTACT_UPDATE:int = 1;
      
      public static const Z_CONTACT_END:int = 2;
      
      public static const Z_CONTACT_VETO:int = 3;
       
      
      public var ourObject:World2Obj;
      
      public var other:World2Obj;
      
      public var otherShape:CollisionFixture2;
      
      public var ourShape:CollisionFixture2;
      
      public var otherBody:RigidBody2;
      
      public var ourBody:RigidBody2;
      
      public var position:Vec2F;
      
      public var normal:Vec2F;
      
      public var velocity:Vec2F;
      
      public var contactType:int;
      
      public function EventContact2(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
      }
      
      public function getType() : int
      {
         return this.contactType;
      }
      
      public function getOtherObject() : World2Obj
      {
         return this.other;
      }
      
      public function getOurObject() : World2Obj
      {
         return this.ourObject;
      }
      
      public function getOtherShape() : CollisionFixture2
      {
         return this.otherShape;
      }
      
      public function getOurShape() : CollisionFixture2
      {
         return this.ourShape;
      }
      
      public function getOurBody() : RigidBody2
      {
         return this.ourBody;
      }
      
      public function getOtherBody() : RigidBody2
      {
         return this.otherBody;
      }
      
      public function getVelocity() : Vec2F
      {
         return this.velocity;
      }
      
      public function getPosition() : Vec2F
      {
         return this.position;
      }
      
      public function getNormal() : Vec2F
      {
         return this.normal;
      }
      
      public function setType(param1:int) : void
      {
         this.contactType = param1;
      }
      
      public function setOtherObject(param1:World2Obj) : void
      {
         this.other = param1;
      }
      
      public function setOurObject(param1:World2Obj) : void
      {
         this.ourObject = param1;
      }
      
      public function setOtherShape(param1:CollisionFixture2) : void
      {
         this.otherShape = param1;
      }
      
      public function setOurShape(param1:CollisionFixture2) : void
      {
         this.ourShape = param1;
      }
      
      public function setOurBody(param1:RigidBody2) : void
      {
         this.ourBody = param1;
      }
      
      public function setOtherBody(param1:RigidBody2) : void
      {
         this.otherBody = param1;
      }
      
      public function setVelocity(param1:Vec2F) : void
      {
         this.velocity = new Vec2F(param1.x,param1.y);
      }
      
      public function setPosition(param1:Vec2F) : void
      {
         this.position = new Vec2F(param1.x,param1.y);
      }
      
      public function setNormal(param1:Vec2F) : void
      {
         this.normal = new Vec2F(param1.x,param1.y);
      }
   }
}
