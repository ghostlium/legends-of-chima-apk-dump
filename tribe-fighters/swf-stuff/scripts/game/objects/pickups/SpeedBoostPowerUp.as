package game.objects.pickups
{
   import game.objects.misc.SpeedBoostProxy;
   import util.Vec2F;
   import zufflin.world.WorldObj;
   
   public class SpeedBoostPowerUp extends PowerUp
   {
       
      
      public function SpeedBoostPowerUp(param1:int, param2:String, param3:Vec2F)
      {
         super(param1,param3,"speedboost_" + param2);
      }
      
      override public function activate() : void
      {
         var _loc2_:WorldObj = null;
         var _loc1_:Vector.<WorldObj> = getLayer().getObjectList();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_ is SpeedBoostProxy)
            {
               (_loc2_ as SpeedBoostProxy).deleteThis();
            }
         }
         getLayer().addObject(new SpeedBoostProxy());
      }
   }
}
