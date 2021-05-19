package resource
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import game.GameWorld;
   import starling.text.BitmapFont;
   import starling.text.TextField;
   import starling.textures.Texture;
   
   public class FontResource
   {
      
      public static const Arial_Unicode_32pt_Chin_FNT:Class = FontResource_Arial_Unicode_32pt_Chin_FNT;
      
      public static const Arial_Unicode_32pt_Chin_PNG:Class = FontResource_Arial_Unicode_32pt_Chin_PNG;
      
      public static const Arial_Unicode_24pt_Chin_FNT:Class = FontResource_Arial_Unicode_24pt_Chin_FNT;
      
      public static const Arial_Unicode_24pt_Chin_PNG:Class = FontResource_Arial_Unicode_24pt_Chin_PNG;
      
      public static const Arial_Unicode_32pt_Euro_FNT:Class = FontResource_Arial_Unicode_32pt_Euro_FNT;
      
      public static const Arial_Unicode_32pt_Euro_PNG:Class = FontResource_Arial_Unicode_32pt_Euro_PNG;
      
      public static const Arial_Unicode_24pt_Euro_FNT:Class = FontResource_Arial_Unicode_24pt_Euro_FNT;
      
      public static const Arial_Unicode_24pt_Euro_PNG:Class = FontResource_Arial_Unicode_24pt_Euro_PNG;
      
      public static const Arial_Unicode_32pt_Jap_FNT:Class = FontResource_Arial_Unicode_32pt_Jap_FNT;
      
      public static const Arial_Unicode_32pt_Jap_PNG:Class = FontResource_Arial_Unicode_32pt_Jap_PNG;
      
      public static const Arial_Unicode_24pt_Jap_FNT:Class = FontResource_Arial_Unicode_24pt_Jap_FNT;
      
      public static const Arial_Unicode_24pt_Jap_PNG:Class = FontResource_Arial_Unicode_24pt_Jap_PNG;
      
      public static const Arial_Unicode_32pt_Kor_FNT:Class = FontResource_Arial_Unicode_32pt_Kor_FNT;
      
      public static const Arial_Unicode_32pt_Kor_PNG:Class = FontResource_Arial_Unicode_32pt_Kor_PNG;
      
      public static const Arial_Unicode_24pt_Kor_FNT:Class = FontResource_Arial_Unicode_24pt_Kor_FNT;
      
      public static const Arial_Unicode_24pt_Kor_PNG:Class = FontResource_Arial_Unicode_24pt_Kor_PNG;
      
      public static const Arial_Unicode_32pt_Rus_FNT:Class = FontResource_Arial_Unicode_32pt_Rus_FNT;
      
      public static const Arial_Unicode_32pt_Rus_PNG:Class = FontResource_Arial_Unicode_32pt_Rus_PNG;
      
      public static const Arial_Unicode_24pt_Rus_FNT:Class = FontResource_Arial_Unicode_24pt_Rus_FNT;
      
      public static const Arial_Unicode_24pt_Rus_PNG:Class = FontResource_Arial_Unicode_24pt_Rus_PNG;
      
      private static var _ModeFontNames:Dictionary;
       
      
      public function FontResource()
      {
         super();
      }
      
      public static function Initialise() : void
      {
         _ModeFontNames = new Dictionary();
      }
      
      public static function GetFont(param1:String) : String
      {
         return _ModeFontNames[param1];
      }
      
      public static function LoadAssetSetFonts(param1:int) : void
      {
         var _loc2_:Texture = null;
         var _loc3_:ByteArray = null;
         var _loc4_:String = null;
         if(param1 == ResManager.kAssetSet_fontAssets)
         {
            switch(GameWorld.get().getLanguage().getCurrLangCode())
            {
               case "ko":
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_32pt_Kor_PNG());
                  _loc3_ = new Arial_Unicode_32pt_Kor_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_32pt_Kor.fnt"] = "Arial32";
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_24pt_Kor_PNG());
                  _loc3_ = new Arial_Unicode_24pt_Kor_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_24pt_Kor.fnt"] = "Arial24";
                  TextField.getBitmapFont("Arial32").m_bSplitAnywhere = true;
                  TextField.getBitmapFont("Arial24").m_bSplitAnywhere = true;
                  break;
               case "zh":
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_32pt_Chin_PNG());
                  _loc3_ = new Arial_Unicode_32pt_Chin_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_32pt_Chin.fnt"] = "Arial32";
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_24pt_Chin_PNG());
                  _loc3_ = new Arial_Unicode_24pt_Chin_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_24pt_Chin.fnt"] = "Arial24";
                  TextField.getBitmapFont("Arial32").m_bSplitAnywhere = true;
                  TextField.getBitmapFont("Arial24").m_bSplitAnywhere = true;
                  break;
               case "ja":
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_32pt_Jap_PNG());
                  _loc3_ = new Arial_Unicode_32pt_Jap_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_32pt_Jap.fnt"] = "Arial32";
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_24pt_Jap_PNG());
                  _loc3_ = new Arial_Unicode_24pt_Jap_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_24pt_Jap.fnt"] = "Arial24";
                  TextField.getBitmapFont("Arial32").m_bSplitAnywhere = true;
                  TextField.getBitmapFont("Arial24").m_bSplitAnywhere = true;
                  break;
               case "ru":
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_32pt_Rus_PNG());
                  _loc3_ = new Arial_Unicode_32pt_Rus_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_32pt_Rus.fnt"] = "Arial32";
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_24pt_Rus_PNG());
                  _loc3_ = new Arial_Unicode_24pt_Rus_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_24pt_Rus.fnt"] = "Arial24";
                  TextField.getBitmapFont("Arial32").m_bSplitAnywhere = false;
                  TextField.getBitmapFont("Arial24").m_bSplitAnywhere = false;
                  break;
               default:
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_32pt_Euro_PNG());
                  _loc3_ = new Arial_Unicode_32pt_Euro_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_32pt_Euro.fnt"] = "Arial32";
                  _loc2_ = Texture.fromBitmap(new Arial_Unicode_24pt_Euro_PNG());
                  _loc3_ = new Arial_Unicode_24pt_Euro_FNT() as ByteArray;
                  _loc4_ = initBitmapFont(_loc3_,_loc2_);
                  _ModeFontNames["res/fonts/Arial_Unicode_24pt_Euro.fnt"] = "Arial24";
                  TextField.getBitmapFont("Arial32").m_bSplitAnywhere = false;
                  TextField.getBitmapFont("Arial24").m_bSplitAnywhere = false;
            }
         }
      }
      
      public static function UnLoadAssetSetFonts(param1:int) : void
      {
         var _loc2_:String = null;
         if(param1 == ResManager.kAssetSet_fontAssets)
         {
            for each(_loc2_ in _ModeFontNames)
            {
               TextField.unregisterBitmapFont(_loc2_,true);
            }
            _ModeFontNames = new Dictionary();
         }
      }
      
      private static function readTokenName(param1:String, param2:int) : String
      {
         var _loc5_:int = 0;
         var _loc3_:String = null;
         var _loc4_:int;
         if((_loc4_ = param1.indexOf("=",param2)) != -1)
         {
            if((_loc5_ = param1.indexOf(" ",param2)) > 0 && _loc5_ < _loc4_)
            {
               return _loc3_;
            }
            _loc3_ = param1.substr(param2,_loc4_ - param2);
         }
         return _loc3_;
      }
      
      private static function readTokenValue(param1:String, param2:int) : String
      {
         var _loc3_:String = null;
         var _loc4_:int;
         if((_loc4_ = param1.indexOf(" ",param2)) != -1)
         {
            _loc3_ = param1.substr(param2,_loc4_ - param2);
         }
         return _loc3_;
      }
      
      private static function readSectionName(param1:String, param2:int) : String
      {
         var _loc5_:int = 0;
         var _loc3_:String = null;
         var _loc4_:int;
         if((_loc4_ = param1.indexOf(" ",param2)) != -1)
         {
            if((_loc5_ = param1.indexOf("=",param2)) > 0 && _loc5_ < _loc4_)
            {
               return _loc3_;
            }
            _loc3_ = param1.substr(param2,_loc4_ - param2);
         }
         return _loc3_;
      }
      
      private static function initBitmapFont(param1:ByteArray, param2:Texture) : String
      {
         var _loc6_:XML = null;
         var _loc7_:XML = null;
         var _loc11_:String = null;
         var _loc12_:XML = null;
         var _loc13_:String = null;
         var _loc14_:String = null;
         var _loc3_:String = param1.readUTFBytes(param1.bytesAvailable);
         _loc3_ = _loc3_.replace(/[\r\n\b ]+/g," ");
         var _loc4_:XML = <font></font>;
         var _loc5_:XML = <pages></pages>;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         while(_loc8_ < _loc3_.length)
         {
            _loc11_ = readSectionName(_loc3_,_loc8_);
            _loc8_ += _loc11_.length + 1;
            _loc12_ = new XML("<" + _loc11_ + "></" + _loc11_ + ">");
            _loc13_ = readTokenName(_loc3_,_loc8_);
            while(_loc13_ != null)
            {
               _loc8_ += _loc13_.length + 1;
               _loc14_ = readTokenValue(_loc3_,_loc8_);
               _loc8_ += _loc14_.length + 1;
               _loc14_ = _loc14_.replace(/"/g,"");
               _loc12_[_loc13_] = _loc14_;
               _loc13_ = readTokenName(_loc3_,_loc8_);
            }
            if(_loc11_ == "chars")
            {
               _loc6_ = _loc12_;
            }
            else if(_loc11_ == "char")
            {
               _loc6_.appendChild(_loc12_);
            }
            else if(_loc11_ == "kernings")
            {
               _loc7_ = _loc12_;
            }
            else if(_loc11_ == "kerning")
            {
               _loc9_++;
               _loc7_.appendChild(_loc12_);
            }
            else if(_loc11_ == "page")
            {
               _loc5_.appendChild(_loc12_);
               _loc4_.appendChild(_loc5_);
            }
            else
            {
               _loc4_.appendChild(_loc12_);
            }
         }
         _loc4_.appendChild(_loc6_);
         _loc4_.appendChild(_loc7_);
         var _loc10_:String = _loc4_.info.@face;
         TextField.registerBitmapFont(new BitmapFont(param2,_loc4_));
         return _loc10_;
      }
   }
}
