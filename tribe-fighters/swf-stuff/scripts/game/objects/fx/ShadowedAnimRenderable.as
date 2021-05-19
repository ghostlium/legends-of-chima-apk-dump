package game.objects.fx
{
   import starling.display.BlendMode;
   import starling.display.Image;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.MathsHelper;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerElement;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.cobraBase.GlaScene;
   import zufflin.cobraBase.GlaSceneState;
   import zufflin.core.zSprite;
   import zufflin.world2D.GlaAnimRenderable;
   
   public class ShadowedAnimRenderable extends GlaAnimRenderable
   {
       
      
      public var _bEnableShadow:Boolean;
      
      public var _vShadowPos:Vec2F;
      
      public var _vShadowOffset:Vec2F;
      
      public var _pInvulnSpr:zSprite;
      
      public var _vInvulnOffset:Vec2F;
      
      public var _fInvulnScale:Number;
      
      public var _fInvulnAlpha:Number;
      
      public var _shadow:Image;
      
      public var _invulnImage:Image;
      
      public function ShadowedAnimRenderable(param1:GlaScene = null, param2:GlaSceneState = null)
      {
         super(param1,param2);
         this._vInvulnOffset = new Vec2F();
         this._vShadowPos = new Vec2F();
         this._vShadowOffset = new Vec2F();
         this._bEnableShadow = false;
         this._pInvulnSpr = null;
         this._fInvulnScale = 1;
         this._fInvulnAlpha = 0;
         this._shadow = null;
         this._invulnImage = null;
      }
      
      public function setShadowOffset(param1:Vec2F) : void
      {
         this._vShadowOffset.x = param1.x;
         this._vShadowOffset.y = param1.y;
      }
      
      override public function dispose() : void
      {
         if(this._shadow != null)
         {
            this.removeChild(this._shadow,true);
            this._shadow = null;
         }
         if(this._invulnImage != null)
         {
            this.removeChild(this._invulnImage,true);
            this._invulnImage = null;
         }
         super.dispose();
      }
      
      public function initShadowMesh() : void
      {
      }
      
      public function updateMesh() : void
      {
         var _loc3_:GlaControllerElement = null;
         var _loc4_:int = 0;
         var _loc1_:GlaControllerSprite = null;
         var _loc2_:Vector.<GlaControllerElement> = currentController.getElements();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_ is GlaControllerSprite)
            {
               _loc1_ = _loc3_ as GlaControllerSprite;
               break;
            }
         }
         if(_loc1_)
         {
            if(this._bEnableShadow)
            {
               this._vShadowPos.x = _loc1_.getPosition().x;
               this._vShadowPos.y = _loc1_.getPosition().y + 0.5 * _loc1_.getSprite().getHeight();
               if(this._shadow == null)
               {
                  this._shadow = new Image(_loc1_.getSprite().getTexture());
                  this._shadow.alignPivot(HAlign.CENTER,VAlign.BOTTOM);
                  this._shadow.skewX = MathsHelper.DegToRad(15);
                  this._shadow.blendMode = BlendMode.ERASE;
                  this._shadow.setVertexAlpha(0,0.25);
                  this._shadow.setVertexAlpha(1,0.25);
                  this._shadow.setVertexAlpha(2,0.75);
                  this._shadow.setVertexAlpha(3,0.75);
                  this.addChildAt(this._shadow,0);
               }
               else
               {
                  this._shadow.texture = _loc1_.getSprite().getTexture();
               }
            }
         }
         else if(this._shadow != null)
         {
            this.removeChild(this._shadow,true);
            this._shadow = null;
         }
         if(this._bEnableShadow == false && this._shadow != null)
         {
            this.removeChild(this._shadow,true);
            this._shadow = null;
         }
         if(this._shadow != null)
         {
            this._shadow.x = this._vShadowPos.x + this._vShadowOffset.x;
            this._shadow.y = this._vShadowPos.y + this._vShadowOffset.y;
         }
         if(this._pInvulnSpr == null)
         {
            if(this._invulnImage != null)
            {
               this.removeChild(this._invulnImage,true);
               this._invulnImage = null;
            }
         }
         else
         {
            if(this._invulnImage == null)
            {
               this._invulnImage = new Image(this._pInvulnSpr.getTexture());
               this._invulnImage.blendMode = BlendMode.ADD;
               this._invulnImage.alignPivot();
               _loc4_ = this._shadow != null ? 1 : 0;
               this.addChildAt(this._invulnImage,_loc4_);
            }
            this._invulnImage.alpha = this._fInvulnAlpha;
            this._invulnImage.scaleX = this._fInvulnScale;
            this._invulnImage.scaleY = this._fInvulnScale;
            this._invulnImage.x = this._vInvulnOffset.x;
            this._invulnImage.y = this._vInvulnOffset.y;
         }
      }
      
      public function calculateVerts(param1:zSprite, param2:Vector.<Vec2F>) : void
      {
      }
      
      public function setEnableShadow(param1:Boolean) : void
      {
         this._bEnableShadow = param1;
      }
      
      public function setDrawInvulnerablity(param1:zSprite, param2:Vec2F, param3:Number, param4:Number) : void
      {
         this._pInvulnSpr = param1;
         this._vInvulnOffset.x = param2.x;
         this._vInvulnOffset.y = param2.y;
         this._fInvulnScale = param3;
         this._fInvulnAlpha = param4;
      }
   }
}
