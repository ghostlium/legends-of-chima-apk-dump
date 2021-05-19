package game.objects.ui.hud
{
   import game.objects.ui.UIMenu;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.RenderableParticleSystem;
   
   public class HUD extends UIMenu
   {
       
      
      public var _pScore:HUDStudCount;
      
      public var _pPortrait:HUDPortrait;
      
      public var _pHealthBar:HUDHealthBar;
      
      public var _pChimaButton:HUDChimaButton;
      
      public var _pDistanceMeter:HUDDistanceMeter;
      
      public var _pBorderGlow:HUDBorderGlow;
      
      public var _pPauseButton:HUDPauseButton;
      
      public var _pFlagBuilder:HUDFlagBuilder;
      
      public var _pDamageFlash:HUDDamageFlash;
      
      public function HUD()
      {
         super();
         this._pScore = new HUDStudCount();
         addComponent(this._pScore);
         this._pPortrait = new HUDPortrait();
         addComponent(this._pPortrait);
         this._pHealthBar = new HUDHealthBar();
         addComponent(this._pHealthBar);
         this._pChimaButton = new HUDChimaButton();
         addComponent(this._pChimaButton);
         this._pDistanceMeter = new HUDDistanceMeter();
         addComponent(this._pDistanceMeter);
         this._pPauseButton = new HUDPauseButton();
         addComponent(this._pPauseButton);
         this._pFlagBuilder = new HUDFlagBuilder();
         addComponent(this._pFlagBuilder);
         this._pDamageFlash = new HUDDamageFlash();
         addComponent(this._pDamageFlash);
         this._pBorderGlow = new HUDBorderGlow();
         addComponent(this._pBorderGlow);
         addComponent(new RenderableParticleSystem());
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
      }
      
      public function getScore() : HUDStudCount
      {
         return this._pScore;
      }
      
      public function getPortrait() : HUDPortrait
      {
         return this._pPortrait;
      }
      
      public function getHealthBar() : HUDHealthBar
      {
         return this._pHealthBar;
      }
      
      public function getChimaButton() : HUDChimaButton
      {
         return this._pChimaButton;
      }
      
      public function getDistanceMeter() : HUDDistanceMeter
      {
         return this._pDistanceMeter;
      }
      
      public function getBorderGlow() : HUDBorderGlow
      {
         return this._pBorderGlow;
      }
      
      public function getPauseButton() : HUDPauseButton
      {
         return this._pPauseButton;
      }
      
      public function getFlagBuilder() : HUDFlagBuilder
      {
         return this._pFlagBuilder;
      }
      
      public function getDamageFlash() : HUDDamageFlash
      {
         return this._pDamageFlash;
      }
   }
}
