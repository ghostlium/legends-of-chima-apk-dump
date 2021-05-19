package zufflin.world2D
{
   import starling.core.RenderSupport;
   import starling.display.Sprite;
   import util.SpriteExt;
   import util.Vec2F;
   import zufflin.core.RGBA;
   import zufflin.core.zSprite;
   import zufflin.math.AABox2f;
   import zufflin.world.WorldObj;
   
   public class Renderable2 extends Sprite
   {
       
      
      public var _depth:Number;
      
      private var _bEnabled:Boolean;
      
      protected var _name:String;
      
      public var _uiUserData:uint;
      
      public var _fUserData1:Number;
      
      public var _fUserData2:Number;
      
      public var _fUserData3:Number;
      
      public function Renderable2()
      {
         super();
         this._uiUserData = 0;
         this._fUserData1 = 0;
         this._fUserData2 = 0;
         this._fUserData3 = 0;
         this._depth = 0;
         this._bEnabled = true;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function setPosition2(param1:Number, param2:Number) : void
      {
         this.x = param1;
         this.y = param2;
      }
      
      public function setPosition(param1:Vec2F) : void
      {
         this.setPosition2(param1.x,param1.y);
      }
      
      public function getPosition() : Vec2F
      {
         return new Vec2F(this.x,this.y);
      }
      
      public function getParentWorldObj() : WorldObj
      {
         var _loc1_:WorldObj = null;
         if(this.parent != null)
         {
            if(this.parent is WorldObj)
            {
               _loc1_ = this.parent as WorldObj;
            }
            else if(this.parent is SpriteExt)
            {
               _loc1_ = (this.parent as SpriteExt)._worldObj;
            }
         }
         return _loc1_;
      }
      
      public function setDepth(param1:Number) : void
      {
         var _loc2_:WorldObj = null;
         this._depth = param1;
         if(this.parent != null)
         {
            _loc2_ = null;
            if(this.parent is WorldObj)
            {
               _loc2_ = this.parent as WorldObj;
            }
            else if(this.parent is SpriteExt)
            {
               _loc2_ = (this.parent as SpriteExt)._worldObj;
            }
            if(_loc2_ != null)
            {
               _loc2_.SCG_depthSortComponents_Main();
               if(_loc2_.getLayer() != null)
               {
                  _loc2_.getLayer().SCG_DepthSortObjects();
               }
            }
         }
      }
      
      public function setDepthf(param1:Number) : void
      {
         this.setDepth(param1);
      }
      
      public function getDepth() : Number
      {
         return this._depth;
      }
      
      public function setColor(param1:RGBA) : void
      {
         this.alpha = param1.getDrawAlpha();
      }
      
      public function SCG_setAlpha(param1:uint) : void
      {
         this.alpha = Number(param1) / 255;
      }
      
      public function setScale(param1:Number) : void
      {
         this.scaleX = param1;
         this.scaleY = param1;
      }
      
      public function setScaleV(param1:Vec2F) : void
      {
         this.scaleX = param1.x;
         this.scaleY = param1.y;
      }
      
      public function getScale() : Vec2F
      {
         return new Vec2F(this.scaleX,this.scaleY);
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         this._bEnabled = param1;
      }
      
      public function isEnabled() : Boolean
      {
         return this._bEnabled;
      }
      
      public function setRotation(param1:Number) : void
      {
         if(this.rotation != param1)
         {
            this.rotation = param1;
         }
      }
      
      public function getRotation() : Number
      {
         return this.rotation;
      }
      
      public function setName(param1:String) : void
      {
         this._name = param1;
      }
      
      public function getName() : String
      {
         return this._name;
      }
      
      public function setAlwaysVisible() : void
      {
      }
      
      public function deleteThis() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         Main.Instance().m_app.SCG_AddRenderableObjectForDeletion(this);
      }
      
      public function setBlendMode(param1:int) : void
      {
      }
      
      public function setSprite(param1:zSprite, param2:Boolean = true) : void
      {
      }
      
      override public function render(param1:RenderSupport, param2:Number) : void
      {
         if(this._bEnabled)
         {
            super.render(param1,param2);
         }
      }
      
      public function getWorldObj() : WorldObj
      {
         if(this.parent == null)
         {
            return null;
         }
         return (this.parent as SpriteExt)._worldObj;
      }
      
      public function getLocalBounds() : AABox2f
      {
         return new AABox2f(new Vec2F(bounds.left,bounds.top),new Vec2F(bounds.right,bounds.bottom));
      }
   }
}
