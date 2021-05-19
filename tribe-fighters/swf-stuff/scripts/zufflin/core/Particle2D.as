package zufflin.core
{
   import flash.geom.Point;
   import starling.display.BlendMode;
   import starling.display.Image;
   import starling.display.Sprite;
   import util.Vec2F;
   
   public class Particle2D extends Sprite
   {
      
      public static const Z_ANCHOR_CENTRE:int = 0;
       
      
      public var drawType:int;
      
      public var preDelay:int;
      
      public var rotationSpeed:Number;
      
      public var rotationDamping:Number;
      
      public var startSize:Vec2F;
      
      public var endSize:Vec2F;
      
      public var sizeVel:Vec2F;
      
      public var sizeVelDamping:Number;
      
      public var startColor:RGBA;
      
      public var endColor:RGBA;
      
      public var life:Number;
      
      public var lifeSecsInv:Number;
      
      public var velocityDamping:Number;
      
      public var velocity:Vec2F;
      
      public var externalVelocity:Vec2F;
      
      public var anchor:uint;
      
      public var gravity:Vec2F;
      
      public var posZ:Number;
      
      public var velZ:Number;
      
      public var bounceZ:Number;
      
      public var pSpriteGrid:zSpriteList;
      
      public var alphaKeys:Vector.<Number>;
      
      public var colorKeys:Vector.<RGBA>;
      
      public var sizeKeys:Vector.<Vec2F>;
      
      public var rotationKeys:Vector.<Number>;
      
      private var pSprite:zSprite;
      
      public var curHSize:Vec2F;
      
      public var curShadowDistance:Number;
      
      public var curColor:RGBA;
      
      public var _blendMode:int;
      
      public var shadowDepth:int;
      
      public var flags:uint;
      
      public var sinScaleSpeed:Number;
      
      public var sinScaleDir:int;
      
      public var sinScaleProgress:Number;
      
      private var _image:Image;
      
      private var bIsAdded:Boolean;
      
      private var _oldColour:uint;
      
      private var positionX:Number;
      
      private var positionY:Number;
      
      public var bWorldSpace:Boolean;
      
      private var vLocal:Point;
      
      private var vGlobal:Point;
      
      public function Particle2D()
      {
         this.vGlobal = new Point();
         this.vLocal = new Point();
         this.bWorldSpace = false;
         this.positionX = 0;
         this.positionY = 0;
         this.bIsAdded = false;
         super();
         this.alphaKeys = new Vector.<Number>();
         this.colorKeys = new Vector.<RGBA>();
         this.sizeKeys = new Vector.<Vec2F>();
         this.rotationKeys = new Vector.<Number>();
         this.velocity = new Vec2F();
         this.preDelay = 0;
         rotation = 0;
         this.rotationSpeed = 0;
         this.rotationDamping = 0;
         this.life = 0;
         this.lifeSecsInv = 1;
         this.flags = 0;
         this.velocityDamping = 0;
         this.startColor = new RGBA(255,255,255,255);
         this.endColor = new RGBA(255,255,255,0);
         this.startSize = new Vec2F();
         this.endSize = new Vec2F();
         this.sizeVel = new Vec2F();
         this.sizeVelDamping = 0;
         this._blendMode = zMaterial.Z_BLEND_ALPHA;
         this.pSprite = null;
         this.gravity = new Vec2F();
         this.anchor = Z_ANCHOR_CENTRE;
         this.drawType = ParticleManager2D.Z_PARTICLE_DRAW_POINT_SPRITE;
         this.posZ = 0;
         this.velZ = 0;
         this.bounceZ = 0;
         this.curShadowDistance = 0;
         this.pSpriteGrid = null;
         this.sinScaleSpeed = 0;
         this.sinScaleProgress = 0;
         this.sinScaleDir = 0;
         this._image = null;
         this.curColor = new RGBA(255,255,255,255);
         this.curHSize = new Vec2F();
         this._oldColour = 16777215;
         this.externalVelocity = null;
      }
      
      override public function dispose() : void
      {
         if(this._image != null)
         {
            this.removeChild(this._image);
            this._image.dispose();
            this._image = null;
         }
         super.dispose();
      }
      
      public function setColor(param1:RGBA, param2:RGBA = null) : void
      {
         this.startColor = param1;
         if(param2 == null)
         {
            this.endColor = this.startColor;
         }
         else
         {
            this.endColor = param2;
         }
         this.curColor.setFromRGBA(param1);
      }
      
      public function setSize(param1:Number) : void
      {
         this.startSize.set(param1,param1);
         this.endSize.set(param1,param1);
      }
      
      public function setSize2(param1:Number, param2:Number) : void
      {
         this.startSize.set(param1,param1);
         this.endSize.set(param2,param2);
      }
      
      public function setSizeVec(param1:Vec2F) : void
      {
         this.startSize.x = param1.x;
         this.startSize.y = param1.y;
         this.endSize.x = param1.x;
         this.endSize.y = param1.y;
      }
      
      public function setSizeVec2(param1:Vec2F, param2:Vec2F) : void
      {
         this.startSize.x = param1.x;
         this.startSize.y = param1.y;
         this.endSize.x = param2.x;
         this.endSize.y = param2.y;
      }
      
      public function setSizeVelocity(param1:Vec2F, param2:Number) : void
      {
         this.sizeVel = param1;
         this.sizeVelDamping = param2;
         this.flags |= ParticleManager2D.Z_PARTICLE_SIZE_VEL;
      }
      
      public function setRotation(param1:Number) : void
      {
         rotation = param1;
      }
      
      public function setRotationSpeed(param1:Number, param2:Number) : void
      {
         this.rotationSpeed = param1;
         this.rotationDamping = param2;
      }
      
      public function setRotationAndSpeed(param1:Number, param2:Number) : void
      {
         rotation = param1;
         this.rotationSpeed = param2;
      }
      
      public function setRotationDamping(param1:Number) : void
      {
         this.rotationDamping = param1;
      }
      
      public function setLife(param1:Number) : void
      {
         this.lifeSecsInv = 1 / param1;
      }
      
      public function setSprite(param1:zSprite) : void
      {
         this.pSprite = param1;
         if(this._image == null)
         {
            this._image = new Image(this.pSprite._tex);
            this._image.alignPivot();
            this.addChild(this._image);
            this.bIsAdded = true;
         }
         else
         {
            this._image.texture = this.pSprite._tex;
            this._image.alignPivot();
         }
      }
      
      public function getSprite() : zSprite
      {
         return this.pSprite;
      }
      
      public function setVelocity(param1:Vec2F, param2:Number = 0.0) : void
      {
         this.velocity.x = param1.x;
         this.velocity.y = param1.y;
         this.velocityDamping = param2;
      }
      
      public function setExternalVelocity(param1:Vec2F) : void
      {
         if(param1 == null)
         {
            this.externalVelocity = null;
         }
         else
         {
            this.externalVelocity = param1;
         }
      }
      
      public function setGravity(param1:Vec2F) : void
      {
         this.gravity.x = param1.x;
         this.gravity.y = param1.y;
      }
      
      public function setPosition(param1:Vec2F, param2:Boolean = false) : void
      {
         this.positionX = param1.x;
         this.positionY = param1.y;
         if(param2)
         {
            this.x = param1.x;
            this.y = param1.y;
         }
      }
      
      public function setDelay(param1:int) : void
      {
         this.preDelay = param1;
      }
      
      public function setBlendMode(param1:int) : void
      {
         this._blendMode = param1;
      }
      
      public function setDepth(param1:int) : void
      {
      }
      
      public function setAnchor(param1:uint) : void
      {
         throw new Error("SCG:Particle func needs impl");
      }
      
      public function addAlphaKey(param1:Number) : void
      {
         this.alphaKeys.push(param1);
      }
      
      public function clearAlphaKeys() : void
      {
         this.alphaKeys.length = 0;
      }
      
      public function addColorKey(param1:RGBA) : void
      {
         this.colorKeys.push(param1);
      }
      
      public function clearColorKeys() : void
      {
         this.colorKeys.length = 0;
      }
      
      public function addSizeKeyF(param1:Number) : void
      {
         this.sizeKeys.push(new Vec2F(param1,param1));
      }
      
      public function addSizeKey(param1:Vec2F) : void
      {
         this.sizeKeys.push(param1);
      }
      
      public function addRotationKey(param1:Number) : void
      {
         this.rotationKeys.push(param1);
      }
      
      public function setDrawType(param1:int) : void
      {
         this.drawType = param1;
      }
      
      public function getPosition() : Vec2F
      {
         return new Vec2F(x,y);
      }
      
      public function getRotation() : Number
      {
         return rotation;
      }
      
      public function getCurColor() : RGBA
      {
         return this.curColor;
      }
      
      public function getStartSize() : Vec2F
      {
         return this.startSize;
      }
      
      public function getEndSize() : Vec2F
      {
         return this.endSize;
      }
      
      public function getSizeVel() : Vec2F
      {
         return this.sizeVel;
      }
      
      public function getSizeVelDamping() : Number
      {
         return this.sizeVelDamping;
      }
      
      public function getVelocity() : Vec2F
      {
         return this.velocity;
      }
      
      public function getVelocityDamping() : Number
      {
         return this.velocityDamping;
      }
      
      public function setVelZ(param1:Number) : void
      {
         this.velZ = param1;
      }
      
      public function setPosZ(param1:Number) : void
      {
         this.posZ = param1;
      }
      
      public function setShadowDepth(param1:int) : void
      {
         this.shadowDepth = param1;
      }
      
      public function setSpriteGrid(param1:zSpriteList) : void
      {
         this.pSpriteGrid = param1;
         this.setLife(this.pSpriteGrid._list.length / 30);
      }
      
      public function setSinScale(param1:Number, param2:int = 0) : void
      {
         this.sinScaleSpeed = param1;
         this.sinScaleDir = param2;
      }
      
      public function SCG_UpdateRenderColour() : void
      {
         var _loc1_:uint = 0;
         if(this._image != null)
         {
            _loc1_ = this.curColor.getDrawColour();
            if(_loc1_ != this._oldColour)
            {
               this._image.color = this.curColor.getDrawColour();
               this._oldColour = _loc1_;
            }
            this._image.alpha = this.curColor.getDrawAlpha();
         }
      }
      
      public function finalise(param1:uint = 0) : void
      {
         this.flags |= param1;
         this.curHSize.x = this.startSize.x;
         this.curHSize.y = this.startSize.y;
         this.curColor.setFromRGBA(this.startColor);
         if(this._image != null)
         {
            if(this.bIsAdded == false)
            {
               this.addChild(this._image);
               this.bIsAdded = true;
            }
            if(this.preDelay > 0)
            {
               this.visible = false;
            }
            switch(this._blendMode)
            {
               case zMaterial.Z_BLEND_OPAQUE:
                  this._image.blendMode = BlendMode.NORMAL;
                  break;
               case zMaterial.Z_BLEND_ALPHA_ADD:
                  this._image.blendMode = BlendMode.ADD;
                  break;
               default:
                  this._image.blendMode = BlendMode.NORMAL;
            }
         }
      }
      
      public function applyMove(param1:Number, param2:Number) : void
      {
         this.positionX += param1;
         this.positionY += param2;
         if(this.bWorldSpace)
         {
            if(this.parent != null)
            {
               if(this.parent.parent != null)
               {
                  if(this.parent.parent.parent != null)
                  {
                     this.x = this.positionX - this.parent.parent.parent.x;
                     this.y = this.positionY - this.parent.parent.parent.y;
                  }
                  else
                  {
                     this.x = this.positionX - this.parent.parent.x;
                     this.y = this.positionY - this.parent.parent.y;
                  }
               }
               else
               {
                  this.x = this.positionX - this.parent.x;
                  this.y = this.positionY - this.parent.y;
               }
            }
            else
            {
               this.x = this.positionX;
               this.y = this.positionY;
            }
         }
         else
         {
            this.x = this.positionX;
            this.y = this.positionY;
         }
      }
   }
}
