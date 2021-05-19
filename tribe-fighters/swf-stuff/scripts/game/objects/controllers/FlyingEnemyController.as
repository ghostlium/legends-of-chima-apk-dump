package game.objects.controllers
{
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.Player;
   import game.objects.enemies.Enemy;
   import game.objects.fx.ShadowedAnimRenderable;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.StateManager;
   import zufflin.math.AABox2f;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   
   public class FlyingEnemyController extends EnemyController
   {
      
      public static const kfMoveSpeed:Number = 250;
      
      public static const kfCloseEnough:Number = 5;
      
      public static const kfSlowOverDistance:Number = 60;
      
      public static const kfTargetStartY:Number = 100;
      
      public static const kfDivebombOffsetY:Number = -100;
      
      public static const kfKnockbackVelY:Number = -1000;
      
      public static const kfKnockbackMaxVelY:Number = -200;
      
      public static const kfKnockbackAccY:Number = 10;
       
      
      public var _state:StateManager;
      
      public var _pAnims:Vector.<ShadowedAnimRenderable>;
      
      public var _fDt:Number;
      
      public var _vMoveTarget:Vec2F;
      
      public var _bFired:Boolean;
      
      public var _iFireOnFrame:int;
      
      public var _fKnockbackVelY:Number;
      
      public var _bHasKnockback:Boolean;
      
      public var _bDivebombPlayer:Boolean;
      
      public var _bTargetPlayer:Boolean;
      
      public function FlyingEnemyController(param1:Enemy)
      {
         super(param1);
         this._fDt = 0;
         this._bFired = false;
         this._iFireOnFrame = 0;
         this._fKnockbackVelY = 0;
         this._bHasKnockback = false;
         this._bDivebombPlayer = false;
         this._bTargetPlayer = false;
         this._vMoveTarget = new Vec2F();
         this._state = new StateManager();
         this._state.setOwner(this);
         this._pAnims = param1.getAnims();
         this.pickNewMovementTarget();
         this._state.gotoState(this.StateFly);
      }
      
      public function setFireOnFrame(param1:int) : void
      {
         this._iFireOnFrame = param1;
      }
      
      public function setHasKnockback(param1:Boolean) : void
      {
         this._bHasKnockback = param1;
      }
      
      public function setDivebombPlayer(param1:Boolean) : void
      {
         this._bDivebombPlayer = param1;
      }
      
      public function setTargetPlayer(param1:Boolean) : void
      {
         this._bTargetPlayer = param1;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._fDt = param1.getTime().dt;
         this._state.update();
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
      }
      
      public function StateFly(param1:int, param2:int) : uint
      {
         var _loc3_:Vec2F = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this.setEnemyAnimation(ChimaGameObject.CHAR_ANIM_RUN);
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(this._pAnims[_pEnemy.getCurrAnim()].isAnimating() == false)
               {
                  if(Random.RandomNumberRange(0,10000) % 2 == 0)
                  {
                     if(this._bHasKnockback)
                     {
                        _loc3_ = _pEnemy.getPosition();
                        if(_loc3_.y >= 0.2 * Number(LegoChima.Instance().zGetScreenHeight()))
                        {
                           this._state.gotoState(this.StateShoot);
                        }
                        else
                        {
                           this.setEnemyAnimation(ChimaGameObject.CHAR_ANIM_RUN);
                        }
                     }
                     else
                     {
                        this._state.gotoState(this.StateShoot);
                     }
                  }
                  else
                  {
                     this.setEnemyAnimation(ChimaGameObject.CHAR_ANIM_RUN);
                  }
               }
               this.updateMovement();
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
               this.setEnemyAnimation(ChimaGameObject.CHAR_ANIM_RUN_SHOOT);
               this._bFired = false;
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(this._pAnims[_pEnemy.getCurrAnim()].isAnimating() == false)
               {
                  this._state.gotoState(this.StateFly);
               }
               else if(!this._bFired && this._pAnims[_pEnemy.getCurrAnim()].getFrame() == this._iFireOnFrame)
               {
                  this._bFired = true;
                  _pEnemy.fireGun();
                  if(this._bHasKnockback)
                  {
                     this._state.gotoState(this.StateKnockback);
                  }
               }
               this.updateMovement();
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateKnockback(param1:int, param2:int) : uint
      {
         var _loc3_:Vec2F = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               _loc3_ = _pEnemy.getPosition();
               this._vMoveTarget.x = _loc3_.x;
               this._vMoveTarget.y = -100;
               this._fKnockbackVelY = kfKnockbackVelY;
               break;
            case StateManager.Z_ACTION_UPDATE:
               _loc3_ = _pEnemy.getPosition();
               _loc3_.y += this._fDt * this._fKnockbackVelY;
               if(this._fKnockbackVelY < kfKnockbackMaxVelY)
               {
                  this._fKnockbackVelY += kfKnockbackAccY;
               }
               if(_loc3_.y <= this._vMoveTarget.y)
               {
                  this._state.gotoState(this.StateFly);
               }
               else
               {
                  _pEnemy.setPosition(_loc3_);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function setEnemyAnimation(param1:int) : void
      {
         var _loc2_:int = _pEnemy.getCurrAnim();
         this._pAnims[_loc2_].setEnabled(false);
         this._pAnims[param1].setEnabled(true);
         this._pAnims[param1].setFrame(0);
         this._pAnims[param1].play(false,_pEnemy.getAnimSpeed());
         _pEnemy.setCurrAnimValue(param1);
      }
      
      public function updateMovement() : void
      {
         var _loc1_:Vec2F = _pEnemy.getPosition();
         var _loc2_:Vec2F = new Vec2F(this._vMoveTarget.x - _loc1_.x,this._vMoveTarget.y - _loc1_.y);
         _loc2_.normalize(1);
         var _loc3_:Number = kfMoveSpeed;
         var _loc5_:Number;
         var _loc4_:Vec2F;
         if((_loc5_ = (_loc4_ = new Vec2F(_loc1_.x - this._vMoveTarget.x,_loc1_.y - this._vMoveTarget.y)).length) <= kfSlowOverDistance)
         {
            _loc3_ *= _loc5_ / kfSlowOverDistance;
         }
         _loc2_.x *= this._fDt * _loc3_;
         _loc2_.y *= this._fDt * _loc3_;
         _loc1_.x += _loc2_.x;
         _loc1_.y += _loc2_.y;
         _pEnemy.setPosition(_loc1_);
         if(_loc5_ <= kfCloseEnough)
         {
            this.pickNewMovementTarget();
         }
      }
      
      public function pickNewMovementTarget() : void
      {
         var _loc5_:Vec2F = null;
         var _loc6_:Vec2F = null;
         var _loc1_:Vec2F = new Vec2F();
         var _loc2_:Vec2F = _pEnemy.getPosition();
         var _loc3_:AABox2f = new AABox2f(new Vec2F(0,0),new Vec2F(LegoChima.Instance().zGetScreenWidth(),LegoChima.Instance().zGetScreenHeight()));
         var _loc4_:Player = GameWorld.get().getPlayer();
         if(_loc3_.isPointIn(_loc2_))
         {
            if(this._bDivebombPlayer && _loc4_ && Random.RandomNumberRange(0,10000) % 5 == 0)
            {
               _loc5_ = _loc4_.getPosition();
               _loc1_.x = _loc5_.x;
               _loc1_.y = _loc5_.y;
               _loc1_.y += kfDivebombOffsetY;
            }
            else
            {
               _loc6_ = new Vec2F();
               do
               {
                  _loc6_.x = 0;
                  _loc6_.y = 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
                  _loc6_.rotate(Random.RandomFloatRangeUniform(0,Math.PI * 2));
                  _loc1_.x = _pEnemy.getPosition().x + _loc6_.x;
                  _loc1_.y = _pEnemy.getPosition().y + _loc6_.x;
               }
               while(_loc3_.isPointIn(_loc1_) == false);
               
            }
         }
         else
         {
            _loc1_.x = Random.RandomFloatRangeUniform(0,Number(LegoChima.Instance().zGetScreenWidth()));
            _loc1_.y = kfTargetStartY;
         }
         if(this._bTargetPlayer && Random.RandomNumberRange(0,10000) % 5 == 0 && _loc4_ != null)
         {
            _loc1_.x = _loc4_.getPosition().x;
         }
         this._vMoveTarget.x = _loc1_.x;
         this._vMoveTarget.y = _loc1_.y;
      }
   }
}
