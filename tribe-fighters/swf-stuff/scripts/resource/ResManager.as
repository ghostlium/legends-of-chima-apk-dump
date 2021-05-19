package resource
{
   import flash.utils.ByteArray;
   import starling.textures.Texture;
   import zufflin.core.SCG_Texture;
   
   public class ResManager
   {
      
      public static const kAssetSet_generalAssets:int = 0;
      
      public static const kAssetSet_levelAssets:int = 1;
      
      public static const kAssetSet_genericGameAssets:int = 2;
      
      public static const kAssetSet_firePlayerGameAssets:int = 3;
      
      public static const kAssetSet_icePlayerGameAssets:int = 4;
      
      public static const kAssetSet_uiAssets:int = 5;
      
      public static const kAssetSet_fontAssets:int = 6;
      
      public static const kAssetSet_MAX:int = 7;
       
      
      public function ResManager()
      {
         super();
      }
      
      public static function Initialise() : void
      {
         TextureResource.Initialise();
         TextureAtlasResource.Initialise();
         FontResource.Initialise();
         DataResource.Initialise();
      }
      
      public static function LoadAssetSetResources(param1:int) : void
      {
         DataResource.LoadAssetSetData(param1);
         TextureResource.LoadAssetSetTextures(param1);
         TextureAtlasResource.LoadAssetSetAtlases(param1);
         FontResource.LoadAssetSetFonts(param1);
      }
      
      public static function UnloadAssetSetResources(param1:int) : void
      {
         TextureResource.UnLoadAssetSetTextures(param1);
         TextureAtlasResource.UnLoadAssetSetAtlases(param1);
         FontResource.UnLoadAssetSetFonts(param1);
         DataResource.UnLoadAssetSetData(param1);
      }
      
      public static function GetFont(param1:String) : String
      {
         return FontResource.GetFont(param1);
      }
      
      public static function getTextureSimpleName(param1:String) : String
      {
         var _loc2_:String = param1.replace(".png","");
         var _loc3_:int = _loc2_.search("/");
         while(_loc3_ != -1)
         {
            _loc2_ = _loc2_.slice(_loc3_ + 1);
            _loc3_ = _loc2_.search("/");
         }
         return _loc2_;
      }
      
      public static function getTexture(param1:String) : SCG_Texture
      {
         var _loc3_:String = null;
         var _loc4_:Texture = null;
         var _loc5_:int = 0;
         var _loc2_:SCG_Texture = null;
         _loc3_ = param1.replace(".png","");
         _loc3_ = _loc3_.replace(".pvr","");
         while((_loc4_ = TextureAtlasResource.getTexture(_loc3_)) == null)
         {
            if((_loc4_ = TextureResource.getTexture(_loc3_)) != null)
            {
               return new SCG_Texture(_loc4_,getTextureSimpleName(param1));
            }
            if((_loc5_ = _loc3_.search("/")) == -1)
            {
               return null;
            }
            _loc3_ = _loc3_.slice(_loc5_ + 1);
         }
         return new SCG_Texture(_loc4_,getTextureSimpleName(param1));
      }
      
      public static function getData(param1:String) : ByteArray
      {
         var _loc3_:ByteArray = null;
         var _loc4_:int = 0;
         var _loc2_:String = param1;
         while(true)
         {
            _loc3_ = DataResource.getData(_loc2_);
            if(_loc3_ != null)
            {
               break;
            }
            if((_loc4_ = _loc2_.search("/")) == -1)
            {
               trace("MISSING DATA: " + param1);
               return null;
            }
            _loc2_ = _loc2_.slice(_loc4_ + 1);
         }
         return _loc3_;
      }
   }
}
