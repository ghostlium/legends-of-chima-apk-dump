package game.objects.misc
{
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import game.GameWorld;
   import game.Util;
   import game.objects.GameObject;
   import game.objects.Player;
   import game.objects.enemies.discshooters.DiscShooterEnemy;
   import game.objects.events.EventBulletReflected;
   import game.objects.events.EventChiPowerUsed;
   import game.objects.events.EventEnemyDied;
   import game.objects.events.EventGameEnded;
   import game.objects.events.EventGameStarted;
   import game.objects.events.EventPlayerDied;
   import game.objects.events.EventPlayerDistanceRan;
   import game.objects.events.EventPlayerFlagCollected;
   import game.objects.events.EventPlayerFollowerAdded;
   import game.objects.events.EventPlayerFollowerDied;
   import game.objects.events.EventPlayerHealthChanged;
   import game.objects.events.EventPlayerTookDamage;
   import game.objects.events.EventPowerUpCollected;
   import game.objects.events.EventStudCollected;
   import resource.ResManager;
   
   public class BonusMissions extends GameObject
   {
      
      public static const NUM_CONCURRENT_BONUS_MISSIONS:int = 3;
      
      public static const BONUS_MISSION_DATA_VERSION:int = 1;
      
      public static const eBonusKillXEnemies:int = 0;
      
      public static const eBonusRunXDistanceAsYTribe:int = 1;
      
      public static const eBonusRunXDistanceAsYTribeSingleRun:int = 2;
      
      public static const eBonusRunXDistanceAsYClass:int = 3;
      
      public static const eBonusRunXDistanceAsYClassSingleRun:int = 4;
      
      public static const eBonusDestroyXEnemiesAsYTribe:int = 5;
      
      public static const eBonusDestroyXEnemiesAsYClass:int = 6;
      
      public static const eBonusDestroyXDiscShooters:int = 7;
      
      public static const eBonusDestroyXEnemiesSingleRun:int = 8;
      
      public static const eBonusCollectXFlags:int = 9;
      
      public static const eBonusHaveXFollowers:int = 10;
      
      public static const eBonusRunXDistance:int = 11;
      
      public static const eBonusRunXDistanceSingleRun:int = 12;
      
      public static const eBonusRunXDistanceSingleRunNoChiPower:int = 13;
      
      public static const eBonusRunXDistanceNoFollowers:int = 14;
      
      public static const eBonusRunXDistanceNoDamage:int = 15;
      
      public static const eBonusRunXDistanceOneHealth:int = 16;
      
      public static const eBonusUseChiPowerXTimesSingleRun:int = 17;
      
      public static const eBonusDestroyXNumberOfYTribe:int = 18;
      
      public static const eBonusCollectXStudsSingleRun:int = 19;
      
      public static const eBonusReflectXBulletsAsWarrior:int = 20;
      
      public static const eBonusUseXPowerUpNTimes:int = 21;
      
      public static const eBonusReachXMultiplier:int = 22;
      
      public static const eBonusMissionInvalid:int = 23;
      
      public static const kuSaltLen:uint = 16;
      
      public static const kFileName:String = "bonus";
       
      
      public var _stringToEnum:Dictionary;
      
      public var _bonusMissions:Dictionary;
      
      public var _currMissions:Vector.<BonusMission>;
      
      public var _missionOrder:Vector.<String>;
      
      public var _bGameActive:Boolean;
      
      public var _uNumTimesChiUsed:uint;
      
      public var _uCurrNumFollowers:uint;
      
      public var _fCurrPlayerHealth:Number;
      
      public var _uStudsCollected:uint;
      
      private var _so:SharedObject;
      
      public function BonusMissions()
      {
         super();
         this._stringToEnum = new Dictionary();
         this._bonusMissions = new Dictionary();
         this._currMissions = new Vector.<BonusMission>(NUM_CONCURRENT_BONUS_MISSIONS,true);
         this._missionOrder = new Vector.<String>();
         this._bGameActive = false;
         this._uNumTimesChiUsed = 0;
         this._uCurrNumFollowers = 0;
         this._fCurrPlayerHealth = 0;
         this._uStudsCollected = 0;
         this._so = SharedObject.getLocal(kFileName);
         this.setupEnumMap();
         this.setupMissions();
         this.load();
         Main.Instance().m_app.addEventListener(EventGameStarted.EVENT_GAME_STARTED,this.eventGameStarted);
         Main.Instance().m_app.addEventListener(EventGameEnded.EVENT_GAME_ENDED,this.eventGameEnded);
         Main.Instance().m_app.addEventListener(EventBulletReflected.EVENT_BULLET_REFLECTED,this.eventBulletReflected);
         Main.Instance().m_app.addEventListener(EventChiPowerUsed.EVENT_CHI_POWER_USED,this.eventChiPowerUsed);
         Main.Instance().m_app.addEventListener(EventEnemyDied.EVENT_ENEMY_DIED,this.eventEnemyDied);
         Main.Instance().m_app.addEventListener(EventPlayerDied.EVENT_PLAYER_DIED,this.eventPlayerDied);
         Main.Instance().m_app.addEventListener(EventPlayerDistanceRan.EVENT_PLAYER_DISTANCE_RAN,this.eventPlayerDistanceRan);
         Main.Instance().m_app.addEventListener(EventPlayerFlagCollected.EVENT_PLAYER_FLAG_COLLECTED,this.eventPlayerFlagCollected);
         Main.Instance().m_app.addEventListener(EventPlayerFollowerAdded.EVENT_PLAYER_FOLLOWER_ADDED,this.eventPlayerFollowerAdded);
         Main.Instance().m_app.addEventListener(EventPlayerFollowerDied.EVENT_PLAYER_FOLLOWER_DIED,this.eventPlayerFollowerDied);
         Main.Instance().m_app.addEventListener(EventPlayerHealthChanged.EVENT_PLAYER_HEALTH_CHANGED,this.eventPlayerHealthChanged);
         Main.Instance().m_app.addEventListener(EventStudCollected.EVENT_STUD_COLLECTED,this.eventStudCollected);
         Main.Instance().m_app.addEventListener(EventPlayerTookDamage.EVENT_PLAYER_TOOK_DAMAGE,this.eventPlayerTookDamage);
         Main.Instance().m_app.addEventListener(EventPowerUpCollected.EVENT_POWERUP_COLLECTED,this.eventPowerUpCollected);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventGameStarted.EVENT_GAME_STARTED,this.eventGameStarted);
         Main.Instance().m_app.removeEventListener(EventGameEnded.EVENT_GAME_ENDED,this.eventGameEnded);
         Main.Instance().m_app.removeEventListener(EventBulletReflected.EVENT_BULLET_REFLECTED,this.eventBulletReflected);
         Main.Instance().m_app.removeEventListener(EventChiPowerUsed.EVENT_CHI_POWER_USED,this.eventChiPowerUsed);
         Main.Instance().m_app.removeEventListener(EventEnemyDied.EVENT_ENEMY_DIED,this.eventEnemyDied);
         Main.Instance().m_app.removeEventListener(EventPlayerDied.EVENT_PLAYER_DIED,this.eventPlayerDied);
         Main.Instance().m_app.removeEventListener(EventPlayerDistanceRan.EVENT_PLAYER_DISTANCE_RAN,this.eventPlayerDistanceRan);
         Main.Instance().m_app.removeEventListener(EventPlayerFlagCollected.EVENT_PLAYER_FLAG_COLLECTED,this.eventPlayerFlagCollected);
         Main.Instance().m_app.removeEventListener(EventPlayerFollowerAdded.EVENT_PLAYER_FOLLOWER_ADDED,this.eventPlayerFollowerAdded);
         Main.Instance().m_app.removeEventListener(EventPlayerFollowerDied.EVENT_PLAYER_FOLLOWER_DIED,this.eventPlayerFollowerDied);
         Main.Instance().m_app.removeEventListener(EventPlayerHealthChanged.EVENT_PLAYER_HEALTH_CHANGED,this.eventPlayerHealthChanged);
         Main.Instance().m_app.removeEventListener(EventStudCollected.EVENT_STUD_COLLECTED,this.eventStudCollected);
         Main.Instance().m_app.removeEventListener(EventPlayerTookDamage.EVENT_PLAYER_TOOK_DAMAGE,this.eventPlayerTookDamage);
         Main.Instance().m_app.removeEventListener(EventPowerUpCollected.EVENT_POWERUP_COLLECTED,this.eventPowerUpCollected);
         this.save();
      }
      
      public function setupEnumMap() : void
      {
         this._stringToEnum["eBonusKillXEnemies"] = eBonusKillXEnemies;
         this._stringToEnum["eBonusRunXDistanceAsYTribe"] = eBonusRunXDistanceAsYTribe;
         this._stringToEnum["eBonusRunXDistanceAsYTribeSingleRun"] = eBonusRunXDistanceAsYTribeSingleRun;
         this._stringToEnum["eBonusRunXDistanceAsYClass"] = eBonusRunXDistanceAsYClass;
         this._stringToEnum["eBonusRunXDistanceAsYClassSingleRun"] = eBonusRunXDistanceAsYClassSingleRun;
         this._stringToEnum["eBonusDestroyXEnemiesAsYTribe"] = eBonusDestroyXEnemiesAsYTribe;
         this._stringToEnum["eBonusDestroyXEnemiesAsYClass"] = eBonusDestroyXEnemiesAsYClass;
         this._stringToEnum["eBonusDestroyXDiscShooters"] = eBonusDestroyXDiscShooters;
         this._stringToEnum["eBonusDestroyXEnemiesSingleRun"] = eBonusDestroyXEnemiesSingleRun;
         this._stringToEnum["eBonusCollectXFlags"] = eBonusCollectXFlags;
         this._stringToEnum["eBonusHaveXFollowers"] = eBonusHaveXFollowers;
         this._stringToEnum["eBonusRunXDistance"] = eBonusRunXDistance;
         this._stringToEnum["eBonusRunXDistanceSingleRun"] = eBonusRunXDistanceSingleRun;
         this._stringToEnum["eBonusRunXDistanceSingleRunNoChiPower"] = eBonusRunXDistanceSingleRunNoChiPower;
         this._stringToEnum["eBonusRunXDistanceNoFollowers"] = eBonusRunXDistanceNoFollowers;
         this._stringToEnum["eBonusRunXDistanceNoDamage"] = eBonusRunXDistanceNoDamage;
         this._stringToEnum["eBonusRunXDistanceOneHealth"] = eBonusRunXDistanceOneHealth;
         this._stringToEnum["eBonusUseChiPowerXTimesSingleRun"] = eBonusUseChiPowerXTimesSingleRun;
         this._stringToEnum["eBonusDestroyXNumberOfYTribe"] = eBonusDestroyXNumberOfYTribe;
         this._stringToEnum["eBonusCollectXStudsSingleRun"] = eBonusCollectXStudsSingleRun;
         this._stringToEnum["eBonusReflectXBulletsAsWarrior"] = eBonusReflectXBulletsAsWarrior;
         this._stringToEnum["eBonusUseXPowerUpNTimes"] = eBonusUseXPowerUpNTimes;
         this._stringToEnum["eBonusReachXMultiplier"] = eBonusReachXMultiplier;
      }
      
      public function getEnumFromString(param1:String) : int
      {
         return this._stringToEnum[param1];
      }
      
      public function setupMissions() : void
      {
         var _loc9_:Object = null;
         var _loc10_:BonusMission = null;
         var _loc11_:String = null;
         var _loc1_:ByteArray = ResManager.getData("cfg/bonusmissions.zdf");
         var _loc2_:String = _loc1_.toString();
         var _loc3_:Object = JSON.parse(_loc2_);
         var _loc4_:Array;
         var _loc5_:int = (_loc4_ = _loc3_.missions).length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = _loc4_[_loc6_];
            (_loc10_ = new BonusMission()).bonusMissionName = _loc9_.missionName;
            _loc10_.bonusType = this.getEnumFromString(_loc9_.missionType);
            _loc10_.singleRun = _loc9_.singleRun;
            _loc10_.chimatribe = _loc9_.chimatribe;
            _loc10_.chimaclass = _loc9_.chimaclass;
            _loc10_.currValue = _loc9_.currValue;
            _loc10_.targetValue = _loc9_.targetValue;
            _loc10_.missionLevel = _loc9_.missionLevel;
            _loc10_.missionLevelMultiplier = _loc9_.missionLevelMultiplier;
            _loc10_.missionLevelIncrement = _loc9_.missionLevelIncrement;
            _loc10_.languageString = _loc9_.languageString;
            _loc10_.completed = false;
            _loc10_.reward = _loc9_.reward;
            _loc10_.countdown = 0;
            if(_loc10_.bonusType != eBonusMissionInvalid)
            {
               this._bonusMissions[_loc10_.bonusMissionName] = _loc10_;
            }
            _loc6_++;
         }
         var _loc7_:Array;
         var _loc8_:int = (_loc7_ = _loc3_.missionOrder).length;
         _loc6_ = 0;
         while(_loc6_ < _loc8_)
         {
            _loc11_ = _loc7_[_loc6_];
            this._missionOrder.push(_loc11_);
            _loc6_++;
         }
      }
      
      public function assignDefaultMissions() : void
      {
         this.assignMission(0,this.getMission(this._missionOrder[0]));
         this.assignMission(1,this.getMission(this._missionOrder[1]));
         this.assignMission(2,this.getMission(this._missionOrder[2]));
      }
      
      public function getMission(param1:String) : BonusMission
      {
         var _loc2_:BonusMission = this._bonusMissions[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new BonusMission();
            _loc2_.bonusType = eBonusMissionInvalid;
         }
         return _loc2_;
      }
      
      public function assignMission(param1:uint, param2:BonusMission) : void
      {
         param2.currValue = 0;
         param2.targetValue = param2.missionLevel * param2.targetValue + param2.missionLevel * param2.missionLevelIncrement;
         param2.reward *= param2.missionLevel;
         this._currMissions[param1] = param2;
      }
      
      public function isMissionUsable(param1:String) : Boolean
      {
         var _loc3_:uint = 0;
         var _loc2_:Boolean = true;
         _loc3_ = 0;
         while(_loc3_ < NUM_CONCURRENT_BONUS_MISSIONS)
         {
            if(this._currMissions[_loc3_].completed == false && param1 == this._currMissions[_loc3_].bonusMissionName)
            {
               _loc2_ = false;
            }
            _loc3_++;
         }
         var _loc4_:BonusMission;
         if((_loc4_ = this.getMission(param1)).countdown != 0)
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      public function findNextMission(param1:String) : String
      {
         var _loc2_:uint = 0;
         var _loc3_:String = "";
         while(this._missionOrder[_loc2_] != param1)
         {
            _loc2_++;
         }
         var _loc4_:Boolean = false;
         while(!_loc4_)
         {
            _loc2_ = (_loc2_ + 1) % this._missionOrder.length;
            _loc3_ = this._missionOrder[_loc2_];
            if(this.isMissionUsable(_loc3_))
            {
               _loc4_ = true;
            }
         }
         return _loc3_;
      }
      
      public function load() : void
      {
         var _loc1_:Vector.<Object> = null;
         var _loc2_:Vector.<Object> = null;
         var _loc3_:uint = 0;
         var _loc4_:BonusMissionSaveData = null;
         var _loc5_:BonusMission = null;
         if(this._so.data.currMissionsSave == null)
         {
            this.assignDefaultMissions();
            return;
         }
         _loc1_ = this._so.data.currMissionsSave;
         _loc2_ = this._so.data.bonusMissionsSave;
         if(_loc1_.length != NUM_CONCURRENT_BONUS_MISSIONS)
         {
            return;
         }
         _loc3_ = 0;
         while(_loc3_ < NUM_CONCURRENT_BONUS_MISSIONS)
         {
            (_loc4_ = new BonusMissionSaveData()).CreateFromSaveDataObject(_loc1_[_loc3_]);
            this._currMissions[_loc3_] = new BonusMission();
            _loc4_.FillOutBonusMissionFrom(this._currMissions[_loc3_]);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            (_loc4_ = new BonusMissionSaveData()).CreateFromSaveDataObject(_loc2_[_loc3_]);
            _loc5_ = new BonusMission();
            _loc4_.FillOutBonusMissionFrom(_loc5_);
            this._bonusMissions[_loc5_.bonusMissionName] = _loc5_;
            _loc3_++;
         }
      }
      
      public function save() : void
      {
         var _loc3_:uint = 0;
         var _loc4_:BonusMissionSaveData = null;
         var _loc5_:BonusMission = null;
         var _loc1_:Vector.<BonusMissionSaveData> = new Vector.<BonusMissionSaveData>();
         var _loc2_:Vector.<BonusMissionSaveData> = new Vector.<BonusMissionSaveData>();
         _loc3_ = 0;
         while(_loc3_ < NUM_CONCURRENT_BONUS_MISSIONS)
         {
            (_loc4_ = new BonusMissionSaveData()).CreateFromBonusMission(this._currMissions[_loc3_]);
            _loc1_.push(_loc4_);
            _loc3_++;
         }
         for each(_loc5_ in this._bonusMissions)
         {
            (_loc4_ = new BonusMissionSaveData()).CreateFromBonusMission(_loc5_);
            _loc2_.push(_loc4_);
         }
         this._so.data.currMissionsSave = _loc1_;
         this._so.data.bonusMissionsSave = _loc2_;
         this._so.flush();
      }
      
      public function assignNewMissionsIfNecessary() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:BonusMission = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         _loc1_ = 0;
         while(_loc1_ < NUM_CONCURRENT_BONUS_MISSIONS)
         {
            if(this._currMissions[_loc1_].completed)
            {
               ++this._bonusMissions[this._currMissions[_loc1_].bonusMissionName].missionLevel;
               this._bonusMissions[this._currMissions[_loc1_].bonusMissionName].countdown = 10 + 1;
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < NUM_CONCURRENT_BONUS_MISSIONS)
         {
            if(this._currMissions[_loc1_].completed)
            {
               for each(_loc2_ in this._bonusMissions)
               {
                  if(_loc2_.countdown > 0)
                  {
                     --_loc2_.countdown;
                  }
               }
               _loc3_ = this.findNextMission(this._currMissions[_loc1_].bonusMissionName);
               this.assignMission(_loc1_,this.getMission(_loc3_));
               _loc4_ = this.getBonusMissionDescription_frommission(this._currMissions[_loc1_]);
            }
            _loc1_++;
         }
      }
      
      public function getBonusMissionDescription_fromindex(param1:uint) : String
      {
         return this.getBonusMissionDescription_frommission(this._currMissions[param1]);
      }
      
      public function getBonusMissionDescription_frommission(param1:BonusMission) : String
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc2_:String = GameWorld.get().getLanguage().getString(param1.languageString);
         var _loc3_:String = _loc2_;
         switch(param1.bonusType)
         {
            case eBonusKillXEnemies:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               break;
            case eBonusRunXDistanceAsYTribe:
            case eBonusRunXDistanceAsYTribeSingleRun:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc5_ = GameWorld.get().getLanguage().getString(param1.chimatribe);
               _loc6_ = GameWorld.get().getLanguage().getString("metres");
               _loc3_ = _loc3_.replace("$(DISTANCE)",_loc4_);
               _loc3_ = _loc3_.replace("$(METRES)",_loc6_);
               _loc3_ = _loc3_.replace("$(TRIBE)",_loc5_);
               break;
            case eBonusRunXDistanceAsYClass:
            case eBonusRunXDistanceAsYClassSingleRun:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc7_ = GameWorld.get().getLanguage().getString(param1.chimaclass);
               _loc6_ = GameWorld.get().getLanguage().getString("metres");
               _loc3_ = _loc3_.replace("$(DISTANCE)",_loc4_);
               _loc3_ = _loc3_.replace("$(METRES)",_loc6_);
               _loc3_ = _loc3_.replace("$(CLASS)",_loc7_);
               break;
            case eBonusDestroyXEnemiesAsYTribe:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc5_ = GameWorld.get().getLanguage().getString(param1.chimatribe);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               _loc3_ = _loc3_.replace("$(TRIBE)",_loc5_);
               break;
            case eBonusDestroyXEnemiesAsYClass:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc7_ = GameWorld.get().getLanguage().getString(param1.chimaclass);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               _loc3_ = _loc3_.replace("$(CLASS)",_loc7_);
               break;
            case eBonusDestroyXDiscShooters:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               break;
            case eBonusDestroyXEnemiesSingleRun:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               break;
            case eBonusCollectXFlags:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               break;
            case eBonusHaveXFollowers:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               break;
            case eBonusRunXDistance:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc6_ = GameWorld.get().getLanguage().getString("metres");
               _loc3_ = _loc3_.replace("$(DISTANCE)",_loc4_);
               _loc3_ = _loc3_.replace("$(METRES)",_loc6_);
               break;
            case eBonusRunXDistanceSingleRun:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc6_ = GameWorld.get().getLanguage().getString("metres");
               _loc3_ = _loc3_.replace("$(DISTANCE)",_loc4_);
               _loc3_ = _loc3_.replace("$(METRES)",_loc6_);
               break;
            case eBonusRunXDistanceSingleRunNoChiPower:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc6_ = GameWorld.get().getLanguage().getString("metres");
               _loc3_ = _loc3_.replace("$(DISTANCE)",_loc4_);
               _loc3_ = _loc3_.replace("$(METRES)",_loc6_);
               break;
            case eBonusRunXDistanceNoFollowers:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc6_ = GameWorld.get().getLanguage().getString("metres");
               _loc3_ = _loc3_.replace("$(DISTANCE)",_loc4_);
               _loc3_ = _loc3_.replace("$(METRES)",_loc6_);
               break;
            case eBonusRunXDistanceNoDamage:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc6_ = GameWorld.get().getLanguage().getString("metres");
               _loc3_ = _loc3_.replace("$(DISTANCE)",_loc4_);
               _loc3_ = _loc3_.replace("$(METRES)",_loc6_);
               break;
            case eBonusRunXDistanceOneHealth:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc6_ = GameWorld.get().getLanguage().getString("metres");
               _loc3_ = _loc3_.replace("$(DISTANCE)",_loc4_);
               _loc3_ = _loc3_.replace("$(METRES)",_loc6_);
               break;
            case eBonusUseChiPowerXTimesSingleRun:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               break;
            case eBonusDestroyXNumberOfYTribe:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc5_ = GameWorld.get().getLanguage().getString(param1.chimatribe + "s");
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               _loc3_ = _loc3_.replace("$(TRIBE)",_loc5_);
               break;
            case eBonusCollectXStudsSingleRun:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               break;
            case eBonusReflectXBulletsAsWarrior:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc7_ = GameWorld.get().getLanguage().getString(param1.chimaclass);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               _loc3_ = _loc3_.replace("$(CLASS)",_loc7_);
               break;
            case eBonusUseXPowerUpNTimes:
               _loc4_ = Util.getFormattedNumber(param1.targetValue);
               _loc8_ = GameWorld.get().getLanguage().getString(param1.chimaclass);
               _loc3_ = _loc3_.replace("$(COUNT)",_loc4_);
               _loc3_ = _loc3_.replace("$(TYPE)",_loc8_);
               break;
            case eBonusReachXMultiplier:
               _loc3_ = "Bonus multiplier";
               break;
            default:
               _loc3_ = "Invalid mission.";
         }
         return _loc3_;
      }
      
      public function getBonusMissionCompletion_fromindex(param1:uint) : String
      {
         return this.getBonusMissionCompletion_frommission(this._currMissions[param1]);
      }
      
      public function getBonusMissionCompletion_frommission(param1:BonusMission) : String
      {
         return Util.getFormattedNumber(param1.currValue) + "/" + Util.getFormattedNumber(param1.targetValue);
      }
      
      public function getBonusMissionReward_fromindex(param1:uint) : uint
      {
         return this.getBonusMissionReward_frommission(this._currMissions[param1]);
      }
      
      public function getBonusMissionReward_frommission(param1:BonusMission) : uint
      {
         return param1.reward;
      }
      
      public function getBonusMission(param1:uint) : BonusMission
      {
         return this._currMissions[param1];
      }
      
      public function incrementValue(param1:BonusMission) : void
      {
         if(param1.currValue < param1.targetValue)
         {
            ++param1.currValue;
            if(param1.currValue == param1.targetValue)
            {
               param1.completed = true;
            }
         }
      }
      
      public function eventGameStarted(param1:EventGameStarted) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         this._bGameActive = true;
         this._uNumTimesChiUsed = 0;
         this._uCurrNumFollowers = 0;
         this._uStudsCollected = 0;
         _loc2_ = 0;
         while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
         {
            _loc3_ = this._currMissions[_loc2_];
            if(_loc3_.singleRun && _loc3_.completed == false)
            {
               _loc3_.currValue = 0;
            }
            _loc2_++;
         }
      }
      
      public function eventGameEnded(param1:EventGameEnded) : void
      {
         this._bGameActive = false;
      }
      
      public function eventBulletReflected(param1:EventBulletReflected) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         if(this._bGameActive)
         {
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc3_ = this._currMissions[_loc2_];
               switch(_loc3_.bonusType)
               {
                  case eBonusReflectXBulletsAsWarrior:
                     this.incrementValue(_loc3_);
                     break;
               }
               _loc2_++;
            }
         }
      }
      
      public function eventChiPowerUsed(param1:EventChiPowerUsed) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         if(this._bGameActive)
         {
            ++this._uNumTimesChiUsed;
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc3_ = this._currMissions[_loc2_];
               switch(_loc3_.bonusType)
               {
                  case eBonusUseChiPowerXTimesSingleRun:
                     this.incrementValue(_loc3_);
                     break;
               }
               _loc2_++;
            }
         }
      }
      
      public function eventEnemyDied(param1:EventEnemyDied) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Player = null;
         var _loc4_:BonusMission = null;
         if(this._bGameActive)
         {
            _loc3_ = GameWorld.get().getPlayer();
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc4_ = this._currMissions[_loc2_];
               switch(_loc4_.bonusType)
               {
                  case eBonusKillXEnemies:
                  case eBonusDestroyXEnemiesSingleRun:
                     this.incrementValue(_loc4_);
                     break;
                  case eBonusDestroyXEnemiesAsYTribe:
                     if(_loc3_ != null && _loc3_.getTribeStr() == _loc4_.chimatribe)
                     {
                        this.incrementValue(_loc4_);
                     }
                     break;
                  case eBonusDestroyXEnemiesAsYClass:
                     if(_loc3_ != null && _loc3_.getClassStr() == _loc4_.chimaclass)
                     {
                        this.incrementValue(_loc4_);
                     }
                     break;
                  case eBonusDestroyXDiscShooters:
                     if(param1.getEnemy() is DiscShooterEnemy)
                     {
                        this.incrementValue(_loc4_);
                     }
                     break;
                  case eBonusDestroyXNumberOfYTribe:
                     if(param1.getEnemy().getTribeStr() == _loc4_.chimatribe)
                     {
                        this.incrementValue(_loc4_);
                     }
                     break;
               }
               _loc2_++;
            }
         }
      }
      
      public function eventPlayerDied(param1:EventPlayerDied) : void
      {
      }
      
      public function eventPlayerDistanceRan(param1:EventPlayerDistanceRan) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:Player = null;
         var _loc5_:BonusMission = null;
         if(this._bGameActive)
         {
            _loc4_ = GameWorld.get().getPlayer();
            _loc2_ = 0;
            for(; _loc2_ < NUM_CONCURRENT_BONUS_MISSIONS; _loc2_++)
            {
               _loc5_ = this._currMissions[_loc2_];
               loop7:
               switch(_loc5_.bonusType)
               {
                  case eBonusRunXDistanceAsYTribe:
                  case eBonusRunXDistanceAsYTribeSingleRun:
                     if(_loc4_ && _loc4_.getTribeStr() == _loc5_.chimatribe)
                     {
                        _loc3_ = 0;
                        while(_loc3_ < param1.getDelta())
                        {
                           this.incrementValue(_loc5_);
                           _loc3_++;
                        }
                     }
                     continue;
                  case eBonusRunXDistanceAsYClass:
                  case eBonusRunXDistanceAsYClassSingleRun:
                     if(_loc4_ && _loc4_.getClassStr() == _loc5_.chimaclass)
                     {
                        _loc3_ = 0;
                        while(_loc3_ < param1.getDelta())
                        {
                           this.incrementValue(_loc5_);
                           _loc3_++;
                        }
                     }
                     continue;
                  case eBonusRunXDistance:
                  case eBonusRunXDistanceSingleRun:
                  case eBonusRunXDistanceNoDamage:
                     _loc3_ = 0;
                     while(_loc3_ < param1.getDelta())
                     {
                        this.incrementValue(_loc5_);
                        _loc3_++;
                     }
                     continue;
                  case eBonusRunXDistanceSingleRunNoChiPower:
                     if(this._uNumTimesChiUsed == 0)
                     {
                        _loc3_ = 0;
                        while(_loc3_ < param1.getDelta())
                        {
                           this.incrementValue(_loc5_);
                           _loc3_++;
                        }
                     }
                     continue;
                  case eBonusRunXDistanceNoFollowers:
                     if(this._uCurrNumFollowers == 0)
                     {
                        _loc3_ = 0;
                        while(_loc3_ < param1.getDelta())
                        {
                           this.incrementValue(_loc5_);
                           _loc3_++;
                        }
                     }
                     continue;
                  case eBonusRunXDistanceOneHealth:
                     if(this._fCurrPlayerHealth == 1)
                     {
                        _loc3_ = 0;
                        while(true)
                        {
                           if(_loc3_ >= param1.getDelta())
                           {
                              break loop7;
                           }
                           this.incrementValue(_loc5_);
                           _loc3_++;
                        }
                        break;
                     }
               }
            }
         }
      }
      
      public function eventPlayerFlagCollected(param1:EventPlayerFlagCollected) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         if(this._bGameActive)
         {
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc3_ = this._currMissions[_loc2_];
               switch(_loc3_.bonusType)
               {
                  case eBonusCollectXFlags:
                     this.incrementValue(_loc3_);
                     break;
               }
               _loc2_++;
            }
         }
      }
      
      public function eventPlayerFollowerAdded(param1:EventPlayerFollowerAdded) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         ++this._uCurrNumFollowers;
         if(this._bGameActive)
         {
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc3_ = this._currMissions[_loc2_];
               switch(_loc3_.bonusType)
               {
                  case eBonusHaveXFollowers:
                     this.incrementValue(_loc3_);
                     break;
                  case eBonusRunXDistanceNoFollowers:
                     if(_loc3_.completed == false)
                     {
                        _loc3_.currValue = 0;
                     }
                     break;
               }
               _loc2_++;
            }
         }
      }
      
      public function eventPlayerFollowerDied(param1:EventPlayerFollowerDied) : void
      {
         if(this._uCurrNumFollowers > 0)
         {
            --this._uCurrNumFollowers;
         }
      }
      
      public function eventPlayerHealthChanged(param1:EventPlayerHealthChanged) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         if(this._bGameActive)
         {
            this._fCurrPlayerHealth = param1.getHealth();
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc3_ = this._currMissions[_loc2_];
               switch(_loc3_.bonusType)
               {
                  case eBonusRunXDistanceOneHealth:
                     if(_loc3_.completed == false)
                     {
                        _loc3_.currValue = 0;
                     }
                     break;
               }
               _loc2_++;
            }
         }
      }
      
      public function eventStudCollected(param1:EventStudCollected) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         if(this._bGameActive)
         {
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc3_ = this._currMissions[_loc2_];
               switch(_loc3_.bonusType)
               {
                  case eBonusCollectXStudsSingleRun:
                     if(_loc3_.completed == false)
                     {
                        _loc3_.currValue += param1.getValue();
                        if(_loc3_.currValue >= _loc3_.targetValue)
                        {
                           _loc3_.currValue = _loc3_.targetValue;
                           _loc3_.completed = true;
                        }
                     }
                     break;
               }
               _loc2_++;
            }
         }
      }
      
      public function eventPlayerTookDamage(param1:EventPlayerTookDamage) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         if(this._bGameActive)
         {
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc3_ = this._currMissions[_loc2_];
               switch(_loc3_.bonusType)
               {
                  case eBonusRunXDistanceNoDamage:
                     if(_loc3_.completed == false)
                     {
                        _loc3_.currValue = 0;
                     }
                     break;
               }
               _loc2_++;
            }
         }
      }
      
      public function eventPowerUpCollected(param1:EventPowerUpCollected) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:BonusMission = null;
         if(this._bGameActive)
         {
            _loc2_ = 0;
            while(_loc2_ < NUM_CONCURRENT_BONUS_MISSIONS)
            {
               _loc3_ = this._currMissions[_loc2_];
               switch(_loc3_.bonusType)
               {
                  case eBonusUseXPowerUpNTimes:
                     if(param1.getName() == _loc3_.chimaclass)
                     {
                        this.incrementValue(_loc3_);
                     }
                     break;
               }
               _loc2_++;
            }
         }
      }
   }
}
