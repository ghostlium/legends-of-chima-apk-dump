package game.objects.flags
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.ChimaGameObject;
   import game.objects.Player;
   import game.objects.events.EventObjectDeleted;
   import game.objects.misc.ParticleHolder;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.core.zSprite;
   import zufflin.math.AABox2f;
   import zufflin.physics2D.EventContact2;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.RenderableParticleSystem;
   
   public class FlagPiece extends ChimaGameObject
   {
      
      public static const kfFadeOutSpeed:Number = 6;
       
      
      public var _fAlpha:Number;
      
      public var _bPickedUp:Boolean;
      
      public var _pParticles:RenderableParticleSystem;
      
      public var _pPickedUpSprite:zSprite;
      
      public function FlagPiece(param1:int, param2:Vec2F, param3:GlaSet, param4:String)
      {
         super(param1,param2,1,GameConsts.ePickupCollisionCat,GameConsts.ePlayerCollisionCat,param3,param4);
         this._fAlpha = 1;
         this._bPickedUp = false;
         this._pPickedUpSprite = GameRes.get()._pPickUpGreenSparkleSprite;
         setEnableShadow(false);
         setDepthOffset(GameConsts.DEPTH_OFFSET_FLOOR_OBJECTS);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      override public function deleteThis() : void
      {
         this.eventObjectDeleted();
         super.deleteThis();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:Vec2F = getPosition();
         _loc2_.y += GameWorld.get().getGroundSpeed() * param1.getTime().dt;
         setPosition(_loc2_);
         this.updateParticles();
         var _loc3_:AABox2f = _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].getLocalBounds();
         _loc3_.translate(getPosition());
         _pAnims[ChimaGameObject.CHAR_ANIM_STATIC].setColor(new RGBA(255,255,255,this._fAlpha * 255));
         if(this._bPickedUp)
         {
            this._fAlpha -= param1.getTime().dt * kfFadeOutSpeed;
            if(this._fAlpha <= 0)
            {
               this.deleteThis();
            }
         }
         else if(_loc3_.min.y > LegoChima.Instance().zGetScreenHeight())
         {
            GameWorld.get().getEnemyManager().getFlagGenerator().pieceDestroyed();
            this.deleteThis();
         }
      }
      
      override public function specificContact(param1:EventContact2) : void
      {
         var _loc2_:Particle2D = null;
         var _loc3_:Number = NaN;
         if(!this._bPickedUp && param1.getOtherObject() is Player)
         {
            GameWorld.get().getEnemyManager().getFlagGenerator().piecePickedUp();
            this._bPickedUp = true;
            if(this._pParticles != null)
            {
               _loc2_ = this._pParticles.addParticle();
               if(_loc2_ != null)
               {
                  _loc2_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
                  _loc2_.setSprite(this._pPickedUpSprite);
                  _loc2_.addSizeKeyF(0);
                  _loc2_.addSizeKeyF(Random.RandomFloatRangeUniform(3,5));
                  _loc2_.addSizeKeyF(0);
                  _loc2_.setLife(0.3);
                  _loc3_ = Random.RandomFloatRangeUniform(6,8);
                  if(Random.RandomNumberRange(0,10000) % 2 == 0)
                  {
                     _loc3_ *= -1;
                  }
                  _loc2_.setRotationAndSpeed(Random.RandomFloatRangeUniform(0,Math.PI * 2),_loc3_);
                  _loc2_.setColor(new RGBA(255,255,255,255));
                  _loc2_.addAlphaKey(255);
                  _loc2_.addAlphaKey(0);
                  _loc2_.finalise();
               }
            }
            playSfxExt(GameRes.get()._pPickupFlagSound,0,1,1,false);
         }
      }
      
      public function updateParticles() : void
      {
         var _loc1_:Particle2D = null;
         var _loc2_:Vec2F = null;
         if(!this._bPickedUp)
         {
            if(!this._pParticles)
            {
               this._pParticles = new RenderableParticleSystem(25);
               this._pParticles.setWorldSpace(false);
               addComponent(this._pParticles);
            }
            if(Random.RandomNumberRange(0,10000) % 5 == 0)
            {
               _loc1_ = this._pParticles.addParticle();
               if(_loc1_ != null)
               {
                  _loc1_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
                  _loc1_.setSprite(GameRes.get()._pPickupGreenTrailSprite);
                  _loc1_.setPosition(SCG_GetRigidBody().getRandomPositionInsideCollision());
                  _loc1_.setSize(Random.RandomFloatRangeUniform(1,1.7));
                  _loc1_.setLife(Random.RandomFloatRangeUniform(0.5,0.8));
                  _loc2_ = new Vec2F(0,-1);
                  _loc2_.scaleBy(Random.RandomFloatRangeUniform(75,150));
                  _loc1_.setVelocity(_loc2_);
                  _loc1_.setColor(new RGBA(255,255,255,255));
                  _loc1_.addAlphaKey(255);
                  _loc1_.addAlphaKey(255);
                  _loc1_.addAlphaKey(0);
                  _loc1_.finalise();
               }
            }
         }
      }
      
      public function eventObjectDeleted(param1:EventObjectDeleted = null) : void
      {
         var _loc2_:ParticleHolder = null;
         if(this._pParticles)
         {
            this.removeComponent(this._pParticles);
            _loc2_ = new ParticleHolder(this._pParticles);
            _loc2_.setPosition(getPosition());
            getLayer().addObject(_loc2_);
            _loc2_.eventAddedToLayer();
         }
      }
   }
}
