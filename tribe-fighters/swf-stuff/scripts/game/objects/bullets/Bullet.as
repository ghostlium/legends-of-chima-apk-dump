package game.objects.bullets
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.ChimaGameObject;
   import game.objects.Player;
   import game.objects.enemies.Enemy;
   import game.objects.events.EventBulletReflected;
   import game.objects.events.EventObjectDeleted;
   import game.objects.misc.ParticleHolder;
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.math.AABox2f;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldObj;
   import zufflin.world2D.RenderableParticleSystem;
   import zufflin.world2D.World2Obj;
   
   public class Bullet extends ChimaGameObject
   {
      
      public static const kfSwordBulletWidth:Number = 240;
      
      public static const kfMaxReflectionAngle:Number = 90;
      
      public static const kuMaxTimesReflected:uint = 5;
      
      public static const kfWandMagnetDistance:Number = 200;
      
      public static const kfWandMagnetSpeed:Number = 250;
       
      
      public var _vel:Vec2F;
      
      public var _fDamage:Number;
      
      public var _fLife:Number;
      
      public var _fLifeDecayRate:Number;
      
      public var _colour:RGBA;
      
      public var _uTimesReflected:uint;
      
      public var _bFiredByPlayer:Boolean;
      
      public var _bSpecialEnabled:Boolean;
      
      public var _pParticles:RenderableParticleSystem;
      
      public function Bullet(param1:int, param2:int, param3:int, param4:Number, param5:String, param6:Vec2F, param7:Vec2F, param8:Number)
      {
         super(param1,param6,1,param2,param3,GameRes.get()._pProjectileSet,param5);
         this._vel = new Vec2F(param7.x,param7.y);
         this._fDamage = param4;
         this._fLife = 1;
         this._fLifeDecayRate = param8;
         this._colour = new RGBA(255,255,255,255);
         this._uTimesReflected = 0;
         this._bFiredByPlayer = false;
         this._bSpecialEnabled = false;
         this._pParticles = null;
         this._colour.a = 0;
         _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].setColor(this._colour);
         setEnableShadow(false);
         setDepthOffset(GameConsts.DEPTH_OFFSET_BULLETS);
         this._pParticles = new RenderableParticleSystem(25);
         this._pParticles.setWorldSpace(true);
         addComponent(this._pParticles);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._pParticles = null;
      }
      
      public function getDamage() : Number
      {
         return this._fDamage;
      }
      
      public function setDamage(param1:Number) : void
      {
         this._fDamage = param1;
      }
      
      public function getVelocity() : Vec2F
      {
         return this._vel;
      }
      
      public function getTimesReflected() : uint
      {
         return this._uTimesReflected;
      }
      
      public function setTimesReflected(param1:uint) : void
      {
         this._uTimesReflected = param1;
      }
      
      public function getFiredByPlayer() : Boolean
      {
         return this._bFiredByPlayer;
      }
      
      public function setFiredByPlayer(param1:Boolean) : void
      {
         this._bFiredByPlayer = param1;
      }
      
      public function getSpecialEnabled() : Boolean
      {
         return this._bSpecialEnabled;
      }
      
      public function setSpecialEnabled(param1:Boolean) : void
      {
         this._bSpecialEnabled = param1;
      }
      
      public function updateParticles(param1:Number) : void
      {
      }
      
      public function collisionParticles() : void
      {
      }
      
      public function reflectParticles(param1:Vec2F, param2:Vec2F) : void
      {
      }
      
      override public function deleteThis() : void
      {
         this.eventObjectDeleted();
         super.deleteThis();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc3_:AABox2f = null;
         var _loc4_:Enemy = null;
         var _loc5_:Vec2F = null;
         this._fLife -= this._fLifeDecayRate * param1.getTime().dt;
         if(this._fLifeDecayRate <= 0)
         {
            this._colour.a = 255;
         }
         else if(this._fLife >= 0.8 && this._fLife <= 1)
         {
            this._colour.a = 255 - uint((this._fLife - 0.8) * 5 * 255);
         }
         else if(this._fLife < 0.2)
         {
            this._colour.a = uint(this._fLife * 5 * 255);
         }
         else
         {
            this._colour.a = 255;
         }
         _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].setColor(this._colour);
         this.updateParticles(param1.getTime().dt);
         var _loc2_:Vec2F = getPosition();
         _loc2_.x += param1.getTime().dt * this._vel.x;
         _loc2_.y += param1.getTime().dt * this._vel.y;
         if(this._bFiredByPlayer && this.isWandBullet(this) && this._bSpecialEnabled)
         {
            if(_loc4_ = this.findClosestEnemy())
            {
               if((_loc5_ = new Vec2F(_loc4_.getPosition().x - getPosition().x,_loc4_.getPosition().y - getPosition().y)).length < kfWandMagnetDistance)
               {
                  _loc5_.normalize(1);
                  _loc2_.x += _loc5_.x * kfWandMagnetSpeed * param1.getTime().dt;
                  _loc2_.y += _loc5_.y * kfWandMagnetSpeed * param1.getTime().dt;
               }
            }
         }
         setPosition(_loc2_);
         if(_loc2_.y < 0 && this._vel.y < 0)
         {
            _loc3_ = _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].getLocalBounds();
            _loc3_.translate(getPosition());
            if(_loc3_.max.y < 0)
            {
               this.deleteThis();
            }
         }
         else if(_loc2_.y > Number(LegoChima.Instance().zGetScreenHeight()) && this._vel.y > 0)
         {
            _loc3_ = _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].getLocalBounds();
            _loc3_.translate(getPosition());
            if(_loc3_.min.y > Number(LegoChima.Instance().zGetScreenHeight()))
            {
               this.deleteThis();
            }
         }
         else if(this._fLife <= 0)
         {
            this.deleteThis();
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         var _loc2_:Enemy = null;
         var _loc3_:Number = NaN;
         var _loc4_:Player = null;
         var _loc5_:Bullet = null;
         if(param1.getOtherObject() is Enemy)
         {
            _loc2_ = param1.getOtherObject() as Enemy;
            if(_loc2_.isOtherIdStored(this.getId()) == false)
            {
               _loc3_ = 1;
               if(this._uTimesReflected > 0)
               {
                  _loc3_ = 10;
               }
               _loc2_.takeDamage(this._fDamage * _loc3_);
               _loc2_.storeOtherId(this.getId());
            }
         }
         if(param1.getOtherObject() is Player)
         {
            if((_loc4_ = param1.getOtherObject() as Player).isOtherIdStored(this.getId()) == false)
            {
               _loc4_.takeDamage(this._fDamage);
               _loc4_.storeOtherId(this.getId());
            }
         }
         if(this.isSwordBullet(this) == false && param1.getOtherObject() is Bullet == false)
         {
            this.deleteThis();
            this.collisionParticles();
         }
         else if(this.isSwordBullet(this) && this._bSpecialEnabled && (this.isRangedBullet(param1.getOtherObject()) || this.isDiscBullet(param1.getOtherObject())) && (param1.getOtherObject() as ChimaGameObject).isOtherIdStored(getId()) == false)
         {
            (param1.getOtherObject() as ChimaGameObject).storeOtherId(getId());
            _loc5_ = param1.getOtherObject() as Bullet;
            this.reflectBullet(_loc5_);
         }
      }
      
      public function eventObjectDeleted(param1:EventObjectDeleted = null) : void
      {
         var _loc2_:ParticleHolder = null;
         if(this._pParticles && getLayer() != null)
         {
            this.removeComponent(this._pParticles);
            _loc2_ = new ParticleHolder(this._pParticles);
            _loc2_.setPosition(getPosition());
            getLayer().addObject(_loc2_);
            _loc2_.eventAddedToLayer();
         }
      }
      
      public function isSwordBullet(param1:World2Obj) : Boolean
      {
         return Boolean(param1 is SwordFireBullet || param1 is SwordIceBullet || param1 is SwordFireBulletUp || param1 is SwordIceBulletUp);
      }
      
      public function isWandBullet(param1:World2Obj) : Boolean
      {
         return Boolean(param1 is WandFireBullet || param1 is WandIceBullet);
      }
      
      public function isRangedBullet(param1:World2Obj) : Boolean
      {
         return Boolean(param1 is FireBullet || param1 is IceBullet);
      }
      
      public function isDiscBullet(param1:World2Obj) : Boolean
      {
         return Boolean(param1 is DiscFireBullet || param1 is DiscIceBullet);
      }
      
      public function reflectBullet(param1:Bullet) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:Bullet = null;
         var _loc5_:Vec2F = null;
         var _loc6_:Number = NaN;
         var _loc7_:Vec2F = null;
         if(param1.getTimesReflected() < kuMaxTimesReflected)
         {
            if(param1.getFiredByPlayer())
            {
               _loc2_ = GameConsts.eEnemyBulletCollisionCat;
               _loc3_ = GameConsts.ePlayerCollisionCat | GameConsts.ePlayerBulletCollisionCat;
            }
            else
            {
               _loc2_ = GameConsts.ePlayerBulletCollisionCat;
               _loc3_ = GameConsts.eEnemyCollisionCat | GameConsts.eEnemyBulletCollisionCat;
            }
            _loc4_ = null;
            _loc5_ = new Vec2F(param1.getPosition().x,param1.getPosition().y);
            _loc6_ = 0;
            if(this.getVelocity().y < 0)
            {
               _loc6_ = (_loc5_.x - getPosition().x) / (0.5 * kfSwordBulletWidth);
            }
            else
            {
               _loc6_ = (getPosition().x - _loc5_.x) / (0.5 * kfSwordBulletWidth);
            }
            (_loc7_ = this.getVelocity().getNormal()).scaleBy(param1.getVelocity().length);
            _loc7_.rotate(MathsHelper.DegToRad(_loc6_ * kfMaxReflectionAngle));
            if(this.isRangedBullet(param1))
            {
               switch(_side)
               {
                  case GameConsts.eFireChima:
                     _loc4_ = new FireBullet(_loc5_,_loc7_,_loc2_,_loc3_);
                     break;
                  case GameConsts.eIceChima:
                     _loc4_ = new IceBullet(_loc5_,_loc7_,_loc2_,_loc3_);
               }
            }
            else if(this.isDiscBullet(param1))
            {
               switch(_side)
               {
                  case GameConsts.eFireChima:
                     _loc4_ = new DiscFireBullet(_loc5_,_loc7_,_loc2_,_loc3_);
                     break;
                  case GameConsts.eIceChima:
                     _loc4_ = new DiscIceBullet(_loc5_,_loc7_,_loc2_,_loc3_);
               }
            }
            _loc4_.setTimesReflected(param1.getTimesReflected() + 1);
            _loc4_.setFiredByPlayer(!param1.getFiredByPlayer());
            if(!param1.getFiredByPlayer())
            {
               Main.Instance().m_app.dispatchEvent(new EventBulletReflected(EventBulletReflected.EVENT_BULLET_REFLECTED,false));
            }
            param1.deleteThis();
            getLayer().addObject(_loc4_);
            this.reflectParticles(_loc5_,_loc7_);
         }
         else
         {
            param1.deleteThis();
         }
      }
      
      public function findClosestEnemy() : Enemy
      {
         var _loc5_:Enemy = null;
         var _loc6_:WorldObj = null;
         var _loc1_:Enemy = null;
         var _loc2_:Vec2F = new Vec2F(10000,10000);
         var _loc3_:Vec2F = new Vec2F();
         var _loc4_:Vector.<WorldObj> = getLayer().getObjectList();
         for each(_loc6_ in _loc4_)
         {
            if(_loc6_ is Enemy)
            {
               _loc5_ = _loc6_ as Enemy;
               _loc3_.x = getPosition().x - _loc5_.getPosition().x;
               _loc3_.y = getPosition().y - _loc5_.getPosition().y;
               if(_loc3_.getLengthSq() < _loc2_.getLengthSq())
               {
                  _loc1_ = _loc5_;
                  _loc2_ = _loc3_;
               }
            }
         }
         return _loc1_;
      }
   }
}
