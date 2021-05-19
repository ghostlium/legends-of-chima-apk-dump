package game.objects.powers
{
   import game.GameWorld;
   import game.objects.Player;
   import zufflin.world2D.Component2;
   
   public class ChimaPower extends Component2
   {
       
      
      public function ChimaPower()
      {
         super();
      }
      
      public function activate() : Boolean
      {
         GameWorld.get().shakeGameLayer();
         var _loc1_:Player = GameWorld.get().getPlayer();
         if(_loc1_ && _loc1_.isChiUpgradeActive(3))
         {
            _loc1_.addHealth(1);
         }
         return false;
      }
   }
}
