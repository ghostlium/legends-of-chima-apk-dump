package game.objects.ui.pause
{
   import game.objects.ui.UIMenu;
   
   public class PauseMenu extends UIMenu
   {
       
      
      public var _pPauseScreen:PauseMenuScreen;
      
      public function PauseMenu()
      {
         super();
         this._pPauseScreen = new PauseMenuScreen();
         addComponent(this._pPauseScreen);
      }
      
      public function getPauseScreen() : PauseMenuScreen
      {
         return this._pPauseScreen;
      }
   }
}
