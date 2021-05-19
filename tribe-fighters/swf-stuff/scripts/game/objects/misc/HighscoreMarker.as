package game.objects.misc
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import util.Vec2F;
   import zufflin.world.EventUpdate;
   
   public class HighscoreMarker extends ChimaGameObject
   {
       
      
      public function HighscoreMarker(param1:int, param2:uint)
      {
         super(param1,new Vec2F(0,-1024),1,GameConsts.eNO_COLLISION,GameConsts.eNO_COLLISION,GameRes.get()._pLevelSet,"highscoremarker");
         var _loc3_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),-1 * (1 / GameWorld.get().getBackground().getMetreScale()) * Number(param2));
         _loc3_.y += 0.75 * Number(LegoChima.Instance().zGetScreenHeight());
         setPosition(_loc3_);
         setDepthOffset(GameConsts.DEPTH_OFFSET_HIGHSCORE_MARKER);
         setEnableShadow(false);
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Vec2F = getPosition();
         _loc2_.y += GameWorld.get().getGroundSpeed() * param1.getTime().dt;
         setPosition(_loc2_);
         if(_loc2_.y >= 2 * Number(LegoChima.Instance().zGetScreenHeight()))
         {
            deleteThis();
         }
      }
   }
}
