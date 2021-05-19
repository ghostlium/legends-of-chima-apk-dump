package game.objects.powers
{
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import util.Vec2F;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   import zufflin.world2D.GlaAnimRenderable;
   
   public class ChimaPowerBomb extends ChimaPower
   {
      
      public static var kvChimaBombOffset:Vec2F = new Vec2F(0,-40);
       
      
      public var _pChimaBurstAnim:GlaAnimRenderable;
      
      public function ChimaPowerBomb()
      {
         super();
         this._pChimaBurstAnim = null;
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:WorldLayer = this.getLayer();
         if(_loc2_ && _loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         if(this._pChimaBurstAnim != null)
         {
            if(this._pChimaBurstAnim.getFrame() == 21)
            {
               GameWorld.get().killAllEnemies();
            }
            if(this._pChimaBurstAnim.isAnimating() == false)
            {
               (getWorldObj() as ChimaGameObject).removeComponent(this._pChimaBurstAnim);
               this._pChimaBurstAnim.deleteThis();
               this._pChimaBurstAnim = null;
            }
         }
      }
      
      override public function activate() : Boolean
      {
         if(GameWorld.get().getHUD().getChimaButton().getCharge() >= 1 && this._pChimaBurstAnim == null)
         {
            super.activate();
            GameWorld.get().getHUD().getChimaButton().setCharge(0);
            this._pChimaBurstAnim = new GlaAnimRenderable(GameRes.get()._pFXChiSet.findScene("Scene000"));
            this._pChimaBurstAnim.setPosition(kvChimaBombOffset);
            this._pChimaBurstAnim.play(false,1);
            (getWorldObj() as ChimaGameObject).addComponent(this._pChimaBurstAnim);
            getWorldObj().playSfxExt(GameRes.get()._pChiBombSound,0,1,1,false);
            return true;
         }
         return false;
      }
   }
}
