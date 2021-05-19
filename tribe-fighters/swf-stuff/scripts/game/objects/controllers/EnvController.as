package game.objects.controllers
{
   import game.GameWorld;
   import game.objects.enemies.Enemy;
   import util.Vec2F;
   import zufflin.world.EventUpdate;
   
   public class EnvController extends EnemyController
   {
       
      
      public var _vVelocity:Vec2F;
      
      public function EnvController(param1:Enemy)
      {
         super(param1);
         this._vVelocity = new Vec2F();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Vec2F = null;
         _loc2_ = new Vec2F(_pEnemy.getPosition().x,_pEnemy.getPosition().y);
         this._vVelocity.x = 0;
         this._vVelocity.y = GameWorld.get().getGroundSpeed();
         _loc2_.x += param1.getTime().dt * this._vVelocity.x;
         _loc2_.y += param1.getTime().dt * this._vVelocity.y;
         _pEnemy.setPosition(_loc2_);
      }
   }
}
