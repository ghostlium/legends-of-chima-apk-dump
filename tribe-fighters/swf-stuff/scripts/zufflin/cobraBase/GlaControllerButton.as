package zufflin.cobraBase
{
   import starling.display.Quad;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.events.TouchPhase;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.MathsHelper;
   import zufflin.core.RGBA;
   import zufflin.core.zSoundList;
   
   public class GlaControllerButton extends GlaControllerGuiObject
   {
      
      public static var defButtonSoundDown:zSoundList;
      
      public static var defButtonSoundUp:zSoundList;
      
      public static var defbuttonChannel:int = 0;
      
      public static var defbuttonChannelUp:int = 0;
       
      
      public var pNormal:GlaControllerScene;
      
      public var pPressed:GlaControllerScene;
      
      public var pNotActive:GlaControllerScene;
      
      public var bHighlighted:Boolean;
      
      public var actionMsg:String;
      
      public var text:String;
      
      public var textColor:RGBA;
      
      public var bFireOnPress:Boolean;
      
      public var buttonSoundDown:zSoundList;
      
      public var buttonSoundUp:zSoundList;
      
      public var buttonChannel:int;
      
      public var buttonChannelUp:int;
      
      private var bJustPressed:Boolean;
      
      private var _tf:TextField;
      
      private var _fakedTouch:Quad;
      
      public function GlaControllerButton(param1:GlaController, param2:GlaElementGameObj)
      {
         this._fakedTouch = null;
         super(param1,param2);
         this.bHighlighted = false;
         this.pNormal = null;
         this.pPressed = null;
         this.pNotActive = null;
         this.bFireOnPress = false;
         this.textColor = new RGBA(255,255,255,255);
         this.buttonSoundDown = defButtonSoundDown;
         this.buttonSoundUp = defButtonSoundUp;
         this.buttonChannel = defbuttonChannel;
         this.buttonChannelUp = defbuttonChannelUp;
         this.bJustPressed = false;
      }
      
      public static function setDefaultSounds(param1:zSoundList, param2:zSoundList, param3:int, param4:int = -1) : void
      {
         defButtonSoundDown = param1;
         defButtonSoundUp = param2;
         if(param4 == -1)
         {
            defbuttonChannel = param3;
            defbuttonChannelUp = param3;
         }
         else
         {
            defbuttonChannel = param3;
            defbuttonChannelUp = param4;
         }
      }
      
      public function getText() : String
      {
         return this.text;
      }
      
      public function getMsg() : String
      {
         return this.actionMsg;
      }
      
      public function isPressed() : Boolean
      {
         return this.bHighlighted;
      }
      
      public function getPressedScene() : GlaControllerScene
      {
         return this.pPressed;
      }
      
      public function getScene() : GlaControllerScene
      {
         return this.pNormal;
      }
      
      public function getActionMsg() : String
      {
         return this.actionMsg;
      }
      
      override public function initialise() : void
      {
         var _loc2_:GlaElementRectangle = null;
         this.text = getSrcGameObj().getPropString("Text");
         this.actionMsg = getSrcGameObj().getPropString("Action");
         var _loc1_:GlaSceneState = getSrcGameObj().getPropRefScene_State("Button");
         if(_loc1_)
         {
            this.bFireOnPress = _loc1_.getPropBool("FireOnPress");
            this.pNormal = new GlaControllerScene(null,_loc1_);
            this.pPressed = new GlaControllerScene(null,_loc1_);
            this.pNormal.setFrame(0);
            this.pPressed.setFrame(1);
            if(_loc1_.getNumFrames() >= 3)
            {
               this.pNotActive = new GlaControllerScene(null,_loc1_);
               this.pNotActive.setFrame(2);
            }
            hitBox = this.pNormal.getSrcSceneState().getMaxBounds();
            _loc2_ = _loc1_.findControlRect("hitbox");
            if(_loc2_)
            {
               hitBox = _loc2_.getAABox(0);
            }
            if(this.actionMsg.length == 0)
            {
               this.actionMsg = _loc1_.getPropString("Action");
            }
         }
         this.addChild(this.pNormal);
         this.addChild(this.pPressed);
         if(this.pNotActive)
         {
            this.addChild(this.pNotActive);
         }
         this.pNormal.playChildrenAnimation(true,0.5);
         this.pPressed.playChildrenAnimation(true,0.5);
         this.setFrame(0);
         if(this.text.length > 0)
         {
            this._tf = new TextField(hitBox.getSizeX(),hitBox.getSizeY(),this.text,"Arial",32);
            this._tf.alignPivot();
            this._tf.hAlign = HAlign.CENTER;
            this._tf.vAlign = VAlign.CENTER;
            this._tf.touchable = false;
            this._tf.autoScale = true;
            this.addChild(this._tf);
         }
         else
         {
            this._tf = null;
         }
         this.bJustPressed = false;
         this.addEventListener(TouchEvent.TOUCH,this.eventTouch);
      }
      
      override public function propagateMessage(param1:GlaMsg) : void
      {
         if(param1.getID() == MSG_RESET_GUI)
         {
            pressed = -1;
            this.bHighlighted = false;
         }
      }
      
      public function AddFakedTouchable() : void
      {
         this._fakedTouch = new Quad(80,80);
         this._fakedTouch.alignPivot();
         this._fakedTouch.alpha = 0;
         this.addChild(this._fakedTouch);
      }
      
      public function SetUpForCharSelect() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = this.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.getChildAt(_loc2_).touchable = false;
            _loc2_++;
         }
         this._fakedTouch = new Quad(this.width * 0.4,this.height * 0.55);
         this._fakedTouch.alignPivot();
         this._fakedTouch.alpha = 0;
         this._fakedTouch.y = this.height * 0.075;
         this.addChild(this._fakedTouch);
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
            }
         }
      }
      
      override public function update() : void
      {
         this.visible = bVisible;
         if(this._tf)
         {
            this._tf.color = this.textColor.getDrawColour();
            this._tf.alpha = this.textColor.getDrawAlpha();
            if(!bActive)
            {
               this._tf.alpha *= 0.5;
            }
         }
         if(!bActive)
         {
            if(this.pNotActive)
            {
               this.pNotActive.visible = true;
            }
         }
         else
         {
            this.pPressed.visible = false;
            this.pNormal.visible = false;
         }
         if(!bActive || !bVisible)
         {
            return;
         }
         this.pNormal.updateChildrenAnimation();
         this.pPressed.updateChildrenAnimation();
         if(this.bHighlighted)
         {
            this.pPressed.visible = true;
            this.pNormal.visible = false;
         }
         else
         {
            if(this.bJustPressed)
            {
               getRoot().propagateMessage(new GlaMsg(null,MSG_GUI_ACTION,this.actionMsg,this,0));
               this.bJustPressed = false;
            }
            this.pPressed.visible = false;
            this.pNormal.visible = true;
         }
      }
      
      public function keyboardActive(param1:Boolean) : void
      {
         this.pPressed.getElement("keyboard").setActive(param1);
         this.pNormal.getElement("keyboard").setActive(param1);
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
         getRoot().propagateMessage(new GlaMsg(null,0,this.actionMsg,this,0));
      }
      
      override public function dispose() : void
      {
         this.removeEventListener(TouchEvent.TOUCH,this.eventTouch);
         if(this._fakedTouch != null)
         {
            this.removeChild(this._fakedTouch,true);
            this._fakedTouch = null;
         }
         if(this._tf != null)
         {
            this.removeChild(this._tf,true);
            this._tf = null;
         }
         this.removeChild(this.pNormal);
         this.pNormal.dispose();
         this.pNormal = null;
         this.removeChild(this.pPressed);
         this.pPressed.dispose();
         this.pPressed = null;
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
         if(this.pNormal)
         {
            this.pNormal.setAlpha(param1);
         }
         if(this.pPressed)
         {
            this.pPressed.setAlpha(param1);
         }
         if(this.pNotActive)
         {
            this.pNotActive.setAlpha(param1);
         }
         this.textColor.a = param1;
      }
      
      override public function setFrame(param1:int) : void
      {
         bActive = (getSrc() as GlaElementGameObj).trkActive.getValue(param1);
         position = (getSrc() as GlaElementGameObj).trkPosition.getValue(param1);
         rotation = -MathsHelper.DegToRad((getSrc() as GlaElementGameObj).trkRotation.getValue(param1));
         depth = int(getSrcGameObj().trkDepth.getValue(param1));
         scale = (getSrc() as GlaElementGameObj).trkScale.getValue(param1);
         setPosition(position);
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
            zPlaySoundOnChannel(this.buttonChannelUp,this.buttonSoundUp.rand_element(),1);
         }
      }
      
      public function setButtonDownSound(param1:zSoundList, param2:int) : void
      {
         this.buttonSoundDown = param1;
         this.buttonChannel = param2;
      }
      
      public function setButtonUpSound(param1:zSoundList, param2:int) : void
      {
         this.buttonSoundUp = param1;
         this.buttonChannelUp = param2;
      }
      
      public function setButtonSound(param1:zSoundList, param2:zSoundList, param3:int, param4:int = -1) : void
      {
         this.buttonSoundDown = param1;
         this.buttonSoundUp = param2;
         if(param4 == -1)
         {
            this.buttonChannel = param3;
            this.buttonChannelUp = param3;
         }
         else
         {
            this.buttonChannel = param3;
            this.buttonChannelUp = param4;
         }
      }
   }
}
