package zufflin.cobraBase
{
   import flash.utils.getQualifiedClassName;
   import util.MathsHelper;
   import zufflin.core.ParticleManager2D;
   
   public class GlaControllerScene extends GlaController
   {
       
      
      public var messages:Vector.<GlaMsg>;
      
      protected var pSrcState:GlaSceneState;
      
      protected var all_elements:Vector.<GlaControllerElement>;
      
      protected var scene_elements:Vector.<GlaControllerSceneElement>;
      
      protected var non_scene_elements:Vector.<GlaControllerElement>;
      
      protected var globalFrameFrac:Number;
      
      protected var globalFrameI:int;
      
      protected var animFrameI:int;
      
      protected var animFrameFrac:Number;
      
      protected var animSpeedF:Number;
      
      protected var animUsesrSpeed:Number;
      
      protected var loopCount:int;
      
      protected var bDidLoop:Boolean;
      
      protected var bLooping:Boolean;
      
      protected var bAnimating:Boolean;
      
      protected var pParticleManager:ParticleManager2D;
      
      protected var bKeyboardActive:Boolean;
      
      protected var keyboardButtonNo:int;
      
      protected var keyboardTotalButtons:int;
      
      public function GlaControllerScene(param1:GlaController, param2:GlaSceneState = null, param3:GlaScene = null)
      {
         this.messages = new Vector.<GlaMsg>();
         super(param1);
         this.constructor();
         if(param2 != null)
         {
            this.setSceneState(param2);
         }
         else if(param3 != null)
         {
            this.setSceneState(param3.getState(0));
         }
         else
         {
            this.setSceneState(null);
         }
      }
      
      public function constructor() : void
      {
         this.pSrcState = null;
         this.bLooping = false;
         this.bDidLoop = false;
         this.bAnimating = false;
         this.globalFrameI = 0;
         this.globalFrameFrac = 0;
         this.animFrameI = 0;
         this.animFrameFrac = 0;
         this.animSpeedF = 0;
         this.animUsesrSpeed = 0;
         this.loopCount = 0;
         this.pParticleManager = null;
         this.all_elements = new Vector.<GlaControllerElement>();
         this.scene_elements = new Vector.<GlaControllerSceneElement>();
         this.non_scene_elements = new Vector.<GlaControllerElement>();
      }
      
      override public function dispose() : void
      {
         this.destroyElements();
         super.dispose();
      }
      
      public function internalFrameUpdated() : void
      {
         var _loc1_:FrameInfo = new FrameInfo();
         _loc1_.frac = this.animFrameFrac;
         _loc1_.frameI = this.animFrameI;
         _loc1_.globalFrameI = this.globalFrameI;
         var _loc2_:int = 0;
         while(_loc2_ < this.all_elements.length)
         {
            this.all_elements[_loc2_].internalSetFrame(_loc1_);
            _loc2_++;
         }
      }
      
      public function internalSetFrame(param1:FrameInfo) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.all_elements.length)
         {
            this.all_elements[_loc2_].internalSetFrame(param1);
            _loc2_++;
         }
      }
      
      public function getName() : String
      {
         return this.pSrcState.getName();
      }
      
      public function getSrcScene() : GlaScene
      {
         return this.pSrcState.getScene();
      }
      
      public function getSrcSceneState() : GlaSceneState
      {
         return this.pSrcState;
      }
      
      public function findSprite(param1:String) : GlaControllerSprite
      {
         return this.findElement(param1) as GlaControllerSprite;
      }
      
      public function getElement(param1:String) : GlaControllerElement
      {
         return this.findElement(param1);
      }
      
      public function findButton(param1:String) : GlaControllerButton
      {
         return this.findElement(param1) as GlaControllerButton;
      }
      
      public function getScene(param1:String) : GlaControllerSceneElement
      {
         return this.findElement(param1) as GlaControllerSceneElement;
      }
      
      public function getToggleButton(param1:String) : GlaControllerToggleButton
      {
         return this.findElement(param1) as GlaControllerToggleButton;
      }
      
      public function getButton(param1:String) : GlaControllerButton
      {
         return this.findElement(param1) as GlaControllerButton;
      }
      
      public function getRectangle(param1:String) : GlaControllerRectangle
      {
         return this.findElement(param1) as GlaControllerRectangle;
      }
      
      public function getSprite(param1:String) : GlaControllerSprite
      {
         return this.findElement(param1) as GlaControllerSprite;
      }
      
      public function getElements() : Vector.<GlaControllerElement>
      {
         return this.all_elements;
      }
      
      public function stopAnimation() : void
      {
         this.bAnimating = false;
      }
      
      public function resetAnimation() : void
      {
         this.bLooping = false;
         this.globalFrameI = 0;
         this.globalFrameFrac = 0;
         this.animFrameI = 0;
         this.animFrameFrac = 0;
         this.bAnimating = false;
         this.loopCount = 0;
      }
      
      public function getAnimTimeNormalised() : Number
      {
         return (this.animFrameI + this.animFrameFrac) / this.pSrcState.getNumFrames();
      }
      
      public function getFrameF() : Number
      {
         return this.animFrameI + this.animFrameFrac;
      }
      
      public function getFrame() : int
      {
         return this.animFrameI;
      }
      
      public function isAnimating() : Boolean
      {
         return this.bAnimating;
      }
      
      public function isLooping() : Boolean
      {
         return this.bLooping;
      }
      
      public function didLoop() : Boolean
      {
         return this.bDidLoop;
      }
      
      public function getSpeed() : Number
      {
         return this.animUsesrSpeed;
      }
      
      public function setAnimationSpeed(param1:Number) : void
      {
         if(param1 != this.animUsesrSpeed)
         {
            this.animUsesrSpeed = param1;
            this.animSpeedF = param1 * (this.getSrcSceneState().getFPS() / 30);
         }
      }
      
      public function setEndFrame() : void
      {
         this.setFrame(this.pSrcState.getNumFrames());
      }
      
      public function setFrame(param1:int, param2:Number = 0.0) : void
      {
         param1 = MathsHelper.Clamp(param1,0,this.pSrcState.getNumFrames() - 1);
         this.animFrameI = param1;
         this.animFrameFrac = param2;
         this.globalFrameFrac = this.animFrameFrac;
         this.globalFrameI = this.animFrameI;
         this.bAnimating = false;
         this.internalFrameUpdated();
      }
      
      public function setElements(param1:Vector.<GlaElement>) : void
      {
         var _loc3_:GlaControllerElement = null;
         this.destroyElements();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = this.createControllerFor(param1[_loc2_]);
            this.SCGaddChild(_loc3_);
            _loc2_++;
         }
      }
      
      public function setScene(param1:GlaScene) : void
      {
         this.setSceneState(param1.getState(0));
      }
      
      public function setSceneState(param1:GlaSceneState) : void
      {
         if(param1 == this.pSrcState)
         {
            return;
         }
         this.pSrcState = param1;
         if(this.pSrcState)
         {
            this.setElements(this.pSrcState.getElements());
         }
         else
         {
            this.destroyElements();
         }
      }
      
      public function createControllerFor(param1:GlaElement) : GlaControllerElement
      {
         var _loc4_:GlaElementGameObj = null;
         var _loc2_:GlaControllerElement = null;
         var _loc3_:String = getQualifiedClassName(param1);
         if(_loc3_ == "zufflin.cobraBase::GlaElementSprite")
         {
            _loc2_ = new GlaControllerSprite(this,param1 as GlaElementSprite);
         }
         else
         {
            if(_loc3_ == "zufflin.cobraBase::GlaElementTextBox")
            {
               throw new Error("SCG : Need to implement");
            }
            if(_loc3_ == "zufflin.cobraBase::GlaElementRectangle")
            {
               _loc2_ = new GlaControllerRectangle(this,param1 as GlaElementRectangle);
            }
            else if(_loc3_ == "zufflin.cobraBase::GlaElementScene")
            {
               _loc2_ = new GlaControllerSceneElement(this,param1 as GlaElementScene);
            }
            else
            {
               if(_loc3_ == "zufflin.cobraBase::GlaElementEvent")
               {
                  throw new Error("SCG : Need to implement");
               }
               if(_loc3_ == "zufflin.cobraBase::GlaElementPolyTextured")
               {
                  _loc2_ = new GlaControllerPolyTextured(this,param1 as GlaElementPolyTextured);
               }
               else
               {
                  if(_loc3_ == "zufflin.cobraBase::GlaElementMultiSprite")
                  {
                     throw new Error("SCG : Need to implement");
                  }
                  if(_loc3_ == "zufflin.cobraBase::GlaElementParticleEmitter")
                  {
                     throw new Error("SCG : Need to implement");
                  }
                  if(_loc3_ == "zufflin.cobraBase::GlaElementGameObj")
                  {
                     if((_loc4_ = param1 as GlaElementGameObj).getTemplateName() == "Button")
                     {
                        _loc2_ = new GlaControllerButton(this,_loc4_);
                     }
                     else if(_loc4_.getTemplateName() == "Toggle Button")
                     {
                        _loc2_ = new GlaControllerToggleButton(this,_loc4_);
                     }
                     else if(_loc4_.getTemplateName() == "Slider")
                     {
                        throw new Error("SCG : Need to implement");
                     }
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function destroyElements() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.all_elements.length)
         {
            this.removeChild(this.all_elements[_loc1_]);
            this.all_elements[_loc1_].dispose();
            this.all_elements[_loc1_] = null;
            _loc1_++;
         }
         this.all_elements.length = 0;
         this.scene_elements.length = 0;
         this.non_scene_elements.length = 0;
         if(this.pParticleManager)
         {
            this.pParticleManager.dispose();
            this.pParticleManager = null;
         }
      }
      
      public function setAlpha(param1:uint) : void
      {
         var _loc2_:GlaControllerElement = null;
         for each(_loc2_ in this.all_elements)
         {
            _loc2_.setAlpha(param1);
         }
      }
      
      public function update() : void
      {
         this.messages.splice(0,this.messages.length);
         var _loc1_:int = 0;
         while(_loc1_ < this.all_elements.length)
         {
            this.all_elements[_loc1_].update();
            _loc1_++;
         }
      }
      
      public function findElement(param1:String) : GlaControllerElement
      {
         var _loc2_:GlaControllerElement = null;
         var _loc3_:GlaControllerSceneElement = null;
         var _loc4_:GlaControllerElement = null;
         for each(_loc2_ in this.all_elements)
         {
            if(_loc2_.getName() == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc3_ in this.scene_elements)
         {
            if((_loc4_ = _loc3_.getScene().findElement(param1)) != null)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function updateAnimation() : void
      {
         var _loc1_:int = 0;
         if(this.bAnimating)
         {
            this.bDidLoop = false;
            this.animFrameFrac += this.animSpeedF * (LegoChima.m_fTimeStep * 60);
            if(this.animFrameFrac >= 1)
            {
               _loc1_ = Math.floor(this.animFrameFrac);
               this.animFrameI += _loc1_;
               this.animFrameFrac -= _loc1_;
               if(this.animFrameI >= this.pSrcState.getNumFrames() - 1)
               {
                  if(!this.bLooping)
                  {
                     this.bAnimating = false;
                     this.animFrameI = this.pSrcState.getNumFrames() - 1;
                     this.animFrameFrac = 0;
                  }
                  else
                  {
                     this.bDidLoop = true;
                     ++this.loopCount;
                     this.animFrameI -= this.pSrcState.getNumFrames() - 1;
                  }
               }
               this.globalFrameI = this.loopCount * (this.pSrcState.getNumFrames() - 1) + this.animFrameI;
               this.globalFrameFrac = this.animFrameFrac;
            }
            else if(this.animFrameFrac < 0)
            {
               _loc1_ = Math.floor(this.animFrameFrac);
               this.animFrameI += _loc1_;
               this.animFrameFrac -= _loc1_;
               if(this.animFrameI < 0)
               {
                  if(!this.bLooping)
                  {
                     this.bAnimating = false;
                     this.animFrameI = 0;
                     this.animFrameFrac = 0;
                  }
                  else
                  {
                     this.bDidLoop = true;
                     ++this.loopCount;
                     this.animFrameI += this.pSrcState.getNumFrames() - 1;
                  }
               }
               this.globalFrameI = this.loopCount * (this.pSrcState.getNumFrames() - 1) + this.animFrameI;
               this.globalFrameFrac = this.animFrameFrac;
            }
            this.internalFrameUpdated();
         }
      }
      
      public function playChildrenAnimation(param1:Boolean, param2:Number) : void
      {
         var _loc3_:GlaControllerSceneElement = null;
         for each(_loc3_ in this.scene_elements)
         {
            _loc3_.getScene().playAnimation(param1,param2);
         }
      }
      
      public function updateChildrenAnimation() : void
      {
         var _loc1_:GlaControllerSceneElement = null;
         for each(_loc1_ in this.scene_elements)
         {
            _loc1_.getScene().updateAnimation();
         }
      }
      
      public function SCGaddChild(param1:GlaControllerElement) : void
      {
         var _loc2_:String = null;
         if(param1)
         {
            this.addChild(param1);
            param1.pParent = this;
            this.all_elements.push(param1);
            _loc2_ = getQualifiedClassName(param1);
            if(_loc2_ == "zufflin.cobraBase::GlaControllerSceneElement")
            {
               this.scene_elements.push(param1);
            }
            else
            {
               this.non_scene_elements.push(param1);
            }
            param1.initialise();
         }
      }
      
      override public function propagateMessage(param1:GlaMsg) : void
      {
         var _loc2_:GlaControllerElement = null;
         if(param1.getID() == GlaControllerGuiObject.MSG_GUI_ACTION)
         {
            this.messages.push(param1);
         }
         else
         {
            for each(_loc2_ in this.all_elements)
            {
               _loc2_.propagateMessage(param1);
            }
         }
      }
      
      public function popMsg() : GlaMsg
      {
         return this.messages.pop();
      }
      
      public function hasMsg() : Boolean
      {
         return this.messages.length != 0;
      }
      
      public function setOwner(param1:Object) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.all_elements.length)
         {
            this.all_elements[_loc2_].setOwner(param1);
            _loc2_++;
         }
      }
      
      public function playAnimation(param1:Boolean, param2:Number = 1.0) : void
      {
         if(this.getSrcSceneState().hasAnimation())
         {
            this.bLooping = param1;
            this.bAnimating = true;
            this.animUsesrSpeed = param2;
            if(GlaController.getRuntimeAnimationVersion() == 0)
            {
               this.animSpeedF = param2 * (this.getSrcSceneState().getFPS() / 30) * (LegoChima.m_fTimeStep / (1 / 30));
            }
            else if(GlaController.getRuntimeAnimationVersion() == 1)
            {
               this.animSpeedF = param2 * (this.getSrcSceneState().getFPS() / 60);
            }
            else
            {
               this.animSpeedF = param2 * (this.getSrcSceneState().getFPS() / 60);
            }
         }
      }
   }
}
