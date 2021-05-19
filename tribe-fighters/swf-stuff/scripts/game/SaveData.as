package game
{
   import flash.net.SharedObject;
   
   public class SaveData
   {
      
      public static const SAVE_DATA_VERSION:int = 8;
      
      public static const ePlayerCharRangedBearSlot:int = 0;
      
      public static const ePlayerCharMageBearSlot:int = 1;
      
      public static const ePlayerCharWarriorBearSlot:int = 2;
      
      public static const ePlayerCharRangedCrocSlot:int = 3;
      
      public static const ePlayerCharMageCrocSlot:int = 4;
      
      public static const ePlayerCharWarriorCrocSlot:int = 5;
      
      public static const ePlayerCharRangedLionSlot:int = 6;
      
      public static const ePlayerCharMageLionSlot:int = 7;
      
      public static const ePlayerCharWarriorLionSlot:int = 8;
      
      public static const ePlayerCharRangedSaberSlot:int = 9;
      
      public static const ePlayerCharMageSaberSlot:int = 10;
      
      public static const ePlayerCharWarriorSaberSlot:int = 11;
      
      public static const ePlayerCharLavalSlot:int = 12;
      
      public static const ePlayerCharSirFangorSlot:int = 13;
      
      public static const NUM_PLAYER_CHAR_SAVE_SLOTS:int = 14;
      
      private static const kFileName:String = "savedata";
       
      
      public var _uStudsCollected:uint;
      
      public var _chardata:Vector.<CharData>;
      
      public var _bMusicEnabled:Boolean;
      
      public var _bSfxEnabled:Boolean;
      
      public var _languageCode:String;
      
      public var _bTutorialShown:Boolean;
      
      public var _bPlayerGot50000StudsFirstTime:Boolean;
      
      public var _bPlayerGot100000StudsFirstTime:Boolean;
      
      public var _bPlayerGot500000StudsFirstTime:Boolean;
      
      public var _bPlayerGot1000000StudsFirstTime:Boolean;
      
      private var _so:SharedObject;
      
      public function SaveData()
      {
         var _loc1_:int = 0;
         super();
         this._languageCode = "en";
         this._chardata = new Vector.<CharData>(NUM_PLAYER_CHAR_SAVE_SLOTS,true);
         _loc1_ = 0;
         while(_loc1_ < NUM_PLAYER_CHAR_SAVE_SLOTS)
         {
            this._chardata[_loc1_] = new CharData();
            _loc1_++;
         }
         this._so = SharedObject.getLocal(kFileName);
         this.load();
      }
      
      public function dispose() : void
      {
         this.save();
      }
      
      public function getTutorialShown() : Boolean
      {
         return this._bTutorialShown;
      }
      
      public function setTutorialShown(param1:Boolean) : void
      {
         this._bTutorialShown = param1;
      }
      
      public function getMusicEnabled() : Boolean
      {
         return this._bMusicEnabled;
      }
      
      public function setMusicEnabled(param1:Boolean) : void
      {
         this._bMusicEnabled = param1;
      }
      
      public function getSfxEnabled() : Boolean
      {
         return this._bSfxEnabled;
      }
      
      public function setSfxEnabled(param1:Boolean) : void
      {
         this._bSfxEnabled = param1;
      }
      
      public function getLanguageCode() : String
      {
         return this._languageCode;
      }
      
      public function setLanguageCode(param1:String) : void
      {
         this._languageCode = param1;
      }
      
      public function load() : void
      {
         var _loc1_:Vector.<Object> = null;
         var _loc2_:int = 0;
         var _loc3_:CharSaveData = null;
         if(this._so.data._uStudsCollected == null)
         {
            this.loadDefaults();
            return;
         }
         this._uStudsCollected = this._so.data._uStudsCollected;
         this._bMusicEnabled = this._so.data._bMusicEnabled;
         this._bSfxEnabled = this._so.data._bSfxEnabled;
         this._languageCode = this._so.data._languageCode;
         this._bPlayerGot50000StudsFirstTime = this._so.data._bPlayerGot50000StudsFirstTime;
         this._bPlayerGot100000StudsFirstTime = this._so.data._bPlayerGot100000StudsFirstTime;
         this._bPlayerGot500000StudsFirstTime = this._so.data._bPlayerGot500000StudsFirstTime;
         this._bPlayerGot1000000StudsFirstTime = this._so.data._bPlayerGot1000000StudsFirstTime;
         _loc1_ = this._so.data.aCharSaveData;
         _loc2_ = 0;
         while(_loc2_ < NUM_PLAYER_CHAR_SAVE_SLOTS)
         {
            _loc3_ = new CharSaveData();
            _loc3_.CreateFromSaveDataObject(_loc1_[_loc2_]);
            _loc3_.FillOutCharDataFromSave(this._chardata[_loc2_]);
            _loc2_++;
         }
         this._bTutorialShown = this._so.data._bTutorialShown;
      }
      
      public function loadDefaults() : void
      {
         var _loc1_:uint = 0;
         this._uStudsCollected = 0;
         _loc1_ = 0;
         while(_loc1_ < NUM_PLAYER_CHAR_SAVE_SLOTS)
         {
            this._chardata[_loc1_].upgradeLevel = 0;
            this._chardata[_loc1_].unused1 = 0;
            this._chardata[_loc1_].unused2 = 0;
            this._chardata[_loc1_].unlocked = false;
            this._chardata[_loc1_].highestScore = 0;
            this._chardata[_loc1_].highestStudsCollected = 0;
            this._chardata[_loc1_].highestDistanceTravelled = 0;
            _loc1_++;
         }
         this._chardata[ePlayerCharRangedBearSlot].unlocked = true;
         this._chardata[ePlayerCharMageCrocSlot].unlocked = true;
         this._chardata[ePlayerCharWarriorLionSlot].unlocked = true;
         this._chardata[ePlayerCharRangedSaberSlot].unlocked = true;
         this._chardata[ePlayerCharLavalSlot].upgradeLevel = 10;
         this._chardata[ePlayerCharLavalSlot].unlocked = true;
         this._chardata[ePlayerCharSirFangorSlot].upgradeLevel = 10;
         this._chardata[ePlayerCharSirFangorSlot].unlocked = true;
         this._bMusicEnabled = true;
         this._bSfxEnabled = true;
         this._languageCode = Language.getSystemLanguageCode();
         this._bPlayerGot50000StudsFirstTime = false;
         this._bPlayerGot100000StudsFirstTime = false;
         this._bPlayerGot500000StudsFirstTime = false;
         this._bPlayerGot1000000StudsFirstTime = false;
         this._bTutorialShown = false;
      }
      
      public function save() : void
      {
         var _loc2_:int = 0;
         var _loc3_:CharSaveData = null;
         this._so.data._uStudsCollected = this._uStudsCollected;
         this._so.data._bMusicEnabled = this._bMusicEnabled;
         this._so.data._bSfxEnabled = this._bSfxEnabled;
         this._so.data._languageCode = this._languageCode;
         this._so.data._bPlayerGot50000StudsFirstTime = this._bPlayerGot50000StudsFirstTime;
         this._so.data._bPlayerGot100000StudsFirstTime = this._bPlayerGot100000StudsFirstTime;
         this._so.data._bPlayerGot500000StudsFirstTime = this._bPlayerGot500000StudsFirstTime;
         this._so.data._bPlayerGot1000000StudsFirstTime = this._bPlayerGot1000000StudsFirstTime;
         this._so.data._bTutorialShown = this._bTutorialShown;
         var _loc1_:Vector.<CharSaveData> = new Vector.<CharSaveData>(NUM_PLAYER_CHAR_SAVE_SLOTS,true);
         _loc2_ = 0;
         while(_loc2_ < NUM_PLAYER_CHAR_SAVE_SLOTS)
         {
            _loc3_ = new CharSaveData();
            _loc3_.CreateFromCharData(this._chardata[_loc2_]);
            _loc1_[_loc2_] = _loc3_;
            _loc2_++;
         }
         this._so.data.aCharSaveData = _loc1_;
         this._so.flush();
      }
      
      public function getStudsCollected() : uint
      {
         return this._uStudsCollected;
      }
      
      public function addToStudsCollected(param1:uint) : void
      {
         this._uStudsCollected += param1;
         if(this._uStudsCollected > 50000 && !this._bPlayerGot50000StudsFirstTime)
         {
            this._bPlayerGot50000StudsFirstTime = true;
         }
         if(this._uStudsCollected > 100000 && !this._bPlayerGot100000StudsFirstTime)
         {
            this._bPlayerGot100000StudsFirstTime = true;
         }
         if(this._uStudsCollected > 500000 && !this._bPlayerGot500000StudsFirstTime)
         {
            this._bPlayerGot500000StudsFirstTime = true;
         }
         if(this._uStudsCollected > 1000000 && !this._bPlayerGot1000000StudsFirstTime)
         {
            this._bPlayerGot1000000StudsFirstTime = true;
         }
      }
      
      public function subtractFromStudsCollected(param1:uint) : void
      {
         if(this._uStudsCollected >= param1)
         {
            this._uStudsCollected -= param1;
         }
         else
         {
            this._uStudsCollected = 0;
         }
      }
      
      public function getCharSlot(param1:int) : CharData
      {
         if(param1 >= 0 && param1 < NUM_PLAYER_CHAR_SAVE_SLOTS)
         {
            return this._chardata[param1];
         }
         return null;
      }
   }
}
