package game.objects
{
   import game.CharData;
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.SaveData;
   import game.objects.controllers.PlayerController;
   import game.objects.events.EventChiPowerUsed;
   import game.objects.events.EventObjectDeleted;
   import game.objects.events.EventPlayerDied;
   import game.objects.events.EventPlayerFollowerAdded;
   import game.objects.events.EventPlayerFollowerDied;
   import game.objects.events.EventPlayerHealthChanged;
   import game.objects.events.EventPlayerTookDamage;
   import game.objects.guns.PlayerGun;
   import game.objects.misc.ParticleHolder;
   import game.objects.players.mage.MageBearPlayer;
   import game.objects.players.mage.MageCrocPlayer;
   import game.objects.players.mage.MageLionPlayer;
   import game.objects.players.mage.MageSaberPlayer;
   import game.objects.players.ranged.RangedBearPlayer;
   import game.objects.players.ranged.RangedCrocPlayer;
   import game.objects.players.ranged.RangedLionPlayer;
   import game.objects.players.ranged.RangedSaberPlayer;
   import game.objects.players.warrior.WarriorBearPlayer;
   import game.objects.players.warrior.WarriorCrocPlayer;
   import game.objects.players.warrior.WarriorLionPlayer;
   import game.objects.players.warrior.WarriorSaberPlayer;
   import game.objects.powers.ChimaPower;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.core.zSprite;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.RenderableParticleSystem;
   
   public class Player extends ChimaGameObject
   {
      
      public static const PLAYER_MAX_FOLLOWERS:int = 4;
      
      public static const kfInvincibilityLife:Number = 10;
      
      public static const ePlayerAnimalNone:int = 0;
      
      public static const ePlayerAnimalLion:int = 0;
      
      public static const ePlayerAnimalCroc:int = 1;
      
      public static const ePlayerAnimalBear:int = 2;
      
      public static const ePlayerAnimalSaber:int = 3;
      
      private static var offsets:Vector.<Vec2F> = new <Vec2F>[new Vec2F(-80,40),new Vec2F(80,40),new Vec2F(-160,80),new Vec2F(160,80)];
       
      
      public var _fHealth:Number;
      
      public var _fMaxHealth:Number;
      
      public var _pGun:PlayerGun;
      
      public var _pController:PlayerController;
      
      public var _pParticles:RenderableParticleSystem;
      
      public var _bIsFollower:Boolean;
      
      public var _pFollow:Player;
      
      public var _bIsInvincible:Boolean;
      
      public var _fInvincibilityTimer:Number;
      
      public var _pGlow:zSprite;
      
      public var _uNumFollowers:uint;
      
      public var _pFollowers:Vector.<Player>;
      
      public var _pPower:ChimaPower;
      
      public var _animal:int;
      
      public var _saveSlot:int;
      
      public function Player(param1:int, param2:GlaSet, param3:String)
      {
         var _loc4_:uint = 0;
         this._pFollowers = new Vector.<Player>(PLAYER_MAX_FOLLOWERS,true);
         super(param1,new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),1.25 * Number(LegoChima.Instance().zGetScreenHeight())),1,GameConsts.ePlayerCollisionCat,GameConsts.eEnemyBulletCollisionCat | GameConsts.eEnemyCollisionCat | GameConsts.eEnemyMissileCollisionCat | GameConsts.ePickupCollisionCat,param2,param3);
         this._pGun = null;
         this._pPower = null;
         this._bIsFollower = false;
         this._pFollow = null;
         this._uNumFollowers = 0;
         this._animal = ePlayerAnimalNone;
         this._bIsInvincible = false;
         this._fInvincibilityTimer = 0;
         this._pController = new PlayerController(this);
         this._pController.setStartPos(getPosition());
         this._pController.setWalkOnTarget(new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.75 * Number(LegoChima.Instance().zGetScreenHeight())));
         addComponent(this._pController);
         if(_bHasGun)
         {
            this._pGun = new PlayerGun(param1,_gunPosition);
            addComponent(this._pGun);
         }
         _loc4_ = 0;
         while(_loc4_ < PLAYER_MAX_FOLLOWERS)
         {
            this._pFollowers[_loc4_] = null;
            _loc4_++;
         }
         if(param1 == GameConsts.eFireChima)
         {
            this._pGlow = GameRes.get()._pUISet.findScene("frontend_charselect").findSpriteElement("fire_glow").getSprite();
         }
         else
         {
            this._pGlow = GameRes.get()._pUISet.findScene("frontend_charselect").findSpriteElement("ice_glow").getSprite();
         }
         this._pParticles = new RenderableParticleSystem(25);
         this._pParticles.setWorldSpace(false);
         GameWorld._pWorld.m_FootParticleHolder.addComponent(this._pParticles);
         this._pParticles.setDepth(GameConsts.DEPTH_GROUND_PARTS);
         this.setHealth(3);
         this.setMaxHealth(3);
      }
      
      override public function dispose() : void
      {
         if(this._pParticles)
         {
            GameWorld._pWorld.m_FootParticleHolder.removeComponent(this._pParticles,true);
            this._pParticles = null;
         }
         super.dispose();
      }
      
      public function getHealth() : Number
      {
         return this._fHealth;
      }
      
      public function getMaxHealth() : Number
      {
         return this._fMaxHealth;
      }
      
      public function setMaxHealth(param1:Number) : void
      {
         this._fMaxHealth = param1;
      }
      
      public function getFollowPlayer() : Player
      {
         return this._pFollow;
      }
      
      public function getAnimal() : int
      {
         return this._animal;
      }
      
      public function setAnimal(param1:int) : void
      {
         this._animal = param1;
      }
      
      public function getGun() : PlayerGun
      {
         return this._pGun;
      }
      
      public function getController() : PlayerController
      {
         return this._pController;
      }
      
      public function setSaveSlot(param1:int) : void
      {
         this._saveSlot = param1;
      }
      
      public function getSaveSlot() : int
      {
         return this._saveSlot;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Number = NaN;
         if(!this._bIsFollower)
         {
            GameWorld.get().getHUD().getHealthBar().setHealth(this._fHealth / this._fMaxHealth);
         }
         this.spawnFootprints();
         if(this._bIsInvincible)
         {
            this._fInvincibilityTimer += param1.getTime().dt;
            if(this._fInvincibilityTimer >= kfInvincibilityLife)
            {
               this._bIsInvincible = false;
               _loc2_ = 0;
               while(_loc2_ < NUM_CHAR_ANIMS)
               {
                  if(_pAnims[_loc2_] != null)
                  {
                     _pAnims[_loc2_].setDrawInvulnerablity(null,new Vec2F(),0,0);
                  }
                  _loc2_++;
               }
            }
            else
            {
               _loc3_ = 1;
               if(this._fInvincibilityTimer >= 0 && this._fInvincibilityTimer < 0.5)
               {
                  _loc3_ = this._fInvincibilityTimer * 2;
               }
               else if(this._fInvincibilityTimer >= kfInvincibilityLife - 0.5)
               {
                  _loc3_ = 1 - (this._fInvincibilityTimer - (kfInvincibilityLife - 0.5)) / 0.5;
               }
               _loc2_ = 0;
               while(_loc2_ < NUM_CHAR_ANIMS)
               {
                  if(_pAnims[_loc2_] != null)
                  {
                     _pAnims[_loc2_].setDrawInvulnerablity(this._pGlow,getCharacterOffset(),1,_loc3_);
                  }
                  _loc2_++;
               }
            }
         }
      }
      
      public function spawnFootprints() : void
      {
         var _loc1_:Particle2D = null;
         if(this._pParticles == null)
         {
            return;
         }
         if(getLayer().getUpdateCount() % 20 == 0)
         {
            _loc1_ = this._pParticles.addParticle();
            if(_loc1_ != null)
            {
               _loc1_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc1_.setSprite(GameRes.get()._pCharacterFootprint);
               _loc1_.setPosition(new Vec2F(getPosition().x + 10,getPosition().y));
               _loc1_.setExternalVelocity(GameWorld.get().getBackgroundVelocityPt());
               _loc1_.setLife(1);
               _loc1_.setSize(1);
               _loc1_.setColor(new RGBA(255,255,255,75));
               _loc1_.addAlphaKey(75);
               _loc1_.addAlphaKey(75);
               _loc1_.addAlphaKey(0);
               _loc1_.setDepth(GameConsts.DEPTH_GROUND);
               _loc1_.finalise();
            }
         }
         if(getLayer().getUpdateCount() % 20 == 10)
         {
            _loc1_ = this._pParticles.addParticle();
            if(_loc1_ != null)
            {
               _loc1_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc1_.setSprite(GameRes.get()._pCharacterFootprint);
               _loc1_.setPosition(new Vec2F(getPosition().x - 10,getPosition().y));
               _loc1_.setExternalVelocity(GameWorld.get().getBackgroundVelocityPt());
               _loc1_.setLife(1);
               _loc1_.setSize(1);
               _loc1_.setColor(new RGBA(255,255,255,75));
               _loc1_.addAlphaKey(75);
               _loc1_.addAlphaKey(75);
               _loc1_.addAlphaKey(0);
               _loc1_.setDepth(GameConsts.DEPTH_GROUND);
               _loc1_.finalise();
            }
         }
         if(getLayer().getUpdateCount() % 5 == 0)
         {
            _loc1_ = this._pParticles.addParticle();
            if(_loc1_ != null)
            {
               _loc1_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc1_.setSprite(GameRes.get()._pRunningDust);
               _loc1_.setPosition(new Vec2F(getPosition().x + Random.RandomFloatRangeUniform(-20,20),getPosition().y + Random.RandomFloatRangeUniform(-20,20)));
               _loc1_.setExternalVelocity(GameWorld.get().getBackgroundVelocityPt());
               _loc1_.setLife(0.5);
               _loc1_.setSize2(0.5,Random.RandomFloatRangeUniform(1.5,2.5));
               _loc1_.setColor(new RGBA(255,255,255,128));
               _loc1_.addAlphaKey(128);
               _loc1_.addAlphaKey(0);
               _loc1_.setDepth(GameConsts.DEPTH_GROUND - 1);
               _loc1_.finalise();
            }
         }
      }
      
      public function addHealth(param1:Number) : void
      {
         var _loc2_:Number = this._fHealth;
         this._fHealth += param1;
         this._fHealth = MathsHelper.Clamp(this._fHealth,0,this._fMaxHealth);
         if(_loc2_ != this._fHealth)
         {
            Main.Instance().m_app.dispatchEvent(new EventPlayerHealthChanged(EventPlayerHealthChanged.EVENT_PLAYER_HEALTH_CHANGED,false,this._fHealth));
         }
      }
      
      public function takeDamage(param1:Number) : void
      {
         if(this._pController && this._pController.canTakeDamage() == false)
         {
            return;
         }
         if(this._bIsInvincible)
         {
            return;
         }
         _fShakeMagnitude = 1;
         this._fHealth -= param1;
         if(!this._bIsFollower)
         {
            Main.Instance().m_app.dispatchEvent(new EventPlayerHealthChanged(EventPlayerHealthChanged.EVENT_PLAYER_HEALTH_CHANGED,false,this._fHealth));
            Main.Instance().m_app.dispatchEvent(new EventPlayerTookDamage(EventPlayerTookDamage.EVENT_PLAYER_TOOK_DAMAGE,false,param1));
            if(this._fHealth > 0)
            {
               GameWorld.get().getHUD().getDamageFlash().doFlash();
            }
         }
         if(this._fHealth <= 0)
         {
            this._fHealth = 0;
            this.die();
         }
         else if(Random.RandomNumberRange(0,10000) % 3 == 0)
         {
            playSfxExt(GameRes.get()._pHurtSounds.rand_element(),0,1,1,false);
         }
      }
      
      public function die() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:SaveData = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         generateDebris(new Vec2F(1.5,-1.5));
         playSfxExt(GameRes.get()._pDieSounds.rand_element(),0,1,1,false);
         if(this._bIsFollower && _pOwner && _pOwner is Player)
         {
            (_pOwner as Player).followerDied(this);
         }
         else if(!this._bIsFollower)
         {
            Main.Instance().m_app.dispatchEvent(new EventPlayerDied(EventPlayerDied.EVENT_PLAYER_DIED,false));
            _loc1_ = 0;
            while(_loc1_ < PLAYER_MAX_FOLLOWERS)
            {
               if(this._pFollowers[_loc1_])
               {
                  this._pFollowers[_loc1_].die();
               }
               _loc1_++;
            }
            _loc2_ = GameWorld.get().getSaveData();
            _loc3_ = _loc2_.getCharSlot(this.getSaveSlot()).highestDistanceTravelled;
            if((_loc4_ = GameWorld.get().getHUD().getDistanceMeter().getDistance()) > _loc3_)
            {
               GameWorld.get().getGameOverMenu().getScreen().setNewBestDistance(true,_loc3_);
               _loc2_.getCharSlot(this.getSaveSlot()).highestDistanceTravelled = _loc4_;
            }
            else
            {
               GameWorld.get().getGameOverMenu().getScreen().setNewBestDistance(false,_loc3_);
            }
         }
         this.deleteThis();
         if(!this._bIsFollower)
         {
            GameWorld.get().gotoGameOver();
         }
      }
      
      public function activateChimaPower() : void
      {
         var _loc1_:Boolean = false;
         if(this._pPower)
         {
            _loc1_ = this._pPower.activate();
            if(_loc1_)
            {
               Main.Instance().m_app.dispatchEvent(new EventChiPowerUsed(EventChiPowerUsed.EVENT_CHI_POWER_USED,false));
            }
         }
      }
      
      public function setHealth(param1:Number) : void
      {
         this._fHealth = param1;
         Main.Instance().m_app.dispatchEvent(new EventPlayerHealthChanged(EventPlayerHealthChanged.EVENT_PLAYER_HEALTH_CHANGED,false,this._fHealth));
      }
      
      public function setFollowPlayer(param1:Player) : void
      {
         if(param1 != null)
         {
            this._bIsFollower = true;
            this._pFollow = param1;
         }
         else
         {
            this._bIsFollower = false;
            this._pFollow = null;
         }
      }
      
      public function getNewFollowPlayer(param1:String) : Player
      {
         var _loc2_:Player = null;
         if(param1 == "croc")
         {
            switch(Random.RandomNumberRange(0,10000) % 3)
            {
               case 0:
                  _loc2_ = new RangedCrocPlayer();
                  break;
               case 1:
                  _loc2_ = new MageCrocPlayer();
                  break;
               case 2:
                  _loc2_ = new WarriorCrocPlayer();
            }
         }
         else if(param1 == "lion")
         {
            switch(Random.RandomNumberRange(0,10000) % 3)
            {
               case 0:
                  _loc2_ = new RangedLionPlayer();
                  break;
               case 1:
                  _loc2_ = new MageLionPlayer();
                  break;
               case 2:
                  _loc2_ = new WarriorLionPlayer();
            }
         }
         else if(param1 == "bear")
         {
            switch(Random.RandomNumberRange(0,10000) % 3)
            {
               case 0:
                  _loc2_ = new RangedBearPlayer();
                  break;
               case 1:
                  _loc2_ = new MageBearPlayer();
                  break;
               case 2:
                  _loc2_ = new WarriorBearPlayer();
            }
         }
         else if(param1 == "saber")
         {
            switch(Random.RandomNumberRange(0,10000) % 3)
            {
               case 0:
                  _loc2_ = new RangedSaberPlayer();
                  break;
               case 1:
                  _loc2_ = new MageSaberPlayer();
                  break;
               case 2:
                  _loc2_ = new WarriorSaberPlayer();
            }
         }
         return _loc2_;
      }
      
      public function addNewFollower(param1:String) : void
      {
         var _loc2_:int = 0;
         if(this._uNumFollowers < PLAYER_MAX_FOLLOWERS)
         {
            _loc2_ = this.getEmptyFollowerSlot();
            if(_loc2_ != -1)
            {
               this._pFollowers[_loc2_] = this.getNewFollowPlayer(param1);
               if(this._pFollowers[_loc2_])
               {
                  playSfxExt(GameRes.get()._pCharacterSelectSounds.rand_element(),0,1,1,false);
                  ++this._uNumFollowers;
                  this._pFollowers[_loc2_].setOwner(this);
                  this._pFollowers[_loc2_].setFollowPlayer(this);
                  this._pFollowers[_loc2_].getController().setFollowOffset(offsets[_loc2_]);
                  this._pFollowers[_loc2_].setAnim(CHAR_ANIM_RUN);
                  if(this.isTribeUpgradeActive(1))
                  {
                     this._pFollowers[_loc2_].setHealth(4);
                     this._pFollowers[_loc2_].setMaxHealth(4);
                  }
                  else if(this.isTribeUpgradeActive(0))
                  {
                     this._pFollowers[_loc2_].setHealth(3);
                     this._pFollowers[_loc2_].setMaxHealth(3);
                  }
                  else
                  {
                     this._pFollowers[_loc2_].setHealth(2);
                     this._pFollowers[_loc2_].setMaxHealth(2);
                  }
                  getLayer().addObject(this._pFollowers[_loc2_]);
                  Main.Instance().m_app.dispatchEvent(new EventPlayerFollowerAdded(EventPlayerFollowerAdded.EVENT_PLAYER_FOLLOWER_ADDED,false));
               }
            }
         }
      }
      
      public function getEmptyFollowerSlot() : int
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < PLAYER_MAX_FOLLOWERS)
         {
            if(this._pFollowers[_loc1_] == null)
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      public function followerDied(param1:Player) : void
      {
         var _loc2_:uint = 0;
         Main.Instance().m_app.dispatchEvent(new EventPlayerFollowerDied(EventPlayerFollowerDied.EVENT_PLAYER_FOLLOWER_DIED,false));
         _loc2_ = 0;
         while(_loc2_ < PLAYER_MAX_FOLLOWERS)
         {
            if(this._pFollowers[_loc2_] == param1)
            {
               this._pFollowers[_loc2_] = null;
               --this._uNumFollowers;
            }
            _loc2_++;
         }
      }
      
      override public function deleteThis() : void
      {
         this.eventObjectDeleted();
         super.deleteThis();
      }
      
      public function deleteFollowers() : void
      {
         var _loc1_:uint = 0;
         _loc1_ = 0;
         while(_loc1_ < PLAYER_MAX_FOLLOWERS)
         {
            if(this._pFollowers[_loc1_])
            {
               Main.Instance().m_app.dispatchEvent(new EventPlayerFollowerDied(EventPlayerFollowerDied.EVENT_PLAYER_FOLLOWER_DIED,false));
               this._pFollowers[_loc1_].deleteThis();
               this._pFollowers[_loc1_] = null;
            }
            _loc1_++;
         }
      }
      
      public function addChimaPower(param1:ChimaPower) : void
      {
         this._pPower = param1;
         addComponent(this._pPower);
      }
      
      public function activateInvincibilityPowerUp() : void
      {
         if(this._bIsInvincible)
         {
            this._fInvincibilityTimer = 0.5;
         }
         else
         {
            this._bIsInvincible = true;
            this._fInvincibilityTimer = 0;
         }
      }
      
      public function isHealthUpgradeActive(param1:uint) : Boolean
      {
         var _loc2_:CharData = GameWorld.get().getSaveData().getCharSlot(this.getSaveSlot());
         var _loc3_:Vector.<uint> = new Vector.<uint>(2,true);
         switch(getClassType())
         {
            case GameConsts.eChimaRangedClass:
               _loc3_[0] = 1;
               _loc3_[1] = 9;
               break;
            case GameConsts.eChimaMageClass:
               _loc3_[0] = 1;
               _loc3_[1] = 9;
               break;
            case GameConsts.eChimaWarriorClass:
               _loc3_[0] = 1;
               _loc3_[1] = 9;
               break;
            default:
               return false;
         }
         if(_loc2_.upgradeLevel >= _loc3_[param1])
         {
            return true;
         }
         return false;
      }
      
      public function isWeaponUpgradeActive(param1:uint) : Boolean
      {
         var _loc2_:CharData = GameWorld.get().getSaveData().getCharSlot(this.getSaveSlot());
         var _loc3_:Vector.<uint> = new Vector.<uint>(2,true);
         switch(getClassType())
         {
            case GameConsts.eChimaRangedClass:
               _loc3_[0] = 2;
               _loc3_[1] = 6;
               break;
            case GameConsts.eChimaMageClass:
               _loc3_[0] = 2;
               _loc3_[1] = 6;
               break;
            case GameConsts.eChimaWarriorClass:
               _loc3_[0] = 2;
               _loc3_[1] = 6;
               break;
            default:
               return false;
         }
         if(_loc2_.upgradeLevel >= _loc3_[param1])
         {
            return true;
         }
         return false;
      }
      
      public function isTribeUpgradeActive(param1:uint) : Boolean
      {
         var _loc2_:CharData = GameWorld.get().getSaveData().getCharSlot(this.getSaveSlot());
         var _loc3_:Vector.<uint> = new Vector.<uint>(2,true);
         switch(getClassType())
         {
            case GameConsts.eChimaRangedClass:
               _loc3_[0] = 4;
               _loc3_[1] = 7;
               break;
            case GameConsts.eChimaMageClass:
               _loc3_[0] = 4;
               _loc3_[1] = 7;
               break;
            case GameConsts.eChimaWarriorClass:
               _loc3_[0] = 4;
               _loc3_[1] = 7;
               break;
            default:
               return false;
         }
         if(_loc2_.upgradeLevel >= _loc3_[param1])
         {
            return true;
         }
         return false;
      }
      
      public function isChiUpgradeActive(param1:uint) : Boolean
      {
         var _loc2_:CharData = GameWorld.get().getSaveData().getCharSlot(this.getSaveSlot());
         var _loc3_:Vector.<uint> = new Vector.<uint>(4,true);
         switch(getClassType())
         {
            case GameConsts.eChimaRangedClass:
               _loc3_[0] = 3;
               _loc3_[1] = 5;
               _loc3_[2] = 8;
               _loc3_[3] = 10;
               break;
            case GameConsts.eChimaMageClass:
               _loc3_[0] = 3;
               _loc3_[1] = 5;
               _loc3_[2] = 8;
               _loc3_[3] = 10;
               break;
            case GameConsts.eChimaWarriorClass:
               _loc3_[0] = 3;
               _loc3_[1] = 5;
               _loc3_[2] = 8;
               _loc3_[3] = 10;
               break;
            default:
               return false;
         }
         if(_loc2_.upgradeLevel >= _loc3_[param1])
         {
            return true;
         }
         return false;
      }
      
      public function eventObjectDeleted(param1:EventObjectDeleted = null) : void
      {
         var _loc2_:ParticleHolder = null;
         if(this._pParticles)
         {
            GameWorld._pWorld.m_FootParticleHolder.removeComponent(this._pParticles);
            _loc2_ = new ParticleHolder(this._pParticles);
            _loc2_.setPosition(getPosition());
            getLayer().addObject(_loc2_);
            _loc2_.eventAddedToLayer();
            this._pParticles = null;
         }
      }
   }
}
