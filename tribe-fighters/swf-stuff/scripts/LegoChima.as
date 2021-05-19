package
{
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import flash.utils.getTimer;
   import game.control.CobraText;
   import starling.core.Starling;
   import starling.display.Stage;
   import starling.events.Event;
   import util.KeyboardInput;
   import util.Vec2F;
   
   public class LegoChima extends Sprite
   {
      
      public static const kbDEBUG_ShowStats:Boolean = false;
      
      public static const kb_BaselineConstrained:Boolean = true;
      
      public static const kiWindowHeight:int = 700;
      
      public static const kiWindowWidth:int = 525;
      
      public static const kiScreenHeight:int = 1024;
      
      public static const kiScreenWidth:int = 768;
      
      public static const kfWindowScaleX:Number = Number(kiWindowHeight) / Number(kiScreenHeight);
      
      public static const kfWindowScaleY:Number = Number(kiWindowWidth) / Number(kiScreenWidth);
      
      public static const kfInvWindowScaleX:Number = 1 / kfWindowScaleX;
      
      public static const kfInvWindowScaleY:Number = 1 / kfWindowScaleY;
      
      public static const kiHalfScreenHeight:int = kiScreenHeight / 2;
      
      public static const kiHalfScreenWidth:int = kiScreenWidth / 2;
      
      public static const kScreenSize:Vec2F = new Vec2F(kiScreenWidth,kiScreenHeight);
      
      public static const kScreenCentre:Vec2F = new Vec2F(kiScreenWidth / 2,kiScreenHeight / 2);
      
      private static var m_Instance:LegoChima = null;
      
      public static var gsiLanguage:int = CobraText.Z_LANG_ENGLISH_US;
      
      public static const DEBUG_DRAW_PHYSICS:Boolean = false;
      
      public static var DBGPhysSprite:Sprite;
      
      public static var DBGPhysScale:Number;
      
      public static const kiKeyboardUp:int = 0;
      
      public static const kiKeyboardDown:int = 1;
      
      public static const kiKeyboardLeft:int = 2;
      
      public static const kiKeyboardRight:int = 3;
      
      public static const kiKeyboardSuperweapon:int = 4;
      
      public static const kiKeyboardPause:int = 5;
      
      public static const kiKeyboardMax:int = 6;
      
      public static var m_fTimeStep:Number = 1 / 60;
       
      
      private var m_Starling:Starling;
      
      private var m_iTime:int;
      
      private var _aKeyInputs:Vector.<KeyboardInput>;
      
      public function LegoChima()
      {
         super();
         m_Instance = this;
         if(stage)
         {
            this.StageInitialise();
         }
         else
         {
            addEventListener(flash.events.Event.ADDED_TO_STAGE,this.StageInitialise);
         }
      }
      
      public static function Instance() : LegoChima
      {
         return m_Instance;
      }
      
      public static function GetScreenSize() : Vec2F
      {
         return Vec2F(kScreenSize.clone());
      }
      
      public static function GetScreenCentre() : Vec2F
      {
         return Vec2F(kScreenCentre.clone());
      }
      
      public static function GetHalfScreenWidth() : Number
      {
         return kiHalfScreenWidth;
      }
      
      public static function GetHalfScreenHeight() : Number
      {
         return kiHalfScreenHeight;
      }
      
      public static function GetScreenWidth() : Number
      {
         return kiScreenWidth;
      }
      
      public static function GetScreenHeight() : Number
      {
         return kiScreenHeight;
      }
      
      private function StageInitialise(param1:flash.events.Event = null) : void
      {
         removeEventListener(flash.events.Event.ADDED_TO_STAGE,this.StageInitialise);
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.align = StageAlign.TOP_LEFT;
         if(stage.stageWidth != 0 && stage.stageHeight != 0)
         {
            this.CreateStarling();
         }
         else
         {
            stage.addEventListener(flash.events.Event.RESIZE,this.onResize);
         }
      }
      
      private function onResize(param1:flash.events.Event) : void
      {
         if(stage.stageWidth != 0 && stage.stageHeight != 0)
         {
            stage.removeEventListener(flash.events.Event.RESIZE,this.onResize);
            this.CreateStarling();
         }
      }
      
      private function CreateStarling() : void
      {
         Starling.handleLostContext = true;
         if(kb_BaselineConstrained)
         {
            this.m_Starling = new Starling(Main,stage,null,null,"auto","baselineConstrained");
         }
         else
         {
            this.m_Starling = new Starling(Main,stage,null,null,"auto","baseline");
         }
         this.m_Starling.addEventListener(starling.events.Event.ROOT_CREATED,this.StarlingRootCreated);
      }
      
      private function StarlingRootCreated(param1:starling.events.Event) : void
      {
         this.m_Starling.removeEventListener(starling.events.Event.ROOT_CREATED,this.StarlingRootCreated);
         var _loc2_:Rectangle = new Rectangle(0,0,kiWindowWidth,kiWindowHeight);
         this.m_Starling.viewPort = _loc2_;
         this.m_Starling.stage.stageWidth = kiWindowWidth;
         this.m_Starling.stage.stageHeight = kiWindowHeight;
         if(DEBUG_DRAW_PHYSICS)
         {
            DBGPhysScale = kiWindowHeight / kiScreenHeight;
            DBGPhysSprite = new Sprite();
            addChild(DBGPhysSprite);
         }
         this.DetectLanguage();
         this.m_Starling.start();
         Main.Instance().Initialise();
         this.m_iTime = getTimer();
         stage.addEventListener(flash.events.Event.ENTER_FRAME,this.EnterFrame);
         stage.frameRate = 60;
         this._aKeyInputs = new Vector.<KeyboardInput>(kiKeyboardMax,true);
         this._aKeyInputs[kiKeyboardUp] = new KeyboardInput(new <uint>[Keyboard.UP,Keyboard.W,Keyboard.Z]);
         this._aKeyInputs[kiKeyboardDown] = new KeyboardInput(new <uint>[Keyboard.DOWN,Keyboard.S]);
         this._aKeyInputs[kiKeyboardLeft] = new KeyboardInput(new <uint>[Keyboard.LEFT,Keyboard.A,Keyboard.Q]);
         this._aKeyInputs[kiKeyboardRight] = new KeyboardInput(new <uint>[Keyboard.RIGHT,Keyboard.D]);
         this._aKeyInputs[kiKeyboardSuperweapon] = new KeyboardInput(new <uint>[Keyboard.SPACE,Keyboard.CONTROL]);
         this._aKeyInputs[kiKeyboardPause] = new KeyboardInput(new <uint>[Keyboard.P]);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,this.HandleKeyDown);
         stage.addEventListener(KeyboardEvent.KEY_UP,this.HandleKeyUp);
      }
      
      public function GetStarlingStage() : starling.display.Stage
      {
         return this.m_Starling.stage;
      }
      
      public function GetStarlingCurrent() : Starling
      {
         return Starling.current;
      }
      
      public function GetFlashStage() : flash.display.Stage
      {
         return stage;
      }
      
      private function EnterFrame(param1:flash.events.Event) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:Number = (_loc2_ - this.m_iTime) * 0.001;
         this.m_iTime = _loc2_;
         if(_loc3_ > 0.0667)
         {
            _loc3_ = 0.0667;
         }
         m_fTimeStep = _loc3_;
         Main.Instance().Tick(_loc3_);
         var _loc4_:int = 0;
         while(_loc4_ < kiKeyboardMax)
         {
            this._aKeyInputs[_loc4_].Tick();
            _loc4_++;
         }
      }
      
      public function GetTimeMS() : Number
      {
         return this.m_iTime;
      }
      
      public function DetectLanguage() : void
      {
         var _loc1_:String = Preloader.m_LanguageFlashVar.toLocaleLowerCase();
         var _loc2_:String = _loc1_.length > 2 ? _loc1_.substr(0,2) : _loc1_;
         if(_loc1_ == "es-mx")
         {
            gsiLanguage = CobraText.Z_LANG_SPANISH;
         }
         else if(_loc2_ == "mx")
         {
            gsiLanguage = CobraText.Z_LANG_SPANISH;
         }
         else if(_loc2_ == "de")
         {
            gsiLanguage = CobraText.Z_LANG_GERMAN;
         }
         else if(_loc2_ == "es")
         {
            gsiLanguage = CobraText.Z_LANG_SPANISH;
         }
         else if(_loc2_ == "fr")
         {
            gsiLanguage = CobraText.Z_LANG_FRENCH;
         }
         else if(_loc2_ == "it")
         {
            gsiLanguage = CobraText.Z_LANG_ITALIAN;
         }
         else if(_loc2_ == "pt")
         {
            gsiLanguage = CobraText.Z_LANG_PORTUGUESE;
         }
         else if(_loc2_ == "da")
         {
            gsiLanguage = CobraText.Z_LANG_DANISH;
         }
         else if(_loc2_ == "nl")
         {
            gsiLanguage = CobraText.Z_LANG_DUTCH;
         }
         else if(_loc2_ == "ru")
         {
            gsiLanguage = CobraText.Z_LANG_RUSSIAN;
         }
         else if(_loc2_ == "ko")
         {
            gsiLanguage = CobraText.Z_LANG_KOREAN;
         }
         else if(_loc2_ == "zh")
         {
            gsiLanguage = CobraText.Z_LANG_CHINESE_SIMPLIFIED;
         }
         else if(_loc2_ == "cs")
         {
            gsiLanguage = CobraText.Z_LANG_CZECH;
         }
         else if(_loc2_ == "fi")
         {
            gsiLanguage = CobraText.Z_LANG_FINNISH;
         }
         else if(_loc2_ == "hu")
         {
            gsiLanguage = CobraText.Z_LANG_HUNGARIAN;
         }
         else if(_loc2_ == "ja")
         {
            gsiLanguage = CobraText.Z_LANG_JAPANESE;
         }
         else if(_loc2_ == "no")
         {
            gsiLanguage = CobraText.Z_LANG_NORWEGIAN;
         }
         else if(_loc2_ == "pl")
         {
            gsiLanguage = CobraText.Z_LANG_POLISH;
         }
         else if(_loc2_ == "po")
         {
            gsiLanguage = CobraText.Z_LANG_POLISH;
         }
         else if(_loc2_ == "sv")
         {
            gsiLanguage = CobraText.Z_LANG_SWEDISH;
         }
         else
         {
            gsiLanguage = CobraText.Z_LANG_ENGLISH_US;
         }
      }
      
      public function HandleKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < kiKeyboardMax)
         {
            this._aKeyInputs[_loc2_].HandleUpEvent(param1.keyCode);
            _loc2_++;
         }
      }
      
      public function HandleKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < kiKeyboardMax)
         {
            this._aKeyInputs[_loc2_].HandleDownEvent(param1.keyCode);
            _loc2_++;
         }
      }
      
      public function GetKeyJustPressed(param1:int, param2:Boolean = false) : Boolean
      {
         var _loc3_:Boolean = this._aKeyInputs[param1]._bJustPressed;
         if(param2)
         {
            this._aKeyInputs[param1]._bJustPressed = false;
         }
         return _loc3_;
      }
      
      public function GetKeyJustReleased(param1:int) : Boolean
      {
         return this._aKeyInputs[param1]._bJustReleased;
      }
      
      public function GetKeyIsPressed(param1:int) : Boolean
      {
         return this._aKeyInputs[param1]._bIsPressed;
      }
      
      public function GetIsAnyKeyJustPressed() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < kiKeyboardMax)
         {
            if(this._aKeyInputs[_loc1_]._bJustPressed)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function GetIsAnyKeyJustReleased() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < kiKeyboardMax)
         {
            if(this._aKeyInputs[_loc1_]._bJustReleased)
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function zGetScreenHeight() : int
      {
         return kiScreenHeight;
      }
      
      public function zGetScreenWidth() : int
      {
         return kiScreenWidth;
      }
   }
}
