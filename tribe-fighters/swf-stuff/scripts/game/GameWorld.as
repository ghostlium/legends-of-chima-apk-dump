package game
{
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import flash.utils.ByteArray;
   import game.objects.ChimaGameObject;
   import game.objects.EnemyManager;
   import game.objects.GameObject;
   import game.objects.Player;
   import game.objects.ScrollingBg;
   import game.objects.bullets.Bullet;
   import game.objects.enemies.Enemy;
   import game.objects.events.EventGameEnded;
   import game.objects.events.EventGameStarted;
   import game.objects.events.EventPlayerDied;
   import game.objects.events.EventPlayerFlagCollected;
   import game.objects.fx.EnvironmentParticleSpawner;
   import game.objects.misc.BonusMissions;
   import game.objects.misc.HighscoreMarker;
   import game.objects.pickups.Pickup;
   import game.objects.players.mage.MageBearPlayer;
   import game.objects.players.mage.MageCrocPlayer;
   import game.objects.players.mage.MageLionPlayer;
   import game.objects.players.mage.MageSaberPlayer;
   import game.objects.players.ranged.RangedBearPlayer;
   import game.objects.players.ranged.RangedCrocPlayer;
   import game.objects.players.ranged.RangedLionPlayer;
   import game.objects.players.ranged.RangedSaberPlayer;
   import game.objects.players.special.WarriorLavalPlayer;
   import game.objects.players.special.WarriorSirFangorPlayer;
   import game.objects.players.warrior.WarriorBearPlayer;
   import game.objects.players.warrior.WarriorCrocPlayer;
   import game.objects.players.warrior.WarriorLionPlayer;
   import game.objects.players.warrior.WarriorSaberPlayer;
   import game.objects.ui.frontend.GameOverMenu;
   import game.objects.ui.frontend.MainMenu;
   import game.objects.ui.hud.HUD;
   import game.objects.ui.pause.PauseMenu;
   import game.objects.ui.tutorial.Tutorial;
   import resource.ResManager;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.core.MusicSystem;
   import zufflin.core.RGBA;
   import zufflin.core.StateManager;
   import zufflin.physics2D.PhysicsSystem2;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldObj;
   import zufflin.world2D.Layer2;
   import zufflin.world2D.World2;
   import zufflin.world2D.World2Obj;
   
   public class GameWorld extends World2
   {
      
      public static const LAYER_GAME:int = 0;
      
      public static const LAYER_FRONTEND:int = 1;
      
      public static const LAYER_HUD:int = 2;
      
      public static const LAYER_TUTORIAL:int = 3;
      
      public static const LAYER_PAUSE:int = 4;
      
      public static const NUM_WORLD_LAYERS:int = 5;
      
      public static var _pWorld:GameWorld = null;
      
      public static const kfGameOverFlashSpeed:Number = 6;
      
      public static const kfMaxShake:Number = 10;
      
      public static const kfShakeRate:Number = 1;
       
      
      public var _state:StateManager;
      
      public var _vBackgroundVelocity:Vec2F;
      
      public var _pLayers:Vector.<Layer2>;
      
      public var _fDt:Number;
      
      public var _fGameTime:Number;
      
      public var _uUnlockCharCost:uint;
      
      public var _uUpgradeBaseCost:uint;
      
      public var _uUpgradeCostLevelMultiplier:uint;
      
      public var _pPhysics:PhysicsSystem2;
      
      public var _pGameBg:ScrollingBg;
      
      private var _pGameBGOverlayLayer:World2Obj;
      
      public var _pMainMenu:MainMenu;
      
      public var _pGameOverMenu:GameOverMenu;
      
      public var _bDoGameOverFlash:Boolean;
      
      public var _bGameOverClearDone:Boolean;
      
      public var _fGameOverFlashProgress:Number;
      
      public var _uFlagsCollected:uint;
      
      public var _pHud:HUD;
      
      public var _bShouldDoTutorial:Boolean;
      
      public var _pTutorial:Tutorial;
      
      public var _pPauseMenu:PauseMenu;
      
      public var _pPlayer:Player;
      
      public var _lastAddedPlayer:String;
      
      public var _pEnemyManager:EnemyManager;
      
      public var _pSaveData:SaveData;
      
      public var _pLanguage:Language;
      
      public var _pBonusMissions:BonusMissions;
      
      public var _bShakeGameLayer:Boolean;
      
      public var _fShakeMagnitude:Number;
      
      public var m_FootParticleHolder:GameObject;
      
      public function GameWorld()
      {
         var _loc1_:int = 0;
         this._bShakeGameLayer = false;
         this._fShakeMagnitude = 0;
         super();
         this._state = new StateManager();
         this._pLayers = new Vector.<Layer2>(NUM_WORLD_LAYERS,true);
         this._pPlayer = null;
         this._lastAddedPlayer = "";
         this._pHud = null;
         this._uFlagsCollected = 0;
         this._fDt = 0;
         this._fGameTime = 0;
         this._vBackgroundVelocity = new Vec2F(0,0);
         _pWorld = this;
         GlaControllerButton.setDefaultSounds(GameRes.get()._pButtonClickDownSounds,GameRes.get()._pButtonClickUpSounds,0);
         this._pSaveData = new SaveData();
         this._pLanguage = new Language();
         GameRes.get().loadFonts();
         this._pBonusMissions = new BonusMissions();
         this.loadCosts();
         _loc1_ = 0;
         while(_loc1_ < NUM_WORLD_LAYERS)
         {
            this._pLayers[_loc1_] = null;
            _loc1_++;
         }
         this._state.setOwner(this);
         this.addLayers();
         this.initEventHandlers();
         this.gotoFrontend();
         this._state.update();
         if(this._pSaveData.getMusicEnabled())
         {
            MusicSystem.getSingleton().setVolume(1);
         }
         else
         {
            MusicSystem.getSingleton().setVolume(0);
         }
         if(this._pSaveData.getSfxEnabled())
         {
            SoundMixer.soundTransform = new SoundTransform(1);
         }
         else
         {
            SoundMixer.soundTransform = new SoundTransform(0);
         }
      }
      
      public static function get() : GameWorld
      {
         return _pWorld;
      }
      
      override public function dispose() : void
      {
         this.RemoveEventHandlers();
         super.dispose();
      }
      
      public function getShouldDoTutorial() : Boolean
      {
         return this._bShouldDoTutorial;
      }
      
      public function setShouldDoTutorial(param1:Boolean) : void
      {
         this._bShouldDoTutorial = param1;
      }
      
      public function getUnlockCharCost() : uint
      {
         return this._uUnlockCharCost;
      }
      
      public function getUpgradeBaseCost() : uint
      {
         return this._uUpgradeBaseCost;
      }
      
      public function getUpgradeCostMultiplier() : uint
      {
         return this._uUpgradeCostLevelMultiplier;
      }
      
      public function getBackgroundVelocityPt() : Vec2F
      {
         return this._vBackgroundVelocity;
      }
      
      public function getHUD() : HUD
      {
         return this._pHud;
      }
      
      public function getPlayer() : Player
      {
         return this._pPlayer;
      }
      
      public function getBackground() : ScrollingBg
      {
         return this._pGameBg;
      }
      
      public function getTutorial() : Tutorial
      {
         return this._pTutorial;
      }
      
      public function getEnemyManager() : EnemyManager
      {
         return this._pEnemyManager;
      }
      
      public function getSaveData() : SaveData
      {
         return this._pSaveData;
      }
      
      public function getLanguage() : Language
      {
         return this._pLanguage;
      }
      
      public function getBonusMissions() : BonusMissions
      {
         return this._pBonusMissions;
      }
      
      public function getGameOverMenu() : GameOverMenu
      {
         return this._pGameOverMenu;
      }
      
      public function getMainMenu() : MainMenu
      {
         return this._pMainMenu;
      }
      
      public function startGame() : void
      {
         Main.Instance().m_app.dispatchEvent(new EventGameStarted(EventGameStarted.EVENT_GAME_STARTED,false));
         this._uFlagsCollected = 0;
         this._fGameTime = 0;
         MusicSystem.zMusicStop();
         MusicSystem.zMusicPlay(GameRes.get()._pGameMusic);
         this.addHighscoreMarker();
         if(this._pPlayer.isHealthUpgradeActive(1))
         {
            this._pPlayer.setHealth(5);
            this._pPlayer.setMaxHealth(5);
         }
         else if(this._pPlayer.isHealthUpgradeActive(0))
         {
            this._pPlayer.setHealth(4);
            this._pPlayer.setMaxHealth(4);
         }
         else
         {
            this._pPlayer.setHealth(3);
            this._pPlayer.setMaxHealth(3);
         }
         this._pHud.getHealthBar().setNumHearts(uint(this._pPlayer.getMaxHealth()));
         this.gotoPlayingGame();
      }
      
      public function gotoFrontend() : void
      {
         MusicSystem.zMusicStop();
         MusicSystem.zMusicPlay(GameRes.get()._pFrontendMusic);
         this._state.gotoState(this.StateFrontend);
      }
      
      public function gotoFrontendStraightToUpgradeScreen() : void
      {
         MusicSystem.zMusicStop();
         MusicSystem.zMusicPlay(GameRes.get()._pFrontendMusic);
         this._state.gotoState(this.StateFrontend,1);
      }
      
      public function gotoPlayingGame() : void
      {
         MusicSystem.zMusicStop();
         MusicSystem.zMusicPlay(GameRes.get()._pGameMusic);
         this._state.gotoState(this.StatePlayingGame);
      }
      
      public function gotoRestartGame() : void
      {
         MusicSystem.zMusicStop();
         MusicSystem.zMusicPlay(GameRes.get()._pGameMusic);
         this._state.gotoState(this.StateRestartGame);
      }
      
      public function gotoQuitGame() : void
      {
         this._state.gotoState(this.StateQuitGame);
      }
      
      public function gotoPaused() : void
      {
         this._state.gotoState(this.StatePaused);
      }
      
      public function gotoGameOver() : void
      {
         MusicSystem.zMusicStop();
         MusicSystem.zMusicPlay(GameRes.get()._pResultsMusic);
         this._state.gotoState(this.StateGameOver);
      }
      
      public function pauseGameLayer() : void
      {
         this._pLayers[LAYER_GAME].enableUpdate(false);
      }
      
      public function unpauseGameLayer() : void
      {
         this._pLayers[LAYER_GAME].enableUpdate(true);
      }
      
      public function selectCharacter(param1:String) : void
      {
         if(this._pPlayer)
         {
            if(this._pPlayer.getCharacterName() == param1)
            {
               return;
            }
            this._pPlayer.getController().walkOff();
            this._pPlayer = null;
         }
         this.addPlayer(param1);
      }
      
      public function StateFrontend(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pEnemyManager.setEnabled(false);
               this._pHud.hide();
               this._pHud.getScore().setStuds(0);
               this._pHud.getChimaButton().setCharge(0);
               this._pHud.getDistanceMeter().setDistance(0);
               this._pMainMenu.show();
               this._pMainMenu.reset();
               if(param2 == 1)
               {
                  this._pMainMenu.getTitleScreen().forceHide();
                  this._pMainMenu.getTitleScreen().slideLowerButtonsOn();
                  this._pMainMenu.getCharacterSelect().setupLastSelectedTribe();
                  this._pMainMenu.gotoCharacterSelect();
               }
               this._vBackgroundVelocity.x = 0;
               this._vBackgroundVelocity.y = this._pGameBg.getSpeed();
               break;
            case StateManager.Z_ACTION_UPDATE:
               break;
            case StateManager.Z_ACTION_END:
               this._pHud.getDistanceMeter().setDistance(0);
         }
         return 0;
      }
      
      public function StatePlayingGame(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._bShouldDoTutorial = true;
               this._pPlayer.getController().setEnabled(true);
               this._pEnemyManager.setEnabled(true);
               this._pHud.show();
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._vBackgroundVelocity.x = 0;
               this._vBackgroundVelocity.y = this._pGameBg.getSpeed();
               if(GameWorld.get().getTutorial().getActive() == false)
               {
                  this._fGameTime += this._fDt;
               }
               if(LegoChima.Instance().GetKeyJustPressed(LegoChima.kiKeyboardPause,true))
               {
                  this._state.gotoState(this.StatePaused);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateRestartGame(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               Main.Instance().m_app.dispatchEvent(new EventGameEnded(EventGameEnded.EVENT_GAME_ENDED,false,0));
               if(this._pPlayer)
               {
                  this._pPlayer.deleteFollowers();
                  this._pPlayer.deleteThis();
               }
               this._pPlayer = null;
               this.clearGameField();
               this._pEnemyManager.reset();
               this.addPlayer(this._lastAddedPlayer);
               if(this._pPlayer.isHealthUpgradeActive(1))
               {
                  this._pPlayer.setHealth(5);
                  this._pPlayer.setMaxHealth(5);
               }
               else if(this._pPlayer.isHealthUpgradeActive(0))
               {
                  this._pPlayer.setHealth(4);
                  this._pPlayer.setMaxHealth(4);
               }
               else
               {
                  this._pPlayer.setHealth(3);
                  this._pPlayer.setMaxHealth(3);
               }
               this._pPlayer.getController().setEnabled(true);
               this._pEnemyManager.setEnabled(true);
               this._pHud.getScore().setStuds(0);
               this._pHud.getChimaButton().setCharge(0);
               this._pHud.getDistanceMeter().setDistance(0);
               break;
            case StateManager.Z_ACTION_UPDATE:
               Main.Instance().m_app.dispatchEvent(new EventGameStarted(EventGameStarted.EVENT_GAME_STARTED,false));
               this._uFlagsCollected = 0;
               this._fGameTime = 0;
               this.addHighscoreMarker();
               this.gotoPlayingGame();
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateQuitGame(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               Main.Instance().m_app.dispatchEvent(new EventGameEnded(EventGameEnded.EVENT_GAME_ENDED,false,0));
               this._pPlayer.deleteFollowers();
               this._pPlayer.deleteThis();
               this._pPlayer = null;
               this.clearGameField();
               this._pHud.forceHide();
               break;
            case StateManager.Z_ACTION_UPDATE:
               this.gotoFrontend();
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StatePaused(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pHud.hide();
               this._pPauseMenu.show();
               this._pLayers[LAYER_GAME].enableUpdate(false);
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(LegoChima.Instance().GetKeyJustPressed(LegoChima.kiKeyboardPause,true))
               {
                  this._state.gotoState(this.StatePlayingGame);
               }
               break;
            case StateManager.Z_ACTION_END:
               this._pHud.show();
               this._pPauseMenu.hide();
               this._pLayers[LAYER_GAME].enableUpdate(true);
         }
         return 0;
      }
      
      public function StateGameOver(param1:int, param2:int) : uint
      {
         var _loc3_:Boolean = false;
         var _loc4_:Number = NaN;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               Main.Instance().m_app.dispatchEvent(new EventGameEnded(EventGameEnded.EVENT_GAME_ENDED,false,this._pHud.getScore().getStuds()));
               this._pPlayer = null;
               this._pEnemyManager.setEnabled(false);
               this._pGameOverMenu.reset();
               this._pGameOverMenu.forceShow();
               this._pGameOverMenu.getScreen().setDistanceAchieved(this._pHud.getDistanceMeter().getDistance());
               this._pGameOverMenu.getScreen().setStudsCollected(this._pHud.getScore().getStuds());
               this._pGameOverMenu.getScreen().setFlagsCollected(this._uFlagsCollected);
               this._pHud.hide();
               this._bDoGameOverFlash = false;
               this._bGameOverClearDone = false;
               this._fGameOverFlashProgress = 0;
               break;
            case StateManager.Z_ACTION_UPDATE:
               _loc3_ = false;
               if(this._pGameOverMenu.getScreen().isDone())
               {
                  if(this._pGameOverMenu.getScreen().doRetry())
                  {
                     _loc3_ = true;
                  }
                  this._bDoGameOverFlash = true;
               }
               if(this._bDoGameOverFlash)
               {
                  this._fGameOverFlashProgress += kfGameOverFlashSpeed * this._fDt;
                  if(this._fGameOverFlashProgress >= 0.5 && !this._bGameOverClearDone)
                  {
                     this._bGameOverClearDone = true;
                     this._pGameOverMenu.forceHide();
                     this.clearGameField();
                  }
                  if(this._fGameOverFlashProgress >= 1)
                  {
                     if(_loc3_)
                     {
                        this.gotoRestartGame();
                     }
                     else
                     {
                        this.gotoFrontendStraightToUpgradeScreen();
                     }
                     this._pGameOverMenu.forceHide();
                  }
                  else
                  {
                     _loc4_ = Math.sin(this._fGameOverFlashProgress * Math.PI) * Math.sin(this._fGameOverFlashProgress * Math.PI);
                     this._pGameOverMenu.getBrightener().setColour(new RGBA(255,255,255,_loc4_ * 255));
                  }
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function eventPlayerDied(param1:EventPlayerDied) : void
      {
         this._pPlayer = null;
      }
      
      public function eventFlagCollected(param1:EventPlayerFlagCollected) : void
      {
         ++this._uFlagsCollected;
      }
      
      public function update_SCG(param1:Number) : void
      {
         var _loc2_:Vec2F = null;
         this._fDt = param1;
         this._state.update();
         super.update(new EventUpdate(EventUpdate.EVENT_UPDATE,false,param1));
         if(this._bShakeGameLayer)
         {
            this._fShakeMagnitude -= this._fDt * kfShakeRate;
            if(this._fShakeMagnitude <= 0)
            {
               this._fShakeMagnitude = 0;
               this._bShakeGameLayer = false;
            }
         }
         if(this._fShakeMagnitude > 0)
         {
            _loc2_ = new Vec2F(0,this._fShakeMagnitude * kfMaxShake);
            _loc2_.rotate(Random.RandomFloatRangeUniform(0,Math.PI * 2));
            this.x = _loc2_.x;
            this.y = _loc2_.y;
         }
         else
         {
            this.x = 0;
            this.y = 0;
         }
      }
      
      public function getGroundSpeed() : Number
      {
         return this._pGameBg.getSpeed();
      }
      
      public function getGroundSpeedBoost() : Number
      {
         return this._pGameBg.getSpeedBoost();
      }
      
      public function shakeGameLayer() : void
      {
         this._bShakeGameLayer = true;
         this._fShakeMagnitude = 1;
      }
      
      public function killAllEnemies() : void
      {
         var _loc2_:WorldObj = null;
         var _loc1_:Vector.<WorldObj> = this._pLayers[LAYER_GAME].getObjectList();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ is Enemy)
            {
               (_loc2_ as Enemy).die();
            }
         }
      }
      
      public function clearPlayers() : void
      {
         var _loc2_:WorldObj = null;
         var _loc1_:Vector.<WorldObj> = this._pLayers[LAYER_GAME].getObjectList();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ is Player)
            {
               (_loc2_ as Player).deleteThis();
            }
         }
         this._pPlayer = null;
      }
      
      public function RemoveEventHandlers() : void
      {
         Main.Instance().m_app.removeEventListener(EventPlayerDied.EVENT_PLAYER_DIED,this.eventPlayerDied);
         Main.Instance().m_app.removeEventListener(EventPlayerFlagCollected.EVENT_PLAYER_FLAG_COLLECTED,this.eventFlagCollected);
      }
      
      public function initEventHandlers() : void
      {
         Main.Instance().m_app.addEventListener(EventPlayerDied.EVENT_PLAYER_DIED,this.eventPlayerDied);
         Main.Instance().m_app.addEventListener(EventPlayerFlagCollected.EVENT_PLAYER_FLAG_COLLECTED,this.eventFlagCollected);
      }
      
      public function loadCosts() : void
      {
         var _loc1_:ByteArray = ResManager.getData("res/cfg/costs.zdf");
         var _loc2_:String = _loc1_.toString();
         var _loc3_:Object = JSON.parse(_loc2_);
         var _loc4_:Object = _loc3_.costs;
         this._uUnlockCharCost = _loc4_.character_unlock;
         this._uUpgradeBaseCost = _loc4_.upgrade_cost_base;
         this._uUpgradeCostLevelMultiplier = _loc4_.upgrade_cost_level_multiplier;
      }
      
      public function addLayers() : void
      {
         this.addGameLayer();
         this.addFrontendLayer();
         this.addHudLayer();
         this.addTutorialLayer();
         this.addPauseLayer();
      }
      
      public function addGameLayer() : void
      {
         if(this._pLayers[LAYER_GAME] != null)
         {
            this.removeLayer(this._pLayers[LAYER_GAME]);
         }
         this._pLayers[LAYER_GAME] = new Layer2();
         this._pLayers[LAYER_GAME].setName("Game");
         this.addLayer(this._pLayers[LAYER_GAME]);
         this._pPhysics = new PhysicsSystem2();
         this._pPhysics.setDefaultCollisionFilter();
         this._pPhysics.setContinuousPhysics(true);
         this._pPhysics.setStepParams(6,6);
         this._pPhysics.setGravity(new Vec2F(0,0));
         this._pLayers[LAYER_GAME].addPhysicsSystem(this._pPhysics);
         this._pGameBGOverlayLayer = new World2Obj();
         this._pGameBg = new ScrollingBg(Random.RandomNumberRange(0,10000) % ScrollingBg.NUM_TILESETS,this._pGameBGOverlayLayer);
         this._pLayers[LAYER_GAME].addObject(this._pGameBg);
         this._pLayers[LAYER_GAME].addObject(this._pGameBGOverlayLayer);
         this._pLayers[LAYER_GAME].addObject(new EnvironmentParticleSpawner());
         this.m_FootParticleHolder = new GameObject();
         this._pLayers[LAYER_GAME].addObject(this.m_FootParticleHolder);
         this._pEnemyManager = new EnemyManager(GameConsts.eIceChima);
         this._pEnemyManager.setMaxEnvironmentals(3);
         this._pEnemyManager.setMaxDiscShooters(1);
         this._pEnemyManager.setMaxOrbs(1);
         this._pLayers[LAYER_GAME].addObject(this._pEnemyManager);
         this._pLayers[LAYER_GAME].addObject(this._pBonusMissions);
      }
      
      public function addFrontendLayer() : void
      {
         if(this._pLayers[LAYER_FRONTEND] != null)
         {
            this.removeLayer(this._pLayers[LAYER_FRONTEND]);
         }
         this._pLayers[LAYER_FRONTEND] = new Layer2();
         this._pLayers[LAYER_FRONTEND].setName("Frontend");
         this.addLayer(this._pLayers[LAYER_FRONTEND]);
         this._pMainMenu = new MainMenu();
         this._pLayers[LAYER_FRONTEND].addObject(this._pMainMenu);
         this._pGameOverMenu = new GameOverMenu();
         this._pGameOverMenu.forceHide();
         this._pLayers[LAYER_FRONTEND].addObject(this._pGameOverMenu);
      }
      
      public function addHudLayer() : void
      {
         if(this._pLayers[LAYER_HUD] != null)
         {
            this.removeLayer(this._pLayers[LAYER_HUD]);
         }
         this._pLayers[LAYER_HUD] = new Layer2();
         this._pLayers[LAYER_HUD].setName("Hud");
         this.addLayer(this._pLayers[LAYER_HUD]);
         this._pHud = new HUD();
         this._pLayers[LAYER_HUD].addObject(this._pHud);
         this._pHud.getPortrait().setPortrait("player_lion_ranged");
         this._pHud.forceHide();
      }
      
      public function addTutorialLayer() : void
      {
         if(this._pLayers[LAYER_TUTORIAL] != null)
         {
            this.removeLayer(this._pLayers[LAYER_TUTORIAL]);
         }
         this._pLayers[LAYER_TUTORIAL] = new Layer2();
         this._pLayers[LAYER_TUTORIAL].setName("Tutorial");
         this.addLayer(this._pLayers[LAYER_TUTORIAL]);
         this._bShouldDoTutorial = false;
         this._pTutorial = new Tutorial();
         this._pLayers[LAYER_TUTORIAL].addObject(this._pTutorial);
      }
      
      public function addPauseLayer() : void
      {
         if(this._pLayers[LAYER_PAUSE] != null)
         {
            this.removeLayer(this._pLayers[LAYER_PAUSE]);
         }
         this._pLayers[LAYER_PAUSE] = new Layer2();
         this._pLayers[LAYER_PAUSE].setName("Pause");
         this.addLayer(this._pLayers[LAYER_PAUSE]);
         this._pPauseMenu = new PauseMenu();
         this._pLayers[LAYER_PAUSE].addObject(this._pPauseMenu);
         this._pPauseMenu.forceHide();
      }
      
      public function addPlayer(param1:String) : void
      {
         if(param1 == "player_bear_ranged")
         {
            this._pPlayer = new RangedBearPlayer();
         }
         else if(param1 == "player_croc_ranged")
         {
            this._pPlayer = new RangedCrocPlayer();
         }
         else if(param1 == "player_lion_ranged")
         {
            this._pPlayer = new RangedLionPlayer();
         }
         else if(param1 == "player_saber_ranged")
         {
            this._pPlayer = new RangedSaberPlayer();
         }
         else if(param1 == "player_bear_mage")
         {
            this._pPlayer = new MageBearPlayer();
         }
         else if(param1 == "player_croc_mage")
         {
            this._pPlayer = new MageCrocPlayer();
         }
         else if(param1 == "player_lion_mage")
         {
            this._pPlayer = new MageLionPlayer();
         }
         else if(param1 == "player_saber_mage")
         {
            this._pPlayer = new MageSaberPlayer();
         }
         else if(param1 == "player_bear_warrior")
         {
            this._pPlayer = new WarriorBearPlayer();
         }
         else if(param1 == "player_croc_warrior")
         {
            this._pPlayer = new WarriorCrocPlayer();
         }
         else if(param1 == "player_lion_warrior")
         {
            this._pPlayer = new WarriorLionPlayer();
         }
         else if(param1 == "player_saber_warrior")
         {
            this._pPlayer = new WarriorSaberPlayer();
         }
         else if(param1 == "player_laval_warrior")
         {
            this._pPlayer = new WarriorLavalPlayer();
         }
         else if(param1 == "player_sirfangor_warrior")
         {
            this._pPlayer = new WarriorSirFangorPlayer();
         }
         if(this._pPlayer != null)
         {
            this._lastAddedPlayer = param1;
            this._pHud.getPortrait().setPortrait(param1);
            this._pEnemyManager.setSide((uint(this._pPlayer.getSide()) + 1) % GameConsts.NUM_CHIMA_TEAMS);
            this._pPlayer.setAnim(ChimaGameObject.CHAR_ANIM_RUN);
            this._pPlayer.getController().setEnabled(false);
            this._pPlayer.getController().setTouchControls(true);
            this._pLayers[LAYER_GAME].addObject(this._pPlayer);
         }
      }
      
      public function clearGameField() : void
      {
         var _loc2_:WorldObj = null;
         this._pEnemyManager.reset();
         var _loc1_:Vector.<WorldObj> = this._pLayers[LAYER_GAME].getObjectList();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ is Bullet)
            {
               (_loc2_ as Bullet).deleteThis();
            }
            if(_loc2_ is Pickup)
            {
               (_loc2_ as Pickup).deleteThis();
            }
            if(_loc2_ is HighscoreMarker)
            {
               (_loc2_ as HighscoreMarker).deleteThis();
            }
         }
      }
      
      public function addHighscoreMarker() : void
      {
      }
   }
}
