package zufflin.physics2D
{
   import Box2D.Dynamics.b2FilterData;
   import Box2D.Dynamics.b2Fixture;
   import util.Vec2F;
   import zufflin.math.AABox2f;
   import zufflin.world2D.CollisionFixture;
   
   public class CollisionFixture2 extends CollisionFixture
   {
       
      
      public var bEnabled:Boolean;
      
      protected var collisionGroup:uint;
      
      protected var collisionMaskBits:uint;
      
      protected var collisionCategoryBits:uint;
      
      protected var friction:Number;
      
      protected var restitution:Number;
      
      protected var density:Number;
      
      protected var position:Vec2F;
      
      protected var rotation:Number;
      
      protected var bIsSensor:Boolean;
      
      public var b2Fixtures:Vector.<b2Fixture>;
      
      public function CollisionFixture2()
      {
         super();
         this.position = new Vec2F();
         this.rotation = 0;
         this.density = 1;
         this.friction = 0.2;
         this.restitution = 0.2;
         this.bIsSensor = false;
         this.bEnabled = false;
         this.collisionGroup = 0;
         this.collisionCategoryBits = 1;
         this.collisionMaskBits = 0;
         this.b2Fixtures = new Vector.<b2Fixture>();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function isCollisionEnabled() : Boolean
      {
         return this.bEnabled;
      }
      
      public function getB2Fixtures() : Vector.<b2Fixture>
      {
         return this.b2Fixtures;
      }
      
      public function setDensity(param1:Number) : void
      {
         this.density = param1;
      }
      
      public function getDensity() : Number
      {
         return this.density;
      }
      
      public function getPosition() : Vec2F
      {
         return this.position;
      }
      
      public function getRotation() : Number
      {
         return this.rotation;
      }
      
      public function setFriction(param1:Number) : void
      {
         this.friction = param1;
      }
      
      public function getFriction() : Number
      {
         return this.friction;
      }
      
      public function getRestitution() : Number
      {
         return this.restitution;
      }
      
      public function isSensor() : Boolean
      {
         return this.bIsSensor;
      }
      
      public function getCollisionGroup() : uint
      {
         return this.collisionGroup;
      }
      
      public function getCollisionMask() : uint
      {
         return this.collisionMaskBits;
      }
      
      public function getCollisionCategory() : uint
      {
         return this.collisionCategoryBits;
      }
      
      public function scale(param1:Vec2F) : void
      {
         this.position.x *= param1.x;
         this.position.y *= param1.y;
      }
      
      public function getRandomPositionInsideShape() : Vec2F
      {
         return new Vec2F();
      }
      
      public function getRigidBody() : RigidBody2
      {
         return pRigidBody as RigidBody2;
      }
      
      public function enableCollision(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 != this.bEnabled)
         {
            this.bEnabled = param1;
            if(this.bEnabled)
            {
               this.createCollision();
            }
            else
            {
               _loc2_ = 0;
               while(_loc2_ < this.b2Fixtures.length)
               {
                  this.getRigidBody().getB2Body().DestroyFixture(this.b2Fixtures[_loc2_]);
                  _loc2_++;
               }
               this.b2Fixtures.length = 0;
            }
         }
      }
      
      public function setPosition(param1:Vec2F) : void
      {
         if(this.bEnabled)
         {
            if(this.position.x != param1.x && this.position.y != param1.y)
            {
               this.position.x = param1.x;
               this.position.y = param1.y;
               this.enableCollision(false);
               this.enableCollision(true);
            }
         }
         else
         {
            this.position.x = param1.x;
            this.position.y = param1.y;
         }
      }
      
      public function setRotation(param1:Number) : void
      {
         if(this.bEnabled)
         {
            if(this.rotation != param1)
            {
               this.rotation = param1;
               this.enableCollision(false);
               this.enableCollision(true);
            }
         }
         else
         {
            this.rotation = param1;
         }
      }
      
      public function setCollisionGroup(param1:uint) : void
      {
         this.collisionGroup = param1;
         this.updateCollisionFilter();
      }
      
      public function setCollisionMask(param1:uint) : void
      {
         this.collisionMaskBits = param1;
         this.updateCollisionFilter();
      }
      
      public function setCollisionCategory(param1:uint) : void
      {
         this.collisionCategoryBits = param1;
         this.updateCollisionFilter();
      }
      
      public function updateCollisionFilter() : void
      {
         var _loc1_:b2FilterData = null;
         var _loc2_:int = 0;
         if(this.bEnabled)
         {
            _loc1_ = new b2FilterData();
            _loc1_.categoryBits = this.collisionCategoryBits;
            _loc1_.maskBits = this.collisionMaskBits;
            _loc1_.groupIndex = this.collisionGroup;
            _loc2_ = 0;
            while(_loc2_ < this.b2Fixtures.length)
            {
               this.b2Fixtures[_loc2_].SetFilterData(_loc1_);
               _loc2_++;
            }
         }
      }
      
      public function setRestitution(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(this.restitution != param1)
         {
            this.restitution = param1;
            if(this.bEnabled)
            {
               _loc2_ = 0;
               while(_loc2_ < this.b2Fixtures.length)
               {
                  this.b2Fixtures[_loc2_].SetRestitution(this.restitution);
                  _loc2_++;
               }
            }
         }
      }
      
      public function setSensor(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(this.bIsSensor != param1)
         {
            this.bIsSensor = param1;
            _loc2_ = 0;
            while(_loc2_ < this.b2Fixtures.length)
            {
               this.b2Fixtures[_loc2_].SetSensor(this.bIsSensor);
               _loc2_++;
            }
         }
      }
      
      public function createCollision() : void
      {
      }
      
      public function calcLocalBounds(param1:AABox2f) : void
      {
         throw new Error("SCG: Needs overridden in base");
      }
   }
}
