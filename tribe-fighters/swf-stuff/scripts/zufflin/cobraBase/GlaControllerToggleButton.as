package zufflin.cobraBase
{
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.events.TouchPhase;
   import util.MathsHelper;
   import zufflin.core.RGBA;
   import zufflin.core.zSoundList;
   
   public class GlaControllerToggleButton extends GlaControllerGuiObject
   {
       
      
      public var pNormalNo:GlaControllerScene;
      
      public var pPressedNo:GlaControllerScene;
      
      public var pNormalYes:GlaControllerScene;
      
      public var pPressedYes:GlaControllerScene;
      
      public var pNotActive:GlaControllerScene;
      
      public var bTicked:Boolean;
      
      public var bHighlighted:Boolean;
      
      public var actionMsg:String;
      
      public var text:String;
      
      public var textColor:RGBA;
      
      public var buttonSoundDown:zSoundList;
      
      public var buttonSoundUp:zSoundList;
      
      public var buttonChannel:int;
      
      private var bJustPressed:Boolean;
      
      public function GlaControllerToggleButton(param1:GlaController, param2:GlaElementGameObj)
      {
         super(param1,param2);
         this.bHighlighted = false;
         this.bTicked = false;
         this.pNormalNo = null;
         this.pPressedNo = null;
         this.pNormalYes = null;
         this.pPressedYes = null;
         this.pNotActive = null;
         this.textColor = new RGBA(255,255,255,255);
         this.buttonSoundDown = GlaControllerButton.defButtonSoundDown;
         this.buttonSoundUp = GlaControllerButton.defButtonSoundUp;
         this.buttonChannel = GlaControllerButton.defbuttonChannel;
         this.bJustPressed = false;
      }
      
      public function getText() : String
      {
         return this.text;
      }
      
      override public function initialise() : void
      {
         var _loc2_:GlaElementRectangle = null;
         this.text = getSrcGameObj().getPropString("Text");
         this.actionMsg = getSrcGameObj().getPropString("Action");
         var _loc1_:GlaSceneState = getSrcGameObj().getPropRefScene_State("Button");
         if(_loc1_)
         {
            this.pNormalNo = new GlaControllerScene(null,_loc1_);
            this.pPressedNo = new GlaControllerScene(null,_loc1_);
            this.pNormalYes = new GlaControllerScene(null,_loc1_);
            this.pPressedYes = new GlaControllerScene(null,_loc1_);
            this.pNormalNo.setFrame(0);
            this.pPressedNo.setFrame(1);
            this.pNormalYes.setFrame(2);
            this.pPressedYes.setFrame(3);
            if(_loc1_.getNumFrames() == 5)
            {
               this.pNotActive = new GlaControllerScene(null,_loc1_);
               this.pNotActive.setFrame(4);
            }
            _loc2_ = _loc1_.findControlRect("hitbox");
            if(_loc2_)
            {
               hitBox = _loc2_.getAABox(0);
            }
            else
            {
               hitBox = this.pNormalNo.getSrcSceneState().getMaxBounds();
            }
            if(this.actionMsg.length == 0)
            {
               this.actionMsg = _loc1_.getPropString("Action");
            }
         }
         if(this.pNormalNo)
         {
            this.addChild(this.pNormalNo);
         }
         if(this.pPressedNo)
         {
            this.addChild(this.pPressedNo);
         }
         if(this.pNormalYes)
         {
            this.addChild(this.pNormalYes);
         }
         if(this.pPressedYes)
         {
            this.addChild(this.pPressedYes);
         }
         if(this.pNotActive)
         {
            this.addChild(this.pNotActive);
         }
         this.pNormalNo.playChildrenAnimation(true,0.5);
         this.pPressedNo.playChildrenAnimation(true,0.5);
         this.pNormalYes.playChildrenAnimation(true,0.5);
         this.pPressedYes.playChildrenAnimation(true,0.5);
         this.setFrame(0);
         this.addEventListener(TouchEvent.TOUCH,this.eventTouch);
         this.bJustPressed = false;
      }
      
      private function eventTouch(param1:TouchEvent) : void
      {
         var _loc2_:Touch = param1.getTouch(this);
         if(_loc2_)
         {
            if(_loc2_.phase == TouchPhase.BEGAN)
            {
               this.playButtonSound(0);
               this.bHighlighted = true;
               pressed = 0;
            }
            else if(_loc2_.phase == TouchPhase.ENDED)
            {
               this.playButtonSound(1);
               this.bHighlighted = false;
               pressed = -1;
               this.bJustPressed = true;
               this.bTicked = !this.bTicked;
            }
         }
      }
      
      override public function propagateMessage(param1:GlaMsg) : void
      {
         if(param1.getID() == MSG_RESET_GUI)
         {
            pressed = -1;
            this.bHighlighted = false;
         }
      }
      
      override public function update() : void
      {
         if(!bActive || !bVisible)
         {
            return;
         }
         if(this.bTicked)
         {
            if(this.bHighlighted)
            {
               this.pPressedYes.visible = true;
               this.pNormalYes.visible = false;
            }
            else
            {
               this.pNormalYes.visible = true;
               this.pPressedYes.visible = false;
            }
            this.pPressedNo.visible = false;
            this.pNormalNo.visible = false;
         }
         else
         {
            if(this.bHighlighted)
            {
               this.pPressedNo.visible = true;
               this.pNormalNo.visible = false;
            }
            else
            {
               this.pNormalNo.visible = true;
               this.pPressedNo.visible = false;
            }
            this.pNormalYes.visible = false;
            this.pPressedYes.visible = false;
         }
         if(this.bJustPressed)
         {
            getRoot().propagateMessage(new GlaMsg(null,MSG_GUI_ACTION,this.actionMsg,this,!!this.bTicked ? 1 : 0));
            this.bJustPressed = false;
         }
         this.visible = bVisible;
         this.pNormalNo.updateChildrenAnimation();
         this.pPressedNo.updateChildrenAnimation();
         this.pNormalYes.updateChildrenAnimation();
         this.pPressedYes.updateChildrenAnimation();
      }
      
      public function keyboardActive(param1:Boolean) : void
      {
         this.pNormalNo.getElement("keyboard").setActive(param1);
         this.pPressedNo.getElement("keyboard").setActive(param1);
         this.pNormalYes.getElement("keyboard").setActive(param1);
         this.pPressedYes.getElement("keyboard").setActive(param1);
         if(this.pNotActive)
         {
            this.pNotActive.getElement("keyboard").setActive(param1);
         }
      }
      
      public function keyboardFire() : void
      {
         if(!bActive || !bVisible)
         {
            return;
         }
         this.playButtonSound(1);
         this.bTicked = !this.bTicked;
         getRoot().propagateMessage(new GlaMsg(null,0,this.actionMsg,this,!!this.bTicked ? 1 : 0));
      }
      
      override public function dispose() : void
      {
         this.removeEventListener(TouchEvent.TOUCH,this.eventTouch);
         if(this.pNormalNo)
         {
            this.removeChild(this.pNormalNo);
            this.pNormalNo.dispose();
            this.pNormalNo = null;
         }
         if(this.pPressedNo)
         {
            this.removeChild(this.pPressedNo);
            this.pPressedNo.dispose();
            this.pPressedNo = null;
         }
         if(this.pNormalYes)
         {
            this.removeChild(this.pNormalYes);
            this.pNormalYes.dispose();
            this.pNormalYes = null;
         }
         if(this.pPressedYes)
         {
            this.removeChild(this.pPressedYes);
            this.pPressedYes.dispose();
            this.pPressedYes = null;
         }
         if(this.pNotActive)
         {
            this.removeChild(this.pNotActive);
            this.pNotActive.dispose();
            this.pNotActive = null;
         }
         super.dispose();
      }
      
      override public function setAlpha(param1:uint) : void
      {
         if(this.pNormalNo)
         {
            this.pNormalNo.setAlpha(param1);
         }
         if(this.pPressedNo)
         {
            this.pPressedNo.setAlpha(param1);
         }
         if(this.pNormalYes)
         {
            this.pNormalYes.setAlpha(param1);
         }
         if(this.pPressedYes)
         {
            this.pPressedYes.setAlpha(param1);
         }
         this.textColor.a = param1;
      }
      
      override public function setFrame(param1:int) : void
      {
         bActive = (getSrc() as GlaElementGameObj).trkActive.getValue(param1);
         position = (getSrc() as GlaElementGameObj).trkPosition.getValue(param1);
         rotation = -MathsHelper.DegToRad((getSrc() as GlaElementGameObj).trkRotation.getValue(param1));
         depth = getSrcGameObj().trkDepth.getValue(param1);
         scale = (getSrc() as GlaElementGameObj).trkScale.getValue(param1);
      }
      
      public function setButtonSound(param1:zSoundList, param2:zSoundList, param3:int) : void
      {
         this.buttonSoundDown = param1;
         this.buttonSoundUp = param2;
         this.buttonChannel = param3;
      }
      
      public function playButtonSound(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.buttonSoundDown.sounds.length == 0)
            {
               zPlaySoundOnChannel(this.buttonChannel,this.buttonSoundDown.rand_element(),1);
            }
         }
         else if(!this.buttonSoundUp.sounds.length == 0)
         {
            zPlaySoundOnChannel(this.buttonChannel,this.buttonSoundUp.rand_element(),1);
         }
      }
      
      public function setTicked(param1:Boolean) : void
      {
         if(this.bTicked != param1)
         {
            this.bTicked = param1;
         }
      }
      
      public function getMsg() : String
      {
         return this.actionMsg;
      }
      
      public function isTicked() : Boolean
      {
         return this.bTicked;
      }
      
      public function getActionMsg() : String
      {
         return this.actionMsg;
      }
   }
}
