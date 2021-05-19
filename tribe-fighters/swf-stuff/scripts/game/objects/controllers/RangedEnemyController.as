package game.objects.controllers
{
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.EnemyManager;
   import game.objects.Player;
   import game.objects.enemies.Enemy;
   import game.objects.fx.ShadowedAnimRenderable;
   import util.MathsHelper;
   import util.Random;
   import util.Vec2F;
   import zufflin.core.StateManager;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   
   public class RangedEnemyController extends EnemyController
   {
      
      public static const kfTestEnemyMoveSpeed:Number = 100;
      
      public static const kfTestEnemyCloseEnough:Number = 5;
      
      public static const kfTestEnemyIgnoreCollSpeed:Number = 1;
      
      public static const kfEnemyOffScreenKillDistance:Number = 200;
      
      public static const kfPlayerBaseLineY:Number = 768;
       
      
      public var _state:StateManager;
      
      public var _pAnims:Vector.<ShadowedAnimRenderable>;
      
      public var _fDt:Number;
      
      public var _fTimeSinceShot:Number;
      
      public var _vVelocity:Vec2F;
      
      public var _vWalkTarget:Vec2F;
      
      public var _bTargetReached:Boolean;
      
      public var _fIgnoreCollisionTimer:Number;
      
      public var _fStandTimer:Number;
      
      public var _iFireOnRunFrame:int;
      
      public var _iFireOnStandFrame:int;
      
      public var _bFired:Boolean;
      
      public function RangedEnemyController(param1:Enemy)
      {
         super(param1);
         this._fTimeSinceShot = 0;
         this._vVelocity = new Vec2F();
         this._vWalkTarget = new Vec2F();
         this._fStandTimer = 0;
         this._fIgnoreCollisionTimer = 0;
         this._fDt = 0;
         this._iFireOnRunFrame = 0;
         this._iFireOnStandFrame = 0;
         this._bFired = false;
         this._pAnims = param1.getAnims();
         this._state = new StateManager();
         this._state.setOwner(this);
         this._state.gotoState(this.StateStand);
         this.pickNewMode();
      }
      
      public function setFireOnRunFrame(param1:int) : void
      {
         this._iFireOnRunFrame = param1;
      }
      
      public function setFireOnStandFrame(param1:int) : void
      {
         this._iFireOnStandFrame = param1;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         this._fDt = param1.getTime().dt;
         this._fIgnoreCollisionTimer -= kfTestEnemyIgnoreCollSpeed * this._fDt;
         this._fIgnoreCollisionTimer = MathsHelper.Clamp(this._fIgnoreCollisionTimer,0,1);
         this._state.update();
         if(_pEnemy.getPosition().y > kfEnemyOffScreenKillDistance + Number(LegoChima.Instance().zGetScreenHeight()))
         {
            if(_pEnemy.getOwner() != null)
            {
               (_pEnemy.getOwner() as EnemyManager).enemyDied(_pEnemy,false);
            }
            _pEnemy.deleteThis();
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         var _loc2_:Vec2F = null;
         if(this._fIgnoreCollisionTimer == 0 && param1.getOtherObject() is Enemy)
         {
            this._fIgnoreCollisionTimer = 1;
            this._vVelocity.x = _pEnemy.getPosition().x - param1.getOtherObject().getPosition().x;
            this._vVelocity.y = _pEnemy.getPosition().y - param1.getOtherObject().getPosition().y;
            this._vVelocity.normalize(1);
            _loc2_ = new Vec2F(this._vVelocity.x,this._vVelocity.y);
            _loc2_.scaleBy(Random.RandomFloatRangeUniform(100,250));
            this._vWalkTarget.x = _pEnemy.getPosition().x + _loc2_.x;
            this._vWalkTarget.y = _pEnemy.getPosition().y + _loc2_.y;
            this._vVelocity.scaleBy(kfTestEnemyMoveSpeed);
            this._vWalkTarget.x = MathsHelper.Clamp(this._vWalkTarget.x,0,LegoChima.Instance().zGetScreenWidth());
            this._vWalkTarget.y = MathsHelper.Clamp(this._vWalkTarget.y,0,LegoChima.Instance().zGetScreenHeight());
            this._bTargetReached = false;
         }
      }
      
      public function StateStand(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this.setEnemyAnimation(ChimaGameObject.CHAR_ANIM_STAND);
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._state.gotoState(this.StateStandShoot);
               this.updateStandMovement();
               this._fStandTimer -= this._fDt;
               if(this._fStandTimer <= 0)
               {
                  this.pickNewMode();
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateStandShoot(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this.setEnemyAnimation(ChimaGameObject.CHAR_ANIM_STAND_SHOOT);
               this._fTimeSinceShot = 0;
               this._bFired = false;
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._fStandTimer -= this._fDt;
               if(this._pAnims[_pEnemy.getCurrAnim()].getFrame() > 0)
               {
                  this.updateStandMovement();
               }
               if(this._pAnims[_pEnemy.getCurrAnim()].isAnimating() == false)
               {
                  this._state.gotoState(this.StateStand);
               }
               else if(!this._bFired && this._pAnims[_pEnemy.getCurrAnim()].getFrame() == this._iFireOnStandFrame)
               {
                  this._bFired = true;
                  _pEnemy.fireGun();
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateWalk(param1:int, param2:int) : uint
      {
         var _loc3_:Player = null;
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               _loc4_ = 0;
               if(_pEnemy.getOwner() != null)
               {
                  if((_pEnemy.getOwner() as EnemyManager).getCurrentRound() < 3)
                  {
                     _loc3_ = GameWorld.get().getPlayer();
                     if(_loc3_)
                     {
                        _loc4_ = kfPlayerBaseLineY;
                     }
                  }
               }
               if(Random.RandomNumberRange(0,10000) % 2 == 0)
               {
                  this.pickNewWalkTarget(new Vec2F(0,_loc4_),new Vec2F(LegoChima.Instance().zGetScreenWidth(),_loc4_ + Random.RandomFloatRangeUniform(0,0.25) * Number(LegoChima.Instance().zGetScreenHeight())));
               }
               else
               {
                  this.pickNewWalkTarget(new Vec2F(0,_loc4_),new Vec2F(Number(LegoChima.Instance().zGetScreenWidth()),_loc4_ + 0.25 * Number(LegoChima.Instance().zGetScreenHeight()) + Random.RandomFloatRangeUniform(0,0.5) * Number(LegoChima.Instance().zGetScreenHeight())));
               }
               this.setEnemyAnimation(ChimaGameObject.CHAR_ANIM_RUN);
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(this._pAnims[_pEnemy.getCurrAnim()].isAnimating() == false)
               {
                  _loc5_ = false;
                  _loc3_ = GameWorld.get().getPlayer();
                  if(_loc3_ && _pEnemy.getPosition().y >= kfPlayerBaseLineY)
                  {
                     _loc5_ = true;
                  }
                  if(this._bTargetReached)
                  {
                     if(_loc5_)
                     {
                        this._vWalkTarget.y += LegoChima.Instance().zGetScreenHeight();
                        this._vVelocity.x = this._vWalkTarget.x - _pEnemy.getPosition().x;
                        this._vVelocity.y = this._vWalkTarget.y - _pEnemy.getPosition().y;
                        this._vVelocity.normalize(1);
                        this._vVelocity.scaleBy(kfTestEnemyMoveSpeed);
                        this._bTargetReached = false;
                     }
                     else
                     {
                        this.pickNewMode();
                     }
                  }
                  else if(Random.RandomNumberRange(0,10000) % 2 == 0 || _loc5_)
                  {
                     this.setEnemyAnimation(ChimaGameObject.CHAR_ANIM_RUN);
                  }
                  else
                  {
                     this._state.gotoState(this.StateWalkShoot);
                  }
               }
               this.updateWalkMovement();
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateWalkShoot(param1:int, param2:int) : uint
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
                  this._state.gotoState(this.StateWalk);
               }
               else if(!this._bFired && this._pAnims[_pEnemy.getCurrAnim()].getFrame() == this._iFireOnRunFrame)
               {
                  this._bFired = true;
                  _pEnemy.fireGun();
               }
               this.updateWalkMovement();
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function updateStandMovement() : void
      {
         var _loc1_:Vec2F = _pEnemy.getPosition();
         _loc1_.y += GameWorld.get().getGroundSpeed() * this._fDt;
         _pEnemy.setPosition(_loc1_);
      }
      
      public function updateWalkMovement() : void
      {
         var _loc1_:Vec2F = _pEnemy.getPosition();
         _loc1_.x += this._vVelocity.x * this._fDt;
         _loc1_.y += this._vVelocity.y * this._fDt;
         _loc1_.y += GameWorld.get().getGroundSpeedBoost() * this._fDt;
         _pEnemy.setPosition(_loc1_);
         var _loc2_:Vec2F = new Vec2F(_loc1_.x - this._vWalkTarget.x,_loc1_.y - this._vWalkTarget.y);
         if(_loc2_.getLengthSq() <= kfTestEnemyCloseEnough)
         {
            this._bTargetReached = true;
         }
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
      
      public function pickNewMode() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Player = null;
         if(this._state.getCurState() == this.StateStand)
         {
            this._state.gotoState(this.StateWalk);
         }
         else if(this._state.getCurState() == this.StateWalk)
         {
            if(Random.RandomNumberRange(0,10000) % 2 == 0 && _pEnemy.getPosition().y < Number(LegoChima.Instance().zGetScreenHeight()) * 0.5)
            {
               this._fStandTimer = Random.RandomFloatRangeUniform(0.5,2.5);
               this._state.gotoState(this.StateStand);
            }
            else
            {
               _loc1_ = 0;
               if(_pEnemy.getOwner() != null)
               {
                  if((_pEnemy.getOwner() as EnemyManager).getCurrentRound() < 3)
                  {
                     _loc2_ = GameWorld.get().getPlayer();
                     if(_loc2_ != null)
                     {
                        _loc1_ = _loc2_.getPosition().y;
                     }
                     else
                     {
                        _loc1_ = LegoChima.Instance().zGetScreenHeight();
                     }
                  }
               }
               this.pickNewWalkTarget(new Vec2F(0,_loc1_),new Vec2F(Number(LegoChima.Instance().zGetScreenWidth()),_loc1_ + Random.RandomFloatRangeUniform(0,0.5) * Number(LegoChima.Instance().zGetScreenHeight())));
            }
         }
      }
      
      public function pickNewWalkTarget(param1:Vec2F, param2:Vec2F) : void
      {
         var _loc3_:Vec2F = new Vec2F(this._vWalkTarget.x,this._vWalkTarget.y);
         var _loc4_:Vec2F = new Vec2F(_loc3_.x - this._vWalkTarget.x,_loc3_.y - this._vWalkTarget.y);
         while(_loc4_.getLengthSq() < 300)
         {
            this._vWalkTarget.x = Random.RandomFloatRangeUniform(param1.x,param2.x);
            this._vWalkTarget.y = Random.RandomFloatRangeUniform(param1.y,param2.y);
            _loc4_.x = _loc3_.x - this._vWalkTarget.x;
            _loc4_.y = _loc3_.y - this._vWalkTarget.y;
         }
         this._vVelocity.x = this._vWalkTarget.x - _pEnemy.getPosition().x;
         this._vVelocity.y = this._vWalkTarget.y - _pEnemy.getPosition().y;
         this._vVelocity.normalize(1);
         this._vVelocity.scaleBy(kfTestEnemyMoveSpeed);
         this._bTargetReached = false;
      }
   }
}
