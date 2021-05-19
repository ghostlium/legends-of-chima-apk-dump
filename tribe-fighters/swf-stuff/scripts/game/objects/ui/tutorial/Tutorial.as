package game.objects.ui.tutorial
{
   import game.GameRes;
   import game.GameWorld;
   import starling.events.Touch;
   import starling.events.TouchEvent;
   import starling.events.TouchPhase;
   import util.Vec2F;
   import zufflin.cobraBase.GlaElement;
   import zufflin.cobraBase.GlaElementRectangle;
   import zufflin.cobraBase.GlaElementScene;
   import zufflin.cobraBase.GlaScene;
   import zufflin.core.RGBA;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.GlaAnimRenderable;
   import zufflin.world2D.World2Obj;
   
   public class Tutorial extends World2Obj
   {
      
      public static const NUM_TUTORIAL_PAGES:int = 2;
      
      public static const kfActiveAlpha:Number = 0.67;
       
      
      public var _bActive:Boolean;
      
      public var _uCurrPage:uint;
      
      public var _animScenes:Vector.<GlaAnimRenderable>;
      
      public var _vPageEntries:Vector.<Vector.<TutorialPanel>>;
      
      public function Tutorial()
      {
         var _loc1_:int = 0;
         super();
         this._animScenes = new Vector.<GlaAnimRenderable>();
         this._vPageEntries = new Vector.<Vector.<TutorialPanel>>(NUM_TUTORIAL_PAGES,true);
         _loc1_ = 0;
         while(_loc1_ < NUM_TUTORIAL_PAGES)
         {
            this._vPageEntries[_loc1_] = new Vector.<TutorialPanel>();
            _loc1_++;
         }
         this._bActive = false;
         this._uCurrPage = 0;
         this.loadPages();
         Main.Instance().m_app.addEventListener(TouchEvent.TOUCH,this.eventTouch);
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         this.touchable = false;
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         Main.Instance().m_app.removeEventListener(TouchEvent.TOUCH,this.eventTouch);
         super.dispose();
      }
      
      public function getActive() : Boolean
      {
         return this._bActive;
      }
      
      private function eventTouch(param1:TouchEvent) : void
      {
         var _loc2_:Touch = param1.getTouch(Main.Instance());
         if(_loc2_ && _loc2_.phase == TouchPhase.BEGAN)
         {
            if(this._bActive)
            {
               this.setPageActive(this._uCurrPage,false);
               ++this._uCurrPage;
               if(this._uCurrPage < NUM_TUTORIAL_PAGES)
               {
                  this.setPageActive(this._uCurrPage,true);
               }
               else
               {
                  this.setActive(false);
               }
            }
         }
      }
      
      public function setActive(param1:Boolean) : void
      {
         var _loc2_:uint = 0;
         this._bActive = param1;
         if(this._bActive)
         {
            GameWorld.get().pauseGameLayer();
            this._uCurrPage = 0;
            this.setPageActive(0,true);
         }
         else
         {
            GameWorld.get().unpauseGameLayer();
            this._uCurrPage = 0;
            _loc2_ = 0;
            while(_loc2_ < NUM_TUTORIAL_PAGES)
            {
               this.setPageActive(_loc2_,false);
               _loc2_++;
            }
         }
      }
      
      public function loadPages() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:GlaScene = null;
         var _loc5_:Vector.<GlaElement> = null;
         var _loc6_:GlaElement = null;
         var _loc7_:GlaAnimRenderable = null;
         var _loc8_:GlaElementRectangle = null;
         var _loc9_:String = null;
         var _loc10_:Vec2F = null;
         var _loc11_:AABox2f = null;
         var _loc12_:TutorialPanel = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:GlaElementScene = null;
         var _loc18_:String = null;
         var _loc19_:Vec2F = null;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc1_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         _loc2_ = 0;
         while(_loc2_ < NUM_TUTORIAL_PAGES)
         {
            _loc3_ = "tutorial" + _loc2_.toString();
            if(_loc4_ = GameRes.get()._pUISet.findScene(_loc3_))
            {
               _loc5_ = _loc4_.getElements();
               for each(_loc6_ in _loc5_)
               {
                  if(_loc6_ is GlaElementRectangle)
                  {
                     if((_loc9_ = (_loc8_ = _loc6_ as GlaElementRectangle).getName()) != "screen" && _loc9_ != "screen_576" && _loc9_ != "screen_centre")
                     {
                        if((_loc10_ = new Vec2F(_loc8_.getPos(0).x,_loc8_.getPos(0).y)).x < 0)
                        {
                           _loc13_ = -0.5 * 576;
                           _loc14_ = -0.5 * Number(LegoChima.Instance().zGetScreenWidth());
                           _loc10_.x -= _loc13_ - _loc14_;
                        }
                        else if(_loc10_.x > 0)
                        {
                           _loc15_ = 0.5 * 576;
                           _loc16_ = 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
                           _loc10_.x += _loc16_ - _loc15_;
                        }
                        _loc10_.x += _loc1_.x;
                        _loc10_.y += _loc1_.y;
                        _loc11_ = _loc8_.getAABox(0);
                        _loc12_ = new TutorialPanel(_loc9_,_loc11_,_loc10_,_loc8_.getName().indexOf("touch") != -1);
                        this._vPageEntries[_loc2_].push(_loc12_);
                        addComponent(_loc12_);
                     }
                  }
                  else if(_loc6_ is GlaElementScene)
                  {
                     _loc17_ = _loc6_ as GlaElementScene;
                     if((_loc18_ = _loc4_.getName()) != "screen" && _loc18_ != "screen_576" && _loc18_ != "screen_centre")
                     {
                        if((_loc19_ = new Vec2F(_loc17_.getPos(0).x,_loc17_.getPos(0).y)).x < 0)
                        {
                           _loc20_ = -0.5 * 576;
                           _loc21_ = -0.5 * Number(LegoChima.Instance().zGetScreenWidth());
                           _loc19_.x -= _loc20_ - _loc21_;
                        }
                        else if(_loc19_.x > 0)
                        {
                           _loc22_ = 0.5 * 576;
                           _loc23_ = 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
                           _loc19_.x += _loc23_ - _loc22_;
                        }
                        _loc19_.x = Math.round(_loc19_.x);
                        _loc19_.y = Math.round(_loc19_.y);
                        _loc17_.trkPosition.setValues(_loc19_);
                     }
                  }
               }
               (_loc7_ = new GlaAnimRenderable(_loc4_)).setPosition(new Vec2F(Number(LegoChima.Instance().zGetScreenWidth()) * 0.5,Number(LegoChima.Instance().zGetScreenHeight()) * 0.5));
               _loc7_.setDepth(1000);
               _loc7_.setColor(new RGBA(255,255,255,0));
               addComponent(_loc7_);
               this._animScenes.push(_loc7_);
            }
            _loc2_++;
         }
      }
      
      public function setPageActive(param1:uint, param2:Boolean) : void
      {
         var _loc4_:TutorialPanel = null;
         var _loc3_:Number = 0;
         if(param2)
         {
            _loc3_ = kfActiveAlpha;
         }
         for each(_loc4_ in this._vPageEntries[param1])
         {
            _loc4_.setAlpha(_loc3_);
         }
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this._animScenes.length)
         {
            _loc3_ = this._animScenes[_loc2_].alpha * 255;
            if(_loc2_ == this._uCurrPage && this._bActive)
            {
               _loc3_ += 10;
               _loc3_ = Math.min(_loc3_,255);
               this._animScenes[_loc2_].SCG_setAlpha(_loc3_);
            }
            else if(_loc3_ > 0)
            {
               _loc3_ -= 10;
               _loc3_ = Math.max(_loc3_,0);
               this._animScenes[_loc2_].SCG_setAlpha(_loc3_);
            }
            _loc2_++;
         }
      }
   }
}
