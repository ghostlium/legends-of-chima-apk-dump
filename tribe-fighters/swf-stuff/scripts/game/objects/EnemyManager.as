package game.objects
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.enemies.Enemy;
   import game.objects.enemies.EnvEnemy;
   import game.objects.enemies.MageBearEnemy;
   import game.objects.enemies.MageCrocEnemy;
   import game.objects.enemies.MageLionEnemy;
   import game.objects.enemies.MageSaberEnemy;
   import game.objects.enemies.RangedBearEnemy;
   import game.objects.enemies.RangedCrocEnemy;
   import game.objects.enemies.RangedLionEnemy;
   import game.objects.enemies.RangedSaberEnemy;
   import game.objects.enemies.WarriorBearEnemy;
   import game.objects.enemies.WarriorCrocEnemy;
   import game.objects.enemies.WarriorLionEnemy;
   import game.objects.enemies.WarriorSaberEnemy;
   import game.objects.enemies.additionals.MageFireGorillaEnemy;
   import game.objects.enemies.additionals.MageLeopardEnemy;
   import game.objects.enemies.additionals.MageRedBirdEnemy;
   import game.objects.enemies.additionals.RangedBatEnemy;
   import game.objects.enemies.additionals.RangedFireLionEnemy;
   import game.objects.enemies.additionals.RangedIceCrocEnemy;
   import game.objects.enemies.additionals.RangedIceLionEnemy;
   import game.objects.enemies.additionals.RangedMinimammothEnemy;
   import game.objects.enemies.additionals.RangedPredatorEnemy;
   import game.objects.enemies.additionals.WarriorFireGorillaEnemy;
   import game.objects.enemies.additionals.WarriorVultureEnemy;
   import game.objects.enemies.discshooters.DiscShooterBearEnemy;
   import game.objects.enemies.discshooters.DiscShooterCrocEnemy;
   import game.objects.enemies.discshooters.DiscShooterEnemy;
   import game.objects.enemies.discshooters.DiscShooterLionEnemy;
   import game.objects.enemies.discshooters.DiscShooterSaberEnemy;
   import game.objects.enemies.orbs.OrbEnemy;
   import game.objects.events.EventEnemyDied;
   import game.objects.flags.FlagGenerator;
   import game.objects.flags.FlagPiece;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldObj;
   
   public class EnemyManager extends GameObject
   {
      
      public static const ENEMY_MANAGER_ENV_SLOTS:int = 8;
      
      public static const kfSlotDecayRate:Number = 0.1;
      
      public static const kuNumStartingEnemies:uint = 1;
      
      public static const kuMinEnvDistance:uint = 10;
      
      public static const kuDistanceForDifficultyChange:uint = 40;
      
      private static var names:Vector.<Vector.<String>> = new <Vector.<String>>[new <String>["env_jungle_1","env_jungle_2","env_jungle_3","env_jungle_4","env_jungle_5","env_jungle_6","env_jungle_7","env_jungle_8"],new <String>["env_ice_1","env_ice_2","env_ice_3","env_ice_4","env_ice_5","env_ice_6","env_ice_7","env_ice_8"],new <String>["env_cave_1","env_cave_2","env_cave_3","env_cave_4","env_cave_5","env_cave_6","env_cave_7","env_cave_8"],new <String>["env_fire_1","env_fire_2","env_fire_3","env_fire_4","env_fire_5","env_fire_6","env_fire_7","env_fire_8"]];
       
      
      public var _bEnabled:Boolean;
      
      public var _side:int;
      
      public var _uEnemyCount:uint;
      
      public var _uMaxEnemyCount:uint;
      
      public var _uEnvCount:uint;
      
      public var _uMaxEnvCount:uint;
      
      public var _uDiscShooterCount:uint;
      
      public var _uMaxDiscShooterCount:uint;
      
      public var _uOrbCount:uint;
      
      public var _uMaxOrbCount:uint;
      
      public var _uDistanceToNextIncrease:uint;
      
      public var _uKillsRequiredForIncrease:uint;
      
      public var _uKillCount:uint;
      
      public var _uCurrentRound:uint;
      
      public var _pFlagGenerator:FlagGenerator;
      
      public var _fEnvSlotTimer:Vector.<Number>;
      
      public function EnemyManager(param1:int)
      {
         var _loc2_:uint = 0;
         super();
         this._fEnvSlotTimer = new Vector.<Number>(ENEMY_MANAGER_ENV_SLOTS,true);
         this._side = param1;
         this._uEnemyCount = 0;
         this._uEnvCount = 0;
         this._uMaxEnvCount = 0;
         this._uDiscShooterCount = 0;
         this._uMaxDiscShooterCount = 0;
         this._uOrbCount = 0;
         this._uMaxOrbCount = 0;
         this._bEnabled = false;
         this._uDistanceToNextIncrease = kuDistanceForDifficultyChange;
         this._uMaxEnemyCount = kuNumStartingEnemies;
         this._uKillsRequiredForIncrease = kuNumStartingEnemies;
         this._uKillCount = 0;
         this._uCurrentRound = 1;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         _loc2_ = 0;
         while(_loc2_ < ENEMY_MANAGER_ENV_SLOTS)
         {
            this._fEnvSlotTimer[_loc2_] = Random.RandomFloatRangeUniform(0,1);
            _loc2_++;
         }
         var _loc3_:int = (param1 + 1) % GameConsts.NUM_CHIMA_TEAMS;
         this._pFlagGenerator = new FlagGenerator(_loc3_);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this._pFlagGenerator.dispose();
         this._pFlagGenerator = null;
         super.dispose();
      }
      
      public function setMaxEnemies(param1:uint) : void
      {
         this._uMaxEnemyCount = param1;
      }
      
      public function setMaxEnvironmentals(param1:uint) : void
      {
         this._uMaxEnvCount = param1;
      }
      
      public function setMaxDiscShooters(param1:uint) : void
      {
         this._uMaxDiscShooterCount = param1;
      }
      
      public function setMaxOrbs(param1:uint) : void
      {
         this._uMaxOrbCount = param1;
      }
      
      override public function setEnabled(param1:Boolean) : void
      {
         this._bEnabled = param1;
      }
      
      public function getFlagGenerator() : FlagGenerator
      {
         return this._pFlagGenerator;
      }
      
      public function getCurrentRound() : uint
      {
         return this._uCurrentRound;
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         if(getLayer().isUpdateEnabled() == false)
         {
            return;
         }
         if(this._bEnabled)
         {
            _loc2_ = GameWorld.get().getHUD().getDistanceMeter().getDistance();
            if(this._uDistanceToNextIncrease <= _loc2_ && this._uKillCount >= this._uKillsRequiredForIncrease)
            {
               this._uDistanceToNextIncrease = _loc2_ + kuDistanceForDifficultyChange;
               ++this._uMaxEnemyCount;
               this._uKillsRequiredForIncrease = this._uMaxEnemyCount * 2;
               this._uKillCount = 0;
               ++this._uCurrentRound;
            }
            if(this._uEnemyCount < this._uMaxEnemyCount && Random.RandomNumberRange(0,30) == 0)
            {
               this.addEnemy();
            }
            if(this._uEnvCount < this._uMaxEnvCount && Random.RandomNumberRange(0,30) == 0)
            {
               if(GameWorld.get().getBackground().getDistanceSinceTransition() > kuMinEnvDistance)
               {
                  this.addEnvironmental();
               }
            }
            if(this._uDiscShooterCount < this._uMaxDiscShooterCount && Random.RandomNumberRange(0,120) == 0)
            {
               this.addDiscShooter();
            }
            if(this._uOrbCount < this._uMaxOrbCount)
            {
               this.addOrb();
            }
            this.addFlag();
            _loc3_ = 0;
            while(_loc3_ < ENEMY_MANAGER_ENV_SLOTS)
            {
               this._fEnvSlotTimer[_loc3_] -= param1.getTime().dt * kfSlotDecayRate;
               this._fEnvSlotTimer[_loc3_] = MathsHelper.Clamp(this._fEnvSlotTimer[_loc3_],0,1);
               _loc3_++;
            }
         }
      }
      
      public function addEnemy() : void
      {
         var _loc1_:Vec2F = new Vec2F(Random.RandomFloatRangeUniform(0,LegoChima.Instance().zGetScreenWidth()),-200);
         var _loc2_:Enemy = this.getNewEnemy(_loc1_);
         _loc2_.setOwner(this);
         getLayer().addObject(_loc2_);
         var _loc3_:uint = uint(GameWorld.get().getHUD().getDistanceMeter().getDistance());
         if(_loc3_ < 50)
         {
            _loc2_.setHealth(1);
         }
         else if(_loc3_ < 100)
         {
            _loc2_.setHealth(2);
         }
         ++this._uEnemyCount;
      }
      
      public function getNewEnemy(param1:Vec2F) : Enemy
      {
         var _loc2_:Enemy = null;
         switch(Random.RandomNumberRange(0,4) % this._uCurrentRound)
         {
            case 0:
               _loc2_ = this.getRangedEnemy(param1);
               break;
            case 1:
               _loc2_ = this.getMageEnemy(param1);
               break;
            case 2:
               _loc2_ = this.getWarriorEnemy(param1);
               break;
            case 3:
               _loc2_ = this.getAdditionalEnemy(param1);
               break;
            case 4:
               _loc2_ = this.getFlyingEnemy(param1);
               break;
            default:
               throw new Error("SCG:Check me");
         }
         return _loc2_;
      }
      
      public function getRangedEnemy(param1:Vec2F) : Enemy
      {
         var _loc2_:Enemy = null;
         switch(this._side)
         {
            case GameConsts.eFireChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new RangedCrocEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new RangedLionEnemy(this._side,param1);
               }
               break;
            case GameConsts.eIceChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new RangedBearEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new RangedSaberEnemy(this._side,param1);
               }
         }
         return _loc2_;
      }
      
      public function getMageEnemy(param1:Vec2F) : Enemy
      {
         var _loc2_:Enemy = null;
         switch(this._side)
         {
            case GameConsts.eFireChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new MageCrocEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new MageLionEnemy(this._side,param1);
               }
               break;
            case GameConsts.eIceChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new MageBearEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new MageSaberEnemy(this._side,param1);
               }
         }
         return _loc2_;
      }
      
      public function getWarriorEnemy(param1:Vec2F) : Enemy
      {
         var _loc2_:Enemy = null;
         switch(this._side)
         {
            case GameConsts.eFireChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new WarriorCrocEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new WarriorLionEnemy(this._side,param1);
               }
               break;
            case GameConsts.eIceChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new WarriorBearEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new WarriorSaberEnemy(this._side,param1);
               }
         }
         return _loc2_;
      }
      
      public function getAdditionalEnemy(param1:Vec2F) : Enemy
      {
         var _loc2_:Enemy = null;
         switch(this._side)
         {
            case GameConsts.eFireChima:
               switch(Random.RandomNumberRange(0,10000) % 4)
               {
                  case 0:
                     _loc2_ = new MageFireGorillaEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new WarriorFireGorillaEnemy(this._side,param1);
                     break;
                  case 2:
                     _loc2_ = new RangedFireLionEnemy(this._side,param1);
                     break;
                  case 3:
                     _loc2_ = new MageLeopardEnemy(this._side,param1);
               }
               break;
            case GameConsts.eIceChima:
               switch(Random.RandomNumberRange(0,10000) % 4)
               {
                  case 0:
                     _loc2_ = new RangedIceCrocEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new RangedIceLionEnemy(this._side,param1);
                     break;
                  case 2:
                     _loc2_ = new RangedMinimammothEnemy(this._side,param1);
                     break;
                  case 3:
                     _loc2_ = new RangedPredatorEnemy(this._side,param1);
               }
         }
         return _loc2_;
      }
      
      public function getFlyingEnemy(param1:Vec2F) : Enemy
      {
         var _loc2_:Enemy = null;
         switch(this._side)
         {
            case GameConsts.eFireChima:
               _loc2_ = new MageRedBirdEnemy(this._side,param1);
               break;
            case GameConsts.eIceChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new WarriorVultureEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new RangedBatEnemy(this._side,param1);
               }
         }
         return _loc2_;
      }
      
      public function addEnvironmental() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:Vec2F = new Vec2F();
         if(this.getNewEnvironmentalPosition(_loc1_))
         {
            _loc2_ = this.getNewEnvironmental(_loc1_);
            if(_loc2_)
            {
               _loc2_.setOwner(this);
               getLayer().addObject(_loc2_);
               ++this._uEnvCount;
            }
         }
      }
      
      public function getNewEnvironmentalPosition(param1:Vec2F) : Boolean
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:Number = NaN;
         param1.x = 0;
         param1.y = 0;
         _loc2_ = 0;
         while(_loc2_ < 4)
         {
            _loc3_ = Random.RandomNumberRange(0,ENEMY_MANAGER_ENV_SLOTS - 1);
            if(this._fEnvSlotTimer[_loc3_] == 0)
            {
               _loc4_ = Number(LegoChima.Instance().zGetScreenWidth()) / Number(ENEMY_MANAGER_ENV_SLOTS);
               param1.x = _loc4_ * Number(_loc3_) + _loc4_ * 0.5;
               param1.y = -200;
               this._fEnvSlotTimer[_loc3_] = 1;
               if(_loc3_ > 0)
               {
                  this._fEnvSlotTimer[_loc3_ - 1] = 0.5;
               }
               if(_loc3_ < ENEMY_MANAGER_ENV_SLOTS - 1)
               {
                  this._fEnvSlotTimer[_loc3_ + 1] = 0.5;
               }
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function getNewEnvironmental(param1:Vec2F) : Enemy
      {
         var _loc2_:Vector.<GlaSet> = new <GlaSet>[GameRes.get()._pFireEnvCharSet,GameRes.get()._pIceEnvCharSet,GameRes.get()._pIceEnvCharSet,GameRes.get()._pFireEnvCharSet];
         var _loc3_:int = GameWorld.get().getBackground().getCurrentTileset().getTileset();
         var _loc5_:String;
         var _loc4_:Vector.<String>;
         if((_loc5_ = (_loc4_ = names[_loc3_])[Random.RandomNumberRange(0,10000) % 8]) != "")
         {
            return new EnvEnemy(this._side,param1,_loc2_[_loc3_],_loc5_);
         }
         return null;
      }
      
      public function addDiscShooter() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:Vec2F = new Vec2F();
         if(this._uCurrentRound >= 3 && this.getNewEnvironmentalPosition(_loc1_))
         {
            _loc2_ = this.getNewDiscShooterEnemy(_loc1_);
            if(_loc2_)
            {
               _loc2_.setOwner(this);
               getLayer().addObject(_loc2_);
               ++this._uDiscShooterCount;
            }
         }
      }
      
      public function getNewDiscShooterEnemy(param1:Vec2F) : Enemy
      {
         var _loc2_:Enemy = null;
         switch(this._side)
         {
            case GameConsts.eFireChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new DiscShooterCrocEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new DiscShooterLionEnemy(this._side,param1);
               }
               break;
            case GameConsts.eIceChima:
               switch(Random.RandomNumberRange(0,10000) % 2)
               {
                  case 0:
                     _loc2_ = new DiscShooterBearEnemy(this._side,param1);
                     break;
                  case 1:
                     _loc2_ = new DiscShooterSaberEnemy(this._side,param1);
               }
         }
         return _loc2_;
      }
      
      public function addOrb() : void
      {
         var _loc2_:Enemy = null;
         var _loc1_:Vec2F = new Vec2F();
         if(this.getNewEnvironmentalPosition(_loc1_))
         {
            _loc2_ = this.getNewOrb(_loc1_);
            if(_loc2_)
            {
               _loc2_.setOwner(this);
               getLayer().addObject(_loc2_);
               ++this._uOrbCount;
            }
         }
      }
      
      public function getNewOrb(param1:Vec2F) : Enemy
      {
         var _loc2_:Enemy = null;
         switch(this._side)
         {
            case GameConsts.eFireChima:
               _loc2_ = new OrbEnemy(GameConsts.eIceChima,param1,GameRes.get()._pIceOrbsCharSet,"orb_ice");
               break;
            case GameConsts.eIceChima:
               _loc2_ = new OrbEnemy(GameConsts.eFireChima,param1,GameRes.get()._pFireOrbsCharSet,"orb_fire");
         }
         return _loc2_;
      }
      
      public function addFlag() : void
      {
         var _loc1_:Vec2F = null;
         var _loc2_:FlagPiece = null;
         if(this._pFlagGenerator.canGenerate())
         {
            _loc1_ = new Vec2F();
            if(this.getNewEnvironmentalPosition(_loc1_))
            {
               _loc2_ = this._pFlagGenerator.getNewFlagPiece(_loc1_);
               getLayer().addObject(_loc2_);
            }
         }
      }
      
      public function enemyDied(param1:Enemy, param2:Boolean = true) : void
      {
         if(param1 is EnvEnemy)
         {
            if(this._uEnvCount > 0)
            {
               --this._uEnvCount;
            }
         }
         else
         {
            Main.Instance().m_app.dispatchEvent(new EventEnemyDied(EventEnemyDied.EVENT_ENEMY_DIED,false,param1));
            if(param2)
            {
               ++this._uKillCount;
            }
            if(param1 is DiscShooterEnemy)
            {
               if(this._uDiscShooterCount > 0)
               {
                  --this._uDiscShooterCount;
               }
            }
            else if(param1 is OrbEnemy)
            {
               if(this._uOrbCount > 0)
               {
                  --this._uOrbCount;
               }
            }
            else if(this._uEnemyCount > 0)
            {
               --this._uEnemyCount;
            }
         }
      }
      
      public function setSide(param1:int) : void
      {
         this._side = param1;
         var _loc2_:int = (this._side + 1) % GameConsts.NUM_CHIMA_TEAMS;
         this._pFlagGenerator.setSide(_loc2_);
      }
      
      public function reset() : void
      {
         this._uMaxEnemyCount = kuNumStartingEnemies;
         this._uDistanceToNextIncrease = kuDistanceForDifficultyChange;
         this._uKillsRequiredForIncrease = kuNumStartingEnemies;
         this._uKillCount = 0;
         this._uCurrentRound = 1;
         this.clear();
         this._pFlagGenerator.reset();
      }
      
      public function clear() : void
      {
         var _loc2_:WorldObj = null;
         var _loc1_:Vector.<WorldObj> = getLayer().getObjectList();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ is Enemy)
            {
               (_loc2_ as Enemy).deleteThis();
            }
            if(_loc2_ is FlagPiece)
            {
               (_loc2_ as FlagPiece).deleteThis();
            }
         }
         this._uEnvCount = 0;
         this._uEnemyCount = 0;
         this._uDiscShooterCount = 0;
         this._uOrbCount = 0;
      }
   }
}
