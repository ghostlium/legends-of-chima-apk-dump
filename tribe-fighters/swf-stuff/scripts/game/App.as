package game
{
   import flash.desktop.*;
   import flash.events.Event;
   import resource.ResManager;
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.events.TouchPhase;
   import util.Vec2F;
   import zufflin.core.MusicSystem;
   import zufflin.core.StateManager;
   import zufflin.core.TouchInfo;
   import zufflin.world.EventUpdate;
   import zufflin.world.EventUpdatePhysics;
   import zufflin.world.WorldObj;
   
   public class App extends Sprite
   {
       
      
      private var vTouchPos:Vec2F;
      
      private var vTouchDelta:Vec2F;
      
      private var bTouching:Boolean;
      
      private var bTouchMoved:Boolean;
      
      private var bTouchJustEnded:Boolean;
      
      private var touchInfo:TouchInfo;
      
      private var bTouchJustPressed:Boolean;
      
      public var _pWorld:GameWorld;
      
      public var _uHold:uint;
      
      public var _state:StateManager;
      
      public var _dt:Number;
      
      public var _pSplash:Splash;
      
      private var _WorldObjDeleteList:Vector.<WorldObj>;
      
      private var _RenderableObjDeleteList:Vector.<DisplayObject>;
      
      public function App()
      {
         super();
         this.vTouchPos = new Vec2F();
         this.vTouchDelta = new Vec2F();
         this.bTouching = false;
         this.bTouchMoved = false;
         this.bTouchJustEnded = false;
         this.bTouchJustPressed = false;
         this.touchInfo = new TouchInfo();
         this._WorldObjDeleteList = new Vector.<WorldObj>();
         this._RenderableObjDeleteList = new Vector.<DisplayObject>();
         this._state = new StateManager();
         this._state.setOwner(this);
         this._state.gotoState(this.StateInit);
      }
      
      public function Init() : void
      {
         ResManager.Initialise();
         LegoChima.Instance().GetStarlingStage().addEventListener(TouchEvent.TOUCH,this.OnStageTouch);
         LegoChima.Instance().GetFlashStage().addEventListener(Event.ACTIVATE,this.OnAppActivate);
         LegoChima.Instance().GetFlashStage().addEventListener(Event.DEACTIVATE,this.OnAppDeactivate);
      }
      
      override public function dispose() : void
      {
         LegoChima.Instance().GetFlashStage().removeEventListener(Event.ACTIVATE,this.OnAppActivate);
         LegoChima.Instance().GetFlashStage().removeEventListener(Event.DEACTIVATE,this.OnAppDeactivate);
         LegoChima.Instance().GetStarlingStage().removeEventListener(TouchEvent.TOUCH,this.OnStageTouch);
         this.removeChild(this._pWorld);
         super.dispose();
         this._pWorld.dispose();
         this._pWorld = null;
         if(MusicSystem.getSingleton())
         {
            MusicSystem.getSingleton().stop();
         }
      }
      
      private function OnAppActivate(param1:Event) : void
      {
         LegoChima.Instance().GetStarlingCurrent().start();
      }
      
      private function OnAppDeactivate(param1:Event) : void
      {
         this.suspend();
         LegoChima.Instance().GetStarlingCurrent().stop();
      }
      
      public function suspend() : void
      {
         if(this._pWorld != null)
         {
            this._pWorld.getSaveData().save();
            this._pWorld.getBonusMissions().save();
         }
      }
      
      public function StateInit(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._state.gotoState(this.StateSplash);
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateSplash(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._pSplash = new Splash();
               this.addChild(this._pSplash);
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._pSplash.SCG_update(this._dt);
               if(this._pSplash.isSplashDone())
               {
                  this._state.gotoState(this.StateLoad);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateLoad(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._uHold = 1;
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(this._uHold == 0)
               {
                  GameRes.load();
                  this.removeChild(this._pSplash,true);
                  this._pSplash = null;
                  this._pWorld = new GameWorld();
                  this.addChild(this._pWorld);
                  this._state.gotoState(this.StateGo);
               }
               else
               {
                  this._uHold--;
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateGo(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._pWorld.update_SCG(this._dt);
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function update(param1:Number) : void
      {
         var _loc4_:int = 0;
         this._dt = param1;
         var _loc2_:EventUpdatePhysics = new EventUpdatePhysics(EventUpdatePhysics.EVENT_UPDATE_PHYSICS,false,param1);
         dispatchEvent(_loc2_);
         this._state.update();
         var _loc3_:EventUpdate = new EventUpdate(EventUpdate.EVENT_UPDATE,false,param1);
         dispatchEvent(_loc3_);
         this.bTouchJustEnded = false;
         this.bTouchJustPressed = false;
         var _loc5_:int = this._RenderableObjDeleteList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            this._RenderableObjDeleteList[_loc4_].dispose();
            this._RenderableObjDeleteList[_loc4_] = null;
            _loc4_++;
         }
         this._RenderableObjDeleteList.length = 0;
         _loc5_ = this._WorldObjDeleteList.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            this._WorldObjDeleteList[_loc4_].dispose();
            this._WorldObjDeleteList[_loc4_] = null;
            _loc4_++;
         }
         this._WorldObjDeleteList.length = 0;
      }
      
      public function SCG_AddWorldObjectForDeletion(param1:WorldObj) : void
      {
         var _loc2_:int = this._WorldObjDeleteList.indexOf(param1);
         if(_loc2_ == -1)
         {
            this._WorldObjDeleteList.push(param1);
         }
      }
      
      public function SCG_AddRenderableObjectForDeletion(param1:DisplayObject) : void
      {
         var _loc2_:int = this._RenderableObjDeleteList.indexOf(param1);
         if(_loc2_ == -1)
         {
            this._RenderableObjDeleteList.push(param1);
         }
      }
      
      public function screenResized(param1:int, param2:int) : void
      {
      }
      
      private function OnStageTouch(param1:TouchEvent) : void
      {
         var _loc2_:Touch = param1.getTouch(LegoChima.Instance().GetStarlingStage());
         if(_loc2_)
         {
            if(_loc2_.phase == TouchPhase.BEGAN)
            {
               this.vTouchPos.x = _loc2_.globalX * LegoChima.kfInvWindowScaleX;
               this.vTouchPos.y = _loc2_.globalY * LegoChima.kfInvWindowScaleY;
               this.vTouchDelta.x = 0;
               this.vTouchDelta.y = 0;
               this.bTouching = true;
               this.bTouchMoved = false;
               this.bTouchJustEnded = false;
               this.bTouchJustPressed = true;
               this.touchInfo.pressed = true;
               this.touchInfo.position.x = this.vTouchPos.x;
               this.touchInfo.position.y = this.vTouchPos.y;
               this.touchInfo.delta.x = 0;
               this.touchInfo.delta.y = 0;
            }
            else if(_loc2_.phase == TouchPhase.MOVED)
            {
               this.vTouchPos.x = _loc2_.globalX * LegoChima.kfInvWindowScaleX;
               this.vTouchPos.y = _loc2_.globalY * LegoChima.kfInvWindowScaleY;
               this.vTouchDelta.x = (_loc2_.globalX - _loc2_.previousGlobalX) * LegoChima.kfInvWindowScaleX;
               this.vTouchDelta.y = (_loc2_.globalY - _loc2_.previousGlobalY) * LegoChima.kfInvWindowScaleY;
               this.bTouchMoved = true;
               this.bTouchJustEnded = false;
               this.touchInfo.pressed = true;
               this.touchInfo.position.x = this.vTouchPos.x;
               this.touchInfo.position.y = this.vTouchPos.y;
               this.touchInfo.delta.x = this.vTouchDelta.x;
               this.touchInfo.delta.y = this.vTouchDelta.y;
            }
            else if(_loc2_.phase == TouchPhase.ENDED)
            {
               this.bTouching = false;
               this.bTouchMoved = false;
               this.bTouchJustEnded = true;
               this.bTouchJustPressed = false;
               this.touchInfo.pressed = false;
            }
         }
      }
      
      public function GetTouchPos() : Vec2F
      {
         return this.vTouchPos;
      }
      
      public function GetTouchInfo() : TouchInfo
      {
         return this.touchInfo;
      }
      
      public function GetTouchJustReleased() : Boolean
      {
         return this.bTouchJustEnded;
      }
      
      public function GetTouchOrKeyJustReleased() : Boolean
      {
         if(this.bTouchJustEnded)
         {
            return true;
         }
         return LegoChima.Instance().GetIsAnyKeyJustReleased();
      }
      
      public function GetTouchJustPressed() : Boolean
      {
         return this.bTouchJustPressed;
      }
      
      public function GetTouchOrKeyJustPressed() : Boolean
      {
         if(this.bTouchJustPressed)
         {
            return true;
         }
         return LegoChima.Instance().GetIsAnyKeyJustPressed();
      }
      
      public function GetIsTouchPressed() : Boolean
      {
         return this.bTouching;
      }
   }
}
