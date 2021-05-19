package game.objects.ui.frontend
{
   import game.GameRes;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   
   public class MainMenuTitleScreen extends UIComponent
   {
       
      
      public var _pScene:GlaControllerScene;
      
      public var _pPlay:GlaControllerButton;
      
      public var _pOptions:GlaControllerButton;
      
      public var _pHelp:GlaControllerButton;
      
      public var _pWarner:GlaControllerButton;
      
      public var _fAlpha:Number;
      
      public var _fScale:Number;
      
      public var _fPlayBtnAlpha:Number;
      
      public var _fOptionsAlpha:Number;
      
      public var _aaSparkleBounds:AABox2f;
      
      public var _vOptionsPos:Vec2F;
      
      public var _vOptionsStart:Vec2F;
      
      public var _vOptionsEnd:Vec2F;
      
      public var _vHelpPos:Vec2F;
      
      public var _vHelpStart:Vec2F;
      
      public var _vHelpEnd:Vec2F;
      
      public var _vWarnerPos:Vec2F;
      
      public var _vWarnerStart:Vec2F;
      
      public var _vWarnerEnd:Vec2F;
      
      public var _pTweener:cTweener;
      
      public function MainMenuTitleScreen()
      {
         super();
         this._fAlpha = 0;
         this._fScale = 2;
         this._fOptionsAlpha = 0;
         this._fPlayBtnAlpha = 0;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_titlescreen"));
         this._pScene.setPosition(new Vec2F());
         this._pPlay = this._pScene.getButton("play_button");
         this._pOptions = this._pScene.getButton("options_button");
         this._pHelp = this._pScene.getButton("help_button");
         this._pWarner = this._pScene.getButton("warner_button");
         this._pTweener = new cTweener();
         this._pPlay.setPosition(new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight())));
         this._pPlay.getScene().getSprite("Cloudy1").setRotation(Random.RandomFloatRangeUniform(Math.PI * 2 * 0.25,Math.PI * 2 * 0.75));
         this._vOptionsEnd = new Vec2F(this._pOptions.getPosition().x,this._pOptions.getPosition().y);
         this._vOptionsEnd.x += 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
         this._vOptionsEnd.y += Number(LegoChima.Instance().zGetScreenHeight());
         this._vOptionsStart = new Vec2F(this._vOptionsEnd.x,this._vOptionsEnd.y);
         this._vOptionsStart.y += 204;
         this._vOptionsPos = new Vec2F(this._vOptionsEnd.x,this._vOptionsEnd.y);
         this._pOptions.setPosition(this._vOptionsEnd);
         this._vHelpEnd = new Vec2F(this._pHelp.getPosition().x,this._pHelp.getPosition().y);
         this._vHelpEnd.x += 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
         this._vHelpEnd.y += Number(LegoChima.Instance().zGetScreenHeight());
         this._vHelpStart = new Vec2F(this._vHelpEnd.x,this._vHelpEnd.y);
         this._vHelpStart.y += 204;
         this._vHelpPos = new Vec2F(this._vHelpEnd.x,this._vHelpEnd.y);
         this._pHelp.setPosition(this._vHelpEnd);
         this._vWarnerEnd = new Vec2F(this._pWarner.getPosition().x,this._pWarner.getPosition().y);
         this._vWarnerEnd.x += 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
         this._vWarnerEnd.y += Number(LegoChima.Instance().zGetScreenHeight());
         this._vWarnerStart = new Vec2F(this._vWarnerEnd.x,this._vWarnerEnd.y);
         this._pWarner.setPosition(this._vWarnerEnd);
         this._vWarnerStart.y += 204;
         this._vWarnerPos = new Vec2F(1024,1124);
         this._pWarner.setPosition(this._vWarnerEnd);
         this._aaSparkleBounds = this._pPlay.getHitBox();
         this._aaSparkleBounds.scale(0.8);
         this._aaSparkleBounds.translate(this._pPlay.getPosition());
         this.addChild(this._pScene);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this._pScene);
         this._pScene.dispose();
         this._pScene = null;
         this._pTweener.dispose();
         this._pTweener = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:GlaMsg = null;
         this.touchable = _bActive;
         this._pTweener.tick(param1.getTime().dt);
         this._pPlay.setAlpha(uint(255 * this._fAlpha));
         this._pPlay.setScale(new Vec2F(this._fScale,this._fScale));
         this.updatePlayButtonAnimation(param1.getTime().dt);
         this._pOptions.setAlpha(uint(255 * this._fOptionsAlpha));
         this._pOptions.setPosition(this._vOptionsPos);
         this._pHelp.setAlpha(uint(255 * this._fOptionsAlpha));
         this._pHelp.setPosition(this._vHelpPos);
         this._pWarner.setAlpha(0);
         this._pWarner.setPosition(this._vWarnerPos);
         if(!_bActive)
         {
            return;
         }
         this._pScene.update();
         while(this._pScene.hasMsg())
         {
            _loc2_ = this._pScene.popMsg();
            if(_loc2_.getText() == "play")
            {
               (getWorldObj() as MainMenu).gotoFlagSelect();
            }
            else if(_loc2_.getText() == "options")
            {
               (getWorldObj() as MainMenu).gotoOptions();
            }
            else if(_loc2_.getText() == "help")
            {
               (getWorldObj() as MainMenu).gotoCredits();
            }
         }
      }
      
      public function updatePlayButtonAnimation(param1:Number) : void
      {
         var _loc2_:GlaControllerScene = this._pPlay.getScene();
         this._fPlayBtnAlpha += param1 * 0.5;
         var _loc3_:Number = (1 + Math.sin(this._fPlayBtnAlpha)) * 0.5;
         _loc2_.getSprite("Cloudy1").setRotation(_loc2_.getSprite("Cloudy1").getRotation() + param1);
         _loc2_.getSprite("Cloudy1").setAlpha(uint(255 * _loc3_ * this._fAlpha));
         _loc2_.getSprite("Cloudy2").setRotation(_loc2_.getSprite("Cloudy2").getRotation() - param1);
         _loc2_.getSprite("Cloudy2").setAlpha(uint(255 * (1 - _loc3_) * this._fAlpha));
         var _loc4_:GlaControllerScene;
         (_loc4_ = this._pPlay.getPressedScene()).getSprite("Cloudy1").setRotation(_loc2_.getSprite("Cloudy1").getRotation());
         _loc4_.getSprite("Cloudy1").setAlpha(_loc2_.getSprite("Cloudy1").getColor().a);
         _loc4_.getSprite("Cloudy2").setRotation(_loc2_.getSprite("Cloudy2").getRotation());
         _loc4_.getSprite("Cloudy2").setAlpha(_loc2_.getSprite("Cloudy2").getColor().a);
      }
      
      override public function show() : void
      {
         this._pTweener.addTween(this,"playButtonAlpha","_fAlpha",0,1,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"playButtonScale","_fScale",0.5,1,0.5,0,cTweener.CUBIC);
         this._pTweener.addTween(this,"optionsButtonAlpha","_fOptionsAlpha",0,1,0.25,0,cTweener.LINEAR);
         _bActive = true;
      }
      
      override public function hide() : void
      {
         this._pTweener.addTween(this,"playButtonAlpha","_fAlpha",1,0,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"playButtonScale","_fScale",1,0.5,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         this._pTweener.addTween(this,"optionsButtonAlpha","_fOptionsAlpha",1,0,0.25,0,cTweener.LINEAR);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         this._pTweener.reset();
         this._pPlay.setAlpha(255);
         this._pPlay.setScale(new Vec2F(1,1));
         this._pOptions.setAlpha(255);
         this._pHelp.setAlpha(255);
         this._pWarner.setAlpha(0);
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         this._pTweener.reset();
         this._pPlay.setAlpha(0);
         this._pPlay.setScale(new Vec2F(0,0));
         this._pOptions.setAlpha(0);
         this._pHelp.setAlpha(0);
         this._pWarner.setAlpha(0);
         _bActive = false;
      }
      
      public function slideLowerButtonsOn() : void
      {
         this._pTweener.addTween(this._vOptionsPos,"optionsButtonPos","y",this._vOptionsStart.y,this._vOptionsEnd.y,1,0,cTweener.BOUNCE,cTweener.EASE_OUT);
         this._pTweener.addTween(this._vHelpPos,"helpButtonPos","y",this._vHelpStart.y,this._vHelpEnd.y,1,0,cTweener.BOUNCE,cTweener.EASE_OUT);
         this._pTweener.addTween(this._vWarnerPos,"warnerButtonPos","y",this._vWarnerStart.y,this._vWarnerEnd.y,1,0,cTweener.BOUNCE,cTweener.EASE_OUT);
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fAlpha > 0 || this._fOptionsAlpha > 0)
         {
            return true;
         }
         return false;
      }
   }
}
