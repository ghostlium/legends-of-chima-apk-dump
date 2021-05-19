package zufflin.world2D
{
   import flash.utils.Dictionary;
   import starling.display.DisplayObject;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaScene;
   import zufflin.cobraBase.GlaSceneState;
   import zufflin.core.zMaterial;
   import zufflin.world.EventAnimFinished;
   import zufflin.world.EventAnimLooped;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   import zufflin.world.WorldObj;
   
   public class GlaAnimRenderable extends Renderable2
   {
       
      
      protected var currentController:GlaControllerScene;
      
      protected var pMaterial:zMaterial;
      
      protected var controllers:Dictionary;
      
      protected var bDisableAfterPlay:Boolean;
      
      public function GlaAnimRenderable(param1:GlaScene = null, param2:GlaSceneState = null)
      {
         super();
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this.pMaterial = null;
         this.bDisableAfterPlay = false;
         this.controllers = new Dictionary();
         if(param1 == null && param2 == null)
         {
            this.currentController = null;
            setEnabled(false);
         }
         else if(param1 != null)
         {
            this.currentController = new GlaControllerScene(null,param1.getState(0));
            this.currentController.setOwner(this);
            this.controllers[param1.getState(0)] = this.currentController;
            this.addChild(this.currentController);
         }
         else
         {
            this.currentController = new GlaControllerScene(null,param2);
            this.currentController.setOwner(this);
            this.controllers[param2] = this.currentController;
            this.addChild(this.currentController);
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:GlaControllerScene = null;
         if(this.currentController != null)
         {
            this.removeChild(this.currentController);
         }
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
         for each(_loc1_ in this.controllers)
         {
            _loc1_.dispose();
         }
         this.controllers = new Dictionary();
      }
      
      public function getNumFrames() : int
      {
         return !!this.currentController ? int(this.currentController.getSrcSceneState().getNumFrames()) : 0;
      }
      
      public function setFrame(param1:int) : void
      {
         if(this.currentController)
         {
            this.currentController.setFrame(param1);
         }
      }
      
      public function getFrame() : int
      {
         return !!this.currentController ? int(this.currentController.getFrame()) : 0;
      }
      
      public function play(param1:Boolean, param2:Number) : void
      {
         if(this.currentController)
         {
            this.currentController.playAnimation(param1,param2);
         }
      }
      
      public function playNew(param1:GlaSceneState, param2:Boolean, param3:Number) : void
      {
         this.setState(param1);
         if(this.currentController)
         {
            this.currentController.playAnimation(param2,param3);
         }
      }
      
      public function isAnimating() : Boolean
      {
         return !!this.currentController ? Boolean(this.currentController.isAnimating()) : false;
      }
      
      public function getSrcState() : GlaSceneState
      {
         return !!this.currentController ? this.currentController.getSrcSceneState() : null;
      }
      
      public function getController() : GlaControllerScene
      {
         return this.currentController;
      }
      
      public function stopAnimation() : void
      {
         if(this.currentController)
         {
            this.currentController.stopAnimation();
         }
      }
      
      public function setDisableAfterPlay(param1:Boolean) : void
      {
         this.bDisableAfterPlay = param1;
      }
      
      public function setMaterial(param1:zMaterial) : void
      {
         this.pMaterial = param1;
      }
      
      public function setState(param1:GlaSceneState) : void
      {
         var _loc2_:GlaControllerScene = null;
         if(param1)
         {
            _loc2_ = this.controllers[param1];
            if(_loc2_ == null)
            {
               this.currentController = new GlaControllerScene(null,param1);
               this.currentController.setOwner(this);
               this.controllers[param1] = this.currentController;
               this.addChild(this.currentController);
            }
            else
            {
               this.removeChild(this.currentController);
               this.currentController = _loc2_;
               this.currentController.setFrame(0);
               this.addChild(this.currentController);
            }
            setEnabled(true);
         }
         else
         {
            if(this.currentController != null)
            {
               this.removeChild(this.currentController);
            }
            this.currentController = null;
            setEnabled(false);
         }
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc2_:WorldObj = this.getWorldObj();
         var _loc3_:WorldLayer = _loc2_ != null ? _loc2_.getLayer() : null;
         if(_loc3_ && _loc3_.isUpdateEnabled() == false)
         {
            return;
         }
         if(this.currentController && this.currentController.isAnimating())
         {
            this.currentController.updateAnimation();
            if((_loc4_ = this.parent) != null)
            {
               if(this.currentController.didLoop())
               {
                  _loc4_.dispatchEvent(new EventAnimLooped(this,EventAnimLooped.EVENT_ANIM_LOOPED,false));
               }
               if(!this.currentController.isAnimating())
               {
                  _loc4_.dispatchEvent(new EventAnimFinished(this,EventAnimFinished.EVENT_ANIM_FINISHED,false));
               }
            }
            if(this.bDisableAfterPlay && !this.currentController.isAnimating())
            {
               setEnabled(false);
            }
         }
      }
   }
}
