package zufflin.core
{
   import starling.display.Sprite;
   import util.MathsHelper;
   import util.Random;
   import zufflin.math.BSpline;
   import zufflin.math.CatmullRomSpline;
   
   public class ParticleManager2D extends Sprite
   {
      
      public static const CLIP_NONE:int = 0;
      
      public static const CLIP_SYSTEM:int = 1;
      
      public static const CLIP_INDIVIDUALY:int = 2;
      
      public static const Z_PARTICLE_SIZE_VEL:int = 1;
      
      public static const Z_PARTICLE_FADE_IN_OUT:int = 2;
      
      public static const Z_PARTICLE_FLICKER:int = 4;
      
      public static const Z_PARTICLE_RANDOM_FRAME:int = 8;
      
      public static const Z_PARTICLE_DRAW_POINT_SPRITE:int = 0;
      
      public static const Z_PARTICLE_DRAW_NORMAL:int = 1;
       
      
      private var pool:Vector.<Particle2D>;
      
      private var clipping:uint;
      
      private var gravityZ:Number;
      
      private var bZ:Boolean;
      
      private var minScaleZ:Number;
      
      private var maxScaleZ:Number;
      
      private var maxPosZ:Number;
      
      private var scaleZDelta:Number;
      
      private var maxShadowDistance:Number;
      
      private var maxparts:int;
      
      private var bWorldSpace:Boolean;
      
      public function ParticleManager2D(param1:int = 512)
      {
         this.bWorldSpace = false;
         super();
         this.clipping = CLIP_SYSTEM;
         this.minScaleZ = 1;
         this.maxScaleZ = 1;
         this.maxPosZ = 0;
         this.scaleZDelta = 0;
         this.gravityZ = 0;
         this.bZ = false;
         this.maxShadowDistance = 0;
         this.pool = new Vector.<Particle2D>();
         this.maxparts = param1;
      }
      
      override public function dispose() : void
      {
         this.removeChildren(0,-1,true);
         super.dispose();
         this.pool.length = 0;
         this.pool = null;
      }
      
      public function setWorldSpace(param1:Boolean) : void
      {
         this.bWorldSpace = param1;
      }
      
      public function getWorldSpace() : Boolean
      {
         return this.bWorldSpace;
      }
      
      public function hasActiveParticles() : Boolean
      {
         return this.pool.length != 0;
      }
      
      public function getNumActiveParticles() : uint
      {
         return this.pool.length;
      }
      
      public function setAlpha(param1:Number) : void
      {
         this.alpha = param1;
      }
      
      public function setClipping(param1:uint) : void
      {
         this.clipping = param1;
      }
      
      public function enableZ(param1:Boolean) : void
      {
         this.bZ = true;
      }
      
      public function setGravityZ(param1:Number) : void
      {
         this.gravityZ = param1;
      }
      
      public function setVisualScaleZ(param1:Number, param2:Number, param3:Number) : void
      {
         this.minScaleZ = param1;
         this.maxScaleZ = param2;
         this.maxPosZ = param3;
         this.scaleZDelta = this.maxScaleZ - this.minScaleZ;
      }
      
      public function setMaxShadowDistance(param1:Number) : void
      {
         this.maxShadowDistance = param1;
      }
      
      public function update(param1:DeltaTime) : void
      {
         var _loc2_:Particle2D = null;
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc3_:Vector.<int> = new Vector.<int>();
         var _loc4_:Number = param1.dt;
         var _loc6_:int = this.pool.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc2_ = this.pool[_loc5_];
            if(_loc2_.life >= 1)
            {
               _loc3_.push(_loc5_);
            }
            else if(_loc2_.preDelay > 0)
            {
               --_loc2_.preDelay;
               if(_loc2_.preDelay <= 0)
               {
                  _loc2_.visible = true;
               }
            }
            else
            {
               if(_loc2_.externalVelocity == null)
               {
                  _loc2_.velocity.x += _loc4_ * _loc2_.gravity.x;
                  _loc2_.velocity.y += _loc4_ * _loc2_.gravity.y;
                  _loc2_.velocity.scaleBy(1 - _loc4_ * _loc2_.velocityDamping);
               }
               else
               {
                  _loc2_.velocity.x = _loc2_.externalVelocity.x;
                  _loc2_.velocity.y = _loc2_.externalVelocity.y;
               }
               _loc2_.rotation += _loc2_.rotationSpeed * _loc4_;
               _loc2_.rotationSpeed *= 1 - _loc4_ * _loc2_.rotationDamping;
               _loc2_.applyMove(_loc2_.velocity.x * _loc4_,_loc2_.velocity.y * _loc4_);
               if(!_loc2_.sizeKeys.length == 0)
               {
                  _loc2_.curHSize = BSpline.calcVecList(_loc2_.sizeKeys,_loc2_.sizeKeys.length,_loc2_.life);
               }
               else if((_loc2_.flags & Z_PARTICLE_SIZE_VEL) != 0)
               {
                  _loc2_.curHSize.x += _loc2_.sizeVel.x * _loc4_;
                  _loc2_.curHSize.y += _loc2_.sizeVel.y * _loc4_;
                  _loc8_ = MathsHelper.Clamp(1 - _loc4_ * _loc2_.sizeVelDamping,0,1);
                  _loc2_.sizeVel.scaleBy(_loc8_);
               }
               else
               {
                  _loc2_.curHSize.x = _loc2_.startSize.x + (_loc2_.endSize.x - _loc2_.startSize.x) * _loc2_.life;
                  _loc2_.curHSize.y = _loc2_.startSize.y + (_loc2_.endSize.y - _loc2_.startSize.y) * _loc2_.life;
                  if((_loc2_.flags & Z_PARTICLE_FLICKER) != 0)
                  {
                     _loc2_.curHSize.scaleBy(0.9 + Random.RandomFloatRangeUniform(0,0.2));
                  }
               }
               if(_loc2_.sinScaleSpeed > 0)
               {
                  _loc2_.sinScaleProgress += _loc2_.sinScaleSpeed;
                  if(_loc2_.sinScaleProgress > 1)
                  {
                     --_loc2_.sinScaleProgress;
                  }
               }
               if(!_loc2_.colorKeys.length == 0)
               {
                  _loc2_.curColor = CatmullRomSpline.calcRGBAList(_loc2_.colorKeys,_loc2_.colorKeys.length,_loc2_.life);
               }
               else if(!_loc2_.alphaKeys.length == 0)
               {
                  _loc2_.curColor.a = uint(Math.max(0,Math.min(255,CatmullRomSpline.calcNumberList(_loc2_.alphaKeys,_loc2_.alphaKeys.length,_loc2_.life))));
               }
               else if((_loc2_.flags & Z_PARTICLE_FADE_IN_OUT) != 0)
               {
                  if(_loc2_.life < 0.5)
                  {
                     _loc2_.curColor = RGBA.mix(_loc2_.endColor,_loc2_.startColor,_loc2_.life * 2,_loc2_.curColor);
                  }
                  else
                  {
                     _loc2_.curColor = RGBA.mix(_loc2_.startColor,_loc2_.endColor,(_loc2_.life - 0.5) * 2,_loc2_.curColor);
                  }
               }
               else
               {
                  _loc2_.curColor = RGBA.mix(_loc2_.startColor,_loc2_.endColor,_loc2_.life,_loc2_.curColor);
               }
               if(_loc2_.flags & Z_PARTICLE_FLICKER)
               {
                  _loc2_.curColor.a = Math.min(255,_loc2_.curColor.a + Random.RandomNumberRange(0,_loc2_.curColor.a | 1));
               }
               _loc2_.life += param1.dt * _loc2_.lifeSecsInv;
               _loc2_.life = MathsHelper.Clamp(_loc2_.life,0,1);
               if(this.bZ)
               {
                  _loc2_.velZ -= _loc4_ * this.gravityZ;
                  _loc2_.posZ += _loc2_.velZ * _loc4_;
                  if(_loc2_.posZ < 0)
                  {
                     _loc2_.posZ = 0;
                     _loc2_.velZ *= -_loc2_.bounceZ;
                  }
                  _loc9_ = _loc2_.posZ / this.maxPosZ;
                  _loc2_.curHSize.scaleBy(this.minScaleZ + this.scaleZDelta * _loc9_);
                  _loc2_.curShadowDistance = _loc9_ * this.maxShadowDistance;
               }
               if(_loc2_.pSpriteGrid)
               {
                  if(_loc2_.flags & Z_PARTICLE_RANDOM_FRAME)
                  {
                     _loc10_ = Random.RandomNumberRange(0,_loc2_.pSpriteGrid._list.length - 1);
                  }
                  else
                  {
                     _loc10_ = Math.min(_loc2_.life * (_loc2_.pSpriteGrid._list.length - 1),_loc2_.pSpriteGrid._list.length - 1);
                  }
                  _loc2_.setSprite(_loc2_.pSpriteGrid._list[_loc10_]);
               }
               _loc2_.SCG_UpdateRenderColour();
               if(_loc2_.sinScaleSpeed > 0)
               {
                  _loc11_ = _loc2_.curHSize.x;
                  _loc12_ = _loc2_.curHSize.y;
                  _loc13_ = Math.sin(_loc2_.sinScaleProgress * Math.PI);
                  _loc14_ = (_loc14_ = 2 * _loc13_ * _loc13_) - 1;
                  if(_loc2_.sinScaleDir == 0)
                  {
                     _loc11_ *= _loc14_;
                  }
                  else
                  {
                     _loc12_ *= _loc14_;
                  }
                  _loc2_.scaleX = _loc11_;
                  _loc2_.scaleY = _loc12_;
               }
               else
               {
                  _loc2_.scaleX = _loc2_.curHSize.x;
                  _loc2_.scaleY = _loc2_.curHSize.y;
               }
            }
            _loc5_++;
         }
         _loc5_ = _loc3_.length - 1;
         while(_loc5_ >= 0)
         {
            this.removeChild(this.pool[_loc3_[_loc5_]]);
            this.pool[_loc3_[_loc5_]].dispose();
            this.pool.splice(_loc3_[_loc5_],1);
            _loc5_--;
         }
      }
      
      public function addParticle() : Particle2D
      {
         var _loc1_:Particle2D = null;
         if(this.pool.length < this.maxparts)
         {
            _loc1_ = new Particle2D();
            this.pool.push(_loc1_);
            _loc1_.bWorldSpace = this.bWorldSpace;
            this.addChild(_loc1_);
            return _loc1_;
         }
         return null;
      }
      
      public function disableExternalVelocity() : void
      {
         var _loc1_:Particle2D = null;
         var _loc2_:int = 0;
         var _loc3_:int = this.pool.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this.pool[_loc2_];
            _loc1_.externalVelocity = null;
            _loc2_++;
         }
      }
   }
}
