package resource
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import starling.textures.Texture;
   
   public class TextureResource
   {
      
      public static const chima_cave_fire_beginnewer:Class = TextureResource_chima_cave_fire_beginnewer;
      
      public static const chima_cave_fire_endnewer:Class = TextureResource_chima_cave_fire_endnewer;
      
      public static const chima_cave_frost_overlay:Class = TextureResource_chima_cave_frost_overlay;
      
      public static const chima_cave_grass_beginnewer:Class = TextureResource_chima_cave_grass_beginnewer;
      
      public static const chima_cave_grass_endnewer:Class = TextureResource_chima_cave_grass_endnewer;
      
      public static const chima_cave_snow_beginnewer:Class = TextureResource_chima_cave_snow_beginnewer;
      
      public static const chima_cave_snow_endnewer:Class = TextureResource_chima_cave_snow_endnewer;
      
      public static const chima_grass_end_04:Class = TextureResource_chima_grass_end_04;
      
      public static const chima_ice5_02:Class = TextureResource_chima_ice5_02;
      
      public static const chima_snow_end_01:Class = TextureResource_chima_snow_end_01;
      
      public static const new_chima_fire1:Class = TextureResource_new_chima_fire1;
      
      public static const new_chima_fire_grass_begin:Class = TextureResource_new_chima_fire_grass_begin;
      
      public static const new_chima_fire_grass_end:Class = TextureResource_new_chima_fire_grass_end;
      
      public static const new_chima_fire_snow_begin:Class = TextureResource_new_chima_fire_snow_begin;
      
      public static const new_chima_fire_snow_end:Class = TextureResource_new_chima_fire_snow_end;
      
      public static const new_chima_forest4_02:Class = TextureResource_new_chima_forest4_02;
      
      public static const new_chima_forest4_03:Class = TextureResource_new_chima_forest4_03;
      
      private static const LightningBlue:Class = TextureResource_LightningBlue;
      
      private static const LightningOrange:Class = TextureResource_LightningOrange;
      
      private static const Play1:Class = TextureResource_Play1;
      
      private static const Frame_Bottom:Class = TextureResource_Frame_Bottom;
      
      private static const Frame_Top:Class = TextureResource_Frame_Top;
      
      private static var _aDictionaries:Vector.<Dictionary>;
       
      
      public function TextureResource()
      {
         super();
      }
      
      public static function Initialise() : void
      {
         _aDictionaries = new Vector.<Dictionary>(ResManager.kAssetSet_MAX,true);
         var _loc1_:int = 0;
         while(_loc1_ < ResManager.kAssetSet_MAX)
         {
            _aDictionaries[_loc1_] = new Dictionary();
            _loc1_++;
         }
      }
      
      public static function LoadAssetSetTextures(param1:int) : void
      {
         var _loc3_:ByteArray = null;
         var _loc4_:Texture = null;
         var _loc2_:Dictionary = _aDictionaries[param1];
         switch(param1)
         {
            case ResManager.kAssetSet_generalAssets:
               break;
            case ResManager.kAssetSet_levelAssets:
               _loc3_ = new chima_cave_fire_beginnewer();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-cave-fire-beginnewer"] = _loc4_;
               _loc3_ = new chima_cave_fire_endnewer();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-cave-fire-endnewer"] = _loc4_;
               _loc3_ = new chima_cave_frost_overlay();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-cave-frost-overlay"] = _loc4_;
               _loc3_ = new chima_cave_grass_beginnewer();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-cave-grass-beginnewer"] = _loc4_;
               _loc3_ = new chima_cave_grass_endnewer();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-cave-grass-endnewer"] = _loc4_;
               _loc3_ = new chima_cave_snow_beginnewer();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-cave-snow-beginnewer"] = _loc4_;
               _loc3_ = new chima_cave_snow_endnewer();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-cave-snow-endnewer"] = _loc4_;
               _loc3_ = new chima_grass_end_04();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-grass-end_04"] = _loc4_;
               _loc3_ = new chima_ice5_02();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-ice5_02"] = _loc4_;
               _loc3_ = new chima_snow_end_01();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/chima-snow-end_01"] = _loc4_;
               _loc3_ = new new_chima_fire1();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/new-chima-fire1"] = _loc4_;
               _loc3_ = new new_chima_fire_grass_begin();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/new-chima-fire-grass-begin"] = _loc4_;
               _loc3_ = new new_chima_fire_grass_end();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/new-chima-fire-grass-end"] = _loc4_;
               _loc3_ = new new_chima_fire_snow_begin();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/new-chima-fire-snow-begin"] = _loc4_;
               _loc3_ = new new_chima_fire_snow_end();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/new-chima-fire-snow-end"] = _loc4_;
               _loc3_ = new new_chima_forest4_02();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/new-chima-forest4_02"] = _loc4_;
               _loc3_ = new new_chima_forest4_03();
               _loc4_ = Texture.fromAtfData(_loc3_,1,false);
               _loc2_["levels/new-chima-forest4_03"] = _loc4_;
               break;
            case ResManager.kAssetSet_genericGameAssets:
               _loc4_ = Texture.fromBitmap(new LightningOrange(),false,false,1,"bgra",true);
               _loc2_["fx/lightning_Orange"] = _loc4_;
               _loc4_ = Texture.fromBitmap(new LightningBlue(),false,false,1,"bgra",true);
               _loc2_["fx/lightning_Blue"] = _loc4_;
               break;
            case ResManager.kAssetSet_firePlayerGameAssets:
               break;
            case ResManager.kAssetSet_icePlayerGameAssets:
               break;
            case ResManager.kAssetSet_uiAssets:
               _loc4_ = Texture.fromBitmap(new Play1(),true,false,1,"bgra");
               _loc2_["Play_1"] = _loc4_;
               _loc4_ = Texture.fromBitmap(new Frame_Bottom(),false,false,525 / 768,"bgra");
               _loc2_["Frame_Bottom"] = _loc4_;
               _loc4_ = Texture.fromBitmap(new Frame_Top(),false,false,525 / 768,"bgra");
               _loc2_["Frame_Top"] = _loc4_;
               Frame_Top;
               break;
            case ResManager.kAssetSet_fontAssets:
         }
      }
      
      public static function UnLoadAssetSetTextures(param1:int) : void
      {
         var _loc3_:Texture = null;
         var _loc2_:Dictionary = _aDictionaries[param1];
         for each(_loc3_ in _loc2_)
         {
            _loc3_.dispose();
         }
         _aDictionaries[param1] = new Dictionary();
      }
      
      public static function getTexture(param1:String) : Texture
      {
         var _loc2_:Texture = null;
         var _loc3_:Dictionary = null;
         for each(_loc3_ in _aDictionaries)
         {
            _loc2_ = _loc3_[param1];
            if(_loc2_ != null)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
