package game.objects.ui.frontend
{
   import game.CharData;
   import game.GameRes;
   import game.GameWorld;
   import game.SaveData;
   import game.Util;
   import game.objects.Player;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import starling.display.Image;
   import starling.display.Sprite;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaControllerSceneElement;
   import zufflin.cobraBase.GlaControllerSprite;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.core.zSoundList;
   import zufflin.core.zSprite;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   
   public class MainMenuCharSelect extends UIComponent
   {
      
      public static const kfStudOffsetX:Number = -16;
      
      public static const kfStudOffsetY:Number = -3;
      
      public static const kfHighlightCycleSpeed:Number = 1;
      
      private static var lion_names:Vector.<String> = new <String>["player_lion_ranged","player_lion_mage","player_lion_warrior"];
      
      private static var lion_slots:Vector.<int> = new <int>[SaveData.ePlayerCharRangedLionSlot,SaveData.ePlayerCharMageLionSlot,SaveData.ePlayerCharWarriorLionSlot];
      
      private static var croc_names:Vector.<String> = new <String>["player_croc_ranged","player_croc_mage","player_croc_warrior"];
      
      private static var croc_slots:Vector.<int> = new <int>[SaveData.ePlayerCharRangedCrocSlot,SaveData.ePlayerCharMageCrocSlot,SaveData.ePlayerCharWarriorCrocSlot];
      
      private static var saber_names:Vector.<String> = new <String>["player_saber_ranged","player_saber_mage","player_saber_warrior"];
      
      private static var saber_slots:Vector.<int> = new <int>[SaveData.ePlayerCharRangedSaberSlot,SaveData.ePlayerCharMageSaberSlot,SaveData.ePlayerCharWarriorSaberSlot];
      
      private static var bear_names:Vector.<String> = new <String>["player_bear_ranged","player_bear_mage","player_bear_warrior"];
      
      private static var bear_slots:Vector.<int> = new <int>[SaveData.ePlayerCharRangedBearSlot,SaveData.ePlayerCharMageBearSlot,SaveData.ePlayerCharWarriorBearSlot];
       
      
      public var _pScene:GlaControllerScene;
      
      public var _pPortraits:GlaControllerScene;
      
      public var _pStudScene:GlaControllerScene;
      
      public var _pCharButtons:Vector.<GlaControllerButton>;
      
      public var _pPlay:GlaControllerButton;
      
      public var _pBack:GlaControllerButton;
      
      public var _pUpgradeBars:Vector.<GlaControllerSceneElement>;
      
      public var _characterVoices:zSoundList;
      
      public var _lastSelected:String;
      
      public var _lastSelectedTribe:String;
      
      public var _pLastSelectedButton:GlaControllerButton;
      
      public var _uLastSelectedIndex:uint;
      
      public var _pLastSelectedButtonForUnlock:GlaControllerButton;
      
      public var _uLastSelectedIndexForUnlock:uint;
      
      public var _uUpgradeApplyIndex:uint;
      
      public var _fAlpha:Number;
      
      public var _fScale:Number;
      
      public var _fSelectedAlpha:Number;
      
      public var _fSelectedScale:Number;
      
      public var _fBackAlpha:Number;
      
      public var _fUpgradeBarAlphas0:Number;
      
      public var _fUpgradeBarAlphas1:Number;
      
      public var _fUpgradeBarAlphas2:Number;
      
      public var _fUpgradeBarAlphas3:Number;
      
      public var _fUpgradeBarAlphas4:Number;
      
      public var _fUpgradeBarAlphas5:Number;
      
      public var _fUpgradeBarAlphas6:Number;
      
      public var _fUpgradeBarAlphas7:Number;
      
      public var _fUpgradeBarAlphas8:Number;
      
      public var _fUpgradeBarAlphas9:Number;
      
      public var _saveSlots:Vector.<int>;
      
      public var _currSlot:int;
      
      public var _pTweener:cTweener;
      
      public var _pBarTweener:cTweener;
      
      public var _upgradeText:String;
      
      public var _studString:String;
      
      public var _vStudPos:Vec2F;
      
      public var _vHighscorePos:Vec2F;
      
      public var _bEnableHighlight:Boolean;
      
      public var _uHighlightChar:uint;
      
      public var _pFireHighlight:zSprite;
      
      public var _pIceHighlight:zSprite;
      
      public var _pUseHighlight:zSprite;
      
      public var _pPadlock:zSprite;
      
      public var _aParticleSpawnArea:AABox2f;
      
      public var _fPlayBtnAlpha:Number;
      
      public var _pParticles:ParticleManager2D;
      
      public var _fUpgradeHighlightCycle:Number;
      
      private var _selectHilight:Image;
      
      private var _aPadlockImage:Vector.<Image>;
      
      private var _upgradeContainer:Sprite;
      
      private var _upgradeTF:TextField;
      
      private var _costTF:TextField;
      
      private var _bestTF:TextField;
      
      private var _blipBase:Vec2F;
      
      public var m_iFrameCount:int;
      
      private var charselectMsgs:Vector.<String>;
      
      public function MainMenuCharSelect()
      {
         var _loc5_:uint = 0;
         var _loc6_:Vec2F = null;
         this.charselectMsgs = new <String>["charselect_ranged","charselect_mage","charselect_warrior"];
         super();
         this.m_iFrameCount = 0;
         this._characterVoices = new zSoundList();
         this._saveSlots = new Vector.<int>(3,true);
         this._pUpgradeBars = new Vector.<GlaControllerSceneElement>(1,true);
         this._pCharButtons = new Vector.<GlaControllerButton>(3,true);
         this._lastSelected = "";
         this._fSelectedAlpha = 0;
         this._fSelectedScale = 0;
         this._fBackAlpha = 0;
         this._bEnableHighlight = false;
         this._uHighlightChar = 0;
         this._pUseHighlight = null;
         this._lastSelectedTribe = "";
         this._pLastSelectedButton = null;
         this._uLastSelectedIndex = 0;
         this._pLastSelectedButtonForUnlock = null;
         this._uLastSelectedIndexForUnlock = 0;
         this._uUpgradeApplyIndex = 0;
         this._upgradeText = "";
         this._fUpgradeHighlightCycle = 0;
         this._fPlayBtnAlpha = 0;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect"));
         this._pScene.setPosition(new Vec2F(0,0));
         this._pFireHighlight = this._pScene.getSprite("fire_glow").getSprite();
         this._pIceHighlight = this._pScene.getSprite("ice_glow").getSprite();
         this._pPadlock = this._pScene.getSprite("padlock").getSprite();
         var _loc1_:Vec2F = this._pScene.getRectangle("screen_bottom_centre").getPosition();
         var _loc2_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc3_:Vec2F = this._pScene.getRectangle("screen_centre").getPosition();
         var _loc4_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         this._pCharButtons[0] = this._pScene.getButton("ranged");
         this._pCharButtons[1] = this._pScene.getButton("mage");
         this._pCharButtons[2] = this._pScene.getButton("warrior");
         _loc5_ = 0;
         while(_loc5_ < 3)
         {
            _loc6_ = this._pCharButtons[_loc5_].getPosition();
            _loc6_.x -= _loc3_.x;
            _loc6_.y -= _loc3_.y;
            _loc6_.x += _loc4_.x;
            _loc6_.y += _loc4_.y;
            this._pCharButtons[_loc5_].setPosition(_loc6_);
            this._pCharButtons[_loc5_].SetUpForCharSelect();
            _loc5_++;
         }
         this._pPlay = this._pScene.getButton("play");
         _loc6_ = this._pPlay.getPosition();
         _loc6_.x -= _loc1_.x;
         _loc6_.y -= _loc1_.y;
         _loc6_.x += _loc2_.x;
         _loc6_.y += _loc2_.y;
         this._pPlay.setPosition(_loc6_);
         this._pPlay.getScene().getSprite("Cloudy1").setRotation(Random.RandomFloatRangeUniform(Math.PI * 2 * 0.25,Math.PI * 2 * 0.75));
         this._pPlay.setAlpha(0);
         this._pPlay.getScene().getSprite("Cloudy1").alignPivot();
         this._pPlay.getScene().getSprite("Cloudy2").alignPivot();
         var _loc7_:Vec2F = this._pPlay.getScene().getSprite("Cloudy1").getPosition();
         _loc7_.y -= 2;
         this._pPlay.getScene().getSprite("Cloudy1").alignPivot();
         this._pPlay.getScene().getSprite("Cloudy1").setPosition(_loc7_);
         _loc7_ = this._pPlay.getScene().getSprite("Cloudy2").getPosition();
         _loc7_.y -= 2;
         this._pPlay.getScene().getSprite("Cloudy2").alignPivot();
         this._pPlay.getScene().getSprite("Cloudy2").setPosition(_loc7_);
         _loc7_ = this._pPlay.getPressedScene().getSprite("Cloudy1").getPosition();
         _loc7_.y -= 2;
         this._pPlay.getPressedScene().getSprite("Cloudy1").alignPivot();
         this._pPlay.getPressedScene().getSprite("Cloudy1").setPosition(_loc7_);
         _loc7_ = this._pPlay.getPressedScene().getSprite("Cloudy2").getPosition();
         _loc7_.y -= 2;
         this._pPlay.getPressedScene().getSprite("Cloudy2").alignPivot();
         this._pPlay.getPressedScene().getSprite("Cloudy2").setPosition(_loc7_);
         this._pBack = this._pScene.getButton("back_button");
         _loc6_ = this._pBack.getPosition();
         _loc6_.x -= _loc1_.x;
         _loc6_.y -= _loc1_.y;
         _loc6_.x += _loc2_.x;
         _loc6_.y += _loc2_.y;
         this._pBack.setPosition(_loc6_);
         this._pUpgradeBars[0] = this._pScene.getScene("upgrade_bar_1");
         _loc5_ = 0;
         while(_loc5_ < 1)
         {
            _loc6_ = this._pUpgradeBars[_loc5_].getPosition();
            _loc6_.x -= _loc3_.x;
            _loc6_.y -= _loc3_.y;
            _loc6_.x += _loc4_.x;
            _loc6_.y += _loc4_.y;
            this._pUpgradeBars[_loc5_].setPosition(_loc6_);
            _loc5_++;
         }
         this._fUpgradeBarAlphas0 = 0;
         this._fUpgradeBarAlphas1 = 0;
         this._fUpgradeBarAlphas2 = 0;
         this._fUpgradeBarAlphas3 = 0;
         this._fUpgradeBarAlphas4 = 0;
         this._fUpgradeBarAlphas5 = 0;
         this._fUpgradeBarAlphas6 = 0;
         this._fUpgradeBarAlphas7 = 0;
         this._fUpgradeBarAlphas8 = 0;
         this._fUpgradeBarAlphas9 = 0;
         var _loc8_:zSprite;
         var _loc9_:int = (_loc8_ = this._pUpgradeBars[0].getScene().getSrcScene().findSpriteElementSprite("blip9")).getWidth();
         var _loc10_:int = _loc8_.getHeight();
         this._aParticleSpawnArea = new AABox2f(new Vec2F(_loc9_ * -0.5,_loc10_ * -0.5),new Vec2F(_loc9_ * 0.5,_loc10_ * 0.5));
         this._aParticleSpawnArea.translate(this._pUpgradeBars[0].getScene().getSrcScene().findSpriteElement("blip9").getPos(0));
         this._pParticles = new ParticleManager2D(40);
         this._vStudPos = new Vec2F(this._pScene.getRectangle("studs").getPosition().x,this._pScene.getRectangle("studs").getPosition().y);
         this._vStudPos.x -= _loc3_.x;
         this._vStudPos.y -= _loc3_.y;
         this._vStudPos.x += _loc4_.x;
         this._vStudPos.y += _loc4_.y;
         this._pStudScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudScene.playAnimation(true);
         this._vHighscorePos = new Vec2F(this._pScene.getRectangle("highscore").getPosition().x,this._pScene.getRectangle("highscore").getPosition().y);
         this._vHighscorePos.x -= _loc3_.x;
         this._vHighscorePos.y -= _loc3_.y;
         this._vHighscorePos.x += _loc4_.x;
         this._vHighscorePos.y += _loc4_.y;
         this._saveSlots[0] = SaveData.ePlayerCharRangedLionSlot;
         this._saveSlots[1] = SaveData.ePlayerCharMageLionSlot;
         this._saveSlots[2] = SaveData.ePlayerCharWarriorLionSlot;
         this._currSlot = SaveData.ePlayerCharRangedLionSlot;
         this._pPortraits = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("charselect_portraits"));
         this._pTweener = new cTweener();
         this._pBarTweener = new cTweener();
         this._selectHilight = new Image(this._pFireHighlight._tex);
         this._selectHilight.alignPivot();
         this._selectHilight.touchable = false;
         this._selectHilight.visible = false;
         this.addChild(this._selectHilight);
         this.addChild(this._pScene);
         this.addChild(this._pStudScene);
         this._aPadlockImage = new Vector.<Image>(3,true);
         _loc5_ = 0;
         while(_loc5_ < 3)
         {
            this._aPadlockImage[_loc5_] = new Image(this._pPadlock._tex);
            this._aPadlockImage[_loc5_].alignPivot();
            this._aPadlockImage[_loc5_].touchable = false;
            this._aPadlockImage[_loc5_].x = this._pCharButtons[_loc5_].getPosition().x;
            this._aPadlockImage[_loc5_].y = this._pCharButtons[_loc5_].getPosition().y;
            this._aPadlockImage[_loc5_].visible = false;
            this.addChild(this._aPadlockImage[_loc5_]);
            _loc5_++;
         }
         this._upgradeContainer = new Sprite();
         this._upgradeContainer.touchable = false;
         this._upgradeContainer.x = this._pUpgradeBars[0].getPosition().x;
         this._upgradeContainer.y = this._pUpgradeBars[0].getPosition().y;
         this.addChild(this._upgradeContainer);
         var _loc11_:AABox2f = this._pUpgradeBars[0].getScene().getRectangle("upgrade_text").getSrcRectangle().getAABox(0);
         var _loc12_:Vec2F = this._pUpgradeBars[0].getScene().getRectangle("upgrade_text").getPosition();
         var _loc13_:Vec2F = new Vec2F(_loc12_.x,_loc12_.y - 0.5 * _loc11_.getSizeY());
         this._upgradeTF = new TextField(_loc11_.getSizeX(),400,"",GameRes.get()._pArialUnicode32,32,16777215);
         this._upgradeTF.alignPivot(HAlign.CENTER,VAlign.TOP);
         this._upgradeTF.hAlign = HAlign.LEFT;
         this._upgradeTF.vAlign = VAlign.TOP;
         this._upgradeTF.touchable = false;
         this._upgradeTF.autoScale = true;
         this._upgradeTF.x = _loc13_.x;
         this._upgradeTF.y = _loc13_.y;
         this._upgradeContainer.addChild(this._upgradeTF);
         this._costTF = new TextField(250,44,"",GameRes.get()._pArialUnicode32,32,16777215);
         this._costTF.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._costTF.hAlign = HAlign.LEFT;
         this._costTF.vAlign = VAlign.TOP;
         this._costTF.touchable = false;
         this._costTF.autoScale = true;
         this._costTF.x = 0;
         this._costTF.y = 0;
         this.addChild(this._costTF);
         this._bestTF = new TextField(250,44,"",GameRes.get()._pArialUnicode32,32,16777215);
         this._bestTF.alignPivot(HAlign.RIGHT,VAlign.TOP);
         this._bestTF.hAlign = HAlign.RIGHT;
         this._bestTF.vAlign = VAlign.TOP;
         this._bestTF.touchable = false;
         this._bestTF.autoScale = true;
         this._bestTF.x = 0;
         this._bestTF.y = 0;
         this.addChild(this._bestTF);
         this._blipBase = new Vec2F(this._pUpgradeBars[0].getScene().getSprite("blip0").getPosition().x,this._pUpgradeBars[0].getScene().getSprite("blip0").getPosition().y);
         this.addChild(this._pParticles);
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         this.removeChild(this._bestTF,true);
         this._bestTF = null;
         this.removeChild(this._costTF,true);
         this._costTF = null;
         this._upgradeContainer.removeChild(this._upgradeTF,true);
         this.removeChild(this._upgradeContainer,true);
         this._upgradeTF = null;
         this._upgradeContainer = null;
         this.removeChild(this._selectHilight);
         this._selectHilight.dispose();
         this._selectHilight = null;
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            this.removeChild(this._aPadlockImage[_loc1_]);
            this._aPadlockImage[_loc1_].dispose();
            this._aPadlockImage[_loc1_] = null;
            _loc1_++;
         }
         this.removeChild(this._pScene);
         this.removeChild(this._pStudScene);
         this.removeChild(this._pParticles,true);
         this._pParticles = null;
         this._pPortraits.dispose();
         this._pPortraits = null;
         this._pScene.dispose();
         this._pScene = null;
         this._pStudScene.dispose();
         this._pStudScene = null;
         this._pTweener.dispose();
         this._pTweener = null;
         this._pBarTweener.dispose();
         this._pBarTweener = null;
         super.dispose();
      }
      
      public function setLastSelectedTribe(param1:String) : void
      {
         this._lastSelectedTribe = param1;
      }
      
      public function setLastSelectedCharacter(param1:String) : void
      {
         this._lastSelected = param1;
      }
      
      public function setLastSelectedButton(param1:uint) : void
      {
         this._pLastSelectedButton = this._pCharButtons[param1];
      }
      
      public function setLastSelectedIndex(param1:uint) : void
      {
         this._uLastSelectedIndex = param1;
      }
      
      public function setCurrSlot(param1:uint) : void
      {
         this._currSlot = param1;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc16_:Number = NaN;
         var _loc17_:String = null;
         var _loc18_:GlaControllerSprite = null;
         var _loc19_:String = null;
         var _loc20_:uint = 0;
         var _loc21_:Number = NaN;
         var _loc22_:GlaMsg = null;
         var _loc23_:GlaControllerButton = null;
         var _loc24_:GlaControllerSceneElement = null;
         this.touchable = _bActive;
         this.updateParticles();
         this._pParticles.update(param1.getTime());
         var _loc2_:int = 255 - this._pUpgradeBars[0].getColor().a;
         _loc2_ = Math.min(_loc2_ * 2,255);
         this._pParticles.setAlpha((255 - _loc2_) / 255);
         this._pTweener.tick(param1.getTime().dt);
         this._pBarTweener.tick(param1.getTime().dt);
         var _loc3_:SaveData = GameWorld.get().getSaveData();
         _loc4_ = 0;
         while(_loc4_ < 3)
         {
            _loc16_ = 0.5;
            if(_loc3_.getCharSlot(this._saveSlots[_loc4_]).unlocked)
            {
               _loc16_ = 1;
            }
            this._pCharButtons[_loc4_].setAlpha(uint(255 * this._fAlpha * _loc16_));
            this._pCharButtons[_loc4_].setScale(new Vec2F(this._fScale,this._fScale));
            _loc4_++;
         }
         this._pPlay.setAlpha(uint(255 * this._fAlpha * this._fSelectedAlpha));
         this._pPlay.setScale(new Vec2F(this._fScale * this._fSelectedScale,this._fScale * this._fSelectedScale));
         this.updatePlayButtonAnimation(param1.getTime().dt);
         this._pBack.setAlpha(uint(255 * this._fBackAlpha));
         _loc4_ = 0;
         while(_loc4_ < 1)
         {
            this._pUpgradeBars[_loc4_].setAlpha(uint(255 * this._fAlpha * this._fSelectedAlpha));
            this._pUpgradeBars[_loc4_].setScale(new Vec2F(this._fScale * this._fSelectedScale,this._fScale * this._fSelectedScale));
            _loc5_ = 0;
            while(_loc5_ < 10)
            {
               _loc17_ = "blip" + _loc5_.toString();
               _loc18_ = this._pUpgradeBars[_loc4_].getScene().getSprite(_loc17_);
               _loc19_ = "_fUpgradeBarAlphas" + _loc5_.toString();
               if(_loc18_)
               {
                  _loc18_.setAlpha(uint(255 * this[_loc19_]));
               }
               _loc5_++;
            }
            _loc4_++;
         }
         _loc3_ = GameWorld.get().getSaveData();
         var _loc6_:uint = GameWorld.get().getSaveData().getCharSlot(this._currSlot).upgradeLevel;
         var _loc7_:Player = GameWorld.get().getPlayer();
         var _loc8_:GlaControllerSprite = this._pUpgradeBars[0].getScene().getSprite("button_highlight");
         var _loc9_:Boolean = false;
         if(_loc6_ < 10 && _loc7_)
         {
            _loc20_ = (_loc6_ + 1) * GameWorld.get().getUpgradeBaseCost() * GameWorld.get().getUpgradeCostMultiplier();
            if(_loc3_.getStudsCollected() >= _loc20_)
            {
               _loc8_.setActive(true);
               _loc8_.touchable = false;
               this._fUpgradeHighlightCycle += param1.getTime().dt * kfHighlightCycleSpeed;
               if(this._fUpgradeHighlightCycle > 1)
               {
                  this._fUpgradeHighlightCycle = this._fUpgradeHighlightCycle - 1;
               }
               _loc21_ = Math.sin(this._fUpgradeHighlightCycle * Math.PI) * Math.sin(this._fUpgradeHighlightCycle * Math.PI);
               _loc8_.setAlpha(uint(255 * _loc21_));
               _loc9_ = true;
            }
            else
            {
               _loc8_.setActive(false);
            }
         }
         else
         {
            _loc8_.setActive(false);
         }
         this._pStudScene.updateAnimation();
         _loc4_ = 0;
         while(_loc4_ < 3)
         {
            this._aPadlockImage[_loc4_].x = this._pCharButtons[_loc4_].getPosition().x;
            this._aPadlockImage[_loc4_].y = this._pCharButtons[_loc4_].getPosition().y;
            this._aPadlockImage[_loc4_].visible = !_loc3_.getCharSlot(this._saveSlots[_loc4_]).unlocked;
            this._aPadlockImage[_loc4_].alpha = this._fAlpha;
            this._aPadlockImage[_loc4_].scaleX = this._fScale;
            this._aPadlockImage[_loc4_].scaleY = this._fScale;
            _loc4_++;
         }
         this._selectHilight.visible = this._bEnableHighlight;
         this._selectHilight.alpha = this._fAlpha;
         this._selectHilight.x = this._pCharButtons[this._uHighlightChar].getPosition().x;
         this._selectHilight.y = this._pCharButtons[this._uHighlightChar].getPosition().y;
         this._pStudScene.alpha = this._fAlpha;
         this._upgradeTF.scaleX = this._fScale * this._fSelectedScale;
         this._upgradeTF.scaleY = this._fScale * this._fSelectedScale;
         this._upgradeTF.text = this._upgradeText;
         this._upgradeTF.alpha = this._fAlpha * this._fSelectedAlpha;
         this._costTF.alpha = this._fAlpha;
         this._costTF.x = this._vStudPos.x;
         this._costTF.y = this._vStudPos.y;
         this._costTF.text = this._studString;
         this._bestTF.alpha = this._fAlpha * this._fSelectedAlpha;
         this._bestTF.x = this._vHighscorePos.x;
         this._bestTF.y = this._vHighscorePos.y;
         var _loc10_:String = GameWorld.get().getLanguage().getString("charselect_furthest");
         var _loc11_:String = Util.getFormattedNumber(_loc3_.getCharSlot(this._currSlot).highestDistanceTravelled);
         var _loc12_:String = GameWorld.get().getLanguage().getString("metres");
         var _loc13_:String = (_loc13_ = _loc10_.replace("$(DISTANCE)",_loc11_)).replace("$(METRES)",_loc12_);
         this._bestTF.text = _loc13_;
         if(!_bActive)
         {
            return;
         }
         this._pScene.update();
         this._studString = Util.getFormattedNumber(GameWorld.get().getSaveData().getStudsCollected());
         var _loc14_:Number = 44;
         var _loc15_:Vec2F = new Vec2F(this._vStudPos.x,this._vStudPos.y);
         _loc15_.x += kfStudOffsetX;
         _loc15_.y += _loc14_ * 0.5 + kfStudOffsetY;
         this._pStudScene.setPosition(_loc15_);
         while(this._pScene.hasMsg())
         {
            _loc22_ = this._pScene.popMsg();
            this.processCharSelectMsgs(_loc22_);
            if(_loc22_.getText() == "play")
            {
               if(this._lastSelected != "")
               {
                  GameWorld.get().startGame();
                  (getWorldObj() as MainMenu).gotoHidden();
               }
            }
            else if(_loc22_.getText() == "back")
            {
               (getWorldObj() as MainMenu).gotoFlagSelect();
               GameWorld.get().selectCharacter("");
               if(this._lastSelected != "")
               {
                  this._lastSelected = "";
                  this._pTweener.addTween(this,"charselectSelectedAlpha","_fSelectedAlpha",1,0,0.25,0,cTweener.LINEAR);
                  this._pTweener.addTween(this,"charselectSelectedScale","_fSelectedScale",1,0.5,0.25,0,cTweener.CUBIC,cTweener.EASE_OUT);
               }
            }
            else if(_loc22_.getText() == "upgrade")
            {
               _loc24_ = (_loc23_ = _loc22_.getSrcObject() as GlaControllerButton).getParent().getParent() as GlaControllerSceneElement;
               _loc4_ = 0;
               while(_loc4_ < 1)
               {
                  if(_loc24_ == this._pUpgradeBars[_loc4_])
                  {
                     _loc3_ = GameWorld.get().getSaveData();
                     switch(_loc4_)
                     {
                        case 0:
                           if(_loc3_.getCharSlot(this._currSlot).upgradeLevel < 10 && _loc9_)
                           {
                              (getWorldObj() as MainMenu).getUpgradeConfirm().setUpgradeToLevel(_loc3_.getCharSlot(this._currSlot).upgradeLevel + 1);
                              (getWorldObj() as MainMenu).gotoUpgradeConfirm();
                              this._uUpgradeApplyIndex = 0;
                           }
                           else if(!_loc9_)
                           {
                              GameRes.get()._pNotAllowedSound.play();
                           }
                     }
                     this.updateBars(this._currSlot,false);
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      public function processCharSelectMsgs(param1:GlaMsg) : Boolean
      {
         var _loc3_:uint = 0;
         var _loc4_:GlaControllerButton = null;
         var _loc2_:Boolean = false;
         _loc3_ = 0;
         while(_loc3_ < 3)
         {
            if(param1.getText() == this.charselectMsgs[_loc3_])
            {
               _loc2_ = true;
               _loc4_ = param1.getSrcObject() as GlaControllerButton;
               if(GameWorld.get().getSaveData().getCharSlot(this._saveSlots[_loc3_]).unlocked)
               {
                  if(this._lastSelected == "")
                  {
                     this._pTweener.addTween(this,"charselectSelectedAlpha","_fSelectedAlpha",0,1,0.25,0,cTweener.LINEAR);
                     this._pTweener.addTween(this,"charselectSelectedScale","_fSelectedScale",0.5,1,0.25,0,cTweener.CUBIC);
                  }
                  if(this._lastSelected != _loc4_.getName())
                  {
                     GameWorld.get().selectCharacter(_loc4_.getName());
                     this.selectCharacter(_loc4_,_loc3_);
                  }
               }
               else
               {
                  this._pLastSelectedButtonForUnlock = _loc4_;
                  this._uLastSelectedIndexForUnlock = _loc3_;
                  (getWorldObj() as MainMenu).gotoCharacterSelectUnlock();
               }
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function setButtonOn(param1:GlaControllerButton) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:zSprite = null;
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc3_ = this._pPortraits.getSprite(this._pCharButtons[_loc2_].getName() + "_off").getSprite();
            this._pCharButtons[_loc2_].getScene().findSprite("char_img").setSprite(_loc3_);
            this._pCharButtons[_loc2_].getPressedScene().findSprite("char_img").setSprite(_loc3_);
            _loc2_++;
         }
         _loc3_ = this._pPortraits.getSprite(param1.getName() + "_on").getSprite();
         param1.getScene().findSprite("char_img").setSprite(_loc3_);
         param1.getPressedScene().findSprite("char_img").setSprite(_loc3_);
      }
      
      public function selectCharacter(param1:GlaControllerButton, param2:uint) : void
      {
         this._currSlot = this._saveSlots[param2];
         this.updateBars(this._currSlot);
         this._lastSelected = param1.getName();
         this._bEnableHighlight = true;
         this._uHighlightChar = param2;
         this.setButtonOn(param1);
         this._pLastSelectedButton = param1;
         this._uLastSelectedIndex = param2;
         this._characterVoices.sounds[param2].play(0,0);
      }
      
      public function selectLastSelected() : void
      {
         if(this._pLastSelectedButton != null)
         {
            this._pTweener.addTween(this,"charselectSelectedAlpha","_fSelectedAlpha",0,1,0.25,0,cTweener.LINEAR);
            this._pTweener.addTween(this,"charselectSelectedScale","_fSelectedScale",0.5,1,0.25,0,cTweener.CUBIC);
            this.selectCharacter(this._pLastSelectedButton,this._uLastSelectedIndex);
            this._bEnableHighlight = true;
         }
      }
      
      public function selectLastSelectedForUnlock() : void
      {
         var _loc1_:SaveData = null;
         if(this._pLastSelectedButtonForUnlock != null)
         {
            this._pTweener.addTween(this,"charselectSelectedAlpha","_fSelectedAlpha",0,1,0.25,0,cTweener.LINEAR);
            this._pTweener.addTween(this,"charselectSelectedScale","_fSelectedScale",0.5,1,0.25,0,cTweener.CUBIC);
            this.selectCharacter(this._pLastSelectedButtonForUnlock,this._uLastSelectedIndexForUnlock);
            _loc1_ = GameWorld.get().getSaveData();
            _loc1_.getCharSlot(this._currSlot).unlocked = true;
            GameWorld.get().selectCharacter(this._pLastSelectedButtonForUnlock.getName());
            this.updateUpgradeText();
            this._bEnableHighlight = true;
         }
      }
      
      public function applyUpgrade() : void
      {
         var _loc1_:SaveData = GameWorld.get().getSaveData();
         switch(this._uUpgradeApplyIndex)
         {
            case 0:
               ++_loc1_.getCharSlot(this._currSlot).upgradeLevel;
               break;
            case 1:
               ++_loc1_.getCharSlot(this._currSlot).unused1;
               break;
            case 2:
               ++_loc1_.getCharSlot(this._currSlot).unused2;
         }
         this.updateBars(this._currSlot);
         this.setupLastSelectedTribe();
      }
      
      public function updateBars(param1:int, param2:Boolean = true) : void
      {
         var _loc3_:SaveData = GameWorld.get().getSaveData();
         var _loc4_:CharData = _loc3_.getCharSlot(param1);
         this._pBarTweener.reset();
         this.updateBar(0,_loc4_.upgradeLevel,param2);
         this.updateUpgradeText();
      }
      
      public function updateBar(param1:uint, param2:uint, param3:Boolean = true) : void
      {
         var _loc4_:uint = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:String = null;
         _loc4_ = 0;
         while(_loc4_ < 10)
         {
            _loc5_ = 9 - _loc4_;
            _loc6_ = "_fUpgradeBarAlphas" + _loc4_.toString();
            _loc7_ = "_fUpgradeBarAlphas" + _loc5_.toString();
            if(param3)
            {
               this._pBarTweener.addTween(this,"barBlip",_loc7_,this[_loc7_],0,0.125,0.0125 * Number(_loc4_),cTweener.CUBIC,cTweener.EASE_IN_OUT,0,true);
               if(_loc4_ < param2)
               {
                  this._pBarTweener.addTween(this,"barBlip",_loc6_,0,1,0.125,0.25 + 0.0125 * Number(_loc4_),cTweener.CUBIC,cTweener.EASE_IN_OUT,0,true);
               }
            }
            else if(_loc4_ < param2)
            {
               this._pBarTweener.addTween(this,"barBlip",_loc6_,this[_loc6_],1,0.25,0,cTweener.CUBIC,cTweener.EASE_IN_OUT,0,false);
            }
            _loc4_++;
         }
         this.updateBarPointer(param1,param2);
      }
      
      public function updateBarPointer(param1:uint, param2:uint) : void
      {
         var _loc3_:String = null;
         var _loc4_:Vec2F = null;
         if(param2 < 10)
         {
            this._pUpgradeBars[param1].getScene().getSprite("pointer_glow").setActive(true);
            this._pUpgradeBars[param1].getScene().getSprite("upgrade_box").setActive(true);
            this._pUpgradeBars[param1].getScene().getSprite("pointer").setActive(true);
            _loc3_ = "blip" + param2.toString();
            _loc4_ = new Vec2F(this._pUpgradeBars[param1].getScene().getSprite(_loc3_).getPosition().x,this._pUpgradeBars[param1].getScene().getSprite(_loc3_).getPosition().y);
            _loc4_.x -= this._blipBase.x;
            _loc4_.y -= this._blipBase.y;
            this._pUpgradeBars[param1].getScene().getSprite("pointer_glow").setPosition(_loc4_);
            this._pUpgradeBars[param1].getScene().getSprite("pointer").setPosition(_loc4_);
         }
         else
         {
            this._pUpgradeBars[param1].getScene().getSprite("pointer_glow").setActive(false);
            this._pUpgradeBars[param1].getScene().getSprite("upgrade_box").setActive(false);
            this._pUpgradeBars[param1].getScene().getSprite("pointer").setActive(false);
         }
      }
      
      public function resetBars() : void
      {
         this._fUpgradeBarAlphas0 = 0;
         this._fUpgradeBarAlphas1 = 0;
         this._fUpgradeBarAlphas2 = 0;
         this._fUpgradeBarAlphas3 = 0;
         this._fUpgradeBarAlphas4 = 0;
         this._fUpgradeBarAlphas5 = 0;
         this._fUpgradeBarAlphas6 = 0;
         this._fUpgradeBarAlphas7 = 0;
         this._fUpgradeBarAlphas8 = 0;
         this._fUpgradeBarAlphas9 = 0;
      }
      
      public function updateUpgradeText() : void
      {
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc1_:uint = GameWorld.get().getSaveData().getCharSlot(this._currSlot).upgradeLevel;
         var _loc2_:Player = GameWorld.get().getPlayer();
         if(_loc1_ < 10 && _loc2_)
         {
            _loc3_ = (_loc1_ + 1) * GameWorld.get().getUpgradeBaseCost() * GameWorld.get().getUpgradeCostMultiplier();
            _loc4_ = "charselect_upgrade_" + _loc2_.getClassStr() + _loc1_.toString();
            if(_loc1_ == 9 && this._currSlot == SaveData.ePlayerCharWarriorLionSlot && Util.isSpecialCharacterAvailable("player_laval_warrior"))
            {
               _loc4_ = "charselect_upgrade_warrior_laval";
            }
            if(_loc1_ == 9 && this._currSlot == SaveData.ePlayerCharWarriorSaberSlot && Util.isSpecialCharacterAvailable("player_sirfangor_warrior"))
            {
               _loc4_ = "charselect_upgrade_warrior_sirfangor";
            }
            _loc5_ = GameWorld.get().getLanguage().getString(_loc4_);
            _loc6_ = Util.getFormattedNumber(_loc3_);
            this._upgradeText = _loc5_.replace("$(STUDS)",_loc6_);
         }
         else
         {
            this._upgradeText = "";
         }
      }
      
      public function updatePlayButtonAnimation(param1:Number) : void
      {
         var _loc2_:GlaControllerScene = this._pPlay.getScene();
         this._fPlayBtnAlpha += param1 * 0.5;
         var _loc3_:Number = (1 + Math.sin(this._fPlayBtnAlpha)) * 0.5;
         _loc2_.getSprite("Cloudy1").alignPivot();
         _loc2_.getSprite("Cloudy2").alignPivot();
         _loc2_.getSprite("Cloudy1").setRotation(_loc2_.getSprite("Cloudy1").getRotation() + param1);
         _loc2_.getSprite("Cloudy1").setAlpha(uint(255 * _loc3_ * this._fAlpha * this._fSelectedAlpha));
         _loc2_.getSprite("Cloudy2").setRotation(_loc2_.getSprite("Cloudy2").getRotation() - param1);
         _loc2_.getSprite("Cloudy2").setAlpha(uint(255 * (1 - _loc3_) * this._fAlpha * this._fSelectedAlpha));
         var _loc4_:GlaControllerScene;
         (_loc4_ = this._pPlay.getPressedScene()).getSprite("Cloudy1").alignPivot();
         _loc4_.getSprite("Cloudy2").alignPivot();
         _loc4_.getSprite("Cloudy1").setRotation(_loc2_.getSprite("Cloudy1").getRotation());
         _loc4_.getSprite("Cloudy1").setAlpha(_loc2_.getSprite("Cloudy1").getColor().a);
         _loc4_.getSprite("Cloudy2").setRotation(_loc2_.getSprite("Cloudy2").getRotation());
         _loc4_.getSprite("Cloudy2").setAlpha(_loc2_.getSprite("Cloudy2").getColor().a);
      }
      
      public function updateParticles() : void
      {
         var _loc2_:Particle2D = null;
         var _loc3_:Vec2F = null;
         var _loc1_:Boolean = false;
         if(this._currSlot == SaveData.ePlayerCharWarriorLionSlot && Util.isSpecialCharacterAvailable("player_laval_warrior"))
         {
            _loc1_ = true;
         }
         else if(this._currSlot == SaveData.ePlayerCharWarriorSaberSlot && Util.isSpecialCharacterAvailable("player_sirfangor_warrior"))
         {
            _loc1_ = true;
         }
         ++this.m_iFrameCount;
         if(this._bEnableHighlight && _loc1_ && this.m_iFrameCount > 10 && GameWorld.get().getSaveData().getCharSlot(this._currSlot).upgradeLevel != 10)
         {
            this.m_iFrameCount = 0;
            _loc2_ = this._pParticles.addParticle();
            if(_loc2_ != null)
            {
               _loc2_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
               _loc2_.setSprite(GameRes.get()._pGoldTrailSprite);
               _loc3_ = new Vec2F(this._aParticleSpawnArea.getMin().x + Random.RandomFloatRangeUniform(0,this._aParticleSpawnArea.getSizeX()) + Number(LegoChima.Instance().zGetScreenWidth()) * 0.5,this._aParticleSpawnArea.getMin().y + Random.RandomFloatRangeUniform(0,this._aParticleSpawnArea.getSizeY()) + Number(LegoChima.Instance().zGetScreenHeight()) * 0.5 + 10);
               _loc2_.setPosition(_loc3_);
               _loc2_.setSize(Random.RandomFloatRangeUniform(0.9,1.4));
               _loc2_.setLife(Random.RandomFloatRangeUniform(0.9,1));
               _loc2_.setVelocity(new Vec2F(0,Random.RandomFloatRangeUniform(-60,-40)));
               _loc2_.setColor(new RGBA(255,255,255,0));
               _loc2_.addAlphaKey(0);
               _loc2_.addAlphaKey(255);
               _loc2_.addAlphaKey(255);
               _loc2_.addAlphaKey(0);
               _loc2_.finalise();
            }
         }
      }
      
      public function setupLastSelectedTribe() : void
      {
         if(this._lastSelectedTribe == "lion")
         {
            this.setupLions();
         }
         if(this._lastSelectedTribe == "croc")
         {
            this.setupCrocs();
         }
         if(this._lastSelectedTribe == "bear")
         {
            this.setupBears();
         }
         if(this._lastSelectedTribe == "saber")
         {
            this.setupSabers();
         }
      }
      
      public function setupLions() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:zSprite = null;
         var _loc1_:SaveData = GameWorld.get().getSaveData();
         if(Util.isSpecialCharacterAvailable("player_laval_warrior") && _loc1_.getCharSlot(SaveData.ePlayerCharWarriorLionSlot).upgradeLevel >= 10)
         {
            lion_names[2] = "player_laval_warrior";
         }
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc3_ = this._pPortraits.getSprite(lion_names[_loc2_] + "_off").getSprite();
            this._pCharButtons[_loc2_].getScene().findSprite("char_img").setSprite(_loc3_);
            this._pCharButtons[_loc2_].getPressedScene().findSprite("char_img").setSprite(_loc3_);
            this._pCharButtons[_loc2_].getSrc().setName(lion_names[_loc2_]);
            this._saveSlots[_loc2_] = lion_slots[_loc2_];
            _loc2_++;
         }
         if(this._lastSelectedTribe == "lion" && this._pLastSelectedButton != null)
         {
            this._pTweener.addTween(this,"charselectSelectedAlpha","_fSelectedAlpha",1,0,0.25,0,cTweener.LINEAR);
            this._pTweener.addTween(this,"charselectSelectedScale","_fSelectedScale",1,0.5,0.25,0,cTweener.CUBIC,cTweener.EASE_OUT);
            this._bEnableHighlight = true;
            this.selectLastSelected();
            GameWorld.get().selectCharacter(this._lastSelected);
            this.updateUpgradeText();
         }
         else
         {
            this._pLastSelectedButton = null;
            this._bEnableHighlight = false;
         }
         this._lastSelectedTribe = "lion";
         this._pUseHighlight = this._pFireHighlight;
         this._selectHilight.texture = this._pUseHighlight._tex;
         this.resetBars();
      }
      
      public function setupCrocs() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:zSprite = null;
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            _loc2_ = this._pPortraits.getSprite(croc_names[_loc1_] + "_off").getSprite();
            this._pCharButtons[_loc1_].getScene().findSprite("char_img").setSprite(_loc2_);
            this._pCharButtons[_loc1_].getPressedScene().findSprite("char_img").setSprite(_loc2_);
            this._pCharButtons[_loc1_].getSrc().setName(croc_names[_loc1_]);
            this._saveSlots[_loc1_] = croc_slots[_loc1_];
            _loc1_++;
         }
         if(this._lastSelectedTribe == "croc" && this._pLastSelectedButton != null)
         {
            this._pTweener.addTween(this,"charselectSelectedAlpha","_fSelectedAlpha",1,0,0.25,0,cTweener.LINEAR);
            this._pTweener.addTween(this,"charselectSelectedScale","_fSelectedScale",1,0.5,0.25,0,cTweener.CUBIC,cTweener.EASE_OUT);
            this._bEnableHighlight = true;
            this.selectLastSelected();
            GameWorld.get().selectCharacter(this._lastSelected);
            this.updateUpgradeText();
         }
         else
         {
            this._pLastSelectedButton = null;
            this._bEnableHighlight = false;
         }
         this._lastSelectedTribe = "croc";
         this._pUseHighlight = this._pFireHighlight;
         this._selectHilight.texture = this._pUseHighlight._tex;
         this.resetBars();
      }
      
      public function setupSabers() : void
      {
         var _loc2_:uint = 0;
         var _loc3_:zSprite = null;
         var _loc1_:SaveData = GameWorld.get().getSaveData();
         if(Util.isSpecialCharacterAvailable("player_sirfangor_warrior") && _loc1_.getCharSlot(SaveData.ePlayerCharWarriorSaberSlot).upgradeLevel >= 10)
         {
            saber_names[2] = "player_sirfangor_warrior";
         }
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc3_ = this._pPortraits.getSprite(saber_names[_loc2_] + "_off").getSprite();
            this._pCharButtons[_loc2_].getScene().findSprite("char_img").setSprite(_loc3_);
            this._pCharButtons[_loc2_].getPressedScene().findSprite("char_img").setSprite(_loc3_);
            this._pCharButtons[_loc2_].getSrc().setName(saber_names[_loc2_]);
            this._saveSlots[_loc2_] = saber_slots[_loc2_];
            _loc2_++;
         }
         if(this._lastSelectedTribe == "saber" && this._pLastSelectedButton != null)
         {
            this._pTweener.addTween(this,"charselectSelectedAlpha","_fSelectedAlpha",1,0,0.25,0,cTweener.LINEAR);
            this._pTweener.addTween(this,"charselectSelectedScale","_fSelectedScale",1,0.5,0.25,0,cTweener.CUBIC,cTweener.EASE_OUT);
            this._bEnableHighlight = true;
            this.selectLastSelected();
            GameWorld.get().selectCharacter(this._lastSelected);
            this.updateUpgradeText();
         }
         else
         {
            this._pLastSelectedButton = null;
            this._bEnableHighlight = false;
         }
         this._lastSelectedTribe = "saber";
         this._pUseHighlight = this._pIceHighlight;
         this._selectHilight.texture = this._pUseHighlight._tex;
         this.resetBars();
      }
      
      public function setupBears() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:zSprite = null;
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            _loc2_ = this._pPortraits.getSprite(bear_names[_loc1_] + "_off").getSprite();
            this._pCharButtons[_loc1_].getScene().findSprite("char_img").setSprite(_loc2_);
            this._pCharButtons[_loc1_].getPressedScene().findSprite("char_img").setSprite(_loc2_);
            this._pCharButtons[_loc1_].getSrc().setName(bear_names[_loc1_]);
            this._saveSlots[_loc1_] = bear_slots[_loc1_];
            _loc1_++;
         }
         if(this._lastSelectedTribe == "bear" && this._pLastSelectedButton != null)
         {
            this._pTweener.addTween(this,"charselectSelectedAlpha","_fSelectedAlpha",1,0,0.25,0,cTweener.LINEAR);
            this._pTweener.addTween(this,"charselectSelectedScale","_fSelectedScale",1,0.5,0.25,0,cTweener.CUBIC,cTweener.EASE_OUT);
            this._bEnableHighlight = true;
            this.selectLastSelected();
            GameWorld.get().selectCharacter(this._lastSelected);
            this.updateUpgradeText();
         }
         else
         {
            this._pLastSelectedButton = null;
            this._bEnableHighlight = false;
         }
         this._lastSelectedTribe = "bear";
         this._pUseHighlight = this._pIceHighlight;
         this._selectHilight.texture = this._pUseHighlight._tex;
         this.resetBars();
      }
      
      override public function show() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._pTweener.addTween(this,"charselectAlpha","_fAlpha",0,1,0.25,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"charselectScale","_fScale",0.5,1,0.25,0,cTweener.CUBIC);
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",0,1,0.25,0,cTweener.LINEAR);
         _bActive = true;
         this._costTF.text = "";
         this._characterVoices.clear();
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            this._characterVoices.push(GameRes.get()._pCharacterSelectSounds.rand_element());
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if(this._characterVoices.sounds[_loc1_] == this._characterVoices.sounds[_loc2_])
               {
                  this._characterVoices.sounds[_loc1_] = GameRes.get()._pCharacterSelectSounds.rand_element();
                  _loc2_ = -1;
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      override public function hide() : void
      {
         this._pTweener.addTween(this,"charselectAlpha","_fAlpha",1,0,0.25,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"charselectScale","_fScale",1,0.5,0.25,0,cTweener.CUBIC,cTweener.EASE_OUT);
         this._pTweener.addTween(this,"backButtonAlpha","_fBackAlpha",1,0,0.25,0,cTweener.LINEAR);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         var _loc1_:uint = 0;
         this._pTweener.reset();
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            this._pCharButtons[_loc1_].setAlpha(255);
            this._pCharButtons[_loc1_].setScale(new Vec2F(1,1));
            _loc1_++;
         }
         this._pPlay.setAlpha(255);
         this._pPlay.setScale(new Vec2F(1,1));
         this._pBack.setAlpha(255);
         _loc1_ = 0;
         while(_loc1_ < 1)
         {
            this._pUpgradeBars[_loc1_].setAlpha(0);
            this._pUpgradeBars[_loc1_].setScale(new Vec2F(0,0));
            _loc1_++;
         }
         _bActive = true;
         this._bEnableHighlight = false;
      }
      
      override public function forceHide() : void
      {
         var _loc1_:uint = 0;
         this._pTweener.reset();
         _loc1_ = 0;
         while(_loc1_ < 3)
         {
            this._pCharButtons[_loc1_].setAlpha(0);
            this._pCharButtons[_loc1_].setScale(new Vec2F(0,0));
            _loc1_++;
         }
         this._pPlay.setAlpha(0);
         this._pPlay.setScale(new Vec2F(0,0));
         this._pBack.setAlpha(0);
         _loc1_ = 0;
         while(_loc1_ < 1)
         {
            this._pUpgradeBars[_loc1_].setAlpha(0);
            this._pUpgradeBars[_loc1_].setScale(new Vec2F(0,0));
            _loc1_++;
         }
         _bActive = false;
      }
      
      override public function reset() : void
      {
         this._lastSelected = "";
         this._fSelectedAlpha = 0;
         this._fSelectedScale = 0;
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._fAlpha > 0)
         {
            return true;
         }
         return false;
      }
   }
}
