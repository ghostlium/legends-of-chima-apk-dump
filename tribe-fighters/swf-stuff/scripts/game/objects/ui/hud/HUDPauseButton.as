package game.objects.ui.hud
{
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ui.UIComponent;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.world.EventUpdate;
   
   public class HUDPauseButton extends UIComponent
   {
       
      
      public var _pScene:GlaControllerScene;
      
      public function HUDPauseButton()
      {
         super();
         setSlideDir(eUISlideRight);
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("hud_pausebutton"));
         this._pScene.setPosition(new Vec2F(LegoChima.Instance().zGetScreenWidth(),0));
         this.addChild(this._pScene);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._pScene);
         this._pScene.dispose();
         this._pScene = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:GlaMsg = null;
         if(_bActive)
         {
            this._pScene.update();
            while(this._pScene.hasMsg())
            {
               _loc2_ = this._pScene.popMsg();
               if(_loc2_.getText() == "pause")
               {
                  if(GameWorld.get().getTutorial().getActive() == false)
                  {
                     GameWorld.get().gotoPaused();
                  }
               }
            }
         }
      }
   }
}
