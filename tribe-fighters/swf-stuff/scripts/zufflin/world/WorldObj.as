package zufflin.world
{
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import util.SpriteExt;
   import util.Vec2F;
   import zufflin.world2D.Renderable2;
   import zufflin.world2D.RenderableParticleSystem;
   
   public class WorldObj
   {
      
      public static const Z_UPDATE_PRIORITY_JOINT:int = 1000000;
      
      public static const Z_UPDATE_PRIORITY_DEFAULT:int = 0;
      
      public static const Z_UPDATE_PRIORITY_CAMERA:int = -1000;
      
      public static const Z_WOF_DELETE_ME:int = 1;
      
      public static const Z_WOF_ENABLED:int = 2;
      
      public static const Z_WOF_REPORT_CONTACT_TO_PARENT:int = 32;
      
      public static const Z_WOF_COLLIDE_WITH_GROUP:int = 64;
       
      
      protected var flags:uint;
      
      protected var pLayer:WorldLayer;
      
      protected var _ComponentLayer:SpriteExt;
      
      public function WorldObj()
      {
         super();
         this._ComponentLayer = new SpriteExt(this);
         this.flags = Z_WOF_ENABLED;
      }
      
      public function dispose() : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.removeChildren(0,-1,true);
            this._ComponentLayer.dispose();
            this._ComponentLayer = null;
         }
      }
      
      public function GetDisplayObj() : SpriteExt
      {
         return this._ComponentLayer;
      }
      
      public function isEnabled() : Boolean
      {
         return (this.flags & (Z_WOF_ENABLED | Z_WOF_DELETE_ME)) == Z_WOF_ENABLED;
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         this._ComponentLayer.visible = param1;
         if(param1)
         {
            this.flags |= Z_WOF_ENABLED;
         }
         else
         {
            this.flags &= ~Z_WOF_ENABLED;
         }
      }
      
      public function getLayer() : WorldLayer
      {
         return this.pLayer;
      }
      
      public function setLayer(param1:WorldLayer) : void
      {
         this.pLayer = param1;
      }
      
      public function setRotation(param1:Number) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.rotation = param1;
         }
      }
      
      public function getRotation() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.rotation;
         }
         return 0;
      }
      
      public function SCG_getMinDepth() : Number
      {
         var _loc1_:int = 0;
         var _loc2_:Renderable2 = null;
         var _loc4_:Number = NaN;
         var _loc3_:Number = 0;
         var _loc5_:Boolean = false;
         _loc1_ = 0;
         while(_loc1_ < this._ComponentLayer.numChildren)
         {
            _loc2_ = this._ComponentLayer.getChildAt(_loc1_) as Renderable2;
            if(_loc2_ != null)
            {
               _loc4_ = _loc2_.getDepth();
               if(!_loc5_ || _loc4_ < _loc3_)
               {
                  _loc3_ = _loc4_;
                  _loc5_ = true;
               }
            }
            _loc1_++;
         }
         return _loc3_;
      }
      
      public function SCG_getMaxDepth() : Number
      {
         var _loc1_:int = 0;
         var _loc2_:Renderable2 = null;
         var _loc4_:Number = NaN;
         var _loc3_:Number = 0;
         var _loc5_:Boolean = false;
         _loc1_ = 0;
         while(_loc1_ < this._ComponentLayer.numChildren)
         {
            _loc2_ = this._ComponentLayer.getChildAt(_loc1_) as Renderable2;
            if(_loc2_ != null)
            {
               _loc4_ = _loc2_.getDepth();
               if(!_loc5_ || _loc4_ > _loc3_)
               {
                  _loc3_ = _loc4_;
                  _loc5_ = true;
               }
            }
            _loc1_++;
         }
         return _loc3_;
      }
      
      public function getComponents_Layer() : SpriteExt
      {
         return this._ComponentLayer;
      }
      
      public function addComponent(param1:DisplayObject) : void
      {
         this._ComponentLayer.addChild(param1);
         this.SCG_depthSortComponents_Main();
         if(this.getLayer() != null)
         {
            this.getLayer().SCG_DepthSortObjects();
         }
      }
      
      public function removeComponent(param1:DisplayObject, param2:Boolean = false) : void
      {
         this._ComponentLayer.removeChild(param1,param2);
      }
      
      public function setPosition(param1:Vec2F) : void
      {
         this._ComponentLayer.x = param1.x;
         this._ComponentLayer.y = param1.y;
      }
      
      public function setPosition2(param1:Number, param2:Number) : void
      {
         this._ComponentLayer.x = param1;
         this._ComponentLayer.y = param2;
      }
      
      public function getPosition() : Vec2F
      {
         if(this._ComponentLayer)
         {
            return new Vec2F(this._ComponentLayer.x,this._ComponentLayer.y);
         }
         return null;
      }
      
      public function get rotation() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.rotation;
         }
         return 0;
      }
      
      public function set x(param1:Number) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.x = param1;
         }
      }
      
      public function get x() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.x;
         }
         return 0;
      }
      
      public function set y(param1:Number) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.y = param1;
         }
      }
      
      public function get y() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.y;
         }
         return 0;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.alpha = param1;
         }
      }
      
      public function get alpha() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.alpha;
         }
         return 0;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.scaleX = param1;
         }
      }
      
      public function get scaleX() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.scaleX;
         }
         return 1;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.scaleY = param1;
         }
      }
      
      public function get scaleY() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.scaleY;
         }
         return 1;
      }
      
      public function set touchable(param1:Boolean) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.touchable = param1;
         }
      }
      
      public function get touchable() : Boolean
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.touchable;
         }
         return false;
      }
      
      public function get width() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.width;
         }
         return 0;
      }
      
      public function get height() : Number
      {
         if(this._ComponentLayer != null)
         {
            return this._ComponentLayer.height;
         }
         return 0;
      }
      
      public function addEventListener(param1:String, param2:Function) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.addEventListener(param1,param2);
         }
      }
      
      public function removeEventListener(param1:String, param2:Function) : void
      {
         if(this._ComponentLayer != null)
         {
            this._ComponentLayer.removeEventListener(param1,param2);
         }
      }
      
      private function SCG_internalDepthSort(param1:DisplayObject, param2:DisplayObject) : int
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Renderable2 = param1 as Renderable2;
         var _loc6_:Renderable2 = param2 as Renderable2;
         if(_loc5_ != null)
         {
            _loc3_ = _loc5_.getDepth();
         }
         if(_loc6_ != null)
         {
            _loc4_ = _loc6_.getDepth();
         }
         if(_loc3_ > _loc4_)
         {
            return -1;
         }
         if(_loc3_ < _loc4_)
         {
            return 1;
         }
         return 0;
      }
      
      public function SCG_depthSortComponents_Main() : void
      {
         this._ComponentLayer.sortChildren(this.SCG_internalDepthSort);
      }
      
      public function setScaleF(param1:Number) : void
      {
         this._ComponentLayer.scaleX = param1;
         this._ComponentLayer.scaleY = param1;
      }
      
      public function getScale() : Vec2F
      {
         return new Vec2F(this._ComponentLayer.scaleX,this._ComponentLayer.scaleY);
      }
      
      public function shouldDelete() : Boolean
      {
         return (this.flags & Z_WOF_DELETE_ME) != 0;
      }
      
      public function deleteThis() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Renderable2 = null;
         var _loc5_:WorldObj = null;
         var _loc6_:DisplayObject = null;
         if(!this.shouldDelete())
         {
            this.flags |= Z_WOF_DELETE_ME;
            _loc1_ = this._ComponentLayer;
            _loc3_ = _loc1_.numChildren;
            _loc2_ = _loc3_ - 1;
            while(_loc2_ >= 0)
            {
               if((_loc4_ = (_loc6_ = _loc1_.getChildAt(_loc2_)) as Renderable2) != null)
               {
                  _loc4_.deleteThis();
               }
               if((_loc5_ = _loc6_ as WorldObj) != null)
               {
                  _loc5_.deleteThis();
               }
               _loc2_--;
            }
            if(this.getLayer())
            {
               this.getLayer().deleteObject(this);
            }
            else
            {
               if(this._ComponentLayer.parent != null)
               {
                  this._ComponentLayer.parent.removeChild(this._ComponentLayer);
               }
               Main.Instance().m_app.SCG_AddWorldObjectForDeletion(this);
            }
         }
      }
      
      public function getComponentRenderableParticleSystem() : RenderableParticleSystem
      {
         var _loc1_:int = 0;
         var _loc2_:int = this._ComponentLayer.numChildren;
         var _loc3_:RenderableParticleSystem = null;
         _loc1_ = _loc2_ - 1;
         while(_loc1_ >= 0)
         {
            _loc3_ = this._ComponentLayer.getChildAt(_loc1_) as RenderableParticleSystem;
            if(_loc3_ != null)
            {
               return _loc3_;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function getComponentRenderable2() : Renderable2
      {
         var _loc1_:int = 0;
         var _loc2_:int = this._ComponentLayer.numChildren;
         var _loc3_:Renderable2 = null;
         _loc1_ = _loc2_ - 1;
         while(_loc1_ >= 0)
         {
            _loc3_ = this._ComponentLayer.getChildAt(_loc1_) as Renderable2;
            if(_loc3_ != null)
            {
               return _loc3_;
            }
            _loc1_++;
         }
         return null;
      }
      
      public function getWorld() : World
      {
         return this.getLayer().getWorld();
      }
      
      public function setCollidesWithGroup(param1:Boolean) : void
      {
         if(param1)
         {
            this.flags |= Z_WOF_COLLIDE_WITH_GROUP;
         }
         else
         {
            this.flags &= ~Z_WOF_COLLIDE_WITH_GROUP;
         }
      }
      
      public function collidesWithGroup() : Boolean
      {
         return (this.flags & Z_WOF_COLLIDE_WITH_GROUP) != 0;
      }
      
      public function getParentRoot() : WorldObj
      {
         return this;
      }
   }
}
