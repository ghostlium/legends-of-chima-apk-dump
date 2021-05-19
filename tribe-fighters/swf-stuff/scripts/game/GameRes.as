package game
{
   import flash.media.Sound;
   import resource.AudioResource;
   import resource.ResManager;
   import starling.textures.Texture;
   import zufflin.cobraBase.GlaSet;
   import zufflin.core.zSoundList;
   import zufflin.core.zSprite;
   
   public class GameRes
   {
      
      public static var _pSingleton:GameRes = null;
       
      
      public var _pLevelSet:GlaSet;
      
      public var _pFirePlayerCharSet:GlaSet;
      
      public var _pFireEnvCharSet:GlaSet;
      
      public var _pFireOrbsCharSet:GlaSet;
      
      public var _pFireDiscShooterCharSet:GlaSet;
      
      public var _pFireEnemiesCharSet:GlaSet;
      
      public var _pFireAdditionalsCharSet:GlaSet;
      
      public var _pFireFlagsSet:GlaSet;
      
      public var _pIcePlayerCharSet:GlaSet;
      
      public var _pIceEnvCharSet:GlaSet;
      
      public var _pIceOrbsCharSet:GlaSet;
      
      public var _pIceDiscShooterCharSet:GlaSet;
      
      public var _pIceEnemiesCharSet:GlaSet;
      
      public var _pIceAdditionalsCharSet:GlaSet;
      
      public var _pIceFlagsSet:GlaSet;
      
      public var _pProjectileSet:GlaSet;
      
      public var _pPickupSet:GlaSet;
      
      public var _pUISet:GlaSet;
      
      public var _pParticleEffectsSet:GlaSet;
      
      public var _pFXChiSet:GlaSet;
      
      public var _pSwordSwingingSounds:zSoundList;
      
      public var _pMageShoot:zSoundList;
      
      public var _pBlasterShoot:zSoundList;
      
      public var _pSmallSmash:zSoundList;
      
      public var _pExplosionSounds:zSoundList;
      
      public var _pPunchSounds:zSoundList;
      
      public var _pHurtSounds:zSoundList;
      
      public var _pDieSounds:zSoundList;
      
      public var _pImpactEnvSounds:zSoundList;
      
      public var _pCharacterSelectSounds:zSoundList;
      
      public var _pStudCollectSounds:zSoundList;
      
      public var _pButtonClickUpSounds:zSoundList;
      
      public var _pButtonClickDownSounds:zSoundList;
      
      public var _pPickupFlagSound:Sound;
      
      public var _pReflectBulletSound:Sound;
      
      public var _pDiscShotSound:Sound;
      
      public var _pCoinSound:Sound;
      
      public var _pBlueCoinSound:Sound;
      
      public var _pChiCrystalSound:Sound;
      
      public var _pChiBombSound:Sound;
      
      public var _pChiMageSound:Sound;
      
      public var _pChiSwordSound:Sound;
      
      public var _pPickedUpPowerUp:Sound;
      
      public var _pFlagCompletedSound:Sound;
      
      public var _pPassedBestSound:Sound;
      
      public var _pDistanceSound:Sound;
      
      public var _pNotAllowedSound:Sound;
      
      public var _pVortexLightningFire:Texture;
      
      public var _pVortexLightningIce:Texture;
      
      public var _pScoreFont:String;
      
      public var _pArialUnicode32:String;
      
      public var _pFrontendMusic:Sound;
      
      public var _pGameMusic:Sound;
      
      public var _pResultsMusic:Sound;
      
      public var _pTrailIceSprite:zSprite;
      
      public var _pTrailFireSprite:zSprite;
      
      public var _pDiscTrailIceSprite:zSprite;
      
      public var _pDiscTrailFireSprite:zSprite;
      
      public var _pHitIceSprite:zSprite;
      
      public var _pHitFireSprite:zSprite;
      
      public var _pCharacterFootprint:zSprite;
      
      public var _pRunningDust:zSprite;
      
      public var _pPickUpGreenSparkleSprite:zSprite;
      
      public var _pPickupGreenTrailSprite:zSprite;
      
      public var _pGoldTrailSprite:zSprite;
      
      public var _bFireResourcesLoaded:Boolean;
      
      public var _bIceResourcesLoaded:Boolean;
      
      public function GameRes()
      {
         super();
         this._bFireResourcesLoaded = false;
         this._bIceResourcesLoaded = false;
         this.loadResources();
         this.initialiseResources();
      }
      
      public static function load() : void
      {
         _pSingleton = new GameRes();
      }
      
      public static function unload() : void
      {
         if(_pSingleton)
         {
            _pSingleton.dispose();
            _pSingleton = null;
         }
      }
      
      public static function get() : GameRes
      {
         if(_pSingleton != null)
         {
            return _pSingleton;
         }
         load();
         return _pSingleton;
      }
      
      public function dispose() : void
      {
         ResManager.UnloadAssetSetResources(ResManager.kAssetSet_generalAssets);
         ResManager.UnloadAssetSetResources(ResManager.kAssetSet_levelAssets);
         ResManager.UnloadAssetSetResources(ResManager.kAssetSet_genericGameAssets);
         ResManager.UnloadAssetSetResources(ResManager.kAssetSet_firePlayerGameAssets);
         ResManager.UnloadAssetSetResources(ResManager.kAssetSet_icePlayerGameAssets);
         ResManager.UnloadAssetSetResources(ResManager.kAssetSet_uiAssets);
         ResManager.UnloadAssetSetResources(ResManager.kAssetSet_fontAssets);
      }
      
      public function loadResources() : void
      {
         ResManager.LoadAssetSetResources(ResManager.kAssetSet_generalAssets);
         ResManager.LoadAssetSetResources(ResManager.kAssetSet_levelAssets);
         ResManager.LoadAssetSetResources(ResManager.kAssetSet_genericGameAssets);
         ResManager.LoadAssetSetResources(ResManager.kAssetSet_uiAssets);
         this._pFrontendMusic = AudioResource.getSound("frontend");
         this._pGameMusic = AudioResource.getSound("GameplayLoop");
         this._pResultsMusic = AudioResource.getSound("GameComplete");
         this._pLevelSet = GlaSet.loadAll("res/levels.cgla",ResManager.getData("levels.cgla"));
         this._pProjectileSet = GlaSet.loadAll("res/projectiles.cgla",ResManager.getData("projectiles.cgla"));
         this._pPickupSet = GlaSet.loadAll("res/pickups.cgla",ResManager.getData("pickups.cgla"));
         this._pFXChiSet = GlaSet.loadAll("res/fx/chi/Chima_Power.cgla",ResManager.getData("fx/chi/Chima_Power.cgla"));
         this._pFireFlagsSet = GlaSet.loadAll("res/flags_fire.cgla",ResManager.getData("flags_fire.cgla"));
         this._pIceFlagsSet = GlaSet.loadAll("res/flags_ice.cgla",ResManager.getData("flags_ice.cgla"));
         this._pParticleEffectsSet = GlaSet.loadAll("res/particle_effects.cgla",ResManager.getData("particle_effects.cgla"));
         this._pTrailFireSprite = this._pParticleEffectsSet.findScene("fire_particle_effects_sprites").getState(0).findSpriteElementSprite("bullet_trail");
         this._pTrailIceSprite = this._pParticleEffectsSet.findScene("ice_particle_effects_sprites").getState(0).findSpriteElementSprite("bullet_trail");
         this._pDiscTrailIceSprite = this._pParticleEffectsSet.findScene("ice_particle_effects_sprites").getState(0).findSpriteElementSprite("disc_particle");
         this._pDiscTrailFireSprite = this._pParticleEffectsSet.findScene("fire_particle_effects_sprites").getState(0).findSpriteElementSprite("disc_particle");
         this._pHitIceSprite = this._pParticleEffectsSet.findScene("ice_particle_effects_sprites").getState(0).findSpriteElementSprite("hit_particle");
         this._pHitFireSprite = this._pParticleEffectsSet.findScene("fire_particle_effects_sprites").getState(0).findSpriteElementSprite("hit_particle");
         this._pCharacterFootprint = this._pParticleEffectsSet.findScene("misc_particle_effects_sprites").getState(0).findSpriteElementSprite("footprint");
         this._pRunningDust = this._pParticleEffectsSet.findScene("misc_particle_effects_sprites").getState(0).findSpriteElementSprite("dust");
         this._pPickUpGreenSparkleSprite = this._pParticleEffectsSet.findScene("misc_particle_effects_sprites").getState(0).findSpriteElementSprite("green_sparkle");
         this._pPickupGreenTrailSprite = this._pParticleEffectsSet.findScene("misc_particle_effects_sprites").getState(0).findSpriteElementSprite("green_bullet_trail");
         this._pGoldTrailSprite = this._pParticleEffectsSet.findScene("misc_particle_effects_sprites").getState(0).findSpriteElementSprite("gold_bullet_trail");
         this._pVortexLightningFire = ResManager.getTexture("fx/lightning_Orange.png")._texture;
         this._pVortexLightningIce = ResManager.getTexture("fx/lightning_Blue.png")._texture;
         this._pSwordSwingingSounds = new zSoundList();
         this._pSwordSwingingSounds.push_back(AudioResource.getSound("2H_sword_1"));
         this._pSwordSwingingSounds.push_back(AudioResource.getSound("2H_sword_2"));
         this._pSwordSwingingSounds.push_back(AudioResource.getSound("2H_sword_3"));
         this._pSwordSwingingSounds.push_back(AudioResource.getSound("sword_3"));
         this._pBlasterShoot = new zSoundList();
         this._pBlasterShoot.push_back(AudioResource.getSound("Eagle_Turret_Laser_01"));
         this._pBlasterShoot.push_back(AudioResource.getSound("Eagle_Turret_Laser_02"));
         this._pMageShoot = new zSoundList();
         this._pMageShoot.push_back(AudioResource.getSound("scythe_1"));
         this._pMageShoot.push_back(AudioResource.getSound("scythe_2"));
         this._pMageShoot.push_back(AudioResource.getSound("scythe_3"));
         this._pSmallSmash = new zSoundList();
         this._pSmallSmash.push_back(AudioResource.getSound("smash_small_4"));
         this._pSmallSmash.push_back(AudioResource.getSound("smash_small_1"));
         this._pSmallSmash.push_back(AudioResource.getSound("smash_med_3"));
         this._pExplosionSounds = new zSoundList();
         this._pExplosionSounds.push_back(AudioResource.getSound("Chi_Explosion_01"));
         this._pExplosionSounds.push_back(AudioResource.getSound("Chi_Explosion_02"));
         this._pExplosionSounds.push_back(AudioResource.getSound("Chi_Explosion_03"));
         this._pPunchSounds = new zSoundList();
         this._pPunchSounds.push_back(AudioResource.getSound("PUNCHLIGHT1"));
         this._pPunchSounds.push_back(AudioResource.getSound("PUNCHLIGHT2"));
         this._pPunchSounds.push_back(AudioResource.getSound("PUNCHLIGHT4"));
         this._pHurtSounds = new zSoundList();
         this._pHurtSounds.push_back(AudioResource.getSound("Pain_Short_03"));
         this._pHurtSounds.push_back(AudioResource.getSound("Pain_Short_04"));
         this._pHurtSounds.push_back(AudioResource.getSound("Pain_Short_06"));
         this._pHurtSounds.push_back(AudioResource.getSound("Pain_Short_07"));
         this._pHurtSounds.push_back(AudioResource.getSound("PainSmall9"));
         this._pHurtSounds.push_back(AudioResource.getSound("PainSmall12"));
         this._pHurtSounds.push_back(AudioResource.getSound("Pain_Medium_01"));
         this._pHurtSounds.push_back(AudioResource.getSound("Pain_Medium_02"));
         this._pHurtSounds.push_back(AudioResource.getSound("Pain_Medium_03"));
         this._pHurtSounds.push_back(AudioResource.getSound("PainBig2"));
         this._pHurtSounds.push_back(AudioResource.getSound("PainBig3"));
         this._pHurtSounds.push_back(AudioResource.getSound("PainBig5"));
         this._pDieSounds = new zSoundList();
         this._pDieSounds.push_back(AudioResource.getSound("Death_01"));
         this._pDieSounds.push_back(AudioResource.getSound("Death_03"));
         this._pDieSounds.push_back(AudioResource.getSound("Death_04"));
         this._pDieSounds.push_back(AudioResource.getSound("Death_05"));
         this._pDieSounds.push_back(AudioResource.getSound("Death_06"));
         this._pDieSounds.push_back(AudioResource.getSound("Death11"));
         this._pDieSounds.push_back(AudioResource.getSound("Death12"));
         this._pImpactEnvSounds = new zSoundList();
         this._pImpactEnvSounds.push_back(AudioResource.getSound("Impact_Wood_01"));
         this._pImpactEnvSounds.push_back(AudioResource.getSound("Impact_Wood_02"));
         this._pImpactEnvSounds.push_back(AudioResource.getSound("Impact_Wood_03"));
         this._pCharacterSelectSounds = new zSoundList();
         this._pCharacterSelectSounds.push_back(AudioResource.getSound("Win1"));
         this._pCharacterSelectSounds.push_back(AudioResource.getSound("Win2"));
         this._pCharacterSelectSounds.push_back(AudioResource.getSound("Win19"));
         this._pCharacterSelectSounds.push_back(AudioResource.getSound("Victory_02"));
         this._pStudCollectSounds = new zSoundList();
         this._pStudCollectSounds.push_back(AudioResource.getSound("StudCollect1"));
         this._pStudCollectSounds.push_back(AudioResource.getSound("StudCollect2"));
         this._pStudCollectSounds.push_back(AudioResource.getSound("StudCollect3"));
         this._pStudCollectSounds.push_back(AudioResource.getSound("StudCollect4"));
         this._pButtonClickUpSounds = new zSoundList();
         this._pButtonClickUpSounds.push_back(AudioResource.getSound("Assemble1"));
         this._pButtonClickDownSounds = new zSoundList();
         this._pButtonClickDownSounds.push_back(AudioResource.getSound("Assemble3"));
         this._pPickupFlagSound = AudioResource.getSound("token_pickup_3");
         this._pReflectBulletSound = AudioResource.getSound("reflect");
         this._pDiscShotSound = AudioResource.getSound("rocketshot");
         this._pCoinSound = AudioResource.getSound("ui_collectCoin_02");
         this._pBlueCoinSound = AudioResource.getSound("CoinBlue");
         this._pChiCrystalSound = AudioResource.getSound("Chi_Collect");
         this._pChiBombSound = AudioResource.getSound("Chi_Absorb");
         this._pChiMageSound = AudioResource.getSound("Chi_Loop");
         this._pChiSwordSound = AudioResource.getSound("laser_loop_2");
         this._pPickedUpPowerUp = AudioResource.getSound("elevator_start");
         this._pFlagCompletedSound = AudioResource.getSound("flagCompleteLoud");
         this._pPassedBestSound = AudioResource.getSound("challenges_award");
         this._pDistanceSound = AudioResource.getSound("success");
         this._pNotAllowedSound = AudioResource.getSound("Negative_02");
         this._pUISet = GlaSet.loadAll("res/ui.cgla",ResManager.getData("ui.cgla"));
      }
      
      public function loadFireResources() : Boolean
      {
         if(!this._bFireResourcesLoaded)
         {
            ResManager.LoadAssetSetResources(ResManager.kAssetSet_firePlayerGameAssets);
            this._pFirePlayerCharSet = GlaSet.loadAll("res/chars_players_fire.cgla",ResManager.getData("chars_players_fire.cgla"));
            this._pFireEnvCharSet = GlaSet.loadAll("res/chars_env_fire.cgla",ResManager.getData("chars_env_fire.cgla"));
            this._pIceEnvCharSet = GlaSet.loadAll("res/chars_env_ice.cgla",ResManager.getData("chars_env_ice.cgla"));
            this._pFireOrbsCharSet = GlaSet.loadAll("res/chars_orbs_fire.cgla",ResManager.getData("chars_orbs_fire.cgla"));
            this._pIceDiscShooterCharSet = GlaSet.loadAll("res/chars_discshooters_ice.cgla",ResManager.getData("chars_discshooters_ice.cgla"));
            this._pIceEnemiesCharSet = GlaSet.loadAll("res/chars_enemies_ice.cgla",ResManager.getData("chars_enemies_ice.cgla"));
            this._pIceAdditionalsCharSet = GlaSet.loadAll("res/chars_additionals_ice.cgla",ResManager.getData("chars_additionals_ice.cgla"));
            this._bFireResourcesLoaded = true;
            return true;
         }
         return false;
      }
      
      public function loadIceResources() : Boolean
      {
         if(!this._bIceResourcesLoaded)
         {
            ResManager.LoadAssetSetResources(ResManager.kAssetSet_icePlayerGameAssets);
            this._pIcePlayerCharSet = GlaSet.loadAll("res/chars_players_ice.cgla",ResManager.getData("chars_players_ice.cgla"));
            this._pFireEnvCharSet = GlaSet.loadAll("res/chars_env_fire.cgla",ResManager.getData("chars_env_fire.cgla"));
            this._pIceEnvCharSet = GlaSet.loadAll("res/chars_env_ice.cgla",ResManager.getData("chars_env_ice.cgla"));
            this._pIceOrbsCharSet = GlaSet.loadAll("res/chars_orbs_ice.cgla",ResManager.getData("chars_orbs_ice.cgla"));
            this._pFireDiscShooterCharSet = GlaSet.loadAll("res/chars_discshooters_fire.cgla",ResManager.getData("chars_discshooters_fire.cgla"));
            this._pFireEnemiesCharSet = GlaSet.loadAll("res/chars_enemies_fire.cgla",ResManager.getData("chars_enemies_fire.cgla"));
            this._pFireAdditionalsCharSet = GlaSet.loadAll("res/chars_additionals_fire.cgla",ResManager.getData("chars_additionals_fire.cgla"));
            this._bIceResourcesLoaded = true;
            return true;
         }
         return false;
      }
      
      public function unloadFireResources() : void
      {
         if(this._bFireResourcesLoaded)
         {
            ResManager.UnloadAssetSetResources(ResManager.kAssetSet_firePlayerGameAssets);
            this._bFireResourcesLoaded = false;
         }
      }
      
      public function unloadIceResources() : void
      {
         if(this._bIceResourcesLoaded)
         {
            ResManager.UnloadAssetSetResources(ResManager.kAssetSet_icePlayerGameAssets);
            this._bIceResourcesLoaded = false;
         }
      }
      
      public function initialiseResources() : void
      {
      }
      
      public function loadFonts() : void
      {
         ResManager.UnloadAssetSetResources(ResManager.kAssetSet_fontAssets);
         ResManager.LoadAssetSetResources(ResManager.kAssetSet_fontAssets);
         this._pScoreFont = ResManager.GetFont(GameWorld.get().getLanguage().getString("font1"));
         this._pArialUnicode32 = ResManager.GetFont(GameWorld.get().getLanguage().getString("font2"));
      }
   }
}
