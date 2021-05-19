package resource
{
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class DataResource
   {
      
      private static const levelsCGLA:Class = DataResource_levelsCGLA;
      
      private static const flags_fireCGLA:Class = DataResource_flags_fireCGLA;
      
      private static const flags_iceCGLA:Class = DataResource_flags_iceCGLA;
      
      private static const particle_effectsCGLA:Class = DataResource_particle_effectsCGLA;
      
      private static const pickupsCGLA:Class = DataResource_pickupsCGLA;
      
      private static const projectilesCGLA:Class = DataResource_projectilesCGLA;
      
      private static const Chima_PowerCGLA:Class = DataResource_Chima_PowerCGLA;
      
      private static const uiCGLA:Class = DataResource_uiCGLA;
      
      private static const chars_players_fireCGLA:Class = DataResource_chars_players_fireCGLA;
      
      private static const chars_orbs_fireCGLA:Class = DataResource_chars_orbs_fireCGLA;
      
      private static const chars_discshooters_iceCGLA:Class = DataResource_chars_discshooters_iceCGLA;
      
      private static const chars_enemies_iceCGLA:Class = DataResource_chars_enemies_iceCGLA;
      
      private static const chars_additionals_iceCGLA:Class = DataResource_chars_additionals_iceCGLA;
      
      private static const chars_players_iceCGLA:Class = DataResource_chars_players_iceCGLA;
      
      private static const chars_orbs_iceCGLA:Class = DataResource_chars_orbs_iceCGLA;
      
      private static const chars_discshooters_fireCGLA:Class = DataResource_chars_discshooters_fireCGLA;
      
      private static const chars_enemies_fireCGLA:Class = DataResource_chars_enemies_fireCGLA;
      
      private static const chars_additionals_fireCGLA:Class = DataResource_chars_additionals_fireCGLA;
      
      private static const chars_env_fireCGLA:Class = DataResource_chars_env_fireCGLA;
      
      private static const chars_env_iceCGLA:Class = DataResource_chars_env_iceCGLA;
      
      private static const bonusmissionsZDF:Class = DataResource_bonusmissionsZDF;
      
      private static const credits_enZDF:Class = DataResource_credits_enZDF;
      
      private static const costsZDF:Class = DataResource_costsZDF;
      
      private static const lang_csZDF:Class = DataResource_lang_csZDF;
      
      private static const lang_daZDF:Class = DataResource_lang_daZDF;
      
      private static const lang_deZDF:Class = DataResource_lang_deZDF;
      
      private static const lang_enZDF:Class = DataResource_lang_enZDF;
      
      private static const lang_esZDF:Class = DataResource_lang_esZDF;
      
      private static const lang_fiZDF:Class = DataResource_lang_fiZDF;
      
      private static const lang_frZDF:Class = DataResource_lang_frZDF;
      
      private static const lang_huZDF:Class = DataResource_lang_huZDF;
      
      private static const lang_itZDF:Class = DataResource_lang_itZDF;
      
      private static const lang_jaZDF:Class = DataResource_lang_jaZDF;
      
      private static const lang_koZDF:Class = DataResource_lang_koZDF;
      
      private static const lang_nlZDF:Class = DataResource_lang_nlZDF;
      
      private static const lang_noZDF:Class = DataResource_lang_noZDF;
      
      private static const lang_plZDF:Class = DataResource_lang_plZDF;
      
      private static const lang_ptZDF:Class = DataResource_lang_ptZDF;
      
      private static const lang_ruZDF:Class = DataResource_lang_ruZDF;
      
      private static const lang_svZDF:Class = DataResource_lang_svZDF;
      
      private static const lang_zhZDF:Class = DataResource_lang_zhZDF;
      
      private static var _aDictionaries:Vector.<Dictionary>;
      
      private static var _aSharedData:Dictionary;
       
      
      public function DataResource()
      {
         super();
      }
      
      public static function Initialise() : void
      {
         var _loc2_:ByteArray = null;
         _aDictionaries = new Vector.<Dictionary>(ResManager.kAssetSet_MAX,true);
         var _loc1_:int = 0;
         while(_loc1_ < ResManager.kAssetSet_MAX)
         {
            _aDictionaries[_loc1_] = new Dictionary();
            _loc1_++;
         }
         _aSharedData = new Dictionary();
         _loc2_ = new bonusmissionsZDF() as ByteArray;
         _aSharedData["cfg/bonusmissions.zdf"] = _loc2_;
         _loc2_ = new credits_enZDF() as ByteArray;
         _aSharedData["res/cfg/credits_en.zdf"] = _loc2_;
         _loc2_ = new costsZDF() as ByteArray;
         _aSharedData["res/cfg/costs.zdf"] = _loc2_;
         _loc2_ = new lang_csZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_cs.zdf"] = _loc2_;
         _loc2_ = new lang_daZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_da.zdf"] = _loc2_;
         _loc2_ = new lang_deZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_de.zdf"] = _loc2_;
         _loc2_ = new lang_enZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_en.zdf"] = _loc2_;
         _loc2_ = new lang_esZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_es.zdf"] = _loc2_;
         _loc2_ = new lang_fiZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_fi.zdf"] = _loc2_;
         _loc2_ = new lang_frZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_fr.zdf"] = _loc2_;
         _loc2_ = new lang_huZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_hu.zdf"] = _loc2_;
         _loc2_ = new lang_itZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_it.zdf"] = _loc2_;
         _loc2_ = new lang_jaZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_ja.zdf"] = _loc2_;
         _loc2_ = new lang_koZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_ko.zdf"] = _loc2_;
         _loc2_ = new lang_nlZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_nl.zdf"] = _loc2_;
         _loc2_ = new lang_noZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_no.zdf"] = _loc2_;
         _loc2_ = new lang_plZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_pl.zdf"] = _loc2_;
         _loc2_ = new lang_ptZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_pt.zdf"] = _loc2_;
         _loc2_ = new lang_ruZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_ru.zdf"] = _loc2_;
         _loc2_ = new lang_svZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_sv.zdf"] = _loc2_;
         _loc2_ = new lang_zhZDF() as ByteArray;
         _aSharedData["res/cfg/languages/lang_zh.zdf"] = _loc2_;
      }
      
      public static function LoadAssetSetData(param1:int) : void
      {
         var _loc3_:ByteArray = null;
         var _loc2_:Dictionary = _aDictionaries[param1];
         switch(param1)
         {
            case ResManager.kAssetSet_generalAssets:
               break;
            case ResManager.kAssetSet_levelAssets:
               _loc3_ = new levelsCGLA() as ByteArray;
               _loc2_["levels.cgla"] = _loc3_;
               break;
            case ResManager.kAssetSet_genericGameAssets:
               _loc3_ = new flags_fireCGLA() as ByteArray;
               _loc2_["flags_fire.cgla"] = _loc3_;
               _loc3_ = new flags_iceCGLA() as ByteArray;
               _loc2_["flags_ice.cgla"] = _loc3_;
               _loc3_ = new particle_effectsCGLA() as ByteArray;
               _loc2_["particle_effects.cgla"] = _loc3_;
               _loc3_ = new pickupsCGLA() as ByteArray;
               _loc2_["pickups.cgla"] = _loc3_;
               _loc3_ = new projectilesCGLA() as ByteArray;
               _loc2_["projectiles.cgla"] = _loc3_;
               _loc3_ = new Chima_PowerCGLA() as ByteArray;
               _loc2_["fx/chi/Chima_Power.cgla"] = _loc3_;
               break;
            case ResManager.kAssetSet_firePlayerGameAssets:
               _loc3_ = new chars_players_fireCGLA() as ByteArray;
               _loc2_["chars_players_fire.cgla"] = _loc3_;
               _loc3_ = new chars_orbs_fireCGLA() as ByteArray;
               _loc2_["chars_orbs_fire.cgla"] = _loc3_;
               _loc3_ = new chars_discshooters_iceCGLA() as ByteArray;
               _loc2_["chars_discshooters_ice.cgla"] = _loc3_;
               _loc3_ = new chars_enemies_iceCGLA() as ByteArray;
               _loc2_["chars_enemies_ice.cgla"] = _loc3_;
               _loc3_ = new chars_additionals_iceCGLA() as ByteArray;
               _loc2_["chars_additionals_ice.cgla"] = _loc3_;
               _loc3_ = new chars_env_fireCGLA() as ByteArray;
               _loc2_["chars_env_fire.cgla"] = _loc3_;
               _loc3_ = new chars_env_iceCGLA() as ByteArray;
               _loc2_["chars_env_ice.cgla"] = _loc3_;
               break;
            case ResManager.kAssetSet_icePlayerGameAssets:
               _loc3_ = new chars_players_iceCGLA() as ByteArray;
               _loc2_["chars_players_ice.cgla"] = _loc3_;
               _loc3_ = new chars_orbs_iceCGLA() as ByteArray;
               _loc2_["chars_orbs_ice.cgla"] = _loc3_;
               _loc3_ = new chars_discshooters_fireCGLA() as ByteArray;
               _loc2_["chars_discshooters_fire.cgla"] = _loc3_;
               _loc3_ = new chars_enemies_fireCGLA() as ByteArray;
               _loc2_["chars_enemies_fire.cgla"] = _loc3_;
               _loc3_ = new chars_additionals_fireCGLA() as ByteArray;
               _loc2_["chars_additionals_fire.cgla"] = _loc3_;
               _loc3_ = new chars_env_fireCGLA() as ByteArray;
               _loc2_["chars_env_fire.cgla"] = _loc3_;
               _loc3_ = new chars_env_iceCGLA() as ByteArray;
               _loc2_["chars_env_ice.cgla"] = _loc3_;
               break;
            case ResManager.kAssetSet_uiAssets:
               _loc3_ = new uiCGLA() as ByteArray;
               _loc2_["ui.cgla"] = _loc3_;
               break;
            case ResManager.kAssetSet_fontAssets:
         }
      }
      
      public static function UnLoadAssetSetData(param1:int) : void
      {
         var _loc3_:ByteArray = null;
         var _loc2_:Dictionary = _aDictionaries[param1];
         for each(_loc3_ in _loc2_)
         {
            _loc3_.clear();
         }
         _aDictionaries[param1] = new Dictionary();
      }
      
      public static function getData(param1:String) : ByteArray
      {
         var _loc2_:ByteArray = null;
         var _loc3_:Dictionary = null;
         _loc2_ = _aSharedData[param1];
         if(_loc2_ != null)
         {
            _loc2_.position = 0;
            return _loc2_;
         }
         for each(_loc3_ in _aDictionaries)
         {
            _loc2_ = _loc3_[param1];
            if(_loc2_ != null)
            {
               _loc2_.position = 0;
               return _loc2_;
            }
         }
         trace("SCG: REQUEST FOR DATA NOT LOADED : " + param1);
         return null;
      }
   }
}
