package game
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import game.control.CobraText;
   import game.objects.events.EventLanguageChanged;
   import resource.ResManager;
   
   public class Language
   {
       
      
      public var _currLangCode:String;
      
      public var _languageStrings:Dictionary;
      
      public function Language()
      {
         super();
         this._currLangCode = "";
         this._languageStrings = new Dictionary();
         this.load(GameWorld.get().getSaveData().getLanguageCode());
      }
      
      public static function getSystemLanguageCode() : String
      {
         var _loc1_:int = LegoChima.gsiLanguage;
         var _loc2_:String = "en";
         switch(_loc1_)
         {
            case CobraText.Z_LANG_ENGLISH_UK:
               _loc2_ = "en";
               break;
            case CobraText.Z_LANG_ENGLISH_US:
               _loc2_ = "en";
               break;
            case CobraText.Z_LANG_FRENCH:
               _loc2_ = "fr";
               break;
            case CobraText.Z_LANG_GERMAN:
               _loc2_ = "de";
               break;
            case CobraText.Z_LANG_ITALIAN:
               _loc2_ = "it";
               break;
            case CobraText.Z_LANG_SPANISH:
               _loc2_ = "es";
               break;
            case CobraText.Z_LANG_CHINESE_SIMPLIFIED:
               _loc2_ = "zh";
               break;
            case CobraText.Z_LANG_CHINESE_TRADITIONAL:
               _loc2_ = "zh";
               break;
            case CobraText.Z_LANG_JAPANESE:
               _loc2_ = "ja";
               break;
            case CobraText.Z_LANG_KOREAN:
               _loc2_ = "ko";
               break;
            case CobraText.Z_LANG_ARABIC:
               _loc2_ = "ar";
               break;
            case CobraText.Z_LANG_CATALAN:
               _loc2_ = "ca";
               break;
            case CobraText.Z_LANG_CROATIAN:
               _loc2_ = "hr";
               break;
            case CobraText.Z_LANG_CZECH:
               _loc2_ = "cs";
               break;
            case CobraText.Z_LANG_DANISH:
               _loc2_ = "da";
               break;
            case CobraText.Z_LANG_DUTCH:
               _loc2_ = "nl";
               break;
            case CobraText.Z_LANG_FINNISH:
               _loc2_ = "fi";
               break;
            case CobraText.Z_LANG_GREEK:
               _loc2_ = "el";
               break;
            case CobraText.Z_LANG_HEBREW:
               _loc2_ = "he";
               break;
            case CobraText.Z_LANG_HUNGARIAN:
               _loc2_ = "hu";
               break;
            case CobraText.Z_LANG_INDONESIAN:
               _loc2_ = "id";
               break;
            case CobraText.Z_LANG_MALAY:
               _loc2_ = "ms";
               break;
            case CobraText.Z_LANG_NORWEGIAN:
               _loc2_ = "no";
               break;
            case CobraText.Z_LANG_POLISH:
               _loc2_ = "pl";
               break;
            case CobraText.Z_LANG_PORTUGUESE:
               _loc2_ = "pt";
               break;
            case CobraText.Z_LANG_PORTUGUESE_BRAZIL:
               _loc2_ = "pt";
               break;
            case CobraText.Z_LANG_ROMANIAN:
               _loc2_ = "ro";
               break;
            case CobraText.Z_LANG_RUSSIAN:
               _loc2_ = "ru";
               break;
            case CobraText.Z_LANG_SLOVAK:
               _loc2_ = "sk";
               break;
            case CobraText.Z_LANG_SWEDISH:
               _loc2_ = "sv";
               break;
            case CobraText.Z_LANG_THAI:
               _loc2_ = "th";
               break;
            case CobraText.Z_LANG_TURKISH:
               _loc2_ = "tr";
               break;
            case CobraText.Z_LANG_UKRAINIAN:
               _loc2_ = "uk";
               break;
            case CobraText.Z_LANG_VIETNAMESE:
               _loc2_ = "vi";
               break;
            default:
               _loc2_ = "en";
         }
         return _loc2_;
      }
      
      public function getCurrLangCode() : String
      {
         return this._currLangCode;
      }
      
      private function reviver(param1:Object, param2:Object) : Object
      {
         if(param1 is String && param2 is String)
         {
            this._languageStrings[param1 as String] = this.fixString(param2 as String);
         }
         return param2;
      }
      
      public function load(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:ByteArray = null;
         var _loc4_:String = null;
         var _loc5_:Object = null;
         if(this.exists(param1))
         {
            _loc2_ = this.getLanguageFilename(param1);
            _loc3_ = ResManager.getData(_loc2_);
            _loc4_ = _loc3_.toString();
            _loc5_ = JSON.parse(_loc4_,this.reviver);
            if(this._currLangCode != "")
            {
               this._currLangCode = param1;
               GameRes.get().loadFonts();
            }
            else
            {
               this._currLangCode = param1;
            }
            Main.Instance().m_app.dispatchEvent(new EventLanguageChanged(EventLanguageChanged.EVENT_LANGUAGE_CHANGED,false,this._currLangCode));
         }
      }
      
      public function exists(param1:String) : Boolean
      {
         return true;
      }
      
      public function getLanguageFilename(param1:String) : String
      {
         return "res/cfg/languages/lang_" + param1 + ".zdf";
      }
      
      public function fixString(param1:String) : String
      {
         return param1;
      }
      
      public function dumpStrings() : void
      {
      }
      
      public function getString(param1:String) : String
      {
         var _loc2_:String = this._languageStrings[param1];
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return this._currLangCode + ":" + param1;
      }
      
      public function isNoSpaceLanguage() : Boolean
      {
         if(this._currLangCode == "ja" || this._currLangCode == "ko" || this._currLangCode == "zh")
         {
            return true;
         }
         return false;
      }
   }
}
