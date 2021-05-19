package game.objects.enemies
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.EnemyManager;
   import game.objects.Player;
   import game.objects.controllers.EnemyController;
   import game.objects.events.EventEnemySpawned;
   import game.objects.guns.Gun;
   import game.objects.misc.ParticleHolder;
   import game.objects.pickups.StudExplosion;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.RenderableParticleSystem;
   
   public class Enemy extends ChimaGameObject
   {
       
      
      public var _pController:EnemyController;
      
      public var _pGun:Gun;
      
      public var _pParticles:RenderableParticleSystem;
      
      public var _bSpawnFootprints:Boolean;
      
      public var _bDamagePlayerOnContact:Boolean;
      
      public var _bGenerateStuds:Boolean;
      
      public var _fHealth:Number;
      
      public function Enemy(param1:int, param2:Vec2F, param3:Number, param4:Number, param5:GlaSet, param6:String)
      {
         super(param1,param2,param3,GameConsts.eEnemyCollisionCat,GameConsts.ePlayerBulletCollisionCat | GameConsts.ePlayerCollisionCat | GameConsts.ePlayerMissileCollisionCat | GameConsts.eEnemyCollisionCat,param5,param6);
         this._pController = null;
         this._pGun = null;
         this._bDamagePlayerOnContact = true;
         this._bSpawnFootprints = true;
         this._bGenerateStuds = true;
         this._fHealth = param4;
         this._pParticles = new RenderableParticleSystem(25);
         this._pParticles.setWorldSpace(false);
         GameWorld._pWorld.m_FootParticleHolder.addComponent(this._pParticles);
         this._pParticles.setDepth(GameConsts.DEPTH_GROUND_PARTS);
      }
      
      override public function dispose() : void
      {
         if(this._pParticles)
         {
            GameWorld._pWorld.m_FootParticleHolder.removeComponent(this._pParticles,true);
            this._pParticles = null;
         }
         if(this._pController != null)
         {
            this._pController.dispose();
            this._pController = null;
         }
         super.dispose();
      }
      
      public function getHealth() : Number
      {
         return this._fHealth;
      }
      
      public function setHealth(param1:Number) : void
      {
         this._fHealth = param1;
      }
      
      public function getController() : EnemyController
      {
         return this._pController;
      }
      
      public function getGun() : Gun
      {
         return this._pGun;
      }
      
      public function fireGun() : void
      {
         if(this._pGun != null)
         {
            this._pGun.fire();
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         if(param1.getOtherObject() is Player)
         {
            if(this._bDamagePlayerOnContact)
            {
               (param1.getOtherObject() as Player).takeDamage(1);
            }
            this._bGenerateStuds = false;
            this.takeDamage(1000);
         }
         if(this._pController != null)
         {
            this._pController.specificContact(param1);
         }
      }
      
      public function takeDamage(param1:Number) : void
      {
         if(this._fHealth > 0)
         {
            this.specificTakeDamage(param1);
            _fShakeMagnitude = 1;
            this._fHealth -= param1;
            if(this._fHealth <= 0)
            {
               this.die();
            }
         }
      }
      
      public function die() : void
      {
         var _loc1_:Vec2F = null;
         var _loc2_:StudExplosion = null;
         generateDebris(new Vec2F(1,1));
         this.specificDie();
         this.doDeathParticles();
         if(this._bGenerateStuds)
         {
            _loc1_ = new Vec2F(getPosition().x + getCharacterOffset().x,getPosition().y + getCharacterOffset().y);
            _loc2_ = new StudExplosion(_side,_loc1_);
            getLayer().addObject(_loc2_);
         }
         if(_pOwner && _pOwner is EnemyManager)
         {
            (_pOwner as EnemyManager).enemyDied(this);
         }
         deleteThis();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this.spawnFootprints();
      }
      
      public function eventAddedToLayer() : void
      {
         Main.Instance().m_app.dispatchEvent(new EventEnemySpawned(EventEnemySpawned.EVENT_ENEMY_SPAWNED,false,this));
      }
      
      public function spawnFootprints() : void
      {
         var _loc1_:Particle2D = null;
         if(this._bSpawnFootprints && this._pParticles)
         {
            if(getLayer().getUpdateCount() % 20 == 0)
            {
               _loc1_ = this._pParticles.addParticle();
               if(_loc1_)
               {
                  _loc1_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
                  _loc1_.setSprite(GameRes.get()._pCharacterFootprint);
                  _loc1_.setPosition(new Vec2F(getPosition().x + 10,getPosition().y));
                  _loc1_.setExternalVelocity(GameWorld.get().getBackgroundVelocityPt());
                  _loc1_.setLife(0.5);
                  _loc1_.setSize(1);
                  _loc1_.setColor(new RGBA(255,255,255,75));
                  _loc1_.addAlphaKey(75);
                  _loc1_.addAlphaKey(0);
                  _loc1_.setDepth(GameConsts.DEPTH_GROUND_PARTS);
                  _loc1_.finalise();
               }
            }
            if(getLayer().getUpdateCount() % 20 == 10)
            {
               _loc1_ = this._pParticles.addParticle();
               if(_loc1_)
               {
                  _loc1_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
                  _loc1_.setSprite(GameRes.get()._pCharacterFootprint);
                  _loc1_.setPosition(new Vec2F(getPosition().x - 10,getPosition().y));
                  _loc1_.setExternalVelocity(GameWorld.get().getBackgroundVelocityPt());
                  _loc1_.setLife(0.5);
                  _loc1_.setSize(1);
                  _loc1_.setColor(new RGBA(255,255,255,75));
                  _loc1_.addAlphaKey(75);
                  _loc1_.addAlphaKey(0);
                  _loc1_.setDepth(GameConsts.DEPTH_GROUND);
                  _loc1_.finalise();
               }
            }
            if(getLayer().getUpdateCount() % 5 == 0)
            {
               _loc1_ = this._pParticles.addParticle();
               if(_loc1_)
               {
                  _loc1_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
                  _loc1_.setSprite(GameRes.get()._pRunningDust);
                  _loc1_.setPosition(new Vec2F(getPosition().x + Random.RandomFloatRangeUniform(-20,20),getPosition().y + Random.RandomFloatRangeUniform(-20,20)));
                  _loc1_.setExternalVelocity(GameWorld.get().getBackgroundVelocityPt());
                  _loc1_.setLife(0.5);
                  _loc1_.setSize2(0.5,Random.RandomFloatRangeUniform(1.5,2.5));
                  _loc1_.setColor(new RGBA(255,255,255,0));
                  _loc1_.addAlphaKey(0);
                  _loc1_.addAlphaKey(128);
                  _loc1_.addAlphaKey(128);
                  _loc1_.addAlphaKey(0);
                  _loc1_.setDepth(GameConsts.DEPTH_GROUND - 1);
                  _loc1_.finalise();
               }
            }
         }
      }
      
      public function specificTakeDamage(param1:Number) : void
      {
         if(Random.RandomNumberRange(0,10000) % 3 == 0 && this._fHealth - param1 > 0)
         {
            playSfxExt(GameRes.get()._pHurtSounds.rand_element(),0,1,1,false);
         }
         playSfxExt(GameRes.get()._pPunchSounds.rand_element(),0,1,1,false);
      }
      
      public function specificDie() : void
      {
         playSfxExt(GameRes.get()._pDieSounds.rand_element(),0,1,1,false);
      }
      
      public function doDeathParticles() : void
      {
         var _loc1_:Particle2D = null;
         var _loc2_:ParticleHolder = null;
         if(this._pParticles && !shouldDelete())
         {
            _loc1_ = this._pParticles.addParticle();
            if(_loc1_)
            {
               _loc1_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               if(_side == GameConsts.eFireChima)
               {
                  _loc1_.setSprite(GameRes.get()._pHitFireSprite);
               }
               else
               {
                  _loc1_.setSprite(GameRes.get()._pHitIceSprite);
               }
               _loc1_.setPosition(new Vec2F(getPosition().x + getCharacterOffset().x,getPosition().y + getCharacterOffset().y));
               _loc1_.addSizeKeyF(0);
               _loc1_.addSizeKeyF(Random.RandomFloatRangeUniform(3,4));
               _loc1_.setLife(0.3);
               _loc1_.setRotation(Random.RandomFloatRangeUniform(0,Math.PI * 2));
               _loc1_.setColor(new RGBA(255,255,255,255));
               _loc1_.addAlphaKey(255);
               _loc1_.addAlphaKey(0);
               _loc1_.finalise();
            }
            GameWorld._pWorld.m_FootParticleHolder.removeComponent(this._pParticles);
            _loc2_ = new ParticleHolder(this._pParticles);
            getLayer().addObject(_loc2_);
            _loc2_.eventAddedToLayer();
            if(this._pParticles)
            {
               this._pParticles = null;
            }
         }
      }
   }
}
