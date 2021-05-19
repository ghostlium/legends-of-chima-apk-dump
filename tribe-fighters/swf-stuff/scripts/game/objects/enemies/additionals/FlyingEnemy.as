package game.objects.enemies.additionals
{
   import game.objects.enemies.Enemy;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   
   public class FlyingEnemy extends Enemy
   {
       
      
      public function FlyingEnemy(param1:int, param2:Vec2F, param3:Number, param4:Number, param5:GlaSet, param6:String)
      {
         super(param1,param2,param3,param4,param5,param6);
         _bSpawnFootprints = false;
      }
   }
}
