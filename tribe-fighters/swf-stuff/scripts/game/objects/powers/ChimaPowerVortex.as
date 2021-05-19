package game.objects.powers
{
   import flash.events.Event;
   import flash.media.SoundChannel;
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.Player;
   import game.objects.enemies.Enemy;
   import game.objects.enemies.EnvEnemy;
   import game.objects.enemies.discshooters.DiscShooterEnemy;
   import game.objects.enemies.orbs.OrbEnemy;
   import game.objects.events.EventEnemyDied;
   import game.objects.events.EventEnemySpawned;
   import starling.display.BlendMode;
   import starling.display.Image;
   import starling.textures.Texture;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   import zufflin.world.WorldObj;
   
   public class ChimaPowerVortex extends ChimaPower
   {
      
      public static const kfDischargeRate:Number = -0.5;
      
      public static const kfEnemyPullSpeed:Number = 500;
      
      public static const kfEnemyMinDistance:Number = 260;
      
      public static const kfMaxLightningCycleSpeed:Number = 4;
      
      public static const kfMinLightningCycleSpeed:Number = 2;
       
      
      public var _pSoundLoop:SoundChannel;
      
      public var _fPlayerY:Number;
      
      public var _bActivated:Boolean;
      
      public var _fDt:Number;
      
      public var _vLightning:Vector.<VortexLightning>;
      
      public var _vPendingEnemies:Vector.<Enemy>;
      
      public var _pTexture:Texture;
      
      public function ChimaPowerVortex()
      {
         super();
         this._pTexture = null;
         this._vLightning = new Vector.<VortexLightning>();
         this._vPendingEnemies = new Vector.<Enemy>();
         this._bActivated = false;
         this._fPlayerY = 0;
         this._fDt = 0;
         this._pSoundLoop = null;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         Main.Instance().m_app.addEventListener(EventEnemyDied.EVENT_ENEMY_DIED,this.eventEnemyDied);
         Main.Instance().m_app.addEventListener(EventEnemySpawned.EVENT_ENEMY_SPAWNED,this.eventEnemySpawned);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventEnemySpawned.EVENT_ENEMY_SPAWNED,this.eventEnemySpawned);
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         Main.Instance().m_app.removeEventListener(EventEnemyDied.EVENT_ENEMY_DIED,this.eventEnemyDied);
         this.clearLightning();
         super.dispose();
         this._vPendingEnemies.length = 0;
         this._vPendingEnemies = null;
         this._pTexture = null;
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc3_:Enemy = null;
         var _loc4_:Number = NaN;
         var _loc5_:Player = null;
         var _loc6_:VortexLightning = null;
         var _loc7_:Enemy = null;
         var _loc8_:Vec2F = null;
         var _loc9_:Vec2F = null;
         var _loc2_:WorldLayer = this.getLayer();
         if(_loc2_ && _loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         this._fDt = param1.getTime().dt;
         if(this._bActivated)
         {
            for each(_loc3_ in this._vPendingEnemies)
            {
               if(!_loc3_.shouldDelete())
               {
                  this._vLightning.push(this.generateLightning(_loc3_));
               }
            }
            this._vPendingEnemies.length = 0;
         }
         else
         {
            if(this._vPendingEnemies.length > 0)
            {
               this._vPendingEnemies.length = 0;
            }
            this.clearLightning();
            this.removeChildren(0,-1,true);
         }
         if(this._bActivated)
         {
            _loc4_ = (_loc4_ = this.getCharge()) + kfDischargeRate * this._fDt;
            _loc4_ = MathsHelper.Clamp(_loc4_,0,1);
            this.setCharge(_loc4_);
            if(_loc4_ <= 0)
            {
               this._bActivated = false;
               this.clearLightning();
               if(_loc5_ = GameWorld.get().getPlayer())
               {
                  _loc5_.getController().setInvincible(false);
               }
            }
            else
            {
               this.updateAllLightning();
               for each(_loc6_ in this._vLightning)
               {
                  _loc7_ = _loc6_.pEnemy;
                  _loc8_ = new Vec2F(_loc7_.getPosition().x + _loc7_.getCharacterOffset().x,_loc7_.getPosition().y + _loc7_.getCharacterOffset().y);
                  if((_loc9_ = new Vec2F(getWorldObj().getPosition().x - _loc8_.x,getWorldObj().getPosition().y - _loc8_.y)).length > kfEnemyMinDistance)
                  {
                     _loc9_.normalize(1);
                     _loc8_.x += _loc9_.x * kfEnemyPullSpeed * this._fDt;
                     _loc8_.y += _loc9_.y * kfEnemyPullSpeed * this._fDt;
                     _loc7_.setPosition(new Vec2F(_loc8_.x - _loc7_.getCharacterOffset().x,_loc8_.y - _loc7_.getCharacterOffset().y));
                  }
               }
            }
            if(this._pSoundLoop == null && this._vLightning.length > 0)
            {
               this._pSoundLoop = GameRes.get()._pChiSwordSound.play();
               this._pSoundLoop.addEventListener(Event.SOUND_COMPLETE,this.OnSoundComplete);
            }
         }
         else if(this._pSoundLoop != null)
         {
            this._pSoundLoop.removeEventListener(Event.SOUND_COMPLETE,this.OnSoundComplete);
            this._pSoundLoop.stop();
            this._pSoundLoop = null;
         }
      }
      
      private function OnSoundComplete(param1:Event) : void
      {
         this._pSoundLoop.removeEventListener(Event.SOUND_COMPLETE,this.OnSoundComplete);
         this._pSoundLoop = null;
      }
      
      private function eventEnemySpawned(param1:EventEnemySpawned) : void
      {
         var _loc2_:Enemy = null;
         if(this._bActivated)
         {
            _loc2_ = param1.getEnemy();
            if(_loc2_ is EnvEnemy == false && _loc2_ is DiscShooterEnemy == false && _loc2_ is OrbEnemy == false)
            {
               this.addPendingEnemy(_loc2_);
            }
         }
      }
      
      public function eventEnemyDied(param1:EventEnemyDied) : void
      {
         var _loc2_:uint = 0;
         _loc2_ = 0;
         while(_loc2_ < this._vLightning.length)
         {
            if(this._vLightning[_loc2_].pEnemy == param1.getEnemy())
            {
               if(this._vLightning[_loc2_].pMesh)
               {
                  this.removeChild(this._vLightning[_loc2_].pMesh,true);
               }
               this._vLightning[_loc2_].dispose();
               this._vLightning[_loc2_] = null;
               this._vLightning.splice(_loc2_,1);
            }
            else
            {
               _loc2_++;
            }
         }
         _loc2_ = 0;
         while(_loc2_ < this._vPendingEnemies.length)
         {
            if(this._vPendingEnemies[_loc2_] == param1.getEnemy())
            {
               this._vPendingEnemies.splice(_loc2_,1);
            }
            else
            {
               _loc2_++;
            }
         }
      }
      
      override public function activate() : Boolean
      {
         var _loc1_:Player = null;
         if(!this._bActivated && this.getCharge() >= 1)
         {
            super.activate();
            if(this._pSoundLoop == null)
            {
               this._pSoundLoop = GameRes.get()._pChiSwordSound.play();
               this._pSoundLoop.addEventListener(Event.SOUND_COMPLETE,this.OnSoundComplete);
            }
            this._bActivated = true;
            _loc1_ = GameWorld.get().getPlayer();
            if(_loc1_)
            {
               this._fPlayerY = _loc1_.getPosition().y;
               _loc1_.getController().setInvincible(true);
            }
            this.addEnemyLightning();
            return true;
         }
         return false;
      }
      
      public function getCharge() : Number
      {
         return GameWorld.get().getHUD().getChimaButton().getCharge();
      }
      
      public function setCharge(param1:Number) : void
      {
         GameWorld.get().getHUD().getChimaButton().setCharge(param1);
      }
      
      public function addPendingEnemy(param1:Enemy) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(!param1.shouldDelete())
         {
            _loc2_ = false;
            if(this._vPendingEnemies.indexOf(param1) != -1)
            {
               _loc2_ = true;
            }
            _loc3_ = 0;
            while(_loc3_ < this._vLightning.length)
            {
               if(this._vLightning[_loc3_].pEnemy == param1)
               {
                  _loc2_ = true;
               }
               _loc3_++;
            }
            if(!_loc2_)
            {
               this._vPendingEnemies.push(param1);
            }
         }
      }
      
      public function addEnemyLightning() : void
      {
         var _loc2_:WorldObj = null;
         var _loc3_:Enemy = null;
         var _loc1_:Vector.<WorldObj> = getLayer().getObjectList();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ is Enemy && !(_loc2_ is EnvEnemy) && !(_loc2_ is DiscShooterEnemy) && !(_loc2_ is OrbEnemy))
            {
               _loc3_ = _loc2_ as Enemy;
               _loc3_.takeDamage(1);
               this.addPendingEnemy(_loc3_);
            }
         }
      }
      
      public function generateLightning(param1:Enemy) : VortexLightning
      {
         var _loc3_:Player = null;
         var _loc2_:VortexLightning = new VortexLightning();
         _loc2_.pEnemy = param1;
         _loc2_.fCycle = Random.RandomFloatRangeUniform(0,1);
         _loc2_.fCycleSpeed = Random.RandomFloatRangeUniform(kfMinLightningCycleSpeed,kfMaxLightningCycleSpeed);
         if(this._pTexture == null)
         {
            _loc3_ = getWorldObj() as Player;
            if(_loc3_)
            {
               switch(_loc3_.getSide())
               {
                  case GameConsts.eFireChima:
                     this._pTexture = GameRes.get()._pVortexLightningFire;
                     break;
                  case GameConsts.eIceChima:
                     this._pTexture = GameRes.get()._pVortexLightningIce;
               }
            }
         }
         _loc2_.pMesh = new Image(this._pTexture);
         _loc2_.pMesh.blendMode = BlendMode.ADD;
         _loc2_.pMesh.touchable = false;
         _loc2_.pMesh.alignPivot(HAlign.LEFT,VAlign.CENTER);
         this.addChild(_loc2_.pMesh);
         this.updateLightning(_loc2_);
         return _loc2_;
      }
      
      public function updateAllLightning() : void
      {
         var _loc1_:VortexLightning = null;
         for each(_loc1_ in this._vLightning)
         {
            this.updateLightning(_loc1_);
         }
      }
      
      public function updateLightning(param1:VortexLightning) : void
      {
         param1.fCycle += this._fDt * param1.fCycleSpeed;
         if(param1.fCycle >= 1)
         {
            --param1.fCycle;
         }
         var _loc2_:Vec2F = new Vec2F(param1.pEnemy.getPosition().x + param1.pEnemy.getCharacterOffset().x,param1.pEnemy.getPosition().y + param1.pEnemy.getCharacterOffset().y);
         var _loc3_:Vec2F = getWorldObj().getPosition();
         var _loc4_:Vec2F;
         var _loc5_:Number = (_loc4_ = new Vec2F(_loc2_.x - _loc3_.x,_loc2_.y - _loc3_.y)).length;
         param1.pMesh.rotation = 0;
         var _loc6_:Number = Random.RandomFloatRangeUniform(0.5,1.5);
         param1.pMesh.scaleX = _loc5_ / 128;
         param1.pMesh.scaleY = _loc6_;
         param1.pMesh.rotation = _loc4_.getAngle() - Math.PI * 0.5;
         param1.pMesh.setTexCoordsTo(0,0 - param1.fCycle,0);
         param1.pMesh.setTexCoordsTo(1,param1.pMesh.scaleX - param1.fCycle,0);
         param1.pMesh.setTexCoordsTo(2,0 - param1.fCycle,1);
         param1.pMesh.setTexCoordsTo(3,param1.pMesh.scaleX - param1.fCycle,1);
         param1.pMesh.setVertexAlpha(0,0);
         param1.pMesh.setVertexAlpha(1,1);
         param1.pMesh.setVertexAlpha(2,0);
         param1.pMesh.setVertexAlpha(3,1);
         if(Random.RandomNumberRange(0,10000) % 2 == 0)
         {
            param1.pMesh.setVertexAlpha(1,0);
         }
         if(Random.RandomNumberRange(0,10000) % 2 == 0)
         {
            param1.pMesh.setVertexAlpha(3,0);
         }
      }
      
      public function clearLightning() : void
      {
         var _loc2_:VortexLightning = null;
         var _loc3_:Enemy = null;
         var _loc1_:Vector.<Enemy> = new Vector.<Enemy>();
         for each(_loc2_ in this._vLightning)
         {
            if(_loc2_.pMesh)
            {
               this.removeChild(_loc2_.pMesh,true);
            }
            _loc1_.push(_loc2_.pEnemy);
            _loc2_.dispose();
         }
         this._vLightning.length = 0;
         for each(_loc3_ in _loc1_)
         {
            _loc3_.takeDamage(1000);
         }
      }
   }
}
