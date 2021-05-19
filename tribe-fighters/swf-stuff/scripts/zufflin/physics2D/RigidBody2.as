package zufflin.physics2D
{
   import Box2D.Collision.Shapes.b2MassData;
   import Box2D.Common.Math.b2Mat22;
   import Box2D.Common.Math.b2Transform;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Joints.b2JointEdge;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2BodyDef;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.RigidBody;
   import zufflin.math.AABox2f;
   import zufflin.math.OBox2f;
   import zufflin.world2D.World2Obj;
   
   public class RigidBody2 extends RigidBody
   {
      
      public static const Z_RIGID_DEACTIVATION_MAKE_STATIC:int = 0;
      
      public static const Z_RIGID_DEACTIVATION_DISABLE:int = 1;
       
      
      protected var deactivationMode:int;
      
      protected var bodyType:int;
      
      protected var phBody:b2Body;
      
      protected var linearVelocity:Vec2F;
      
      protected var angualrVelocity:Number;
      
      protected var mass:Number;
      
      protected var inertia:Number;
      
      protected var linearDamping:Number;
      
      protected var angularDamping:Number;
      
      protected var gravityScale:Number;
      
      protected var bBullet:Boolean;
      
      protected var bMassSet:Boolean;
      
      protected var bFixedRotation:Boolean;
      
      protected var bActiveMode:Boolean;
      
      protected var bSyncingTransform:int;
      
      protected var bEHTransformChanged:Boolean;
      
      protected var localFixtureBoundsAA:AABox2f;
      
      protected var bLocalFixtureBoundsAADirty:Boolean;
      
      protected var pContactVeto:Function;
      
      protected var collisionExclusions:Vector.<RigidBody2>;
      
      protected var collisionShapes:Vector.<CollisionFixture2>;
      
      protected var _worldObj:World2Obj;
      
      public function RigidBody2(param1:int = 1)
      {
         super();
         this._worldObj = null;
         this.constructor(param1);
      }
      
      public function constructor(param1:int) : void
      {
         this.deactivationMode = Z_RIGID_DEACTIVATION_MAKE_STATIC;
         this.bodyType = param1;
         this.phBody = null;
         this.mass = 0;
         this.inertia = 0;
         this.linearVelocity = new Vec2F();
         this.angualrVelocity = 0;
         this.linearDamping = 0;
         this.angularDamping = 0;
         this.gravityScale = 1;
         this.bBullet = false;
         this.bEHTransformChanged = false;
         this.bMassSet = false;
         this.bFixedRotation = false;
         this.pContactVeto = null;
         this.bActiveMode = true;
         this.localFixtureBoundsAA = new AABox2f();
         this.localFixtureBoundsAA.invalidate();
         this.bLocalFixtureBoundsAADirty = true;
         this.bSyncingTransform = 0;
         this.collisionShapes = new Vector.<CollisionFixture2>();
         this.collisionExclusions = new Vector.<RigidBody2>();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.pContactVeto = null;
         if(this.phBody)
         {
            this.getWorldObj().getLayer().getPhysicsSystem().removeBody(this);
            this.phBody = null;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.collisionShapes.length)
         {
            this.collisionShapes[_loc1_].dispose();
            this.collisionShapes[_loc1_] = null;
            _loc1_++;
         }
         this.collisionShapes.length = 0;
      }
      
      public function getFixtures() : Vector.<CollisionFixture2>
      {
         return this.collisionShapes;
      }
      
      public function removeCollisionFixture(param1:CollisionFixture2) : void
      {
         param1.enableCollision(false);
         var _loc2_:int = this.collisionShapes.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.collisionShapes.splice(_loc2_,1);
         }
      }
      
      public function addCollisionFixture(param1:CollisionFixture2) : void
      {
         param1.setRigidBody(this);
         this.collisionShapes.push(param1);
         if(this.phBody)
         {
            param1.enableCollision(true);
         }
         this.bLocalFixtureBoundsAADirty = true;
      }
      
      public function setTransform(param1:Vec2F, param2:Number) : void
      {
         var _loc3_:b2Transform = null;
         if(this.phBody)
         {
            _loc3_ = new b2Transform(new b2Vec2(param1.x,param1.y),b2Mat22.FromAngle(param2));
            this.phBody.SetTransform(_loc3_);
         }
      }
      
      public function getCollisionExclusions() : Vector.<RigidBody2>
      {
         return this.collisionExclusions;
      }
      
      public function syncPhysics() : void
      {
         ++this.bSyncingTransform;
         this.getWorldObj().setPosition2(this.phBody.GetPosition().x,this.phBody.GetPosition().y);
         this.getWorldObj().setRotation(this.phBody.GetAngle());
         --this.bSyncingTransform;
         this.linearVelocity.x = this.phBody.GetLinearVelocity().x;
         this.linearVelocity.y = this.phBody.GetLinearVelocity().y;
         this.angualrVelocity = this.phBody.GetAngularVelocity();
      }
      
      public function getWorldObj() : World2Obj
      {
         return this._worldObj;
      }
      
      public function setWorldObj(param1:World2Obj) : void
      {
         this._worldObj = param1;
      }
      
      public function hasContactVeto() : Boolean
      {
         return this.pContactVeto != null;
      }
      
      public function callContactVeto(param1:EventContact2) : Boolean
      {
         return this.pContactVeto(param1);
      }
      
      public function getRotation() : Number
      {
         return this.getWorldObj().getRotation();
      }
      
      public function getPosition() : Vec2F
      {
         return this.getWorldObj().getPosition();
      }
      
      public function enablePhysics(param1:Boolean) : void
      {
         var _loc2_:PhysicsSystem2 = null;
         var _loc3_:b2BodyDef = null;
         var _loc4_:b2MassData = null;
         var _loc5_:b2JointEdge = null;
         var _loc6_:b2JointEdge = null;
         var _loc7_:int = 0;
         if(param1 && !this.phBody)
         {
            _loc2_ = this.getWorldObj().getLayer().getPhysicsSystem();
            if(_loc2_)
            {
               _loc3_ = new b2BodyDef();
               _loc3_.position.x = this.getPosition().x;
               _loc3_.position.y = this.getPosition().y;
               _loc3_.angle = this.getRotation();
               _loc3_.linearVelocity.x = this.linearVelocity.x;
               _loc3_.linearVelocity.y = this.linearVelocity.y;
               _loc3_.angularVelocity = this.angualrVelocity;
               _loc3_.linearDamping = this.linearDamping;
               _loc3_.angularDamping = this.angularDamping;
               _loc3_.active = true;
               switch(this.bodyType)
               {
                  case Z_RIGID_BODY_STATIC:
                     _loc3_.type = b2Body.b2_staticBody;
                     break;
                  case Z_RIGID_BODY_DYNAMIC:
                     _loc3_.type = b2Body.b2_dynamicBody;
                     break;
                  case Z_RIGID_BODY_KINEMATIC:
                     _loc3_.type = b2Body.b2_kinematicBody;
                     break;
                  default:
                     trace("Unkown body type for box2d physics system.");
               }
               this.phBody = _loc2_.getBox2DWorld().CreateBody(_loc3_);
               this.phBody.SetUserData(this);
               this.phBody.SetBullet(this.bBullet);
               this.phBody.SetFixedRotation(this.bFixedRotation);
               this.enableCollision(param1);
               if(!this.bMassSet)
               {
                  this.mass = this.phBody.GetMass();
                  this.inertia = this.phBody.GetInertia();
               }
               else
               {
                  (_loc4_ = new b2MassData()).center.SetZero();
                  _loc4_.mass = this.mass;
                  _loc4_.I = this.inertia;
                  this.phBody.SetMassData(_loc4_);
               }
               this.bEHTransformChanged = true;
            }
         }
         else if(!param1 && this.phBody)
         {
            _loc2_ = this.getWorldObj().getLayer().getPhysicsSystem();
            if(_loc2_)
            {
               _loc5_ = null;
               _loc6_ = this.phBody.GetJointList();
               if(_loc6_ != null)
               {
                  throw new Error("SCG: Need to implement joints");
               }
               _loc2_.getBox2DWorld().DestroyBody(this.phBody);
               this.phBody = null;
               _loc7_ = 0;
               while(_loc7_ < this.collisionShapes.length)
               {
                  this.collisionShapes[_loc7_].bEnabled = false;
                  this.collisionShapes[_loc7_].b2Fixtures.length = 0;
                  _loc7_++;
               }
               this.bEHTransformChanged = false;
            }
         }
      }
      
      public function rotationChanged(param1:Number) : void
      {
         if(this.bSyncingTransform == 0 && this.bEHTransformChanged)
         {
            this.phBody.SetAngle(param1);
         }
      }
      
      public function positionChanged(param1:Number, param2:Number) : void
      {
         if(this.bSyncingTransform == false && this.bEHTransformChanged)
         {
            this.phBody.SetPosition(new b2Vec2(param1,param2));
         }
      }
      
      public function enableCollision(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.collisionShapes.length)
         {
            this.collisionShapes[_loc2_].enableCollision(param1);
            _loc2_++;
         }
      }
      
      public function getB2Body() : b2Body
      {
         return this.phBody;
      }
      
      public function addedToLayer() : void
      {
         var _loc1_:PhysicsSystem2 = this.getWorldObj().getLayer().getPhysicsSystem();
         if(_loc1_)
         {
            _loc1_.addBody(this);
            this.enablePhysics(true);
         }
      }
      
      public function removedFromLayer() : void
      {
         var _loc1_:PhysicsSystem2 = this.getWorldObj().getLayer().getPhysicsSystem();
         if(_loc1_)
         {
            this.enablePhysics(false);
            _loc1_.removeBody(this);
         }
      }
      
      public function getLinearVelocity() : Vec2F
      {
         return this.linearVelocity;
      }
      
      public function getRandomPositionInsideCollision() : Vec2F
      {
         if(this.collisionShapes.length == 0)
         {
            return new Vec2F();
         }
         var _loc1_:CollisionFixture2 = this.collisionShapes[Random.RandomNumberRange(0,this.collisionShapes.length - 1)];
         return _loc1_.getRandomPositionInsideShape();
      }
      
      public function scaleCollision(param1:Vec2F) : void
      {
         var _loc2_:CollisionFixture2 = null;
         var _loc3_:Boolean = false;
         for each(_loc2_ in this.collisionShapes)
         {
            _loc3_ = _loc2_.isCollisionEnabled();
            _loc2_.enableCollision(false);
            _loc2_.scale(param1);
            if(_loc3_)
            {
               _loc2_.enableCollision(_loc3_);
            }
         }
      }
      
      private function updateFixtureBounds() : void
      {
         var _loc1_:CollisionFixture2 = null;
         var _loc2_:OBox2f = null;
         var _loc3_:AABox2f = null;
         this.localFixtureBoundsAA.invalidate();
         for each(_loc1_ in this.collisionShapes)
         {
            _loc2_ = new OBox2f();
            _loc3_ = new AABox2f();
            _loc1_.calcLocalBounds(_loc3_);
            _loc2_.set(_loc3_);
            _loc2_.rotate(_loc1_.getRotation());
            _loc2_.translateWorld(_loc1_.getPosition());
            this.localFixtureBoundsAA.addOBOX(_loc2_);
         }
      }
      
      public function getLocalFixtureBounds() : AABox2f
      {
         if(this.bLocalFixtureBoundsAADirty)
         {
            this.updateFixtureBounds();
            this.bLocalFixtureBoundsAADirty = false;
         }
         return this.localFixtureBoundsAA;
      }
   }
}
