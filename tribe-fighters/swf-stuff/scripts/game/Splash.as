package game
{
   import starling.display.Image;
   import starling.display.Sprite;
   import starling.textures.Texture;
   
   public class Splash extends Sprite
   {
      
      private static const english:Class = Splash_english;
      
      private static const french:Class = Splash_french;
      
      public static const kfTimerHold:Number = 2;
      
      public static const kfFadeDuration:Number = 0.5;
       
      
      private var m_texture:Texture;
      
      public var _bSplashDone:Boolean;
      
      public var _fSplashScale:Number;
      
      public var _pObjLegal:Image;
      
      private var m_fTimer:Number;
      
      private var m_iState:int;
      
      public function Splash()
      {
         super();
         this._bSplashDone = false;
         if(Language.getSystemLanguageCode() == "fr")
         {
            this.m_texture = Texture.fromBitmap(new french(),false,false,1,"bgra",false);
         }
         else
         {
            this.m_texture = Texture.fromBitmap(new english(),false,false,1,"bgra",false);
         }
         this._pObjLegal = new Image(this.m_texture);
         this._pObjLegal.width = 768;
         this._pObjLegal.height = 1024;
         this._pObjLegal.alpha = 0;
         this.addChild(this._pObjLegal);
         this.m_iState = 0;
         this.m_fTimer = kfFadeDuration;
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._pObjLegal,true);
         this._pObjLegal = null;
         this.m_texture.dispose();
         this.m_texture = null;
         super.dispose();
      }
      
      public function isSplashDone() : Boolean
      {
         return this._bSplashDone;
      }
      
      public function SCG_update(param1:Number) : void
      {
         this.m_fTimer -= param1;
         switch(this.m_iState)
         {
            case 0:
               if(this.m_fTimer <= 0)
               {
                  this._pObjLegal.alpha = 1;
                  this.m_fTimer = kfTimerHold;
                  this.m_iState = 1;
               }
               else
               {
                  this._pObjLegal.alpha = 1 - this.m_fTimer / kfTimerHold;
               }
               break;
            case 1:
               if(this.m_fTimer <= 0)
               {
                  this.m_fTimer = kfFadeDuration;
                  this.m_iState = 2;
               }
               break;
            case 2:
               if(this.m_fTimer <= 0)
               {
                  this._pObjLegal.alpha = 0;
                  this.m_fTimer = 1;
                  this.m_iState = 3;
                  this._bSplashDone = true;
               }
               else
               {
                  this._pObjLegal.alpha = this.m_fTimer / kfTimerHold;
               }
         }
      }
   }
}
