package game.objects.controllers
{
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.enemies.Enemy;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.StateManager;
   import zufflin.world.EventUpdate;
   
   public class DiscShooterController extends EnemyController
   {
      
      public static const kfMinWaitBeforeShoot:Number = 0;
      
      public static const kfMaxWaitBeforeShoot:Number = 1;
      
      public static const kfWaitAfterShoot:Number = 2;
       
      
      public var _state:StateManager;
      
      public var _fDt:Number;
      
      public var _fWait:Number;
      
      public var _vVelocity:Vec2F;
      
      public function DiscShooterController(param1:Enemy)
      {
         super(param1);
         this._fDt = 0;
         this._fWait = 0;
         this._vVelocity = new Vec2F();
         this._state = new StateManager();
         this._state.setOwner(this);
         this._state.gotoState(this.StateWait);
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._fDt = param1.getTime().dt;
         this._state.update();
         var _loc2_:Vec2F = new Vec2F(_pEnemy.getPosition().x,_pEnemy.getPosition().y);
         this._vVelocity.x = 0;
         this._vVelocity.y = GameWorld.get().getGroundSpeed();
         _loc2_.x += this._fDt * this._vVelocity.x;
         _loc2_.y += this._fDt * this._vVelocity.y;
         _pEnemy.setPosition(_loc2_);
      }
      
      public function StateWait(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._fWait = Random.RandomFloatRangeUniform(kfMinWaitBeforeShoot,kfMaxWaitBeforeShoot);
               _pEnemy.setAnim(ChimaGameObject.CHAR_ANIM_STATIC);
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._fWait -= this._fDt;
               if(this._fWait <= 0)
               {
                  this._state.gotoState(this.StateShoot);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateShoot(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._fWait = kfWaitAfterShoot;
               _pEnemy.setAnim(ChimaGameObject.CHAR_ANIM_STAND_SHOOT);
               if(_pEnemy.getGun() != null)
               {
                  _pEnemy.getGun().fire();
               }
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._fWait -= this._fDt;
               if(this._fWait <= 0)
               {
                  this._state.gotoState(this.StateWait);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
   }
}
