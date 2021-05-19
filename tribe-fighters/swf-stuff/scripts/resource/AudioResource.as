package resource
{
   import flash.media.Sound;
   import flash.utils.Dictionary;
   
   public class AudioResource
   {
      
      private static const frontendMusic:Class = AudioResource_frontendMusic;
      
      private static const gameCompleteMusic:Class = AudioResource_gameCompleteMusic;
      
      private static const gameplayLoopMusic:Class = AudioResource_gameplayLoopMusic;
      
      private static const sword_1:Class = AudioResource_sword_1;
      
      private static const sword_2:Class = AudioResource_sword_2;
      
      private static const sword_3:Class = AudioResource_sword_3;
      
      private static const sword3:Class = AudioResource_sword3;
      
      private static const Eagle_Turret_Laser_01:Class = AudioResource_Eagle_Turret_Laser_01;
      
      private static const Eagle_Turret_Laser_02:Class = AudioResource_Eagle_Turret_Laser_02;
      
      private static const scythe_1:Class = AudioResource_scythe_1;
      
      private static const scythe_2:Class = AudioResource_scythe_2;
      
      private static const scythe_3:Class = AudioResource_scythe_3;
      
      private static const smash_small_4:Class = AudioResource_smash_small_4;
      
      private static const smash_small_1:Class = AudioResource_smash_small_1;
      
      private static const smash_med_3:Class = AudioResource_smash_med_3;
      
      private static const Chi_Explosion_01:Class = AudioResource_Chi_Explosion_01;
      
      private static const Chi_Explosion_02:Class = AudioResource_Chi_Explosion_02;
      
      private static const Chi_Explosion_03:Class = AudioResource_Chi_Explosion_03;
      
      private static const PUNCHLIGHT1:Class = AudioResource_PUNCHLIGHT1;
      
      private static const PUNCHLIGHT2:Class = AudioResource_PUNCHLIGHT2;
      
      private static const PUNCHLIGHT4:Class = AudioResource_PUNCHLIGHT4;
      
      private static const Pain_Short_03:Class = AudioResource_Pain_Short_03;
      
      private static const Pain_Short_04:Class = AudioResource_Pain_Short_04;
      
      private static const Pain_Short_06:Class = AudioResource_Pain_Short_06;
      
      private static const Pain_Short_07:Class = AudioResource_Pain_Short_07;
      
      private static const PainSmall9:Class = AudioResource_PainSmall9;
      
      private static const PainSmall12:Class = AudioResource_PainSmall12;
      
      private static const Pain_Medium_01:Class = AudioResource_Pain_Medium_01;
      
      private static const Pain_Medium_02:Class = AudioResource_Pain_Medium_02;
      
      private static const Pain_Medium_03:Class = AudioResource_Pain_Medium_03;
      
      private static const PainBig2:Class = AudioResource_PainBig2;
      
      private static const PainBig3:Class = AudioResource_PainBig3;
      
      private static const PainBig5:Class = AudioResource_PainBig5;
      
      private static const Death_01:Class = AudioResource_Death_01;
      
      private static const Death_03:Class = AudioResource_Death_03;
      
      private static const Death_04:Class = AudioResource_Death_04;
      
      private static const Death_05:Class = AudioResource_Death_05;
      
      private static const Death_06:Class = AudioResource_Death_06;
      
      private static const Death11:Class = AudioResource_Death11;
      
      private static const Death12:Class = AudioResource_Death12;
      
      private static const Impact_Wood_01:Class = AudioResource_Impact_Wood_01;
      
      private static const Impact_Wood_02:Class = AudioResource_Impact_Wood_02;
      
      private static const Impact_Wood_03:Class = AudioResource_Impact_Wood_03;
      
      private static const Win1:Class = AudioResource_Win1;
      
      private static const Win2:Class = AudioResource_Win2;
      
      private static const Win19:Class = AudioResource_Win19;
      
      private static const Victory_02:Class = AudioResource_Victory_02;
      
      private static const StudCollect1:Class = AudioResource_StudCollect1;
      
      private static const StudCollect2:Class = AudioResource_StudCollect2;
      
      private static const StudCollect3:Class = AudioResource_StudCollect3;
      
      private static const StudCollect4:Class = AudioResource_StudCollect4;
      
      private static const Assemble1:Class = AudioResource_Assemble1;
      
      private static const Assemble3:Class = AudioResource_Assemble3;
      
      private static const token_pickup_3:Class = AudioResource_token_pickup_3;
      
      private static const reflect:Class = AudioResource_reflect;
      
      private static const rocketshot:Class = AudioResource_rocketshot;
      
      private static const ui_collectCoin_02:Class = AudioResource_ui_collectCoin_02;
      
      private static const CoinBlue:Class = AudioResource_CoinBlue;
      
      private static const Chi_Collect:Class = AudioResource_Chi_Collect;
      
      private static const Chi_Absorb:Class = AudioResource_Chi_Absorb;
      
      private static const Chi_Loop:Class = AudioResource_Chi_Loop;
      
      private static const laser_loop_2:Class = AudioResource_laser_loop_2;
      
      private static const elevator_start:Class = AudioResource_elevator_start;
      
      private static const challenges_award:Class = AudioResource_challenges_award;
      
      private static const flagCompleteLoud:Class = AudioResource_flagCompleteLoud;
      
      private static const Negative_02:Class = AudioResource_Negative_02;
      
      private static const success:Class = AudioResource_success;
      
      public static var soundsdict:Dictionary;
      
      {
         initResources();
      }
      
      public function AudioResource()
      {
         super();
      }
      
      private static function initResources() : void
      {
         var _loc1_:Sound = null;
         soundsdict = new Dictionary();
         _loc1_ = new frontendMusic();
         soundsdict["frontend"] = _loc1_;
         _loc1_ = new gameCompleteMusic();
         soundsdict["GameComplete"] = _loc1_;
         _loc1_ = new gameplayLoopMusic();
         soundsdict["GameplayLoop"] = _loc1_;
         _loc1_ = new sword_1();
         soundsdict["2H_sword_1"] = _loc1_;
         _loc1_ = new sword_2();
         soundsdict["2H_sword_2"] = _loc1_;
         _loc1_ = new sword_3();
         soundsdict["2H_sword_3"] = _loc1_;
         _loc1_ = new sword3();
         soundsdict["sword_3"] = _loc1_;
         _loc1_ = new Eagle_Turret_Laser_01();
         soundsdict["Eagle_Turret_Laser_01"] = _loc1_;
         _loc1_ = new Eagle_Turret_Laser_02();
         soundsdict["Eagle_Turret_Laser_02"] = _loc1_;
         _loc1_ = new scythe_1();
         soundsdict["scythe_1"] = _loc1_;
         _loc1_ = new scythe_2();
         soundsdict["scythe_2"] = _loc1_;
         _loc1_ = new scythe_3();
         soundsdict["scythe_3"] = _loc1_;
         _loc1_ = new smash_small_4();
         soundsdict["smash_small_4"] = _loc1_;
         _loc1_ = new smash_small_1();
         soundsdict["smash_small_1"] = _loc1_;
         _loc1_ = new smash_med_3();
         soundsdict["smash_med_3"] = _loc1_;
         _loc1_ = new Chi_Explosion_01();
         soundsdict["Chi_Explosion_01"] = _loc1_;
         _loc1_ = new Chi_Explosion_02();
         soundsdict["Chi_Explosion_02"] = _loc1_;
         _loc1_ = new Chi_Explosion_03();
         soundsdict["Chi_Explosion_03"] = _loc1_;
         _loc1_ = new PUNCHLIGHT1();
         soundsdict["PUNCHLIGHT1"] = _loc1_;
         _loc1_ = new PUNCHLIGHT2();
         soundsdict["PUNCHLIGHT2"] = _loc1_;
         _loc1_ = new PUNCHLIGHT4();
         soundsdict["PUNCHLIGHT4"] = _loc1_;
         _loc1_ = new Pain_Short_03();
         soundsdict["Pain_Short_03"] = _loc1_;
         _loc1_ = new Pain_Short_04();
         soundsdict["Pain_Short_04"] = _loc1_;
         _loc1_ = new Pain_Short_06();
         soundsdict["Pain_Short_06"] = _loc1_;
         _loc1_ = new Pain_Short_07();
         soundsdict["Pain_Short_07"] = _loc1_;
         _loc1_ = new PainSmall9();
         soundsdict["PainSmall9"] = _loc1_;
         _loc1_ = new PainSmall12();
         soundsdict["PainSmall12"] = _loc1_;
         _loc1_ = new Pain_Medium_01();
         soundsdict["Pain_Medium_01"] = _loc1_;
         _loc1_ = new Pain_Medium_02();
         soundsdict["Pain_Medium_02"] = _loc1_;
         _loc1_ = new Pain_Medium_03();
         soundsdict["Pain_Medium_03"] = _loc1_;
         _loc1_ = new PainBig2();
         soundsdict["PainBig2"] = _loc1_;
         _loc1_ = new PainBig3();
         soundsdict["PainBig3"] = _loc1_;
         _loc1_ = new PainBig5();
         soundsdict["PainBig5"] = _loc1_;
         _loc1_ = new Death_01();
         soundsdict["Death_01"] = _loc1_;
         _loc1_ = new Death_03();
         soundsdict["Death_03"] = _loc1_;
         _loc1_ = new Death_04();
         soundsdict["Death_04"] = _loc1_;
         _loc1_ = new Death_05();
         soundsdict["Death_05"] = _loc1_;
         _loc1_ = new Death_06();
         soundsdict["Death_06"] = _loc1_;
         _loc1_ = new Death11();
         soundsdict["Death11"] = _loc1_;
         _loc1_ = new Death12();
         soundsdict["Death12"] = _loc1_;
         _loc1_ = new Impact_Wood_01();
         soundsdict["Impact_Wood_01"] = _loc1_;
         _loc1_ = new Impact_Wood_02();
         soundsdict["Impact_Wood_02"] = _loc1_;
         _loc1_ = new Impact_Wood_03();
         soundsdict["Impact_Wood_03"] = _loc1_;
         _loc1_ = new Win1();
         soundsdict["Win1"] = _loc1_;
         _loc1_ = new Win2();
         soundsdict["Win2"] = _loc1_;
         _loc1_ = new Win19();
         soundsdict["Win19"] = _loc1_;
         _loc1_ = new Victory_02();
         soundsdict["Victory_02"] = _loc1_;
         _loc1_ = new StudCollect1();
         soundsdict["StudCollect1"] = _loc1_;
         _loc1_ = new StudCollect2();
         soundsdict["StudCollect2"] = _loc1_;
         _loc1_ = new StudCollect3();
         soundsdict["StudCollect3"] = _loc1_;
         _loc1_ = new StudCollect4();
         soundsdict["StudCollect4"] = _loc1_;
         _loc1_ = new Assemble1();
         soundsdict["Assemble1"] = _loc1_;
         _loc1_ = new Assemble3();
         soundsdict["Assemble3"] = _loc1_;
         _loc1_ = new token_pickup_3();
         soundsdict["token_pickup_3"] = _loc1_;
         _loc1_ = new reflect();
         soundsdict["reflect"] = _loc1_;
         _loc1_ = new rocketshot();
         soundsdict["rocketshot"] = _loc1_;
         _loc1_ = new ui_collectCoin_02();
         soundsdict["ui_collectCoin_02"] = _loc1_;
         _loc1_ = new CoinBlue();
         soundsdict["CoinBlue"] = _loc1_;
         _loc1_ = new Chi_Collect();
         soundsdict["Chi_Collect"] = _loc1_;
         _loc1_ = new Chi_Absorb();
         soundsdict["Chi_Absorb"] = _loc1_;
         _loc1_ = new Chi_Loop();
         soundsdict["Chi_Loop"] = _loc1_;
         _loc1_ = new laser_loop_2();
         soundsdict["laser_loop_2"] = _loc1_;
         _loc1_ = new elevator_start();
         soundsdict["elevator_start"] = _loc1_;
         _loc1_ = new challenges_award();
         soundsdict["challenges_award"] = _loc1_;
         _loc1_ = new flagCompleteLoud();
         soundsdict["flagCompleteLoud"] = _loc1_;
         _loc1_ = new Negative_02();
         soundsdict["Negative_02"] = _loc1_;
         _loc1_ = new success();
         soundsdict["success"] = _loc1_;
      }
      
      public static function getSound(param1:String) : Sound
      {
         var _loc2_:Sound = soundsdict[param1];
         if(!_loc2_)
         {
            trace("SCG: Missing sound: " + param1);
         }
         return _loc2_;
      }
   }
}
