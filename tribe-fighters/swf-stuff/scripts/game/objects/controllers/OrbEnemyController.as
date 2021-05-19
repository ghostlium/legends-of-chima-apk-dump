package game.objects.controllers
{
   import game.GameWorld;
   import game.objects.enemies.Enemy;
   import util.Vec2F;
   import zufflin.world.EventUpdate;
   
   public class OrbEnemyController extends EnemyController
   {
      
      public static const kfSpeedMult:Number = 1;
       
      
      public function OrbEnemyController(param1:Enemy)
      {
         super(param1);
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Vec2F = null;
         _loc2_ = _pEnemy.getPosition();
         var _loc3_:Vec2F = new Vec2F(0,GameWorld.get().getGroundSpeed() * kfSpeedMult);
         _loc2_.x += param1.getTime().dt * _loc3_.x;
         _loc2_.y += param1.getTime().dt * _loc3_.y;
         _pEnemy.setPosition(_loc2_);
      }
   }
}
