package zufflin.cobraBase
{
   import flash.media.Sound;
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.math.AABox2f;
   
   public class GlaControllerGuiObject extends GlaControllerElement
   {
      
      public static const MSG_GUI_ACTION:int = 536870913;
      
      public static const MSG_CONSUME_KEYS:int = 536870914;
      
      public static const MSG_RESET_GUI:int = 536870916;
       
      
      public var hitBox:AABox2f;
      
      public var bVisible:Boolean;
      
      public var pressed:int;
      
      public function GlaControllerGuiObject(param1:GlaController, param2:GlaElementGameObj)
      {
         super(param1,param2);
         this.hitBox = new AABox2f();
         this.hitBox.invalidate();
         rotation = 0;
         position.clear();
         bActive = true;
         this.bVisible = true;
         this.pressed = -1;
         this.setFrame(0);
      }
      
      public static function clearGui() : void
      {
      }
      
      public function getHitBox() : AABox2f
      {
         return this.hitBox;
      }
      
      public function getSrcGameObj() : GlaElementGameObj
      {
         return pSrcElement as GlaElementGameObj;
      }
      
      override public function setFrame(param1:int) : void
      {
         position = this.getSrcGameObj().trkPosition.getValue(param1);
         rotation = -MathsHelper.DegToRad(this.getSrcGameObj().trkRotation.getValue(param1));
         scale = this.getSrcGameObj().trkScale.getValue(param1);
      }
      
      public function isPointOver(param1:Vec2F) : Boolean
      {
         return this.hitBox.isPointIn(param1);
      }
      
      public function isPointOverEx(param1:Vec2F) : Boolean
      {
         return this.hitBox.isPointIn(param1,16);
      }
      
      override public function setActive(param1:Boolean) : void
      {
         if(bActive != param1)
         {
            bActive = param1;
         }
      }
      
      public function setVisible(param1:Boolean) : void
      {
         if(this.bVisible != param1)
         {
            this.bVisible = param1;
         }
      }
      
      override public function propagateMessage(param1:GlaMsg) : void
      {
      }
      
      override public function internalSetFrame(param1:FrameInfo) : void
      {
         position = this.getSrcGameObj().trkPosition.getValueF(param1.frameI,param1.frac);
         rotation = MathsHelper.DegToRad(this.getSrcGameObj().trkRotation.getValueF(param1.frameI,param1.frac));
         scale = this.getSrcGameObj().trkScale.getValueF(param1.frameI,param1.frac);
      }
      
      public function zPlaySoundOnChannel(param1:int, param2:Sound, param3:Number) : void
      {
         param2.play();
      }
   }
}
