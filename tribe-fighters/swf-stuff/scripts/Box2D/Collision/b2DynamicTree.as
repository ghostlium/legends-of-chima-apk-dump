package Box2D.Collision
{
   import Box2D.Common.*;
   import Box2D.Common.Math.*;
   
   public class b2DynamicTree
   {
       
      
      private var m_root:b2DynamicTreeNode;
      
      private var m_freeList:b2DynamicTreeNode;
      
      private var m_path:uint;
      
      private var m_insertionCount:int;
      
      public function b2DynamicTree()
      {
         super();
         this.m_root = null;
         this.m_freeList = null;
         this.m_path = 0;
         this.m_insertionCount = 0;
      }
      
      public function CreateProxy(param1:b2AABB, param2:*) : b2DynamicTreeNode
      {
         var _loc3_:b2DynamicTreeNode = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc3_ = this.AllocateNode();
         _loc4_ = b2Settings.b2_aabbExtension;
         _loc5_ = b2Settings.b2_aabbExtension;
         _loc3_.aabb.lowerBound.x = param1.lowerBound.x - _loc4_;
         _loc3_.aabb.lowerBound.y = param1.lowerBound.y - _loc5_;
         _loc3_.aabb.upperBound.x = param1.upperBound.x + _loc4_;
         _loc3_.aabb.upperBound.y = param1.upperBound.y + _loc5_;
         _loc3_.userData = param2;
         this.InsertLeaf(_loc3_);
         return _loc3_;
      }
      
      public function DestroyProxy(param1:b2DynamicTreeNode) : void
      {
         this.RemoveLeaf(param1);
         this.FreeNode(param1);
      }
      
      public function MoveProxy(param1:b2DynamicTreeNode, param2:b2AABB, param3:b2Vec2) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         b2Settings.b2Assert(param1.IsLeaf());
         if(param1.aabb.Contains(param2))
         {
            return false;
         }
         this.RemoveLeaf(param1);
         _loc4_ = b2Settings.b2_aabbExtension + b2Settings.b2_aabbMultiplier * (param3.x > 0 ? param3.x : -param3.x);
         _loc5_ = b2Settings.b2_aabbExtension + b2Settings.b2_aabbMultiplier * (param3.y > 0 ? param3.y : -param3.y);
         param1.aabb.lowerBound.x = param2.lowerBound.x - _loc4_;
         param1.aabb.lowerBound.y = param2.lowerBound.y - _loc5_;
         param1.aabb.upperBound.x = param2.upperBound.x + _loc4_;
         param1.aabb.upperBound.y = param2.upperBound.y + _loc5_;
         this.InsertLeaf(param1);
         return true;
      }
      
      public function Rebalance(param1:int) : void
      {
         var _loc3_:b2DynamicTreeNode = null;
         var _loc4_:uint = 0;
         if(this.m_root == null)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = this.m_root;
            _loc4_ = 0;
            while(_loc3_.IsLeaf() == false)
            {
               _loc3_ = !!(this.m_path >> _loc4_ & 1) ? _loc3_.child2 : _loc3_.child1;
               _loc4_ = _loc4_ + 1 & 31;
            }
            ++this.m_path;
            this.RemoveLeaf(_loc3_);
            this.InsertLeaf(_loc3_);
            _loc2_++;
         }
      }
      
      public function GetFatAABB(param1:b2DynamicTreeNode) : b2AABB
      {
         return param1.aabb;
      }
      
      public function GetUserData(param1:b2DynamicTreeNode) : *
      {
         return param1.userData;
      }
      
      public function Query(param1:Function, param2:b2AABB) : void
      {
         var _loc5_:b2DynamicTreeNode = null;
         var _loc6_:Boolean = false;
         if(this.m_root == null)
         {
            return;
         }
         var _loc3_:Vector.<b2DynamicTreeNode> = new Vector.<b2DynamicTreeNode>();
         var _loc4_:int = 0;
         var _loc7_:*;
         _loc3_[_loc7_ = _loc4_++] = this.m_root;
         while(_loc4_ > 0)
         {
            if((_loc5_ = _loc3_[--_loc4_]).aabb.TestOverlap(param2))
            {
               if(_loc5_.IsLeaf())
               {
                  if(!(_loc6_ = param1(_loc5_)))
                  {
                     return;
                  }
               }
               else
               {
                  var _loc8_:*;
                  _loc3_[_loc8_ = _loc4_++] = _loc5_.child1;
                  var _loc9_:*;
                  _loc3_[_loc9_ = _loc4_++] = _loc5_.child2;
               }
            }
         }
      }
      
      public function RayCast(param1:Function, param2:b2RayCastInput) : void
      {
         var _loc3_:b2Vec2 = null;
         var _loc9_:b2AABB = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc14_:b2DynamicTreeNode = null;
         var _loc15_:b2Vec2 = null;
         var _loc16_:b2Vec2 = null;
         var _loc17_:Number = NaN;
         var _loc18_:b2RayCastInput = null;
         if(this.m_root == null)
         {
            return;
         }
         _loc3_ = param2.p1;
         var _loc4_:b2Vec2 = param2.p2;
         var _loc5_:b2Vec2;
         (_loc5_ = b2Math.SubtractVV(_loc3_,_loc4_)).Normalize();
         var _loc6_:b2Vec2 = b2Math.CrossFV(1,_loc5_);
         var _loc7_:b2Vec2 = b2Math.AbsV(_loc6_);
         var _loc8_:Number = param2.maxFraction;
         _loc9_ = new b2AABB();
         _loc10_ = _loc3_.x + _loc8_ * (_loc4_.x - _loc3_.x);
         _loc11_ = _loc3_.y + _loc8_ * (_loc4_.y - _loc3_.y);
         _loc9_.lowerBound.x = Math.min(_loc3_.x,_loc10_);
         _loc9_.lowerBound.y = Math.min(_loc3_.y,_loc11_);
         _loc9_.upperBound.x = Math.max(_loc3_.x,_loc10_);
         _loc9_.upperBound.y = Math.max(_loc3_.y,_loc11_);
         var _loc12_:Vector.<b2DynamicTreeNode> = new Vector.<b2DynamicTreeNode>();
         var _loc13_:int = 0;
         var _loc19_:*;
         _loc12_[_loc19_ = _loc13_++] = this.m_root;
         while(_loc13_ > 0)
         {
            if((_loc14_ = _loc12_[--_loc13_]).aabb.TestOverlap(_loc9_) != false)
            {
               _loc15_ = _loc14_.aabb.GetCenter();
               _loc16_ = _loc14_.aabb.GetExtents();
               if((_loc17_ = Math.abs(_loc6_.x * (_loc3_.x - _loc15_.x) + _loc6_.y * (_loc3_.y - _loc15_.y)) - _loc7_.x * _loc16_.x - _loc7_.y * _loc16_.y) <= 0)
               {
                  if(_loc14_.IsLeaf())
                  {
                     (_loc18_ = new b2RayCastInput()).p1 = param2.p1;
                     _loc18_.p2 = param2.p2;
                     _loc18_.maxFraction = param2.maxFraction;
                     if((_loc8_ = param1(_loc18_,_loc14_)) == 0)
                     {
                        return;
                     }
                     _loc10_ = _loc3_.x + _loc8_ * (_loc4_.x - _loc3_.x);
                     _loc11_ = _loc3_.y + _loc8_ * (_loc4_.y - _loc3_.y);
                     _loc9_.lowerBound.x = Math.min(_loc3_.x,_loc10_);
                     _loc9_.lowerBound.y = Math.min(_loc3_.y,_loc11_);
                     _loc9_.upperBound.x = Math.max(_loc3_.x,_loc10_);
                     _loc9_.upperBound.y = Math.max(_loc3_.y,_loc11_);
                  }
                  else
                  {
                     var _loc20_:*;
                     _loc12_[_loc20_ = _loc13_++] = _loc14_.child1;
                     var _loc21_:*;
                     _loc12_[_loc21_ = _loc13_++] = _loc14_.child2;
                  }
               }
            }
         }
      }
      
      private function AllocateNode() : b2DynamicTreeNode
      {
         var _loc1_:b2DynamicTreeNode = null;
         if(this.m_freeList)
         {
            _loc1_ = this.m_freeList;
            this.m_freeList = _loc1_.parent;
            _loc1_.parent = null;
            _loc1_.child1 = null;
            _loc1_.child2 = null;
            return _loc1_;
         }
         return new b2DynamicTreeNode();
      }
      
      private function FreeNode(param1:b2DynamicTreeNode) : void
      {
         param1.parent = this.m_freeList;
         this.m_freeList = param1;
      }
      
      private function InsertLeaf(param1:b2DynamicTreeNode) : void
      {
         var _loc6_:b2DynamicTreeNode = null;
         var _loc7_:b2DynamicTreeNode = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         ++this.m_insertionCount;
         if(this.m_root == null)
         {
            this.m_root = param1;
            this.m_root.parent = null;
            return;
         }
         var _loc2_:b2Vec2 = param1.aabb.GetCenter();
         var _loc3_:b2DynamicTreeNode = this.m_root;
         if(_loc3_.IsLeaf() == false)
         {
            do
            {
               _loc6_ = _loc3_.child1;
               _loc7_ = _loc3_.child2;
               _loc8_ = Math.abs((_loc6_.aabb.lowerBound.x + _loc6_.aabb.upperBound.x) / 2 - _loc2_.x) + Math.abs((_loc6_.aabb.lowerBound.y + _loc6_.aabb.upperBound.y) / 2 - _loc2_.y);
               _loc9_ = Math.abs((_loc7_.aabb.lowerBound.x + _loc7_.aabb.upperBound.x) / 2 - _loc2_.x) + Math.abs((_loc7_.aabb.lowerBound.y + _loc7_.aabb.upperBound.y) / 2 - _loc2_.y);
               if(_loc8_ < _loc9_)
               {
                  _loc3_ = _loc6_;
               }
               else
               {
                  _loc3_ = _loc7_;
               }
            }
            while(_loc3_.IsLeaf() == false);
            
         }
         var _loc4_:b2DynamicTreeNode = _loc3_.parent;
         var _loc5_:b2DynamicTreeNode;
         (_loc5_ = this.AllocateNode()).parent = _loc4_;
         _loc5_.userData = null;
         _loc5_.aabb.Combine(param1.aabb,_loc3_.aabb);
         if(_loc4_)
         {
            if(_loc3_.parent.child1 == _loc3_)
            {
               _loc4_.child1 = _loc5_;
            }
            else
            {
               _loc4_.child2 = _loc5_;
            }
            _loc5_.child1 = _loc3_;
            _loc5_.child2 = param1;
            _loc3_.parent = _loc5_;
            param1.parent = _loc5_;
            while(!_loc4_.aabb.Contains(_loc5_.aabb))
            {
               _loc4_.aabb.Combine(_loc4_.child1.aabb,_loc4_.child2.aabb);
               _loc5_ = _loc4_;
               if(!(_loc4_ = _loc4_.parent))
               {
                  break;
               }
            }
         }
         else
         {
            _loc5_.child1 = _loc3_;
            _loc5_.child2 = param1;
            _loc3_.parent = _loc5_;
            param1.parent = _loc5_;
            this.m_root = _loc5_;
         }
      }
      
      private function RemoveLeaf(param1:b2DynamicTreeNode) : void
      {
         var _loc4_:b2DynamicTreeNode = null;
         var _loc5_:b2AABB = null;
         if(param1 == this.m_root)
         {
            this.m_root = null;
            return;
         }
         var _loc2_:b2DynamicTreeNode = param1.parent;
         var _loc3_:b2DynamicTreeNode = _loc2_.parent;
         if(_loc2_.child1 == param1)
         {
            _loc4_ = _loc2_.child2;
         }
         else
         {
            _loc4_ = _loc2_.child1;
         }
         if(_loc3_)
         {
            if(_loc3_.child1 == _loc2_)
            {
               _loc3_.child1 = _loc4_;
            }
            else
            {
               _loc3_.child2 = _loc4_;
            }
            _loc4_.parent = _loc3_;
            this.FreeNode(_loc2_);
            while(_loc3_)
            {
               _loc5_ = _loc3_.aabb;
               _loc3_.aabb = b2AABB.Combine(_loc3_.child1.aabb,_loc3_.child2.aabb);
               if(_loc5_.Contains(_loc3_.aabb))
               {
                  break;
               }
               _loc3_ = _loc3_.parent;
            }
         }
         else
         {
            this.m_root = _loc4_;
            _loc4_.parent = null;
            this.FreeNode(_loc2_);
         }
      }
   }
}
