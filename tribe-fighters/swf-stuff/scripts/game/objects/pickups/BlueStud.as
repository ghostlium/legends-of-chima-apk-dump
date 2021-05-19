package game.objects.pickups
{
   import game.GameRes;
   import util.Vec2F;
   
   public class BlueStud extends Stud
   {
       
      
      public function BlueStud(param1:int, param2:Vec2F, param3:Vec2F)
      {
         super(param1,1000,param2,param3,"bluestud");
      }
      
      override public function pickupSound() : void
      {
         playSfxExt(GameRes.get()._pStudCollectSounds.rand_element(),0,1,1,false);
         playSfxExt(GameRes.get()._pBlueCoinSound,0,1,1,false);
      }
   }
}
