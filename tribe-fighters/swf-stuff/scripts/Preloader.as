package
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.LoaderInfo;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   
   public class Preloader extends Sprite
   {
      
      private static var LogoImage:Class = Preloader_LogoImage;
      
      private static var LoadBarBackImage:Class = Preloader_LoadBarBackImage;
      
      private static var LoadBarFrontImage:Class = Preloader_LoadBarFrontImage;
      
      public static var m_LanguageFlashVar:String = "en";
      
      private static const kfScale:Number = 1;
      
      private static const kbTesting:Boolean = false;
       
      
      public var mainClassName:String = "LegoChima";
      
      private var _firstEnterFrame:Boolean;
      
      private var m_Logo:Bitmap;
      
      private var m_LoadBarBack:Bitmap;
      
      private var m_LoadBarFront:Bitmap;
      
      private var m_LoadBarMask:Shape;
      
      private var m_fTestPercent:Number;
      
      private var m_fFadeTime:Number;
      
      private var m_bFading:Boolean;
      
      private const kfFadeDuration:Number = 0.5;
      
      public function Preloader()
      {
         super();
         this.m_bFading = false;
         addEventListener(Event.ADDED_TO_STAGE,this.OnAddedToStage);
         var _loc1_:Object = LoaderInfo(this.root.loaderInfo).parameters.language;
         if(_loc1_ != null)
         {
            m_LanguageFlashVar = _loc1_.toString();
            trace("FOUND FLASH VAR language = " + m_LanguageFlashVar);
         }
         else
         {
            trace("NOT FOUND FLASH VAR language : default to English");
         }
      }
      
      private function OnAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.OnAddedToStage);
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.align = StageAlign.TOP_LEFT;
         stage.color = 0;
         this._firstEnterFrame = true;
         stage.addEventListener(Event.ENTER_FRAME,this.OnEnterFrame);
      }
      
      private function OnEnterFrame(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         if(kbTesting)
         {
            if(this._firstEnterFrame)
            {
               this.m_fTestPercent = 0;
               this._firstEnterFrame = false;
               this.BeginLoading();
               return;
            }
            if(this.m_bFading)
            {
               this.m_fFadeTime -= 1 / 60;
               if(this.m_fFadeTime <= 0)
               {
                  this.dispose();
                  this.RunMainGame();
               }
               else
               {
                  this.m_Logo.alpha = this.m_fFadeTime / this.kfFadeDuration;
                  this.m_LoadBarFront.alpha = this.m_fFadeTime / this.kfFadeDuration;
                  this.m_LoadBarBack.alpha = this.m_fFadeTime / this.kfFadeDuration;
               }
            }
            else if(this.m_fTestPercent >= 1)
            {
               this.m_bFading = true;
               this.m_fFadeTime = this.kfFadeDuration;
            }
            else
            {
               this.UpdateLoading(this.m_fTestPercent);
               this.m_fTestPercent += 0.004;
            }
            return;
         }
         if(this._firstEnterFrame)
         {
            this._firstEnterFrame = false;
            if(root.loaderInfo.bytesLoaded >= root.loaderInfo.bytesTotal)
            {
               this.dispose();
               this.RunMainGame();
            }
            else
            {
               this.BeginLoading();
            }
            return;
         }
         if(this.m_bFading)
         {
            this.m_fFadeTime -= 1 / 60;
            if(this.m_fFadeTime <= 0)
            {
               this.dispose();
               this.RunMainGame();
            }
            else
            {
               this.m_Logo.alpha = this.m_fFadeTime / this.kfFadeDuration;
               this.m_LoadBarFront.alpha = this.m_fFadeTime / this.kfFadeDuration;
               this.m_LoadBarBack.alpha = this.m_fFadeTime / this.kfFadeDuration;
            }
         }
         else if(root.loaderInfo.bytesLoaded >= root.loaderInfo.bytesTotal)
         {
            this.m_bFading = true;
            this.m_fFadeTime = this.kfFadeDuration;
         }
         else
         {
            _loc2_ = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
            this.UpdateLoading(_loc2_);
         }
      }
      
      private function UpdateLoading(param1:Number) : void
      {
         this.m_LoadBarMask.scaleX = param1;
      }
      
      private function BeginLoading() : void
      {
         this.m_Logo = new LogoImage();
         this.m_LoadBarBack = new LoadBarBackImage();
         this.m_LoadBarFront = new LoadBarFrontImage();
         var _loc1_:Number = 525;
         this.m_Logo.scaleX = kfScale;
         this.m_Logo.scaleY = kfScale;
         this.m_Logo.x = 0;
         this.m_Logo.y = 0;
         addChild(this.m_Logo);
         var _loc2_:Number = 605 * kfScale;
         this.m_LoadBarBack.scaleX = kfScale;
         this.m_LoadBarBack.scaleY = kfScale;
         this.m_LoadBarBack.x = (_loc1_ - this.m_LoadBarBack.width) / 2;
         this.m_LoadBarBack.y = _loc2_;
         addChild(this.m_LoadBarBack);
         this.m_LoadBarMask = new Shape();
         this.m_LoadBarMask.graphics.beginFill(10526880);
         this.m_LoadBarMask.graphics.drawRect(0,0,this.m_LoadBarBack.width,this.m_LoadBarBack.height);
         this.m_LoadBarMask.graphics.endFill();
         this.m_LoadBarMask.x = this.m_LoadBarBack.x;
         this.m_LoadBarMask.y = this.m_LoadBarBack.y;
         this.m_LoadBarMask.scaleX = 0;
         addChild(this.m_LoadBarMask);
         this.m_LoadBarFront.scaleX = kfScale;
         this.m_LoadBarFront.scaleY = kfScale;
         this.m_LoadBarFront.x = (_loc1_ - this.m_LoadBarFront.width) / 2;
         this.m_LoadBarFront.y = _loc2_;
         this.m_LoadBarFront.mask = this.m_LoadBarMask;
         addChild(this.m_LoadBarFront);
         LogoImage = null;
         LoadBarBackImage = null;
         LoadBarFrontImage = null;
      }
      
      private function dispose() : void
      {
         stage.removeEventListener(Event.ENTER_FRAME,this.OnEnterFrame);
         if(this.m_LoadBarMask)
         {
            removeChild(this.m_LoadBarMask);
         }
         if(this.m_LoadBarFront)
         {
            this.m_LoadBarFront.mask = null;
            removeChild(this.m_LoadBarFront);
         }
         if(this.m_LoadBarBack)
         {
            removeChild(this.m_LoadBarBack);
         }
         if(this.m_Logo)
         {
            removeChild(this.m_Logo);
         }
         this.m_LoadBarBack = null;
         this.m_LoadBarFront = null;
         this.m_Logo = null;
         this.m_LoadBarMask = null;
      }
      
      private function RunMainGame() : void
      {
         var _loc1_:Class = getDefinitionByName(this.mainClassName) as Class;
         var _loc2_:DisplayObject = new _loc1_() as DisplayObject;
         addChildAt(_loc2_,0);
      }
   }
}
