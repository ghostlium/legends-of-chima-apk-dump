package game.objects.controllers
{
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.Player;
   import game.objects.events.EventShowTutorial;
   import game.objects.fx.ShadowedAnimRenderable;
   import game.objects.guns.PlayerGun;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.events.TouchPhase;
   import util.MathsHelper;
   import util.Vec2F;
   import util.Vec3F;
   import zufflin.core.StateManager;
   import zufflin.math.zMatrix3f;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.Component2;
   
   public class PlayerController extends Component2
   {
      
      public static const PLAYER_TILT_MAX_ANGLE:Number = 10;
      
      public static const PLAYER_TILT_THRESHOLD_ANGLE:Number = 2.5;
      
      public static const kfPlayerWalkOnSpeed:Number = 1;
      
      public static const kfPlayerMaxVel:Number = 420;
      
      public static const kfPlayerTouchSlowRange:Number = 40;
      
      public static const kfFollowerLerpRate:Number = 15;
       
      
      public var _state:StateManager;
      
      public var _animationState:StateManager;
      
      public var _fDt:Number;
      
      public var _bInvincible:Boolean;
      
      public var _bEnabled:Boolean;
      
      public var _fWalkOnProgress:Number;
      
      public var _vStartPos:Vec2F;
      
      public var _vWalkOnTarget:Vec2F;
      
      public var _vCalibration:Vec3F;
      
      public var _vOrientation:Vec3F;
      
      public var _bTouchControls:Boolean;
      
      public var _bFollowingTouch:Boolean;
      
      public var _uTouch:uint;
      
      public var _vTouchPos:Vec2F;
      
      public var _vTouchDiff:Vec2F;
      
      public var _fHAngle:Number;
      
      public var _fVAngle:Number;
      
      public var _fHAngleTarget:Number;
      
      public var _fVAngleTarget:Number;
      
      public var _uFireOnFrame:uint;
      
      public var _uRunCyclesBeforeFire:uint;
      
      public var _uCurrRunCycle:uint;
      
      public var _bFired:Boolean;
      
      public var _bShownTutorial:Boolean;
      
      public var _pPlayer:Player;
      
      public var _vFollowOffset:Vec2F;
      
      public var _pAnims:Vector.<ShadowedAnimRenderable>;
      
      public function PlayerController(param1:Player)
      {
         super();
         this._vTouchPos = new Vec2F();
         this._vTouchDiff = new Vec2F();
         this._fHAngle = 0;
         this._fVAngle = 0;
         this._fHAngleTarget = 0;
         this._fVAngleTarget = 0;
         this._bEnabled = true;
         this._fWalkOnProgress = 0;
         this._fDt = 0;
         this._bInvincible = false;
         this._bTouchControls = false;
         this._bFollowingTouch = false;
         this._uFireOnFrame = 0;
         this._uRunCyclesBeforeFire = 0;
         this._uCurrRunCycle = 0;
         this._pPlayer = param1;
         this._vFollowOffset = new Vec2F();
         this._bShownTutorial = false;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         Main.Instance().m_app.addEventListener(TouchEvent.TOUCH,this.eventTouch);
         Main.Instance().m_app.addEventListener(EventShowTutorial.EVENT_SHOW_TUTORIAL,this.eventShowTutorial);
         this._vCalibration = new Vec3F(0,0,-1);
         this._vOrientation = new Vec3F();
         this._vOrientation.x = this._vCalibration.x;
         this._vOrientation.y = this._vCalibration.y;
         this._vOrientation.z = this._vCalibration.z;
         this._pAnims = param1.getAnims();
         this._state = new StateManager();
         this._state.setOwner(this);
         this._state.gotoState(this.StateWalkOn);
         this._animationState = new StateManager();
         this._animationState.setOwner(this);
         this._animationState.gotoState(this.StateRun);
         this._bShownTutorial = GameWorld.get().getSaveData().getTutorialShown();
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(TouchEvent.TOUCH,this.eventTouch);
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         Main.Instance().m_app.removeEventListener(EventShowTutorial.EVENT_SHOW_TUTORIAL,this.eventShowTutorial);
         super.dispose();
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         this._bEnabled = param1;
      }
      
      public function setStartPos(param1:Vec2F) : void
      {
         this._vStartPos = param1;
      }
      
      public function setWalkOnTarget(param1:Vec2F) : void
      {
         this._vWalkOnTarget = param1;
      }
      
      public function setFireOnFrame(param1:uint) : void
      {
         this._uFireOnFrame = param1;
      }
      
      public function setRunCyclesBeforeFire(param1:uint) : void
      {
         this._uRunCyclesBeforeFire = param1;
      }
      
      public function setTouchControls(param1:Boolean) : void
      {
         this._bTouchControls = param1;
      }
      
      public function setFollowOffset(param1:Vec2F) : void
      {
         this._vFollowOffset = param1;
      }
      
      public function setInvincible(param1:Boolean) : void
      {
         this._bInvincible = param1;
      }
      
      public function eventShowTutorial(param1:EventShowTutorial) : void
      {
         this._bShownTutorial = false;
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         this._fDt = param1.getTime().dt;
         this._state.update();
      }
      
      public function eventTouch(param1:TouchEvent) : void
      {
         var _loc2_:Touch = null;
         if(this._bTouchControls)
         {
            _loc2_ = param1.getTouch(Main.Instance().m_app);
            if(_loc2_)
            {
               if(_loc2_.phase == TouchPhase.BEGAN)
               {
                  if(!this._bFollowingTouch)
                  {
                     this._bFollowingTouch = true;
                     this._vTouchPos.x = _loc2_.globalX;
                     this._vTouchPos.y = _loc2_.globalY;
                     this._vTouchDiff.x = (getWorldObj() as ChimaGameObject).getPosition().x - this._vTouchPos.x;
                     this._vTouchDiff.y = (getWorldObj() as ChimaGameObject).getPosition().y - this._vTouchPos.y;
                  }
               }
               else if(_loc2_.phase == TouchPhase.MOVED)
               {
                  if(this._bFollowingTouch)
                  {
                     this._vTouchPos.x = _loc2_.globalX;
                     this._vTouchPos.y = _loc2_.globalY;
                  }
               }
               else if(_loc2_.phase == TouchPhase.ENDED)
               {
                  if(this._bFollowingTouch)
                  {
                     this._bFollowingTouch = false;
                  }
               }
            }
         }
      }
      
      public function updatePCControls() : void
      {
         var _loc1_:Number = 0.1;
         var _loc2_:Number = 0.1;
         this._fHAngleTarget = 0;
         this._fVAngleTarget = 0;
         if(LegoChima.Instance().GetKeyIsPressed(LegoChima.kiKeyboardRight))
         {
            this._fHAngleTarget = MathsHelper.DegToRad(PLAYER_TILT_MAX_ANGLE);
         }
         else if(LegoChima.Instance().GetKeyIsPressed(LegoChima.kiKeyboardLeft))
         {
            this._fHAngleTarget = -1 * MathsHelper.DegToRad(PLAYER_TILT_MAX_ANGLE);
         }
         if(LegoChima.Instance().GetKeyIsPressed(LegoChima.kiKeyboardUp))
         {
            this._fVAngleTarget = MathsHelper.DegToRad(PLAYER_TILT_MAX_ANGLE);
         }
         else if(LegoChima.Instance().GetKeyIsPressed(LegoChima.kiKeyboardDown))
         {
            this._fVAngleTarget = -1 * MathsHelper.DegToRad(PLAYER_TILT_MAX_ANGLE);
         }
         this.createOrientation(_loc1_,_loc2_);
      }
      
      public function createOrientation(param1:Number, param2:Number) : void
      {
         this._fHAngle = MathsHelper.Lerp(this._fHAngle,this._fHAngleTarget,param1);
         this._fVAngle = MathsHelper.Lerp(this._fVAngle,this._fVAngleTarget,param2);
         var _loc3_:Vec3F = new Vec3F(-1,0,0);
         var _loc4_:Vec3F = new Vec3F(this._vCalibration.x,this._vCalibration.y,this._vCalibration.z);
         var _loc5_:zMatrix3f;
         (_loc5_ = new zMatrix3f()).setIdentity();
         _loc5_.rotate(Math.PI * 0.5,_loc3_);
         _loc5_.transform(_loc4_);
         _loc5_.setIdentity();
         _loc5_.rotate(this._fVAngle,_loc3_);
         _loc5_.rotate(this._fHAngle,_loc4_);
         this._vOrientation.x = this._vCalibration.x;
         this._vOrientation.y = this._vCalibration.y;
         this._vOrientation.z = this._vCalibration.z;
         _loc5_.transform(this._vOrientation);
      }
      
      public function setAnimation(param1:int) : void
      {
         var _loc2_:int = this._pPlayer.getCurrAnim();
         this._pAnims[_loc2_].setEnabled(false);
         this._pAnims[param1].setEnabled(true);
         this._pAnims[param1].setFrame(0);
         this._pAnims[param1].play(false,this._pPlayer.getAnimSpeed());
         this._pPlayer.setCurrAnimValue(param1);
      }
      
      public function walkOff() : void
      {
         this._state.gotoState(this.StateWalkOff);
      }
      
      public function canTakeDamage() : Boolean
      {
         if(this._pPlayer.getFollowPlayer() != null && this._state.getCurState() == this.StateWalkOn)
         {
            return false;
         }
         if(this._bInvincible)
         {
            return false;
         }
         return true;
      }
      
      public function StateWalkOn(param1:int, param2:int) : uint
      {
         var _loc3_:Vec2F = null;
         var _loc4_:Vec2F = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._animationState.gotoState(this.StateRun);
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._animationState.update();
               _loc3_ = new Vec2F();
               _loc4_ = new Vec2F(this._vWalkOnTarget.x,this._vWalkOnTarget.y);
               if(this._pPlayer.getFollowPlayer() != null)
               {
                  _loc4_.x = this._pPlayer.getFollowPlayer().getPosition().x + this._vFollowOffset.x;
                  _loc4_.y = this._pPlayer.getFollowPlayer().getPosition().y + this._vFollowOffset.y;
               }
               _loc3_.x = MathsHelper.Lerp(this._vStartPos.x,_loc4_.x,this._fWalkOnProgress);
               _loc3_.y = MathsHelper.Lerp(this._vStartPos.y,_loc4_.y,this._fWalkOnProgress);
               this._fWalkOnProgress += kfPlayerWalkOnSpeed * this._fDt;
               if(this._fWalkOnProgress >= 1)
               {
                  this._state.gotoState(this.StateNormal);
                  this._fWalkOnProgress = 1;
               }
               (getWorldObj() as ChimaGameObject).setPosition(_loc3_);
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateNormal(param1:int, param2:int) : uint
      {
         var _loc3_:Vec2F = null;
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         var _loc6_:Vec2F = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Vec2F = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._animationState.update();
               if(this._bEnabled)
               {
                  this.updatePCControls();
                  if(this._pPlayer.getFollowPlayer() == null)
                  {
                     if(!this._bShownTutorial && GameWorld.get().getShouldDoTutorial())
                     {
                        GameWorld.get().getTutorial().setActive(true);
                        this._bShownTutorial = true;
                        GameWorld.get().getSaveData().setTutorialShown(this._bShownTutorial);
                     }
                  }
                  _loc3_ = new Vec2F((getWorldObj() as ChimaGameObject).getPosition().x,(getWorldObj() as ChimaGameObject).getPosition().y);
                  if(this._pPlayer.getFollowPlayer() != null)
                  {
                     (_loc4_ = new Vec2F()).x = this._pPlayer.getFollowPlayer().getPosition().x + this._vFollowOffset.x;
                     _loc4_.y = this._pPlayer.getFollowPlayer().getPosition().y + this._vFollowOffset.y;
                     _loc3_.x = MathsHelper.Lerp(_loc3_.x,_loc4_.x,kfFollowerLerpRate * this._fDt);
                     _loc3_.y = MathsHelper.Lerp(_loc3_.y,_loc4_.y,kfFollowerLerpRate * this._fDt);
                  }
                  else if(this._bTouchControls)
                  {
                     if(this._bFollowingTouch)
                     {
                        _loc5_ = new Vec2F(this._vTouchPos.x + this._vTouchDiff.x,this._vTouchPos.y + this._vTouchDiff.y);
                        _loc7_ = (_loc6_ = new Vec2F(_loc5_.x - _loc3_.x,_loc5_.y - _loc3_.y)).length;
                        if(Math.abs(_loc7_) > 0)
                        {
                           _loc7_ /= kfPlayerTouchSlowRange;
                           _loc7_ = MathsHelper.Clamp(_loc7_,-1,1);
                           _loc6_.normalize(1);
                           _loc3_.x += _loc6_.x * kfPlayerMaxVel * this._fDt * _loc7_;
                           _loc3_.y += _loc6_.y * kfPlayerMaxVel * this._fDt * _loc7_;
                        }
                     }
                     else
                     {
                        _loc8_ = Math.sin(this._vOrientation.x);
                        _loc8_ = MathsHelper.Clamp(_loc8_,MathsHelper.DegToRad(-1 * PLAYER_TILT_MAX_ANGLE),MathsHelper.DegToRad(PLAYER_TILT_MAX_ANGLE));
                        if(Math.abs(MathsHelper.RadToDeg(_loc8_)) > PLAYER_TILT_THRESHOLD_ANGLE)
                        {
                           _loc3_.x += kfPlayerMaxVel * this._fDt * (_loc8_ / MathsHelper.DegToRad(PLAYER_TILT_MAX_ANGLE));
                        }
                        _loc8_ = Math.sin(this._vOrientation.y);
                        _loc8_ = MathsHelper.Clamp(_loc8_,MathsHelper.DegToRad(-1 * PLAYER_TILT_MAX_ANGLE),MathsHelper.DegToRad(PLAYER_TILT_MAX_ANGLE));
                        if(Math.abs(MathsHelper.RadToDeg(_loc8_)) > PLAYER_TILT_THRESHOLD_ANGLE)
                        {
                           _loc3_.y += kfPlayerMaxVel * this._fDt * (_loc8_ / MathsHelper.DegToRad(PLAYER_TILT_MAX_ANGLE));
                        }
                     }
                  }
                  _loc3_.x = MathsHelper.Clamp(_loc3_.x,0,LegoChima.Instance().zGetScreenWidth());
                  _loc3_.y = MathsHelper.Clamp(_loc3_.y,0,LegoChima.Instance().zGetScreenHeight());
                  (getWorldObj() as ChimaGameObject).setPosition(_loc3_);
               }
               else
               {
                  (_loc9_ = (getWorldObj() as ChimaGameObject).getPosition()).x = MathsHelper.Lerp(_loc9_.x,0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.05);
                  (getWorldObj() as ChimaGameObject).setPosition(_loc9_);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateWalkOff(param1:int, param2:int) : uint
      {
         var _loc3_:Vec2F = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._vStartPos = this._pPlayer.getPosition();
               this._vWalkOnTarget.x = this._vStartPos.x + 0;
               this._vWalkOnTarget.y = this._vStartPos.y + -1 * Number(LegoChima.Instance().zGetScreenHeight());
               this._fWalkOnProgress = 0;
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._animationState.update();
               _loc3_ = new Vec2F();
               _loc3_.x = MathsHelper.Lerp(this._vStartPos.x,this._vWalkOnTarget.x,this._fWalkOnProgress);
               _loc3_.y = MathsHelper.Lerp(this._vStartPos.y,this._vWalkOnTarget.y,this._fWalkOnProgress);
               this._fWalkOnProgress += kfPlayerWalkOnSpeed * 0.75 * this._fDt;
               if(this._fWalkOnProgress >= 1)
               {
                  this._pPlayer.deleteThis();
               }
               (getWorldObj() as ChimaGameObject).setPosition(_loc3_);
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateRun(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._uCurrRunCycle = 0;
               this.setAnimation(ChimaGameObject.CHAR_ANIM_RUN);
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(this._pAnims[this._pPlayer.getCurrAnim()].isAnimating() == false)
               {
                  if(this._uCurrRunCycle < this._uRunCyclesBeforeFire || !this._bEnabled)
                  {
                     this.setAnimation(ChimaGameObject.CHAR_ANIM_RUN);
                     ++this._uCurrRunCycle;
                  }
                  else
                  {
                     this._animationState.gotoState(this.StateRunShoot);
                  }
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateRunShoot(param1:int, param2:int) : uint
      {
         var _loc3_:PlayerGun = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this.setAnimation(ChimaGameObject.CHAR_ANIM_RUN_SHOOT);
               this._bFired = false;
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(this._pAnims[this._pPlayer.getCurrAnim()].isAnimating() == false)
               {
                  if(this._uRunCyclesBeforeFire == 0)
                  {
                     this.setAnimation(ChimaGameObject.CHAR_ANIM_RUN_SHOOT);
                     this._bFired = false;
                  }
                  else
                  {
                     this._animationState.gotoState(this.StateRun);
                  }
               }
               else if(!this._bFired && this._pAnims[this._pPlayer.getCurrAnim()].getFrame() == this._uFireOnFrame)
               {
                  this._bFired = true;
                  _loc3_ = (getWorldObj() as Player).getGun();
                  if(_loc3_ != null)
                  {
                     _loc3_.fire();
                  }
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
   }
}
