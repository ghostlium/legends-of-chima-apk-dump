package game.objects.ui.frontend
{
   import game.objects.ui.UIMenu;
   import zufflin.core.RGBA;
   
   public class GameOverMenu extends UIMenu
   {
       
      
      public var _pDarkener:FullScreenRect;
      
      public var _pBrightener:FullScreenRect;
      
      public var _pGameOverScreen:GameOverScreen;
      
      public function GameOverMenu()
      {
         super();
         this._pDarkener = new FullScreenRect();
         this._pDarkener.setColour(new RGBA(0,0,0,128));
         addComponent(this._pDarkener);
         this._pGameOverScreen = new GameOverScreen();
         addComponent(this._pGameOverScreen);
         this._pBrightener = new FullScreenRect();
         this._pBrightener.setColour(new RGBA(255,255,255,0));
         addComponent(this._pBrightener);
      }
      
      public function getBrightener() : FullScreenRect
      {
         return this._pBrightener;
      }
      
      public function getDarkener() : FullScreenRect
      {
         return this._pDarkener;
      }
      
      public function getScreen() : GameOverScreen
      {
         return this._pGameOverScreen;
      }
      
      public function reset() : void
      {
         this._pBrightener.setColour(new RGBA(255,255,255,0));
         this._pGameOverScreen.reset();
      }
   }
}
