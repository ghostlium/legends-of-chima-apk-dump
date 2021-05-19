package game.objects.powers
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.Player;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   
   public class ChimaPowerBolt extends ChimaPower
   {
       
      
      public function ChimaPowerBolt()
      {
         super();
      }
      
      override public function activate() : Boolean
      {
         var _loc1_:Player = null;
         var _loc2_:int = 0;
         var _loc3_:Vec2F = null;
         var _loc4_:GlaSet = null;
         var _loc5_:String = null;
         if(GameWorld.get().getHUD().getChimaButton().getCharge() >= 1)
         {
            super.activate();
            GameWorld.get().getHUD().getChimaButton().setCharge(0);
            _loc1_ = GameWorld.get().getPlayer();
            _loc2_ = _loc1_.getSide();
            _loc3_ = new Vec2F(_loc1_.getPosition().x,_loc1_.getPosition().y);
            _loc3_.x += _loc1_.getGunPosition().x;
            _loc3_.y += _loc1_.getGunPosition().y;
            _loc4_ = GameRes.get()._pProjectileSet;
            _loc5_ = "";
            if(_loc2_ == GameConsts.eFireChima)
            {
               _loc5_ = "wand_fire_bullet";
            }
            else
            {
               _loc5_ = "wand_ice_bullet";
            }
            getLayer().addObject(new ChimaMageBolt(_loc2_,_loc3_,_loc4_,_loc5_));
            return true;
         }
         return false;
      }
   }
}
