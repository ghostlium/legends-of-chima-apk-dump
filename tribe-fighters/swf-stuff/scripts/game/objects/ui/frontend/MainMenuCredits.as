package game.objects.ui.frontend
{
   import flash.utils.ByteArray;
   import game.GameRes;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import resource.ResManager;
   import starling.display.Sprite;
   import starling.text.TextField;
   import starling.text.TextFieldAutoSize;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.world.EventUpdate;
   
   public class MainMenuCredits extends UIComponent
   {
       
      
      public var _creditsList:Vector.<String>;
      
      public var _vCreditsPosition:Vec2F;
      
      public var _fCreditsOffset:Number;
      
      public var _fMaxCreditsOffset:Number;
      
      public var _fMinCreditsOffset:Number;
      
      public var _pFrameScene:GlaControllerScene;
      
      public var _pScene:GlaControllerScene;
      
      public var _pBack:GlaControllerButton;
      
      public var _fBackAlpha:Number;
      
      public var _pTweener:cTweener;
      
      public var _textHolder:Sprite;
      
      public var bShowing:Boolean;
      
      public function MainMenuCredits()
      {
         super();
         this._pFrameScene = null;
         this._creditsList = new Vector.<String>();
         this._fBackAlpha = 0;
         this._fCreditsOffset = 0;
         this.bShowing = false;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_credits"));
         this._vCreditsPosition = new Vec2F(this._pScene.findElement("CreditsPosition").getPosition().x,this._pScene.findElement("CreditsPosition").getPosition().y);
         this._fCreditsOffset = 0;
         this._fMaxCreditsOffset = this._fCreditsOffset;
         this._pScene.setPosition(new Vec2F());
         var _loc1_:Vec2F = this._pScene.getRectangle("screen_centre").getPosition();
         var _loc2_:Vec2F = this._pScene.getRectangle("screen_bottom_centre").getPosition();
         this._pBack = this._pScene.getButton("back_button");
         var _loc3_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc4_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc5_:Vec2F = this._pBack.getPosition();
         _loc5_.x -= _loc2_.x;
         _loc5_.y -= _loc2_.y;
         _loc5_.x += _loc4_.x;
         _loc5_.y += _loc4_.y;
         this._pBack.setPosition(_loc5_);
         this._vCreditsPosition.x -= _loc2_.x;
         this._vCreditsPosition.y -= _loc2_.y;
         this._vCreditsPosition.x += _loc4_.x;
         this._vCreditsPosition.y += _loc4_.y;
         this._pTweener = new cTweener();
         this._textHolder = new Sprite();
         this._textHolder.x = LegoChima.Instance().zGetScreenWidth() / 2;
         this._textHolder.touchable = false;
         this._textHolder.visible = false;
         this.loadCredits();
         this.setupFrame();
         this.addChild(this._textHolder);
         this.addChild(this._pFrameScene);
         this.addChild(this._pScene);
      }
      
      override public function dispose() : void
      {
         this._textHolder.removeChildren(0,-1,true);
         this.removeChild(this._textHolder,true);
         this._textHolder = null;
         this.removeChild(this._pScene);
         this._pTweener.dispose();
         this._pTweener = null;
         this._pScene.dispose();
         this._pScene = null;
         if(this._pFrameScene != null)
         {
            this.removeChild(this._pFrameScene);
            this._pFrameScene.dispose();
            this._pFrameScene = null;
         }
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc3_:GlaMsg = null;
         this.touchable = _bActive;
         this._pTweener.tick(param1.getTime().dt);
         var _loc2_:uint = uint(255 * this._fBackAlpha);
         this._pBack.setAlpha(_loc2_);
         if(this._fBackAlpha >= 1)
         {
            if(!this.bShowing)
            {
               this._pFrameScene.visible = true;
               this._textHolder.visible = true;
               this.bShowing = true;
            }
         }
         else if(this.bShowing)
         {
            this._pFrameScene.visible = false;
            this._textHolder.visible = false;
            this.bShowing = false;
         }
         if(!_bActive)
         {
            return;
         }
         this._pScene.update();
         this._textHolder.y = this._vCreditsPosition.y + this._fCreditsOffset;
         while(this._pScene.hasMsg())
         {
            _loc3_ = this._pScene.popMsg();
            if(_loc3_.getText() == "back")
            {
               (getWorldObj() as MainMenu).gotoTitleScreen();
            }
         }
         this._fCreditsOffset -= 3;
         if(this._fCreditsOffset < -(this._fMaxCreditsOffset + this._vCreditsPosition.y + 100))
         {
            (getWorldObj() as MainMenu).gotoTitleScreen();
         }
      }
      
      override public function show() : void
      {
         this.loadCredits();
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",0,1,0.25,0,cTweener.LINEAR);
         _bActive = true;
         this._fCreditsOffset = 0;
      }
      
      override public function hide() : void
      {
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",1,0,0.25,0,cTweener.LINEAR);
         _bActive = false;
         this._fCreditsOffset = 0;
      }
      
      override public function forceShow() : void
      {
         this._pTweener.reset();
         this._fBackAlpha = 1;
         this._pBack.setAlpha(255);
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         this._pTweener.reset();
         this._fBackAlpha = 0;
         this._pBack.setAlpha(0);
         _bActive = false;
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fBackAlpha > 0)
         {
            return true;
         }
         return false;
      }
      
      public function loadCredits() : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:TextField = null;
         this._textHolder.removeChildren(0,-1,true);
         var _loc1_:Boolean = TextField.getBitmapFont("Arial32").m_bSplitAnywhere;
         TextField.getBitmapFont("Arial32").m_bSplitAnywhere = false;
         TextField.getBitmapFont("Arial24").m_bSplitAnywhere = false;
         this._creditsList.length = 0;
         var _loc2_:ByteArray = ResManager.getData("res/cfg/credits_en.zdf");
         var _loc3_:String = _loc2_.toString();
         while(_loc3_.length > 0)
         {
            if((_loc7_ = _loc3_.search("\n")) >= 0)
            {
               _loc8_ = _loc3_.slice(0,_loc7_);
               _loc3_ = _loc3_.slice(_loc7_ + 1);
            }
            else
            {
               _loc8_ = _loc3_;
               _loc3_ = "";
            }
            this._creditsList.push(_loc8_);
         }
         var _loc4_:Number = 0;
         var _loc5_:int = this._creditsList.length;
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            _loc9_ = 32;
            _loc10_ = 24;
            _loc11_ = this._creditsList[_loc6_];
            _loc12_ = 0;
            _loc13_ = GameRes.get()._pScoreFont;
            if(_loc11_.charAt(0) == "/")
            {
               _loc12_ = int(_loc11_.charAt(2));
               _loc13_ = GameRes.get()._pArialUnicode32;
               _loc9_ = 40;
               _loc10_ = 32;
               _loc11_ = _loc11_.substr(3,_loc11_.length);
            }
            if(_loc12_ == 1)
            {
               _loc4_ += 100;
            }
            else if(_loc12_ == 2)
            {
               _loc4_ += 50;
            }
            else if(_loc12_ == 3)
            {
               _loc4_ += 20;
            }
            (_loc14_ = new TextField(500,1,_loc11_,_loc13_,_loc10_,16777215)).autoSize = TextFieldAutoSize.VERTICAL;
            _loc14_.hAlign = HAlign.CENTER;
            _loc14_.vAlign = VAlign.TOP;
            _loc14_.alignPivot(HAlign.CENTER,VAlign.TOP);
            _loc14_.x = 0;
            _loc14_.y = _loc4_;
            _loc14_.touchable = false;
            this._textHolder.addChild(_loc14_);
            _loc4_ += _loc14_.height + 8;
            if(_loc12_ == 2)
            {
               _loc4_ += 10;
            }
            _loc6_++;
         }
         this._fMaxCreditsOffset = this._textHolder.height;
         TextField.getBitmapFont("Arial32").m_bSplitAnywhere = _loc1_;
         TextField.getBitmapFont("Arial24").m_bSplitAnywhere = _loc1_;
      }
      
      public function setupFrame() : void
      {
         this._pFrameScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_frame"));
         this._pFrameScene.setPosition(new Vec2F());
         var _loc1_:GlaControllerSprite = this._pFrameScene.getSprite("frame_top");
         var _loc2_:GlaControllerSprite = this._pFrameScene.getSprite("frame_bottom");
         _loc1_.alignPivot();
         _loc2_.alignPivot();
         var _loc3_:Vec2F = new Vec2F();
         var _loc4_:Vec2F = new Vec2F();
         _loc3_.x = 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
         _loc3_.y = 0.5 * _loc1_.getSprite().getHeight();
         _loc4_.x = 0.5 * Number(LegoChima.Instance().zGetScreenWidth());
         _loc4_.y = Number(LegoChima.Instance().zGetScreenHeight()) - 0.5 * _loc2_.getSprite().getHeight();
         _loc1_.setPosition(_loc3_);
         _loc2_.setPosition(_loc4_);
         this._pFrameScene.visible = false;
      }
   }
}
