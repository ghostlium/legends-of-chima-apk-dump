package game.objects.powers
{
   import flash.events.Event;
   import flash.media.SoundChannel;
   import game.GameConsts;
   import game.GameRes;
   import game.objects.ChimaGameObject;
   import game.objects.enemies.Enemy;
   import game.objects.enemies.EnvEnemy;
   import game.objects.events.EventEnemyDied;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.cobraBase.GlaSet;
   import zufflin.math.AABox2f;
   import zufflin.physics2D.EventContact2;
   import zufflin.physics2D.RigidBody2;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldObj;
   
   public class ChimaMageBolt extends ChimaGameObject
   {
      
      public static const kfBaseBoltSpeed:Number = 400;
      
      public static const kfBoltSpeedIncrease:Number = 100;
       
      
      public var _pSoundLoop:SoundChannel;
      
      public var _fSpeed:Number;
      
      public var _pTarget:Enemy;
      
      public function ChimaMageBolt(param1:int, param2:Vec2F, param3:GlaSet, param4:String)
      {
         super(param1,param2,2,GameConsts.ePlayerBulletCollisionCat,GameConsts.eEnemyCollisionCat,param3,param4);
         this._pTarget = null;
         this._fSpeed = kfBaseBoltSpeed;
         setEnableShadow(false);
         setDepthOffset(GameConsts.DEPTH_OFFSET_BULLETS);
         Main.Instance().m_app.addEventListener(EventEnemyDied.EVENT_ENEMY_DIED,this.eventEnemyDied);
         this._pSoundLoop = GameRes.get()._pChiMageSound.play();
         this._pSoundLoop.addEventListener(Event.SOUND_COMPLETE,this.OnSoundComplete);
      }
      
      private function OnSoundComplete(param1:Event) : void
      {
         this._pSoundLoop.removeEventListener(Event.SOUND_COMPLETE,this.OnSoundComplete);
         this._pSoundLoop = null;
      }
      
      override public function dispose() : void
      {
         if(this._pSoundLoop)
         {
            this._pSoundLoop.removeEventListener(Event.SOUND_COMPLETE,this.OnSoundComplete);
            this._pSoundLoop.stop();
            this._pSoundLoop = null;
         }
         Main.Instance().m_app.removeEventListener(EventEnemyDied.EVENT_ENEMY_DIED,this.eventEnemyDied);
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc6_:Vec2F = null;
         if(this._pSoundLoop == null)
         {
            this._pSoundLoop = GameRes.get()._pChiMageSound.play();
            this._pSoundLoop.addEventListener(Event.SOUND_COMPLETE,this.OnSoundComplete);
         }
         var _loc2_:GlaControllerSprite = _pAnims[CHAR_ANIM_STATIC].getController().findSprite("LightningDisc");
         if(_loc2_ != null)
         {
            _loc2_.setRotation(Random.RandomFloatRangeUniform(0,Math.PI * 2));
         }
         var _loc3_:Vec2F = getPosition();
         var _loc4_:Vec2F = new Vec2F();
         if(this._pTarget != null)
         {
            _loc6_ = this.getTargetCollisionCentre();
            _loc4_.x = _loc6_.x - _loc3_.x;
            _loc4_.y = _loc6_.y - _loc3_.y;
            _loc4_.normalize(1);
            _loc4_.scaleBy(this._fSpeed * param1.getTime().dt);
            this._fSpeed += kfBoltSpeedIncrease;
            setPosition(new Vec2F(_loc3_.x + _loc4_.x,_loc3_.y + _loc4_.y));
         }
         else
         {
            this._fSpeed = kfBaseBoltSpeed;
            this._pTarget = this.findClosestTarget();
            _loc4_.x = 0;
            _loc4_.y = -1 * this._fSpeed * param1.getTime().dt;
            setPosition(new Vec2F(_loc3_.x + _loc4_.x,_loc3_.y + _loc4_.y));
         }
         var _loc5_:AABox2f;
         (_loc5_ = _pAnims[CHAR_ANIM_STATIC].getLocalBounds()).translate(getPosition());
         if(_loc5_.max.y < 0 && this._pTarget == null)
         {
            deleteThis();
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         var _loc2_:Enemy = null;
         if(param1.getOtherObject() is Enemy)
         {
            _loc2_ = param1.getOtherObject() as Enemy;
            _loc2_.takeDamage(1000);
         }
      }
      
      public function eventEnemyDied(param1:EventEnemyDied) : void
      {
         if(param1.getEnemy() == this._pTarget)
         {
            this._pTarget = null;
         }
      }
      
      public function getTargetCollisionCentre() : Vec2F
      {
         var _loc2_:RigidBody2 = null;
         var _loc1_:Vec2F = new Vec2F(0,0);
         if(this._pTarget)
         {
            _loc2_ = this._pTarget.SCG_GetRigidBody();
            if(_loc2_)
            {
               _loc1_.x = this._pTarget.getPosition().x + this._pTarget.getCollisionOffset().x;
               _loc1_.y = this._pTarget.getPosition().y + this._pTarget.getCollisionOffset().y;
               return _loc1_;
            }
            _loc1_.x = this._pTarget.getPosition().x + this._pTarget.getCollisionOffset().x;
            _loc1_.y = this._pTarget.getPosition().y + this._pTarget.getCollisionOffset().y;
            return _loc1_;
         }
         return _loc1_;
      }
      
      public function findClosestTarget() : Enemy
      {
         var _loc4_:WorldObj = null;
         var _loc5_:Enemy = null;
         var _loc6_:Vec2F = null;
         var _loc1_:Enemy = null;
         var _loc2_:Vec2F = new Vec2F(10000,10000);
         var _loc3_:Vector.<WorldObj> = getLayer().getObjectList();
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_ is Enemy && !(_loc4_ is EnvEnemy))
            {
               if((_loc5_ = _loc4_ as Enemy).shouldDelete() == false)
               {
                  if((_loc6_ = new Vec2F(getPosition().x - _loc5_.getPosition().x,getPosition().y - _loc5_.getPosition().y)).getLengthSq() < _loc2_.getLengthSq())
                  {
                     _loc1_ = _loc5_;
                     _loc2_ = _loc6_;
                  }
               }
            }
         }
         return _loc1_;
      }
   }
}
