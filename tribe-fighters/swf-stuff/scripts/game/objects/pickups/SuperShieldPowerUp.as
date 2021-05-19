package game.objects.pickups
{
   import game.GameWorld;
   import game.objects.Player;
   import util.Vec2F;
   
   public class SuperShieldPowerUp extends PowerUp
   {
       
      
      public function SuperShieldPowerUp(param1:int, param2:String, param3:Vec2F)
      {
         super(param1,param3,"supershield_" + param2);
      }
      
      override public function activate() : void
      {
         var _loc1_:Player = GameWorld.get().getPlayer();
         if(_loc1_ != null)
         {
            _loc1_.activateInvincibilityPowerUp();
         }
      }
   }
}
