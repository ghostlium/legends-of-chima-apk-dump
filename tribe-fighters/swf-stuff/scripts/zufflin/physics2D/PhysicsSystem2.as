package zufflin.physics2D
{
   import Box2D.Collision.b2Manifold;
   import Box2D.Collision.b2WorldManifold;
   import Box2D.Common.Math.b2Vec2;
   import Box2D.Dynamics.Contacts.b2Contact;
   import Box2D.Dynamics.b2Body;
   import Box2D.Dynamics.b2ContactFilter;
   import Box2D.Dynamics.b2ContactListener;
   import Box2D.Dynamics.b2DebugDraw;
   import Box2D.Dynamics.b2Fixture;
   import Box2D.Dynamics.b2World;
   import flash.utils.Dictionary;
   import util.Vec2F;
   import zufflin.world.EventUpdatePhysics;
   
   public class PhysicsSystem2
   {
       
      
      private var phWorld:b2World;
      
      private var phContactListener:b2ContactListener;
      
      private var phContactFilter:b2ContactFilter;
      
      private var contacts:Dictionary;
      
      private var activeContacts:Vector.<B2ContactProxy>;
      
      private var toDelete:Vector.<B2ContactProxy>;
      
      private var collisionGrid:Vector.<uint>;
      
      private var collisionGridWidth:int;
      
      private var dbgTraces:Vector.<DbgTraceInfo>;
      
      private var bDbgEnabled:Boolean;
      
      private var gravity:Vec2F;
      
      private var bUseFilterGrid:Boolean;
      
      private var velocityIterations:int;
      
      private var positionIterations:int;
      
      private var timeMultiplier:Number;
      
      public function PhysicsSystem2()
      {
         var _loc1_:b2DebugDraw = null;
         super();
         this.contacts = new Dictionary();
         this.activeContacts = new Vector.<B2ContactProxy>();
         this.toDelete = new Vector.<B2ContactProxy>();
         this.collisionGrid = new Vector.<uint>();
         this.dbgTraces = new Vector.<DbgTraceInfo>();
         this.gravity = new Vec2F();
         Main.Instance().m_app.addEventListener(EventUpdatePhysics.EVENT_UPDATE_PHYSICS,this.eventUpdate);
         this.gravity.set(0,10);
         this.bDbgEnabled = false;
         this.phContactListener = new B2ContactListener(this);
         this.phContactFilter = new B2GridContactFilter(this);
         this.phWorld = new b2World(new b2Vec2(0,0),false);
         this.phWorld.SetContactListener(this.phContactListener);
         this.phWorld.SetContactFilter(this.phContactFilter);
         this.phWorld.SetGravity(new b2Vec2(this.gravity.x,this.gravity.y));
         this.phWorld.SetContinuousPhysics(true);
         this.velocityIterations = 10;
         this.positionIterations = 10;
         this.timeMultiplier = 1;
         this.bUseFilterGrid = true;
         this.collisionGrid.push(1);
         this.collisionGridWidth = 1;
         if(LegoChima.DEBUG_DRAW_PHYSICS)
         {
            _loc1_ = new b2DebugDraw();
            _loc1_.SetSprite(LegoChima.DBGPhysSprite);
            _loc1_.SetDrawScale(LegoChima.DBGPhysScale);
            _loc1_.SetLineThickness(1);
            _loc1_.SetAlpha(0.8);
            _loc1_.SetFillAlpha(0.4);
            _loc1_.SetFlags(b2DebugDraw.e_shapeBit);
            this.phWorld.SetDebugDraw(_loc1_);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         Main.Instance().m_app.removeEventListener(EventUpdatePhysics.EVENT_UPDATE_PHYSICS,this.eventUpdate);
         _loc1_ = 0;
         while(_loc1_ < this.activeContacts.length)
         {
            this.activeContacts[_loc1_].dispose();
            this.activeContacts[_loc1_] = null;
            _loc1_++;
         }
         this.activeContacts.length = 0;
         this.activeContacts = null;
         this.phWorld.SetContactListener(null);
         this.phWorld = null;
         this.phContactListener = null;
         this.phContactFilter = null;
      }
      
      public function getCollisionGridWidth() : int
      {
         return this.collisionGridWidth;
      }
      
      public function getCollisionGrid() : Vector.<uint>
      {
         return this.collisionGrid;
      }
      
      public function getTimeMultiplier() : Number
      {
         return this.timeMultiplier;
      }
      
      public function getBox2DWorld() : b2World
      {
         return this.phWorld;
      }
      
      public function setContinuousPhysics(param1:Boolean) : void
      {
         this.phWorld.SetContinuousPhysics(param1);
      }
      
      public function eventUpdate(param1:EventUpdatePhysics) : void
      {
         if(LegoChima.DEBUG_DRAW_PHYSICS)
         {
            this.phWorld.DrawDebugData();
         }
         this.dbgTraces.length = 0;
         this.phWorld.Step(param1.getTime().dt * this.timeMultiplier,this.velocityIterations,this.positionIterations);
         var _loc2_:b2Body = this.phWorld.GetBodyList();
         while(_loc2_ != null)
         {
            if(_loc2_.GetType() != b2Body.b2_staticBody && _loc2_.IsActive())
            {
               (_loc2_.GetUserData() as RigidBody2).syncPhysics();
            }
            _loc2_ = _loc2_.GetNext();
         }
         this.processContactProxies();
      }
      
      public function setGravity(param1:Vec2F) : void
      {
         this.gravity.x = param1.x;
         this.gravity.y = param1.y;
         this.phWorld.SetGravity(new b2Vec2(this.gravity.x,this.gravity.y));
      }
      
      public function processContactProxies() : void
      {
         var _loc1_:Vector.<B2ContactProxy> = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(!this.activeContacts.length == 0)
         {
            _loc1_ = this.activeContacts;
            _loc2_ = 0;
            for(; _loc2_ < _loc1_.length; _loc2_++)
            {
               if(_loc1_[_loc2_].bDelete)
               {
                  this.toDelete.push(_loc1_[_loc2_]);
                  continue;
               }
               switch(_loc1_[_loc2_].type)
               {
                  case EventContact2.Z_CONTACT_BEGIN:
                     this.reportContactToObjects(_loc1_[_loc2_],EventContact2.Z_CONTACT_BEGIN);
                     _loc1_[_loc2_].type = EventContact2.Z_CONTACT_UPDATE;
                     break;
                  case EventContact2.Z_CONTACT_UPDATE:
                     this.reportContactToObjects(_loc1_[_loc2_],EventContact2.Z_CONTACT_UPDATE);
                     break;
                  case EventContact2.Z_CONTACT_END:
                     this.reportContactToObjects(_loc1_[_loc2_],EventContact2.Z_CONTACT_END);
                     this.toDelete.push(_loc1_[_loc2_]);
                     break;
               }
            }
            _loc2_ = 0;
            while(_loc2_ < this.toDelete.length)
            {
               _loc3_ = this.activeContacts.indexOf(this.toDelete[_loc2_]);
               this.activeContacts[_loc3_].dispose();
               this.activeContacts.splice(_loc3_,1);
               _loc2_++;
            }
            this.toDelete.length = 0;
         }
      }
      
      public function reportContactToObjects(param1:B2ContactProxy, param2:int) : void
      {
         var _loc3_:EventContact2 = new EventContact2(EventContact2.EVENT_CONTACT2);
         _loc3_.setType(param2);
         _loc3_.setPosition(param1.position);
         if(!param1.objA.shouldDelete())
         {
            _loc3_.setOurBody(param1.rigidA);
            _loc3_.setOtherBody(param1.rigidB);
            _loc3_.setOurObject(param1.objA);
            _loc3_.setOtherObject(param1.objB);
            _loc3_.setNormal(param1.normal);
            _loc3_.setVelocity(param1.velocity);
            _loc3_.setOurShape(param1.fixA);
            _loc3_.setOtherShape(param1.fixB);
            param1.objA.doContactEvent(_loc3_);
         }
         if(!param1.objB.shouldDelete())
         {
            _loc3_.setOurBody(param1.rigidB);
            _loc3_.setOtherBody(param1.rigidA);
            _loc3_.setOurObject(param1.objB);
            _loc3_.setOtherObject(param1.objA);
            _loc3_.setNormal(new Vec2F(-param1.normal.x,-param1.normal.y));
            _loc3_.setVelocity(new Vec2F(-param1.velocity.x,-param1.velocity.y));
            _loc3_.setOurShape(param1.fixB);
            _loc3_.setOtherShape(param1.fixA);
            param1.objB.doContactEvent(_loc3_);
         }
      }
      
      public function beginContact(param1:b2Contact) : void
      {
         var _loc2_:B2ContactProxy = new B2ContactProxy();
         _loc2_.pContact = param1;
         _loc2_.fixA = param1.GetFixtureA().GetUserData() as CollisionFixture2;
         _loc2_.fixB = param1.GetFixtureB().GetUserData() as CollisionFixture2;
         _loc2_.rigidA = _loc2_.fixA.getRigidBody();
         _loc2_.rigidB = _loc2_.fixB.getRigidBody();
         _loc2_.objA = _loc2_.rigidA.getWorldObj();
         _loc2_.objB = _loc2_.rigidB.getWorldObj();
         _loc2_.type = EventContact2.Z_CONTACT_BEGIN;
         _loc2_.velocity.clear();
         _loc2_.position.clear();
         _loc2_.bHasCollisionVetos = _loc2_.rigidA.hasContactVeto() || _loc2_.rigidB.hasContactVeto();
         this.activeContacts.push(_loc2_);
      }
      
      public function endContact(param1:b2Contact) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.activeContacts.length;
         var _loc4_:B2ContactProxy = null;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.activeContacts[_loc2_].pContact == param1)
            {
               _loc4_ = this.activeContacts[_loc2_];
               break;
            }
            _loc2_++;
         }
         if(_loc4_ == null)
         {
            trace("  FAILURE: CONTACT not matched in active list");
         }
         _loc4_.type = EventContact2.Z_CONTACT_END;
         _loc4_.pContact = null;
         if(!this.phWorld.IsLocked())
         {
            this.reportContactToObjects(_loc4_,EventContact2.Z_CONTACT_END);
            _loc4_.bDelete = true;
         }
      }
      
      public function preSolve(param1:b2Contact, param2:b2Manifold) : void
      {
         var _loc9_:b2Vec2 = null;
         var _loc10_:b2Vec2 = null;
         var _loc11_:EventContact2 = null;
         var _loc3_:b2Manifold = param1.GetManifold();
         if(_loc3_.m_pointCount == 0)
         {
            return;
         }
         var _loc4_:int;
         if((_loc4_ = this.activeContacts.indexOf(param1)) == -1)
         {
            return;
         }
         var _loc5_:B2ContactProxy = this.activeContacts[_loc4_];
         var _loc6_:b2Fixture = param1.GetFixtureA();
         var _loc7_:b2Fixture = param1.GetFixtureB();
         var _loc8_:b2WorldManifold = new b2WorldManifold();
         param1.GetWorldManifold(_loc8_);
         if(_loc3_.m_pointCount > 0)
         {
            _loc5_.position.x = _loc8_.m_points[0].x;
            _loc5_.position.y = _loc8_.m_points[0].y;
            _loc5_.normal.x = _loc8_.m_normal.x;
            _loc5_.normal.y = _loc8_.m_normal.y;
            _loc9_ = _loc6_.GetBody().GetLinearVelocityFromWorldPoint(_loc8_.m_points[0]);
            _loc10_ = _loc7_.GetBody().GetLinearVelocityFromWorldPoint(_loc8_.m_points[0]);
            _loc5_.velocity.x = _loc10_.x - _loc9_.x;
            _loc5_.velocity.y = _loc10_.y - _loc9_.y;
            _loc5_.vPreSolveCalled = true;
         }
         if(_loc5_.bHasCollisionVetos)
         {
            if(_loc5_.rigidA.hasContactVeto())
            {
               (_loc11_ = new EventContact2(EventContact2.EVENT_CONTACT2)).setType(EventContact2.Z_CONTACT_VETO);
               _loc11_.setPosition(_loc5_.position);
               _loc11_.setOurBody(_loc5_.rigidA);
               _loc11_.setOtherBody(_loc5_.rigidB);
               _loc11_.setOurObject(_loc5_.objA);
               _loc11_.setOtherObject(_loc5_.objB);
               _loc11_.setNormal(_loc5_.normal);
               _loc11_.setVelocity(_loc5_.velocity);
               _loc11_.setOurShape(_loc5_.fixA);
               _loc11_.setOtherShape(_loc5_.fixB);
               if(!_loc5_.rigidA.callContactVeto(_loc11_))
               {
                  param1.SetEnabled(false);
               }
            }
            if(_loc5_.rigidB.hasContactVeto())
            {
               (_loc11_ = new EventContact2(EventContact2.EVENT_CONTACT2)).setType(EventContact2.Z_CONTACT_VETO);
               _loc11_.setPosition(_loc5_.position);
               _loc11_.setOurBody(_loc5_.rigidB);
               _loc11_.setOtherBody(_loc5_.rigidA);
               _loc11_.setOurObject(_loc5_.objB);
               _loc11_.setOtherObject(_loc5_.objA);
               _loc11_.setNormal(new Vec2F(-_loc5_.normal.x,-_loc5_.normal.y));
               _loc11_.setVelocity(new Vec2F(-_loc5_.velocity.x,-_loc5_.velocity.y));
               _loc11_.setOurShape(_loc5_.fixB);
               _loc11_.setOtherShape(_loc5_.fixA);
               if(!_loc5_.rigidB.callContactVeto(_loc11_))
               {
                  param1.SetEnabled(false);
               }
            }
         }
      }
      
      public function addBody(param1:RigidBody2) : void
      {
      }
      
      public function removeBody(param1:RigidBody2) : void
      {
         var _loc3_:B2ContactProxy = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.activeContacts.length)
         {
            _loc3_ = this.activeContacts[_loc2_];
            if(_loc3_.rigidA == param1 || _loc3_.rigidB == param1)
            {
               _loc3_.bDelete = true;
            }
            _loc2_++;
         }
      }
      
      public function enableContactReporting(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && !this.phContactListener)
         {
            this.phContactListener = new B2ContactListener(this);
            this.phWorld.SetContactListener(this.phContactListener);
         }
         else if(!param1 && this.phContactListener)
         {
            this.phWorld.SetContactListener(null);
            this.phContactListener = null;
            _loc2_ = 0;
            while(_loc2_ < this.activeContacts.length)
            {
               this.activeContacts[_loc2_].dispose();
               this.activeContacts[_loc2_] = null;
               _loc2_++;
            }
            this.activeContacts.length = 0;
         }
      }
      
      public function setDefaultCollisionFilter() : void
      {
         this.phContactFilter = new B2ContactFilter();
         this.phWorld.SetContactFilter(this.phContactFilter);
      }
      
      public function setStepParams(param1:int, param2:int) : void
      {
         this.velocityIterations = param1;
         this.positionIterations = param2;
      }
      
      public function setTimeMultiplier(param1:Number) : void
      {
         this.timeMultiplier = param1;
      }
   }
}
