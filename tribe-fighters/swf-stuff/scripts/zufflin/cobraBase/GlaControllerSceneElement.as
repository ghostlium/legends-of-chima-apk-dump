package zufflin.cobraBase
{
   import util.MathsHelper;
   import util.Vec2F;
   
   public class GlaControllerSceneElement extends GlaControllerElement
   {
       
      
      private var ourSceneController:GlaControllerScene;
      
      private var startFrame:int;
      
      private var pivot:Vec2F;
      
      private var currentStateIndex:int;
      
      public function GlaControllerSceneElement(param1:GlaController, param2:GlaElementScene)
      {
         super(param1,param2);
         this.ourSceneController = new GlaControllerScene(this);
         this.startFrame = param2.startFrame;
         this.pivot = new Vec2F();
         depth = calcDepthEnum(param2.getDepthEnum());
         this.currentStateIndex = 0;
         this.addChild(this.ourSceneController);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this.ourSceneController);
         this.ourSceneController.dispose();
         super.dispose();
      }
      
      public function updateAnimation() : void
      {
         this.ourSceneController.updateAnimation();
      }
      
      public function playAnimation(param1:Boolean, param2:int) : void
      {
         this.ourSceneController.setFrame(0);
         this.ourSceneController.playAnimation(param1,Number(param2));
      }
      
      override public function setFrame(param1:int) : void
      {
         this.internalSetFrame(new FrameInfo(param1));
      }
      
      public function getSrcSceneObj() : GlaElementScene
      {
         return pSrcElement as GlaElementScene;
      }
      
      public function getScene() : GlaControllerScene
      {
         return this.ourSceneController;
      }
      
      public function getFirstSceneFrame(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = -1;
         var _loc4_:Vector.<GlaKey>;
         _loc2_ = (_loc4_ = this.getSrcSceneObj().trkSceneRef.vKeys).length - 1;
         while(_loc2_ >= 0)
         {
            if(param1 >= _loc4_[_loc2_].getFrame())
            {
               if(_loc2_ > 0 && _loc4_[_loc2_ - 1].getValue() != _loc4_[_loc2_].getValue())
               {
                  _loc3_ = _loc4_[_loc2_].getFrame();
                  break;
               }
            }
            _loc2_--;
         }
         var _loc5_:int = -1;
         var _loc6_:Vector.<GlaKey>;
         _loc2_ = (_loc6_ = this.getSrcSceneObj().trkActive.vKeys).length - 1;
         while(_loc2_ >= 0)
         {
            if(param1 >= _loc6_[_loc2_].getFrame() && _loc6_[_loc2_].getValue() as Boolean == true)
            {
               if(_loc2_ > 0 && _loc6_[_loc2_ - 1].getValue() as Boolean == false)
               {
                  _loc5_ = _loc6_[_loc2_].getFrame();
                  break;
               }
            }
            _loc2_--;
         }
         if(_loc5_ > _loc3_)
         {
            return _loc5_;
         }
         return _loc3_;
      }
      
      override public function internalSetFrame(param1:FrameInfo) : void
      {
         var _loc2_:GlaScene = null;
         var _loc4_:int = 0;
         var _loc5_:FrameInfo = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         bActive = this.getSrcSceneObj().trkActive.getValue(param1.frameI) && bNodeActive;
         position = this.getSrcSceneObj().trkPosition.getValueF(param1.frameI,param1.frac);
         position.x += nodePosition.x;
         position.y += nodePosition.y;
         _rotation = -MathsHelper.DegToRad(this.getSrcSceneObj().trkRotation.getValueF(param1.frameI,param1.frac)) + nodeRotation;
         scale = this.getSrcSceneObj().trkScale.getValueF(param1.frameI,param1.frac);
         scale.x *= nodeScale.x;
         scale.y *= nodeScale.y;
         this.pivot = this.getSrcSceneObj().trkPivot.getValueF(param1.frameI,param1.frac);
         this.pivot.x += nodePivot.x;
         this.pivot.y += nodePivot.y;
         color = this.getSrcSceneObj().trkColor.getValueF(param1.frameI,param1.frac);
         this.visible = bActive;
         this.x = position.x;
         this.y = position.y;
         this.rotation = _rotation;
         this.scaleX = scale.x;
         this.scaleY = scale.x;
         this.alpha = color.getDrawAlpha();
         var _loc3_:GlaSceneState = null;
         _loc2_ = this.getSrcSceneObj().trkSceneRef.getValue(param1.frameI);
         if(_loc2_)
         {
            _loc3_ = _loc2_.getStateSafe(this.getSrcSceneObj().trkSceneStateIndex.getValue(param1.frameI));
         }
         if(depthEnumValues.length == 0)
         {
            depth = this.getSrcSceneObj().trkDepth.getValueF(param1.frameI,param1.frac) + nodeDepth;
         }
         if(_loc3_)
         {
            this.ourSceneController.setSceneState(_loc3_);
            _loc4_ = this.getFirstSceneFrame(param1.frameI);
            _loc5_ = new FrameInfo();
            if(_loc4_ < 0)
            {
               _loc5_.globalFrameI = param1.globalFrameI;
            }
            else
            {
               _loc5_.globalFrameI = param1.globalFrameI - _loc4_;
            }
            if(_loc3_.getFPS() != 30 && getRuntimeAnimationVersion() == 0)
            {
               _loc6_ = 1;
               _loc7_ = (_loc7_ = _loc5_.globalFrameI + param1.frac) * _loc6_;
               _loc5_.globalFrameI = _loc7_;
               _loc5_.frac = _loc7_ - Number(_loc5_.globalFrameI);
               _loc5_.globalFrameI += this.startFrame;
            }
            else
            {
               _loc5_.frac = param1.frac;
               _loc5_.globalFrameI += this.startFrame;
            }
            _loc5_.frameI = _loc5_.globalFrameI % _loc3_.getNumFrames();
            this.ourSceneController.internalSetFrame(_loc5_);
         }
         else
         {
            this.ourSceneController.setSceneState(null);
         }
      }
      
      override public function update() : void
      {
         if(bActive)
         {
            this.ourSceneController.update();
         }
      }
      
      override public function propagateMessage(param1:GlaMsg) : void
      {
         this.ourSceneController.propagateMessage(param1);
      }
   }
}
