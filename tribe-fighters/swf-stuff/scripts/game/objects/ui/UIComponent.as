package game.objects.ui
{
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.Renderable2;
   
   public class UIComponent extends Renderable2
   {
      
      public static const kfDefaultUISlideSpeed:Number = 3;
      
      public static const eUISlideUp:int = 0;
      
      public static const eUISlideDown:int = 1;
      
      public static const eUISlideLeft:int = 2;
      
      public static const eUISlideRight:int = 3;
      
      public static const NUM_UI_SLIDE_DIRS:int = 4;
      
      public static const eUISlideOn:int = 0;
      
      public static const eUISlideOff:int = 1;
      
      private static var slideOffTargets:Vector.<Vec2F> = new <Vec2F>[new Vec2F(0,-1 * 1024),new Vec2F(0,1024),new Vec2F(-1 * 768,0),new Vec2F(768,0)];
       
      
      public var _bActive:Boolean;
      
      public var _slideDir:int;
      
      public var _slideState:int;
      
      public var _fSlideProgress:Number;
      
      public var _fSlideSpeed:Number;
      
      public var _vCurrPos:Vec2F;
      
      public function UIComponent()
      {
         super();
         this._slideDir = eUISlideLeft;
         this._slideState = eUISlideOn;
         this._fSlideProgress = 1;
         this._fSlideSpeed = kfDefaultUISlideSpeed;
         this._vCurrPos = new Vec2F();
         this._bActive = true;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
      }
      
      public function specificUpdate(param1:EventUpdate) : void
      {
      }
      
      public function setSlideDir(param1:int) : void
      {
         this._slideDir = param1;
      }
      
      public function setSlideState(param1:int) : void
      {
         this._slideState = param1;
      }
      
      public function setSlideSpeed(param1:Number) : void
      {
         this._fSlideSpeed = param1;
      }
      
      public function showAdditionals() : void
      {
      }
      
      public function hideAdditionals() : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Vec2F = slideOffTargets[this._slideDir];
         this._fSlideProgress += param1.getTime().dt * this._fSlideSpeed;
         this._fSlideProgress = MathsHelper.Clamp(this._fSlideProgress,0,1);
         switch(this._slideState)
         {
            case eUISlideOn:
               this._vCurrPos.x = MathsHelper.Lerp(_loc2_.x,0,this._fSlideProgress);
               this._vCurrPos.y = MathsHelper.Lerp(_loc2_.y,0,this._fSlideProgress);
               break;
            case eUISlideOff:
               this._vCurrPos.x = MathsHelper.Lerp(0,_loc2_.x,this._fSlideProgress);
               this._vCurrPos.y = MathsHelper.Lerp(0,_loc2_.y,this._fSlideProgress);
         }
         if(this.isAnythingVisible())
         {
            this.visible = true;
            this.x = this._vCurrPos.x;
            this.y = this._vCurrPos.y;
         }
         else
         {
            this.visible = false;
         }
         this.specificUpdate(param1);
      }
      
      public function show() : void
      {
         if(this._slideState != eUISlideOn)
         {
            this._fSlideProgress = 0;
            this._slideState = eUISlideOn;
            this._bActive = true;
         }
      }
      
      public function hide() : void
      {
         if(this._slideState != eUISlideOff)
         {
            this._fSlideProgress = 0;
            this._slideState = eUISlideOff;
            this._bActive = false;
         }
      }
      
      public function forceShow() : void
      {
         this._fSlideProgress = 1;
         this._slideState = eUISlideOn;
         this._bActive = true;
      }
      
      public function forceHide() : void
      {
         this._fSlideProgress = 1;
         this._slideState = eUISlideOff;
         this._bActive = false;
      }
      
      public function isAnythingVisible() : Boolean
      {
         if(this._slideState == eUISlideOff && this._fSlideProgress == 1)
         {
            return false;
         }
         return true;
      }
   }
}
