package resource
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import starling.textures.Texture;
   import starling.textures.TextureAtlas;
   
   public class TextureAtlasResource
   {
      
      public static const level_overlays_XML:Class = TextureAtlasResource_level_overlays_XML;
      
      public static const level_overlays_ATF:Class = TextureAtlasResource_level_overlays_ATF;
      
      public static const level_overlayShadows_XML:Class = TextureAtlasResource_level_overlayShadows_XML;
      
      public static const level_overlayShadows_ATF:Class = TextureAtlasResource_level_overlayShadows_ATF;
      
      public static const projectiles_XML:Class = TextureAtlasResource_projectiles_XML;
      
      public static const projectiles_ATF:Class = TextureAtlasResource_projectiles_ATF;
      
      public static const pickups_XML:Class = TextureAtlasResource_pickups_XML;
      
      public static const pickups_ATF:Class = TextureAtlasResource_pickups_ATF;
      
      public static const fx_XML:Class = TextureAtlasResource_fx_XML;
      
      public static const fx_ATF:Class = TextureAtlasResource_fx_ATF;
      
      public static const flags_bear_XML:Class = TextureAtlasResource_flags_bear_XML;
      
      public static const flags_bear_ATF:Class = TextureAtlasResource_flags_bear_ATF;
      
      public static const flags_croc_XML:Class = TextureAtlasResource_flags_croc_XML;
      
      public static const flags_croc_ATF:Class = TextureAtlasResource_flags_croc_ATF;
      
      public static const flags_lion_XML:Class = TextureAtlasResource_flags_lion_XML;
      
      public static const flags_lion_ATF:Class = TextureAtlasResource_flags_lion_ATF;
      
      public static const flags_saber_XML:Class = TextureAtlasResource_flags_saber_XML;
      
      public static const flags_saber_ATF:Class = TextureAtlasResource_flags_saber_ATF;
      
      public static const ui_XML:Class = TextureAtlasResource_ui_XML;
      
      public static const ui_ATF:Class = TextureAtlasResource_ui_ATF;
      
      public static const ui_fe_XML:Class = TextureAtlasResource_ui_fe_XML;
      
      public static const ui_fe_ATF:Class = TextureAtlasResource_ui_fe_ATF;
      
      public static const ui_pause_XML:Class = TextureAtlasResource_ui_pause_XML;
      
      public static const ui_pause_ATF:Class = TextureAtlasResource_ui_pause_ATF;
      
      public static const ui_portraits_XML:Class = TextureAtlasResource_ui_portraits_XML;
      
      public static const ui_portraits_ATF:Class = TextureAtlasResource_ui_portraits_ATF;
      
      public static const chars_en_static_bear_XML:Class = TextureAtlasResource_chars_en_static_bear_XML;
      
      public static const chars_en_static_bear_ATF:Class = TextureAtlasResource_chars_en_static_bear_ATF;
      
      public static const chars_en_static_saber_XML:Class = TextureAtlasResource_chars_en_static_saber_XML;
      
      public static const chars_en_static_saber_ATF:Class = TextureAtlasResource_chars_en_static_saber_ATF;
      
      public static const chars_env_cave_XML:Class = TextureAtlasResource_chars_env_cave_XML;
      
      public static const chars_env_cave_ATF:Class = TextureAtlasResource_chars_env_cave_ATF;
      
      public static const chars_env_orbs_fire_XML:Class = TextureAtlasResource_chars_env_orbs_fire_XML;
      
      public static const chars_env_orbs_fire_ATF:Class = TextureAtlasResource_chars_env_orbs_fire_ATF;
      
      public static const chars_env_ice_XML:Class = TextureAtlasResource_chars_env_ice_XML;
      
      public static const chars_env_ice_ATF:Class = TextureAtlasResource_chars_env_ice_ATF;
      
      public static const chars_en_fire_0_XML:Class = TextureAtlasResource_chars_en_fire_0_XML;
      
      public static const chars_en_fire_0_ATF:Class = TextureAtlasResource_chars_en_fire_0_ATF;
      
      public static const chars_en_fire_1_XML:Class = TextureAtlasResource_chars_en_fire_1_XML;
      
      public static const chars_en_fire_1_ATF:Class = TextureAtlasResource_chars_en_fire_1_ATF;
      
      public static const chars_en_fire_2_XML:Class = TextureAtlasResource_chars_en_fire_2_XML;
      
      public static const chars_en_fire_2_ATF:Class = TextureAtlasResource_chars_en_fire_2_ATF;
      
      public static const chars_en_fire_3_XML:Class = TextureAtlasResource_chars_en_fire_3_XML;
      
      public static const chars_en_fire_3_ATF:Class = TextureAtlasResource_chars_en_fire_3_ATF;
      
      public static const chars_en_fire_4_XML:Class = TextureAtlasResource_chars_en_fire_4_XML;
      
      public static const chars_en_fire_4_ATF:Class = TextureAtlasResource_chars_en_fire_4_ATF;
      
      public static const chars_en_fire_5_XML:Class = TextureAtlasResource_chars_en_fire_5_XML;
      
      public static const chars_en_fire_5_ATF:Class = TextureAtlasResource_chars_en_fire_5_ATF;
      
      public static const chars_en_fire_6_XML:Class = TextureAtlasResource_chars_en_fire_6_XML;
      
      public static const chars_en_fire_6_ATF:Class = TextureAtlasResource_chars_en_fire_6_ATF;
      
      public static const chars_en_fire_7_XML:Class = TextureAtlasResource_chars_en_fire_7_XML;
      
      public static const chars_en_fire_7_ATF:Class = TextureAtlasResource_chars_en_fire_7_ATF;
      
      public static const chars_en_fire_8_XML:Class = TextureAtlasResource_chars_en_fire_8_XML;
      
      public static const chars_en_fire_8_ATF:Class = TextureAtlasResource_chars_en_fire_8_ATF;
      
      public static const chars_en_fire_9_XML:Class = TextureAtlasResource_chars_en_fire_9_XML;
      
      public static const chars_en_fire_9_ATF:Class = TextureAtlasResource_chars_en_fire_9_ATF;
      
      public static const chars_en_fire_10_XML:Class = TextureAtlasResource_chars_en_fire_10_XML;
      
      public static const chars_en_fire_10_ATF:Class = TextureAtlasResource_chars_en_fire_10_ATF;
      
      public static const chars_en_fire_11_XML:Class = TextureAtlasResource_chars_en_fire_11_XML;
      
      public static const chars_en_fire_11_ATF:Class = TextureAtlasResource_chars_en_fire_11_ATF;
      
      public static const chars_en_fire_12_XML:Class = TextureAtlasResource_chars_en_fire_12_XML;
      
      public static const chars_en_fire_12_ATF:Class = TextureAtlasResource_chars_en_fire_12_ATF;
      
      public static const chars_env_jungle_XML:Class = TextureAtlasResource_chars_env_jungle_XML;
      
      public static const chars_env_jungle_ATF:Class = TextureAtlasResource_chars_env_jungle_ATF;
      
      public static const chars_env_fire_XML:Class = TextureAtlasResource_chars_env_fire_XML;
      
      public static const chars_env_fire_ATF:Class = TextureAtlasResource_chars_env_fire_ATF;
      
      public static const chars_en_fire_debris_XML:Class = TextureAtlasResource_chars_en_fire_debris_XML;
      
      public static const chars_en_fire_debris_ATF:Class = TextureAtlasResource_chars_en_fire_debris_ATF;
      
      public static const chars_player_fire_0_XML:Class = TextureAtlasResource_chars_player_fire_0_XML;
      
      public static const chars_player_fire_0_ATF:Class = TextureAtlasResource_chars_player_fire_0_ATF;
      
      public static const chars_player_fire_1_XML:Class = TextureAtlasResource_chars_player_fire_1_XML;
      
      public static const chars_player_fire_1_ATF:Class = TextureAtlasResource_chars_player_fire_1_ATF;
      
      public static const chars_player_fire_2_XML:Class = TextureAtlasResource_chars_player_fire_2_XML;
      
      public static const chars_player_fire_2_ATF:Class = TextureAtlasResource_chars_player_fire_2_ATF;
      
      public static const chars_player_fire_debris_XML:Class = TextureAtlasResource_chars_player_fire_debris_XML;
      
      public static const chars_player_fire_debris_ATF:Class = TextureAtlasResource_chars_player_fire_debris_ATF;
      
      public static const chars_en_static_croc_XML:Class = TextureAtlasResource_chars_en_static_croc_XML;
      
      public static const chars_en_static_croc_ATF:Class = TextureAtlasResource_chars_en_static_croc_ATF;
      
      public static const chars_en_static_lion_XML:Class = TextureAtlasResource_chars_en_static_lion_XML;
      
      public static const chars_en_static_lion_ATF:Class = TextureAtlasResource_chars_en_static_lion_ATF;
      
      public static const chars_env_orbs_ice_XML:Class = TextureAtlasResource_chars_env_orbs_ice_XML;
      
      public static const chars_env_orbs_ice_ATF:Class = TextureAtlasResource_chars_env_orbs_ice_ATF;
      
      public static const chars_en_ice_debris_XML:Class = TextureAtlasResource_chars_en_ice_debris_XML;
      
      public static const chars_en_ice_debris_ATF:Class = TextureAtlasResource_chars_en_ice_debris_ATF;
      
      public static const chars_en_ice_0_XML:Class = TextureAtlasResource_chars_en_ice_0_XML;
      
      public static const chars_en_ice_0_ATF:Class = TextureAtlasResource_chars_en_ice_0_ATF;
      
      public static const chars_en_ice_1_XML:Class = TextureAtlasResource_chars_en_ice_1_XML;
      
      public static const chars_en_ice_1_ATF:Class = TextureAtlasResource_chars_en_ice_1_ATF;
      
      public static const chars_en_ice_2_XML:Class = TextureAtlasResource_chars_en_ice_2_XML;
      
      public static const chars_en_ice_2_ATF:Class = TextureAtlasResource_chars_en_ice_2_ATF;
      
      public static const chars_en_ice_3_XML:Class = TextureAtlasResource_chars_en_ice_3_XML;
      
      public static const chars_en_ice_3_ATF:Class = TextureAtlasResource_chars_en_ice_3_ATF;
      
      public static const chars_en_ice_4_XML:Class = TextureAtlasResource_chars_en_ice_4_XML;
      
      public static const chars_en_ice_4_ATF:Class = TextureAtlasResource_chars_en_ice_4_ATF;
      
      public static const chars_en_ice_5_XML:Class = TextureAtlasResource_chars_en_ice_5_XML;
      
      public static const chars_en_ice_5_ATF:Class = TextureAtlasResource_chars_en_ice_5_ATF;
      
      public static const chars_en_ice_6_XML:Class = TextureAtlasResource_chars_en_ice_6_XML;
      
      public static const chars_en_ice_6_ATF:Class = TextureAtlasResource_chars_en_ice_6_ATF;
      
      public static const chars_en_ice_7_XML:Class = TextureAtlasResource_chars_en_ice_7_XML;
      
      public static const chars_en_ice_7_ATF:Class = TextureAtlasResource_chars_en_ice_7_ATF;
      
      public static const chars_en_ice_8_XML:Class = TextureAtlasResource_chars_en_ice_8_XML;
      
      public static const chars_en_ice_8_ATF:Class = TextureAtlasResource_chars_en_ice_8_ATF;
      
      public static const chars_player_ice_0_XML:Class = TextureAtlasResource_chars_player_ice_0_XML;
      
      public static const chars_player_ice_0_ATF:Class = TextureAtlasResource_chars_player_ice_0_ATF;
      
      public static const chars_player_ice_1_XML:Class = TextureAtlasResource_chars_player_ice_1_XML;
      
      public static const chars_player_ice_1_ATF:Class = TextureAtlasResource_chars_player_ice_1_ATF;
      
      public static const chars_player_ice_2_XML:Class = TextureAtlasResource_chars_player_ice_2_XML;
      
      public static const chars_player_ice_2_ATF:Class = TextureAtlasResource_chars_player_ice_2_ATF;
      
      public static const chars_player_ice_debris_XML:Class = TextureAtlasResource_chars_player_ice_debris_XML;
      
      public static const chars_player_ice_debris_ATF:Class = TextureAtlasResource_chars_player_ice_debris_ATF;
      
      private static var _aDictionaries:Vector.<Dictionary>;
       
      
      public function TextureAtlasResource()
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
      
      public static function LoadAssetSetAtlases(param1:int) : void
      {
         var _loc3_:Texture = null;
         var _loc4_:XML = null;
         var _loc5_:TextureAtlas = null;
         var _loc6_:ByteArray = null;
         var _loc2_:Dictionary = _aDictionaries[param1];
         switch(param1)
         {
            case ResManager.kAssetSet_generalAssets:
               break;
            case ResManager.kAssetSet_levelAssets:
               _loc6_ = new level_overlays_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new level_overlays_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["level_overlays"] = _loc5_;
               _loc6_ = new level_overlayShadows_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new level_overlayShadows_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["level_overlayShadows"] = _loc5_;
               break;
            case ResManager.kAssetSet_genericGameAssets:
               _loc6_ = new projectiles_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new projectiles_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["projectiles"] = _loc5_;
               _loc6_ = new pickups_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new pickups_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["pickups"] = _loc5_;
               _loc6_ = new fx_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new fx_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["fx"] = _loc5_;
               _loc6_ = new flags_bear_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new flags_bear_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["flags_bear"] = _loc5_;
               _loc6_ = new flags_croc_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new flags_croc_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["flags_croc"] = _loc5_;
               _loc6_ = new flags_lion_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new flags_lion_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["flags_lion"] = _loc5_;
               _loc6_ = new flags_saber_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new flags_saber_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["flags_saber"] = _loc5_;
               break;
            case ResManager.kAssetSet_firePlayerGameAssets:
               _loc6_ = new chars_en_static_bear_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_static_bear_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_static_bear"] = _loc5_;
               _loc6_ = new chars_en_static_saber_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_static_saber_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_static_saber"] = _loc5_;
               _loc6_ = new chars_env_cave_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_cave_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_cave"] = _loc5_;
               _loc6_ = new chars_env_orbs_fire_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_orbs_fire_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_orbs_fire"] = _loc5_;
               _loc6_ = new chars_env_ice_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_ice_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_ice"] = _loc5_;
               _loc6_ = new chars_env_jungle_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_jungle_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_jungle"] = _loc5_;
               _loc6_ = new chars_env_fire_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_fire_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_fire"] = _loc5_;
               _loc6_ = new chars_en_fire_0_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_0_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_0"] = _loc5_;
               _loc6_ = new chars_en_fire_1_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_1_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_1"] = _loc5_;
               _loc6_ = new chars_en_fire_2_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_2_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_2"] = _loc5_;
               _loc6_ = new chars_en_fire_3_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_3_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_3"] = _loc5_;
               _loc6_ = new chars_en_fire_4_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_4_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_4"] = _loc5_;
               _loc6_ = new chars_en_fire_5_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_5_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_5"] = _loc5_;
               _loc6_ = new chars_en_fire_6_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_6_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_6"] = _loc5_;
               _loc6_ = new chars_en_fire_7_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_7_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_7"] = _loc5_;
               _loc6_ = new chars_en_fire_8_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_8_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_8"] = _loc5_;
               _loc6_ = new chars_en_fire_9_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_9_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_9"] = _loc5_;
               _loc6_ = new chars_en_fire_10_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_10_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_10"] = _loc5_;
               _loc6_ = new chars_en_fire_11_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_11_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_11"] = _loc5_;
               _loc6_ = new chars_en_fire_12_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_12_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_12"] = _loc5_;
               _loc6_ = new chars_player_fire_0_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_player_fire_0_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_player_fire_0"] = _loc5_;
               _loc6_ = new chars_player_fire_1_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_player_fire_1_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_player_fire_1"] = _loc5_;
               _loc6_ = new chars_player_fire_2_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_player_fire_2_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_player_fire_2"] = _loc5_;
               _loc6_ = new chars_player_fire_debris_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_player_fire_debris_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_player_fire_debris"] = _loc5_;
               _loc6_ = new chars_en_fire_debris_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_fire_debris_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_fire_debris"] = _loc5_;
               break;
            case ResManager.kAssetSet_icePlayerGameAssets:
               _loc6_ = new chars_en_static_croc_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_static_croc_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_static_croc"] = _loc5_;
               _loc6_ = new chars_en_static_lion_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_static_lion_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_static_lion"] = _loc5_;
               _loc6_ = new chars_en_ice_debris_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_debris_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_debris"] = _loc5_;
               _loc6_ = new chars_env_cave_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_cave_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_cave"] = _loc5_;
               _loc6_ = new chars_env_orbs_ice_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_orbs_ice_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_orbs_ice"] = _loc5_;
               _loc6_ = new chars_env_ice_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_ice_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_ice"] = _loc5_;
               _loc6_ = new chars_env_jungle_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_jungle_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_jungle"] = _loc5_;
               _loc6_ = new chars_env_fire_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_env_fire_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_env_fire"] = _loc5_;
               _loc6_ = new chars_en_ice_0_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_0_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_0"] = _loc5_;
               _loc6_ = new chars_en_ice_1_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_1_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_1"] = _loc5_;
               _loc6_ = new chars_en_ice_2_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_2_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_2"] = _loc5_;
               _loc6_ = new chars_en_ice_3_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_3_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_3"] = _loc5_;
               _loc6_ = new chars_en_ice_4_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_4_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_4"] = _loc5_;
               _loc6_ = new chars_en_ice_5_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_5_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_5"] = _loc5_;
               _loc6_ = new chars_en_ice_6_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_6_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_6"] = _loc5_;
               _loc6_ = new chars_en_ice_7_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_7_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_7"] = _loc5_;
               _loc6_ = new chars_en_ice_8_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_en_ice_8_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_en_ice_8"] = _loc5_;
               _loc6_ = new chars_player_ice_0_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_player_ice_0_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_player_ice_0"] = _loc5_;
               _loc6_ = new chars_player_ice_1_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_player_ice_1_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_player_ice_1"] = _loc5_;
               _loc6_ = new chars_player_ice_2_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_player_ice_2_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_player_ice_2"] = _loc5_;
               _loc6_ = new chars_player_ice_debris_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new chars_player_ice_debris_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["chars_player_ice_debris"] = _loc5_;
               break;
            case ResManager.kAssetSet_uiAssets:
               _loc6_ = new ui_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new ui_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["ui"] = _loc5_;
               _loc6_ = new ui_fe_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new ui_fe_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["ui_fe"] = _loc5_;
               _loc6_ = new ui_pause_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new ui_pause_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["ui_pause"] = _loc5_;
               _loc6_ = new ui_portraits_ATF();
               _loc3_ = Texture.fromAtfData(_loc6_,1,false);
               _loc4_ = XML(new ui_portraits_XML());
               _loc5_ = new TextureAtlas(_loc3_,_loc4_);
               _loc2_["ui_portraits"] = _loc5_;
               break;
            case ResManager.kAssetSet_fontAssets:
         }
      }
      
      public static function UnLoadAssetSetAtlases(param1:int) : void
      {
         var _loc3_:TextureAtlas = null;
         var _loc2_:Dictionary = _aDictionaries[param1];
         for each(_loc3_ in _loc2_)
         {
            _loc3_.dispose();
         }
         _aDictionaries[param1] = new Dictionary();
      }
      
      public static function getAtlas(param1:String) : TextureAtlas
      {
         var _loc2_:TextureAtlas = null;
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
      
      public static function getTexture(param1:String) : Texture
      {
         var _loc3_:TextureAtlas = null;
         var _loc4_:Dictionary = null;
         var _loc2_:Texture = null;
         for each(_loc4_ in _aDictionaries)
         {
            for each(_loc3_ in _loc4_)
            {
               _loc2_ = _loc3_.getTexture(param1);
               if(_loc2_ != null)
               {
                  return _loc2_;
               }
            }
         }
         return null;
      }
   }
}
