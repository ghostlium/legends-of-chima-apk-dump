package zufflin.world
{
   import game.objects.enemies.Enemy;
   import starling.display.DisplayObject;
   import starling.display.Sprite;
   import util.SpriteExt;
   import zufflin.core.DeltaTime;
   import zufflin.physics2D.PhysicsSystem2;
   import zufflin.world2D.World2Obj;
   
   public class WorldLayer extends Sprite
   {
       
      
      private var _requiresDepthSort:Boolean;
      
      private var _pWorld:World;
      
      private var _name:String;
      
      private var pPhysicsSystem:PhysicsSystem2;
      
      private var _RenderLayer:Sprite;
      
      private var _aWorldObjs:Vector.<WorldObj>;
      
      private var _bUpdateEnabled:Boolean;
      
      private var updateCount:uint;
      
      public function WorldLayer()
      {
         this._bUpdateEnabled = true;
         this._pWorld = null;
         this._requiresDepthSort = false;
         super();
         this.alpha = 0.999;
         this.pPhysicsSystem = null;
         this._RenderLayer = new Sprite();
         this.addChild(this._RenderLayer);
         this._aWorldObjs = new Vector.<WorldObj>();
         this.updateCount = 0;
      }
      
      public function enableUpdate(param1:Boolean) : void
      {
         this._bUpdateEnabled = param1;
      }
      
      public function isUpdateEnabled() : Boolean
      {
         return this._bUpdateEnabled;
      }
      
      public function getUpdateCount() : uint
      {
         return this.updateCount;
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._RenderLayer,true);
         this._RenderLayer = null;
         if(this.pPhysicsSystem != null)
         {
            this.pPhysicsSystem.enableContactReporting(false);
         }
         this._pWorld = null;
         this._name = null;
         super.dispose();
         this._aWorldObjs = null;
      }
      
      public function getWorld() : World
      {
         return this._pWorld;
      }
      
      public function addPhysicsSystem(param1:PhysicsSystem2) : void
      {
         this.pPhysicsSystem = param1;
      }
      
      public function getPhysicsSystem() : PhysicsSystem2
      {
         return this.pPhysicsSystem;
      }
      
      public function addObject(param1:WorldObj) : void
      {
         if(param1 is Enemy)
         {
            (param1 as Enemy).eventAddedToLayer();
         }
         this._aWorldObjs.push(param1);
         this._RenderLayer.addChild(param1.GetDisplayObj());
         param1.setLayer(this);
         this.SCG_DepthSortObjects();
         var _loc2_:World2Obj = param1 as World2Obj;
         if(_loc2_ != null)
         {
            if(_loc2_.SCG_GetRigidBody() != null)
            {
               _loc2_.SCG_GetRigidBody().addedToLayer();
            }
         }
      }
      
      private function SCG_internalDepthSort(param1:DisplayObject, param2:DisplayObject) : int
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc3_:SpriteExt = param1 as SpriteExt;
         var _loc4_:SpriteExt = param2 as SpriteExt;
         if(_loc3_ != null && _loc4_ != null && _loc3_._worldObj != null && _loc4_._worldObj != null)
         {
            _loc5_ = _loc3_._worldObj.SCG_getMaxDepth();
            _loc6_ = _loc4_._worldObj.SCG_getMaxDepth();
            if(_loc5_ > _loc6_)
            {
               return -1;
            }
            if(_loc5_ < _loc6_)
            {
               return 1;
            }
         }
         return 0;
      }
      
      public function SCG_DepthSortObjects() : void
      {
         this._requiresDepthSort = true;
      }
      
      public function update(param1:DeltaTime) : void
      {
         if(this._bUpdateEnabled)
         {
            ++this.updateCount;
         }
         if(this._requiresDepthSort)
         {
            this._RenderLayer.sortChildren(this.SCG_internalDepthSort);
            this._requiresDepthSort = false;
         }
      }
      
      public function setWorld(param1:World) : void
      {
         this._pWorld = param1;
      }
      
      public function deleteObject(param1:WorldObj) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:int = 0;
         this._RenderLayer.removeChild(param1.GetDisplayObj());
         var _loc4_:World2Obj;
         if((_loc4_ = param1 as World2Obj) != null)
         {
            if(_loc4_.SCG_GetRigidBody() != null)
            {
               _loc4_.SCG_GetRigidBody().removedFromLayer();
            }
         }
         Main.Instance().m_app.SCG_AddWorldObjectForDeletion(param1);
         var _loc5_:int;
         if((_loc5_ = this._aWorldObjs.indexOf(param1)) != -1)
         {
            this._aWorldObjs.splice(_loc5_,1);
         }
      }
      
      public function deleteObjects() : void
      {
         var _loc1_:int = 0;
         var _loc3_:DisplayObject = null;
         var _loc4_:World2Obj = null;
         var _loc2_:int = this._aWorldObjs.length;
         _loc1_ = _loc2_ - 1;
         while(_loc1_ >= 0)
         {
            Main.Instance().m_app.SCG_AddWorldObjectForDeletion(this._aWorldObjs[_loc1_]);
            this._RenderLayer.removeChild(this._aWorldObjs[_loc1_].GetDisplayObj());
            if((_loc4_ = this._aWorldObjs[_loc1_] as World2Obj) != null)
            {
               if(_loc4_.SCG_GetRigidBody() != null)
               {
                  _loc4_.SCG_GetRigidBody().removedFromLayer();
               }
            }
            _loc1_--;
         }
         this._aWorldObjs.length = 0;
      }
      
      public function setName(param1:String) : void
      {
         this._name = param1;
      }
      
      public function getObjectList() : Vector.<WorldObj>
      {
         var _loc3_:int = 0;
         var _loc1_:Vector.<WorldObj> = new Vector.<WorldObj>();
         var _loc2_:int = this._aWorldObjs.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(this._aWorldObjs[_loc3_]);
            _loc3_++;
         }
         return _loc1_;
      }
   }
}
