package game.objects.ui.frontend
{
   import game.GameConsts;
   import game.GameRes;
   import game.GameWorld;
   import game.objects.fx.WibblySpriteRenderable;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.world.EventUpdate;
   
   public class MainMenuFlagSelect extends UIComponent
   {
       
      
      public var _pScene:GlaControllerScene;
      
      public var _pFlags:Vector.<GlaControllerButton>;
      
      public var _pBack:GlaControllerButton;
      
      public var _flagSprites:Vector.<WibblySpriteRenderable>;
      
      public var _fAlphas0:Number;
      
      public var _fAlphas1:Number;
      
      public var _fAlphas2:Number;
      
      public var _fAlphas3:Number;
      
      public var _fScales0:Number;
      
      public var _fScales1:Number;
      
      public var _fScales2:Number;
      
      public var _fScales3:Number;
      
      public var _fBackAlpha:Number;
      
      public var _pTweener:cTweener;
      
      private const names:Vector.<String> = new <String>["lion_button","croc_button","saber_button","bear_button"];
      
      public function MainMenuFlagSelect()
      {
         var _loc2_:Vec2F = null;
         var _loc5_:uint = 0;
         var _loc6_:Vec2F = null;
         var _loc7_:WibblySpriteRenderable = null;
         super();
         this._flagSprites = new Vector.<WibblySpriteRenderable>();
         this._pFlags = new Vector.<GlaControllerButton>(4,true);
         this._fBackAlpha = 0;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_flagselect"));
         this._pScene.setPosition(new Vec2F(0,0));
         var _loc1_:Vec2F = this._pScene.getRectangle("screen_bottom_centre").getPosition();
         _loc2_ = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc3_:Vec2F = this._pScene.getRectangle("screen_centre").getPosition();
         var _loc4_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         _loc5_ = 0;
         while(_loc5_ < 4)
         {
            this._pFlags[_loc5_] = this._pScene.getButton(this.names[_loc5_]);
            _loc6_ = this._pFlags[_loc5_].getPosition();
            _loc6_.x -= _loc3_.x;
            _loc6_.y -= _loc3_.y;
            _loc6_.x += _loc4_.x;
            _loc6_.y += _loc4_.y;
            this._pFlags[_loc5_].setPosition(_loc6_);
            (_loc7_ = new WibblySpriteRenderable(this._pFlags[_loc5_].getScene().getSprite("flagSprite").getSprite())).setPosition(_loc6_);
            this._flagSprites.push(_loc7_);
            this.addChild(_loc7_);
            this._pFlags[_loc5_].setAlpha(0);
            _loc5_++;
         }
         this._fAlphas0 = 0;
         this._fAlphas1 = 0;
         this._fAlphas2 = 0;
         this._fAlphas3 = 0;
         this._fScales0 = 2;
         this._fScales1 = 2;
         this._fScales2 = 2;
         this._fScales3 = 2;
         this._pBack = this._pScene.getButton("back_button");
         _loc6_ = this._pBack.getPosition();
         _loc6_.x -= _loc1_.x;
         _loc6_.y -= _loc1_.y;
         _loc6_.x += _loc2_.x;
         _loc6_.y += _loc2_.y;
         this._pBack.setPosition(_loc6_);
         this._pTweener = new cTweener();
         this.addChild(this._pScene);
      }
      
      override public function dispose() : void
      {
         var _loc1_:uint = 0;
         _loc1_ = 0;
         while(_loc1_ < this._flagSprites.length)
         {
            this.removeChild(this._flagSprites[_loc1_],true);
            this._flagSprites[_loc1_] = null;
            _loc1_++;
         }
         this.removeChild(this._pScene);
         this._pTweener.dispose();
         this._pTweener = null;
         this._pScene.dispose();
         this._pScene = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc3_:GlaMsg = null;
         this.touchable = _bActive;
         this._pTweener.tick(param1.getTime().dt);
         var _loc2_:Number = param1.getTime().dt;
         this._flagSprites[0].setScale(this._fScales0);
         this._flagSprites[0].alpha = this._fAlphas0;
         if(this._fAlphas0 > 0)
         {
            this._flagSprites[0].updateMeshes(_loc2_);
         }
         this._flagSprites[1].setScale(this._fScales1);
         this._flagSprites[1].alpha = this._fAlphas1;
         if(this._fAlphas1 > 0)
         {
            this._flagSprites[1].updateMeshes(_loc2_);
         }
         this._flagSprites[2].setScale(this._fScales2);
         this._flagSprites[2].alpha = this._fAlphas2;
         if(this._fAlphas2 > 0)
         {
            this._flagSprites[2].updateMeshes(_loc2_);
         }
         this._flagSprites[3].setScale(this._fScales3);
         this._flagSprites[3].alpha = this._fAlphas3;
         if(this._fAlphas3 > 0)
         {
            this._flagSprites[3].updateMeshes(_loc2_);
         }
         this._pFlags[0].setScale(new Vec2F(this._fScales0,this._fScales0));
         this._pFlags[1].setScale(new Vec2F(this._fScales1,this._fScales1));
         this._pFlags[2].setScale(new Vec2F(this._fScales2,this._fScales2));
         this._pFlags[3].setScale(new Vec2F(this._fScales3,this._fScales3));
         this._pBack.setAlpha(uint(255 * this._fBackAlpha));
         if(!_bActive)
         {
            return;
         }
         this._pScene.update();
         while(this._pScene.hasMsg())
         {
            _loc3_ = this._pScene.popMsg();
            if(_loc3_.getText() == "lion")
            {
               this.loadAssets(GameConsts.eFireChima);
               (getWorldObj() as MainMenu).getCharacterSelect().setupLions();
               (getWorldObj() as MainMenu).gotoCharacterSelect();
            }
            else if(_loc3_.getText() == "croc")
            {
               this.loadAssets(GameConsts.eFireChima);
               (getWorldObj() as MainMenu).getCharacterSelect().setupCrocs();
               (getWorldObj() as MainMenu).gotoCharacterSelect();
            }
            else if(_loc3_.getText() == "saber")
            {
               this.loadAssets(GameConsts.eIceChima);
               (getWorldObj() as MainMenu).getCharacterSelect().setupSabers();
               (getWorldObj() as MainMenu).gotoCharacterSelect();
            }
            else if(_loc3_.getText() == "bear")
            {
               this.loadAssets(GameConsts.eIceChima);
               (getWorldObj() as MainMenu).getCharacterSelect().setupBears();
               (getWorldObj() as MainMenu).gotoCharacterSelect();
            }
            else if(_loc3_.getText() == "back")
            {
               (getWorldObj() as MainMenu).gotoTitleScreen();
            }
         }
      }
      
      override public function show() : void
      {
         var _loc1_:Number = 0;
         this._pTweener.addTween(this,"flagSelectAlpha","_fAlphas0",0,1,0.5,0 + 0.15 * Number(0),cTweener.LINEAR);
         this._pTweener.addTween(this,"flagSelectScale","_fScales0",0.5,1,0.5,0 + 0.15 * Number(0),cTweener.CUBIC);
         this._pTweener.addTween(this,"flagSelectAlpha","_fAlphas1",0,1,0.5,0 + 0.15 * Number(1),cTweener.LINEAR);
         this._pTweener.addTween(this,"flagSelectScale","_fScales1",0.5,1,0.5,0 + 0.15 * Number(1),cTweener.CUBIC);
         this._pTweener.addTween(this,"flagSelectAlpha","_fAlphas2",0,1,0.5,0 + 0.15 * Number(2),cTweener.LINEAR);
         this._pTweener.addTween(this,"flagSelectScale","_fScales2",0.5,1,0.5,0 + 0.15 * Number(2),cTweener.CUBIC);
         this._pTweener.addTween(this,"flagSelectAlpha","_fAlphas3",0,1,0.5,0 + 0.15 * Number(3),cTweener.LINEAR);
         this._pTweener.addTween(this,"flagSelectScale","_fScales3",0.5,1,0.5,0 + 0.15 * Number(3),cTweener.CUBIC);
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",0,1,0.25,0,cTweener.LINEAR);
         _bActive = true;
      }
      
      override public function hide() : void
      {
         this._pTweener.reset();
         this._pTweener.addTween(this,"flagSelectAlpha","_fAlphas0",this._fAlphas0,0,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"flagSelectScale","_fScales0",this._fScales0,0.5,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         this._pTweener.addTween(this,"flagSelectAlpha","_fAlphas1",this._fAlphas1,0,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"flagSelectScale","_fScales1",this._fScales1,0.5,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         this._pTweener.addTween(this,"flagSelectAlpha","_fAlphas2",this._fAlphas2,0,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"flagSelectScale","_fScales2",this._fScales2,0.5,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         this._pTweener.addTween(this,"flagSelectAlpha","_fAlphas3",this._fAlphas3,0,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"flagSelectScale","_fScales3",this._fScales3,0.5,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",1,0,0.25,0,cTweener.LINEAR);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         var _loc1_:uint = 0;
         this._pTweener.reset();
         _loc1_ = 0;
         while(_loc1_ < 4)
         {
            this._pFlags[_loc1_].setAlpha(255);
            this._pFlags[_loc1_].setScale(new Vec2F(1,1));
            _loc1_++;
         }
         this._fAlphas0 = 1;
         this._fAlphas1 = 1;
         this._fAlphas2 = 1;
         this._fAlphas3 = 1;
         this._fScales0 = 1;
         this._fScales1 = 1;
         this._fScales2 = 1;
         this._fScales3 = 1;
         this._fBackAlpha = 1;
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         var _loc1_:uint = 0;
         this._pTweener.reset();
         _loc1_ = 0;
         while(_loc1_ < 4)
         {
            this._pFlags[_loc1_].setAlpha(0);
            this._pFlags[_loc1_].setScale(new Vec2F(2,2));
            _loc1_++;
         }
         this._fAlphas0 = 0;
         this._fAlphas1 = 0;
         this._fAlphas2 = 0;
         this._fAlphas3 = 0;
         this._fScales0 = 2;
         this._fScales1 = 2;
         this._fScales2 = 2;
         this._fScales3 = 2;
         this._fBackAlpha = 0;
         _bActive = false;
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fBackAlpha > 0)
         {
            return true;
         }
         if(this._fAlphas0 > 0 || this._fAlphas1 > 0 || this._fAlphas2 > 0 || this._fAlphas3 > 0)
         {
            return true;
         }
         return false;
      }
      
      public function loadAssets(param1:int) : void
      {
         var _loc2_:Boolean = false;
         if(param1 == GameConsts.eFireChima)
         {
            GameRes.get().unloadIceResources();
            _loc2_ = GameRes.get().loadFireResources();
         }
         else
         {
            GameRes.get().unloadFireResources();
            _loc2_ = GameRes.get().loadIceResources();
         }
         if(_loc2_)
         {
            GameWorld.get().clearPlayers();
         }
      }
   }
}
