package game.objects.pickups
{
   import game.GameConsts;
   import game.GameRes;
   import game.objects.ChimaGameObject;
   import util.Vec2F;
   
   public class Pickup extends ChimaGameObject
   {
       
      
      public function Pickup(param1:int, param2:Vec2F, param3:String)
      {
         super(param1,param2,1,GameConsts.ePickupCollisionCat,GameConsts.ePlayerCollisionCat,GameRes.get()._pPickupSet,param3);
      }
   }
}
