package game.objects.ui.frontend
{
   import game.GameRes;
   import game.GameWorld;
   import game.Util;
   import game.objects.misc.BonusMission;
   import game.objects.misc.BonusMissions;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.core.Particle2D;
   import zufflin.core.ParticleManager2D;
   import zufflin.core.RGBA;
   import zufflin.core.StateManager;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   
   public class GameOverScreen extends UIComponent
   {
      
      public static const kfAlphaSpeed:Number = 3;
      
      public static const kfTickerTime:Number = 3;
      
      public static const kfStudTickerOffsetX:Number = -15;
      
      public static const kfStudTickerOffsetY:Number = 18;
      
      public static const kuDistanceStep:uint = 1;
      
      public static const kuStudStep:uint = 100;
      
      public static const kuFlagStep:uint = 1;
      
      public static const kfBonusHoldTime:Number = 3;
      
      public static const kfBonusScaleInFrom:Number = 0.5;
      
      public static const kfBonusScaleOutTo:Number = 0.5;
      
      public static const kfBonusStudOffsetX:Number = 20;
      
      public static const kfBonusStudOffsetY:Number = -23;
      
      public static const kfBonusRewardTextOffsetX:Number = 40;
      
      public static const kfBonusRewardTextOffsetY:Number = -36;
      
      public static const kfBonusCompletionTextOffsetX:Number = -20;
      
      public static const kfBonusCompletionTextOffsetY:Number = -36;
       
      
      public var _state:StateManager;
      
      public var _pScene:GlaControllerScene;
      
      public var _pStudScene0:GlaControllerScene;
      
      public var _pStudSceneCurr1:GlaControllerScene;
      
      public var _pStudSceneCurr2:GlaControllerScene;
      
      public var _pStudSceneCurr3:GlaControllerScene;
      
      public var _pStudSceneNew1:GlaControllerScene;
      
      public var _pStudSceneNew2:GlaControllerScene;
      
      public var _pStudSceneNew3:GlaControllerScene;
      
      public var _pBonusPanelSceneCurr1:GlaControllerScene;
      
      public var _pBonusPanelSceneCurr2:GlaControllerScene;
      
      public var _pBonusPanelSceneCurr3:GlaControllerScene;
      
      public var _pBonusPanelSceneNew1:GlaControllerScene;
      
      public var _pBonusPanelSceneNew2:GlaControllerScene;
      
      public var _pBonusPanelSceneNew3:GlaControllerScene;
      
      public var _pParticles:ParticleManager2D;
      
      public var _vStudPos:Vec2F;
      
      public var _vDistancePos:Vec2F;
      
      public var _vNewBestPos:Vec2F;
      
      public var _vFlagsPos:Vec2F;
      
      public var _vBonusPos:Vector.<Vec2F>;
      
      public var _bDone:Boolean;
      
      public var _fDt:Number;
      
      public var _fTicker:Number;
      
      public var _fDistanceAlpha:Number;
      
      public var _uDistanceAchieved:uint;
      
      public var _uDisplayDistance:uint;
      
      public var _bNewBestDistance:Boolean;
      
      public var _uOldBestDistance:uint;
      
      public var _fStudAlpha:Number;
      
      public var _uStudsCollected:uint;
      
      public var _uDisplayStuds:uint;
      
      public var _fFlagsAlpha:Number;
      
      public var _uFlagsCollected:uint;
      
      public var _uDisplayFlags:uint;
      
      public var _missionBox:AABox2f;
      
      public var _vMissionBoxOffset:Vec2F;
      
      public var _fBonusHold:Number;
      
      public var _currentMissions:Vector.<BonusMission>;
      
      public var _fCurrentBonusAlpha0:Number;
      
      public var _fCurrentBonusAlpha1:Number;
      
      public var _fCurrentBonusAlpha2:Number;
      
      public var _fCurrentBonusScale0:Number;
      
      public var _fCurrentBonusScale1:Number;
      
      public var _fCurrentBonusScale2:Number;
      
      public var _newMissions:Vector.<BonusMission>;
      
      public var _fNewBonusAlpha0:Number;
      
      public var _fNewBonusAlpha1:Number;
      
      public var _fNewBonusAlpha2:Number;
      
      public var _fNewBonusScale0:Number;
      
      public var _fNewBonusScale1:Number;
      
      public var _fNewBonusScale2:Number;
      
      public var _pTweener:cTweener;
      
      public var m_iFrameCount:int;
      
      private var dist_tf:TextField;
      
      private var newbestdist_tf:TextField;
      
      private var stud_tf0:TextField;
      
      private var flag_tf:TextField;
      
      private var missdesc_curr_tf0:TextField;
      
      private var missdesc_curr_tf1:TextField;
      
      private var missdesc_curr_tf2:TextField;
      
      private var missdesc_new_tf0:TextField;
      
      private var missdesc_new_tf1:TextField;
      
      private var missdesc_new_tf2:TextField;
      
      private var missrew_curr_tf0:TextField;
      
      private var missrew_curr_tf1:TextField;
      
      private var missrew_curr_tf2:TextField;
      
      private var missrew_new_tf0:TextField;
      
      private var missrew_new_tf1:TextField;
      
      private var missrew_new_tf2:TextField;
      
      private var misscomp_curr_tf0:TextField;
      
      private var misscomp_curr_tf1:TextField;
      
      private var misscomp_curr_tf2:TextField;
      
      private var misscomp_new_tf0:TextField;
      
      private var misscomp_new_tf1:TextField;
      
      private var misscomp_new_tf2:TextField;
      
      public var _bRetry:Boolean;
      
      public var _fButtonAlpha:Number;
      
      private var bt_tf0:TextField;
      
      private var bt_tf1:TextField;
      
      private var butt0:GlaControllerButton;
      
      private var butt1:GlaControllerButton;
      
      public function GameOverScreen()
      {
         var _loc5_:uint = 0;
         var _loc6_:String = null;
         super();
         this._state = new StateManager();
         this._vBonusPos = new Vector.<Vec2F>(3,true);
         this._currentMissions = new Vector.<BonusMission>(BonusMissions.NUM_CONCURRENT_BONUS_MISSIONS,true);
         this._newMissions = new Vector.<BonusMission>(BonusMissions.NUM_CONCURRENT_BONUS_MISSIONS,true);
         this._bDone = false;
         this._fDt = 0;
         this._fTicker = 0;
         this._fDistanceAlpha = 0;
         this._uDistanceAchieved = 0;
         this._uDisplayDistance = 0;
         this._bNewBestDistance = false;
         this._uOldBestDistance = 0;
         this._fStudAlpha = 0;
         this._uStudsCollected = 0;
         this._uDisplayStuds = 0;
         this._fFlagsAlpha = 0;
         this._uFlagsCollected = 0;
         this._uDisplayFlags = 0;
         this._fBonusHold = 0;
         this._fButtonAlpha = 0;
         this._bRetry = false;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("gameover"));
         this._pScene.setPosition(new Vec2F(Number(LegoChima.Instance().zGetScreenWidth()) * 0.5,Number(LegoChima.Instance().zGetScreenHeight()) * 0.5));
         this._pStudScene0 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudScene0.playAnimation(true);
         this._pStudSceneCurr1 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudSceneCurr1.playAnimation(true);
         this._pStudSceneCurr2 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudSceneCurr2.playAnimation(true);
         this._pStudSceneCurr3 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudSceneCurr3.playAnimation(true);
         this._pStudSceneNew1 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudSceneNew1.playAnimation(true);
         this._pStudSceneNew2 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudSceneNew2.playAnimation(true);
         this._pStudSceneNew3 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudSceneNew3.playAnimation(true);
         this._pBonusPanelSceneCurr1 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("gameover_bonus_panel"));
         this._pBonusPanelSceneCurr2 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("gameover_bonus_panel"));
         this._pBonusPanelSceneCurr3 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("gameover_bonus_panel"));
         this._pBonusPanelSceneNew1 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("gameover_bonus_panel"));
         this._pBonusPanelSceneNew2 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("gameover_bonus_panel"));
         this._pBonusPanelSceneNew3 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("gameover_bonus_panel"));
         this._pBonusPanelSceneCurr1 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("gameover_bonus_panel"));
         this._missionBox = this._pBonusPanelSceneCurr1.getRectangle("mission").getSrcRectangle().getAABox(0);
         this._vMissionBoxOffset = this._pBonusPanelSceneCurr1.getRectangle("mission").getPosition();
         var _loc1_:Vec2F = this._pScene.getRectangle("screen_centre").getPosition();
         var _loc2_:Vec2F = this._pScene.getRectangle("screen_bottom_centre").getPosition();
         var _loc3_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         var _loc4_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),LegoChima.Instance().zGetScreenHeight());
         this._vStudPos = new Vec2F(this._pScene.getRectangle("studs").getPosition().x,this._pScene.getRectangle("studs").getPosition().y);
         this._vStudPos.x -= _loc1_.x;
         this._vStudPos.y -= _loc1_.y;
         this._vStudPos.x += _loc3_.x;
         this._vStudPos.y += _loc3_.y;
         this._vDistancePos = new Vec2F(this._pScene.getRectangle("distance").getPosition().x,this._pScene.getRectangle("distance").getPosition().y);
         this._vDistancePos.x -= _loc1_.x;
         this._vDistancePos.y -= _loc1_.y;
         this._vDistancePos.x += _loc3_.x;
         this._vDistancePos.y += _loc3_.y;
         this._vNewBestPos = new Vec2F(this._pScene.getRectangle("new_best").getPosition().x,this._pScene.getRectangle("new_best").getPosition().y);
         this._vNewBestPos.x -= _loc1_.x;
         this._vNewBestPos.y -= _loc1_.y;
         this._vNewBestPos.x += _loc3_.x;
         this._vNewBestPos.y += _loc3_.y;
         this._vFlagsPos = new Vec2F(this._pScene.getRectangle("flags").getPosition().x,this._pScene.getRectangle("flags").getPosition().y);
         this._vFlagsPos.x -= _loc1_.x;
         this._vFlagsPos.y -= _loc1_.y;
         this._vFlagsPos.x += _loc3_.x;
         this._vFlagsPos.y += _loc3_.y;
         _loc5_ = 0;
         while(_loc5_ < BonusMissions.NUM_CONCURRENT_BONUS_MISSIONS)
         {
            _loc6_ = "mission" + _loc5_.toString();
            this._vBonusPos[_loc5_] = new Vec2F(this._pScene.getRectangle(_loc6_).getPosition().x,this._pScene.getRectangle(_loc6_).getPosition().y);
            this._vBonusPos[_loc5_].x -= _loc1_.x;
            this._vBonusPos[_loc5_].y -= _loc1_.y;
            this._vBonusPos[_loc5_].x += _loc3_.x;
            this._vBonusPos[_loc5_].y += _loc3_.y;
            _loc5_++;
         }
         this._fCurrentBonusAlpha0 = 0;
         this._fCurrentBonusAlpha1 = 0;
         this._fCurrentBonusAlpha2 = 0;
         this._fCurrentBonusScale0 = 1;
         this._fCurrentBonusScale1 = 1;
         this._fCurrentBonusScale2 = 1;
         this._fNewBonusAlpha0 = 0;
         this._fNewBonusAlpha1 = 0;
         this._fNewBonusAlpha2 = 0;
         this._fNewBonusScale0 = kfBonusScaleInFrom;
         this._fNewBonusScale1 = kfBonusScaleInFrom;
         this._fNewBonusScale2 = kfBonusScaleInFrom;
         this._pTweener = new cTweener();
         this._state.setOwner(this);
         this._state.gotoState(this.StateRackUpDistance);
         this._pParticles = new ParticleManager2D(20);
         this.m_iFrameCount = 0;
         this.dist_tf = new TextField(600,50,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.dist_tf.autoScale = true;
         this.dist_tf.touchable = false;
         this.dist_tf.hAlign = HAlign.CENTER;
         this.dist_tf.vAlign = VAlign.TOP;
         this.dist_tf.alignPivot(HAlign.CENTER,VAlign.TOP);
         this.addChild(this.dist_tf);
         this.newbestdist_tf = new TextField(600,50,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.newbestdist_tf.autoScale = true;
         this.newbestdist_tf.touchable = false;
         this.newbestdist_tf.hAlign = HAlign.CENTER;
         this.newbestdist_tf.vAlign = VAlign.TOP;
         this.newbestdist_tf.alignPivot(HAlign.CENTER,VAlign.TOP);
         this.addChild(this.newbestdist_tf);
         this.addChild(this._pStudScene0);
         this.stud_tf0 = new TextField(600,50,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.stud_tf0.autoScale = true;
         this.stud_tf0.touchable = false;
         this.stud_tf0.hAlign = HAlign.CENTER;
         this.stud_tf0.vAlign = VAlign.TOP;
         this.stud_tf0.alignPivot(HAlign.CENTER,VAlign.TOP);
         this.addChild(this.stud_tf0);
         this.flag_tf = new TextField(600,50,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.flag_tf.autoScale = true;
         this.flag_tf.touchable = false;
         this.flag_tf.hAlign = HAlign.CENTER;
         this.flag_tf.vAlign = VAlign.TOP;
         this.flag_tf.alignPivot(HAlign.CENTER,VAlign.TOP);
         this.addChild(this.flag_tf);
         this.butt0 = this._pScene.findButton("retry");
         this.bt_tf0 = new TextField(this.butt0.getHitBox().getSizeX() * 0.86,80,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.bt_tf0.autoScale = true;
         this.bt_tf0.touchable = false;
         this.bt_tf0.hAlign = HAlign.CENTER;
         this.bt_tf0.vAlign = VAlign.CENTER;
         this.bt_tf0.alignPivot();
         this.addChild(this.butt0);
         this.addChild(this.bt_tf0);
         this.butt1 = this._pScene.findButton("quit");
         this.bt_tf1 = new TextField(this.butt1.getHitBox().getSizeX() * 0.86,80,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.bt_tf1.autoScale = true;
         this.bt_tf1.touchable = false;
         this.bt_tf1.hAlign = HAlign.CENTER;
         this.bt_tf1.vAlign = VAlign.CENTER;
         this.bt_tf1.alignPivot();
         this.addChild(this.butt1);
         this.addChild(this.bt_tf1);
         this._pBonusPanelSceneCurr1.touchable = false;
         this._pBonusPanelSceneCurr2.touchable = false;
         this._pBonusPanelSceneCurr3.touchable = false;
         this._pBonusPanelSceneNew1.touchable = false;
         this._pBonusPanelSceneNew2.touchable = false;
         this._pBonusPanelSceneNew3.touchable = false;
         this.addChild(this._pBonusPanelSceneCurr1);
         this._pBonusPanelSceneCurr1.addChild(this._pStudSceneCurr1);
         this.addChild(this._pBonusPanelSceneCurr2);
         this._pBonusPanelSceneCurr2.addChild(this._pStudSceneCurr2);
         this.addChild(this._pBonusPanelSceneCurr3);
         this._pBonusPanelSceneCurr3.addChild(this._pStudSceneCurr3);
         this.addChild(this._pBonusPanelSceneNew1);
         this._pBonusPanelSceneNew1.addChild(this._pStudSceneNew1);
         this.addChild(this._pBonusPanelSceneNew2);
         this._pBonusPanelSceneNew2.addChild(this._pStudSceneNew2);
         this.addChild(this._pBonusPanelSceneNew3);
         this._pBonusPanelSceneNew3.addChild(this._pStudSceneNew3);
         this.missdesc_curr_tf0 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missdesc_curr_tf0.autoScale = true;
         this.missdesc_curr_tf0.touchable = false;
         this.missdesc_curr_tf0.hAlign = HAlign.LEFT;
         this.missdesc_curr_tf0.vAlign = VAlign.TOP;
         this.missdesc_curr_tf0.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneCurr1.addChild(this.missdesc_curr_tf0);
         this.missdesc_curr_tf1 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missdesc_curr_tf1.autoScale = true;
         this.missdesc_curr_tf1.touchable = false;
         this.missdesc_curr_tf1.hAlign = HAlign.LEFT;
         this.missdesc_curr_tf1.vAlign = VAlign.TOP;
         this.missdesc_curr_tf1.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneCurr2.addChild(this.missdesc_curr_tf1);
         this.missdesc_curr_tf2 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missdesc_curr_tf2.autoScale = true;
         this.missdesc_curr_tf2.touchable = false;
         this.missdesc_curr_tf2.hAlign = HAlign.LEFT;
         this.missdesc_curr_tf2.vAlign = VAlign.TOP;
         this.missdesc_curr_tf2.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneCurr3.addChild(this.missdesc_curr_tf2);
         this.missdesc_new_tf0 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missdesc_new_tf0.autoScale = true;
         this.missdesc_new_tf0.touchable = false;
         this.missdesc_new_tf0.hAlign = HAlign.LEFT;
         this.missdesc_new_tf0.vAlign = VAlign.TOP;
         this.missdesc_new_tf0.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneNew1.addChild(this.missdesc_new_tf0);
         this.missdesc_new_tf1 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missdesc_new_tf1.autoScale = true;
         this.missdesc_new_tf1.touchable = false;
         this.missdesc_new_tf1.hAlign = HAlign.LEFT;
         this.missdesc_new_tf1.vAlign = VAlign.TOP;
         this.missdesc_new_tf1.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneNew2.addChild(this.missdesc_new_tf1);
         this.missdesc_new_tf2 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missdesc_new_tf2.autoScale = true;
         this.missdesc_new_tf2.touchable = false;
         this.missdesc_new_tf2.hAlign = HAlign.LEFT;
         this.missdesc_new_tf2.vAlign = VAlign.TOP;
         this.missdesc_new_tf2.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneNew3.addChild(this.missdesc_new_tf2);
         this.missrew_curr_tf0 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missrew_curr_tf0.autoScale = true;
         this.missrew_curr_tf0.touchable = false;
         this.missrew_curr_tf0.hAlign = HAlign.LEFT;
         this.missrew_curr_tf0.vAlign = VAlign.TOP;
         this.missrew_curr_tf0.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneCurr1.addChild(this.missrew_curr_tf0);
         this.missrew_curr_tf1 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missrew_curr_tf1.autoScale = true;
         this.missrew_curr_tf1.touchable = false;
         this.missrew_curr_tf1.hAlign = HAlign.LEFT;
         this.missrew_curr_tf1.vAlign = VAlign.TOP;
         this.missrew_curr_tf1.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneCurr2.addChild(this.missrew_curr_tf1);
         this.missrew_curr_tf2 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missrew_curr_tf2.autoScale = true;
         this.missrew_curr_tf2.touchable = false;
         this.missrew_curr_tf2.hAlign = HAlign.LEFT;
         this.missrew_curr_tf2.vAlign = VAlign.TOP;
         this.missrew_curr_tf2.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneCurr3.addChild(this.missrew_curr_tf2);
         this.missrew_new_tf0 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missrew_new_tf0.autoScale = true;
         this.missrew_new_tf0.touchable = false;
         this.missrew_new_tf0.hAlign = HAlign.LEFT;
         this.missrew_new_tf0.vAlign = VAlign.TOP;
         this.missrew_new_tf0.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneNew1.addChild(this.missrew_new_tf0);
         this.missrew_new_tf1 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missrew_new_tf1.autoScale = true;
         this.missrew_new_tf1.touchable = false;
         this.missrew_new_tf1.hAlign = HAlign.LEFT;
         this.missrew_new_tf1.vAlign = VAlign.TOP;
         this.missrew_new_tf1.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneNew2.addChild(this.missrew_new_tf1);
         this.missrew_new_tf2 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.missrew_new_tf2.autoScale = true;
         this.missrew_new_tf2.touchable = false;
         this.missrew_new_tf2.hAlign = HAlign.LEFT;
         this.missrew_new_tf2.vAlign = VAlign.TOP;
         this.missrew_new_tf2.alignPivot(HAlign.LEFT,VAlign.TOP);
         this._pBonusPanelSceneNew3.addChild(this.missrew_new_tf2);
         this.misscomp_curr_tf0 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.misscomp_curr_tf0.autoScale = true;
         this.misscomp_curr_tf0.touchable = false;
         this.misscomp_curr_tf0.hAlign = HAlign.RIGHT;
         this.misscomp_curr_tf0.vAlign = VAlign.TOP;
         this.misscomp_curr_tf0.alignPivot(HAlign.RIGHT,VAlign.TOP);
         this._pBonusPanelSceneCurr1.addChild(this.misscomp_curr_tf0);
         this.misscomp_curr_tf1 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.misscomp_curr_tf1.autoScale = true;
         this.misscomp_curr_tf1.touchable = false;
         this.misscomp_curr_tf1.hAlign = HAlign.RIGHT;
         this.misscomp_curr_tf1.vAlign = VAlign.TOP;
         this.misscomp_curr_tf1.alignPivot(HAlign.RIGHT,VAlign.TOP);
         this._pBonusPanelSceneCurr2.addChild(this.misscomp_curr_tf1);
         this.misscomp_curr_tf2 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.misscomp_curr_tf2.autoScale = true;
         this.misscomp_curr_tf2.touchable = false;
         this.misscomp_curr_tf2.hAlign = HAlign.RIGHT;
         this.misscomp_curr_tf2.vAlign = VAlign.TOP;
         this.misscomp_curr_tf2.alignPivot(HAlign.RIGHT,VAlign.TOP);
         this._pBonusPanelSceneCurr3.addChild(this.misscomp_curr_tf2);
         this.misscomp_new_tf0 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.misscomp_new_tf0.autoScale = true;
         this.misscomp_new_tf0.touchable = false;
         this.misscomp_new_tf0.hAlign = HAlign.RIGHT;
         this.misscomp_new_tf0.vAlign = VAlign.TOP;
         this.misscomp_new_tf0.alignPivot(HAlign.RIGHT,VAlign.TOP);
         this._pBonusPanelSceneNew1.addChild(this.misscomp_new_tf0);
         this.misscomp_new_tf1 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.misscomp_new_tf1.autoScale = true;
         this.misscomp_new_tf1.touchable = false;
         this.misscomp_new_tf1.hAlign = HAlign.RIGHT;
         this.misscomp_new_tf1.vAlign = VAlign.TOP;
         this.misscomp_new_tf1.alignPivot(HAlign.RIGHT,VAlign.TOP);
         this._pBonusPanelSceneNew2.addChild(this.misscomp_new_tf1);
         this.misscomp_new_tf2 = new TextField(this._missionBox.getSizeX(),60,"",GameRes.get()._pScoreFont,24,16777215);
         this.misscomp_new_tf2.autoScale = true;
         this.misscomp_new_tf2.touchable = false;
         this.misscomp_new_tf2.hAlign = HAlign.RIGHT;
         this.misscomp_new_tf2.vAlign = VAlign.TOP;
         this.misscomp_new_tf2.alignPivot(HAlign.RIGHT,VAlign.TOP);
         this._pBonusPanelSceneNew3.addChild(this.misscomp_new_tf2);
         this.addChild(this._pParticles);
      }
      
      override public function dispose() : void
      {
         this._pBonusPanelSceneCurr1.removeChild(this._pStudSceneCurr1,true);
         this._pBonusPanelSceneCurr2.removeChild(this._pStudSceneCurr2,true);
         this._pBonusPanelSceneCurr3.removeChild(this._pStudSceneCurr3,true);
         this._pBonusPanelSceneNew1.removeChild(this._pStudSceneNew1,true);
         this._pBonusPanelSceneNew2.removeChild(this._pStudSceneNew2,true);
         this._pBonusPanelSceneNew3.removeChild(this._pStudSceneNew3,true);
         this._pStudSceneCurr1 = null;
         this._pStudSceneCurr2 = null;
         this._pStudSceneCurr3 = null;
         this._pStudSceneNew1 = null;
         this._pStudSceneNew2 = null;
         this._pStudSceneNew3 = null;
         this._pBonusPanelSceneCurr1.removeChild(this.missdesc_curr_tf0,true);
         this._pBonusPanelSceneCurr2.removeChild(this.missdesc_curr_tf1,true);
         this._pBonusPanelSceneCurr3.removeChild(this.missdesc_curr_tf2,true);
         this._pBonusPanelSceneNew1.removeChild(this.missdesc_new_tf0,true);
         this._pBonusPanelSceneNew2.removeChild(this.missdesc_new_tf1,true);
         this._pBonusPanelSceneNew3.removeChild(this.missdesc_new_tf2,true);
         this.missdesc_curr_tf0 = null;
         this.missdesc_curr_tf1 = null;
         this.missdesc_curr_tf2 = null;
         this.missdesc_new_tf0 = null;
         this.missdesc_new_tf1 = null;
         this.missdesc_new_tf2 = null;
         this._pBonusPanelSceneCurr1.removeChild(this.missrew_curr_tf0,true);
         this._pBonusPanelSceneCurr2.removeChild(this.missrew_curr_tf1,true);
         this._pBonusPanelSceneCurr3.removeChild(this.missrew_curr_tf1,true);
         this._pBonusPanelSceneNew1.removeChild(this.missrew_new_tf0,true);
         this._pBonusPanelSceneNew2.removeChild(this.missrew_new_tf1,true);
         this._pBonusPanelSceneNew3.removeChild(this.missrew_new_tf2,true);
         this.missrew_curr_tf0 = null;
         this.missrew_curr_tf1 = null;
         this.missrew_curr_tf2 = null;
         this.missrew_new_tf0 = null;
         this.missrew_new_tf1 = null;
         this.missrew_new_tf2 = null;
         this._pBonusPanelSceneCurr1.removeChild(this.misscomp_curr_tf0,true);
         this._pBonusPanelSceneCurr2.removeChild(this.misscomp_curr_tf1,true);
         this._pBonusPanelSceneCurr3.removeChild(this.misscomp_curr_tf1,true);
         this._pBonusPanelSceneNew1.removeChild(this.misscomp_new_tf0,true);
         this._pBonusPanelSceneNew2.removeChild(this.misscomp_new_tf1,true);
         this._pBonusPanelSceneNew3.removeChild(this.misscomp_new_tf2,true);
         this.misscomp_curr_tf0 = null;
         this.misscomp_curr_tf1 = null;
         this.misscomp_curr_tf2 = null;
         this.misscomp_new_tf0 = null;
         this.misscomp_new_tf1 = null;
         this.misscomp_new_tf2 = null;
         this.removeChild(this._pBonusPanelSceneCurr1,true);
         this.removeChild(this._pBonusPanelSceneCurr2,true);
         this.removeChild(this._pBonusPanelSceneCurr3,true);
         this.removeChild(this._pBonusPanelSceneNew1,true);
         this.removeChild(this._pBonusPanelSceneNew2,true);
         this.removeChild(this._pBonusPanelSceneNew3,true);
         this._pBonusPanelSceneCurr1 = null;
         this._pBonusPanelSceneCurr2 = null;
         this._pBonusPanelSceneCurr3 = null;
         this._pBonusPanelSceneNew1 = null;
         this._pBonusPanelSceneNew2 = null;
         this._pBonusPanelSceneNew3 = null;
         this.removeChild(this.flag_tf,true);
         this.flag_tf = null;
         this.removeChild(this.butt0);
         this.butt0 = null;
         this.removeChild(this.butt1);
         this.butt1 = null;
         this.removeChild(this.bt_tf0,true);
         this.bt_tf0 = null;
         this.removeChild(this.bt_tf1,true);
         this.bt_tf1 = null;
         this.removeChild(this.stud_tf0,true);
         this.stud_tf0 = null;
         this.removeChild(this.newbestdist_tf,true);
         this.newbestdist_tf = null;
         this.removeChild(this.dist_tf,true);
         this.dist_tf = null;
         this.removeChild(this._pParticles);
         this._pParticles.dispose();
         this._pParticles = null;
         this._pScene.dispose();
         this._pScene = null;
         this.removeChild(this._pStudScene0);
         this._pStudScene0.dispose();
         this._pStudScene0 = null;
         this._pTweener.dispose();
         this._pTweener = null;
         super.dispose();
      }
      
      public function setDistanceAchieved(param1:uint) : void
      {
         this._uDistanceAchieved = param1;
      }
      
      public function setNewBestDistance(param1:Boolean, param2:uint) : void
      {
         this._bNewBestDistance = true;
         this._uOldBestDistance = param2;
      }
      
      public function setStudsCollected(param1:uint) : void
      {
         this._uStudsCollected = param1;
      }
      
      public function setFlagsCollected(param1:uint) : void
      {
         this._uFlagsCollected = param1;
      }
      
      public function isDone() : Boolean
      {
         return this._bDone;
      }
      
      public function doRetry() : Boolean
      {
         return this._bRetry;
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Particle2D = null;
         var _loc8_:Vec2F = null;
         this.dist_tf.alpha = this._fDistanceAlpha;
         this.newbestdist_tf.alpha = this._fDistanceAlpha;
         if(this.dist_tf.alpha > 0)
         {
            _loc2_ = GameWorld.get().getLanguage().getString("gameover_distance");
            _loc3_ = Util.getFormattedNumber(this._uDisplayDistance);
            _loc4_ = GameWorld.get().getLanguage().getString("metres");
            _loc2_ = _loc2_.replace("$(DISTANCE)",_loc3_);
            _loc2_ = _loc2_.replace("$(METRES)",_loc4_);
            this.dist_tf.text = _loc2_;
            this.dist_tf.x = this._vDistancePos.x;
            this.dist_tf.y = this._vDistancePos.y;
            this.newbestdist_tf.visible = this._bNewBestDistance && this._uDisplayDistance > this._uOldBestDistance;
            this.newbestdist_tf.text = GameWorld.get().getLanguage().getString("gameover_distance_new_best");
            this.newbestdist_tf.x = this._vNewBestPos.x;
            this.newbestdist_tf.y = this._vNewBestPos.y;
         }
         this._pStudScene0.alpha = this._fStudAlpha;
         this.stud_tf0.alpha = this._fStudAlpha;
         if(this._fStudAlpha > 0)
         {
            _loc5_ = Util.getFormattedNumber(this._uDisplayStuds);
            this._pStudScene0.updateAnimation();
            this._pStudScene0.x = this._vStudPos.x + (kfStudTickerOffsetX * 2 + kfStudTickerOffsetX * (_loc5_.length - 1) * 0.5);
            this._pStudScene0.y = this._vStudPos.y + kfStudTickerOffsetY;
            this.stud_tf0.text = _loc5_;
            this.stud_tf0.x = this._vStudPos.x;
            this.stud_tf0.y = this._vStudPos.y;
         }
         this.bt_tf0.alpha = this._fButtonAlpha;
         this.bt_tf1.alpha = this._fButtonAlpha;
         this.butt0.alpha = this._fButtonAlpha;
         this.butt1.alpha = this._fButtonAlpha;
         if(this._fButtonAlpha > 0)
         {
            this.bt_tf0.text = GameWorld.get().getLanguage().getString("pause_retry");
            this.bt_tf1.text = GameWorld.get().getLanguage().getString("pause_quit");
            this.butt0.x = this._pScene.getPosition().x + this.butt0.getPosition().x;
            this.butt0.y = this._pScene.getPosition().y + this.butt0.getPosition().y;
            this.butt1.x = this._pScene.getPosition().x + this.butt1.getPosition().x;
            this.butt1.y = this._pScene.getPosition().y + this.butt1.getPosition().y;
            this.bt_tf0.x = this.butt0.x;
            this.bt_tf0.y = this.butt0.y;
            this.bt_tf1.x = this.butt1.x;
            this.bt_tf1.y = this.butt1.y;
         }
         this.flag_tf.alpha = this._fFlagsAlpha;
         if(this._fFlagsAlpha > 0)
         {
            this.flag_tf.x = this._vFlagsPos.x;
            this.flag_tf.y = this._vFlagsPos.y;
            _loc2_ = GameWorld.get().getLanguage().getString("gameover_flags");
            _loc6_ = Util.getFormattedNumber(this._uDisplayFlags);
            _loc2_ = _loc2_.replace("$(FLAGS)",_loc6_);
            this.flag_tf.text = _loc2_;
         }
         this._pBonusPanelSceneNew1.alpha = this._fNewBonusAlpha0;
         if(this._fNewBonusAlpha0 > 0 && this._fNewBonusScale0 > 0)
         {
            this._pBonusPanelSceneNew1.x = this._vBonusPos[0].x;
            this._pBonusPanelSceneNew1.y = this._vBonusPos[0].y;
            this._pBonusPanelSceneNew1.x += Number(LegoChima.Instance().zGetScreenWidth()) * (1 - this._fNewBonusAlpha0);
            this.missdesc_new_tf0.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX();
            this.missdesc_new_tf0.y = this._vMissionBoxOffset.y - 0.5 * this._missionBox.getSizeY();
            this.missdesc_new_tf0.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_frommission(this._newMissions[0]);
            this._pStudSceneNew1.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusStudOffsetX;
            this._pStudSceneNew1.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusStudOffsetY;
            this._pStudSceneNew1.updateAnimation();
            this.missrew_new_tf0.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusRewardTextOffsetX;
            this.missrew_new_tf0.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusRewardTextOffsetY;
            this.missrew_new_tf0.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_frommission(this._newMissions[0]));
            this.misscomp_new_tf0.x = this._vMissionBoxOffset.x + 0.5 * this._missionBox.getSizeX() + kfBonusCompletionTextOffsetX;
            this.misscomp_new_tf0.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusCompletionTextOffsetY;
            this.misscomp_new_tf0.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_frommission(this._newMissions[0]);
         }
         this._pBonusPanelSceneNew2.alpha = this._fNewBonusAlpha1;
         if(this._fNewBonusAlpha1 > 0 && this._fNewBonusScale1 > 0)
         {
            this._pBonusPanelSceneNew2.x = this._vBonusPos[1].x;
            this._pBonusPanelSceneNew2.y = this._vBonusPos[1].y;
            this._pBonusPanelSceneNew2.x -= Number(LegoChima.Instance().zGetScreenWidth()) * (1 - this._fNewBonusAlpha1);
            this.missdesc_new_tf1.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX();
            this.missdesc_new_tf1.y = this._vMissionBoxOffset.y - 0.5 * this._missionBox.getSizeY();
            this.missdesc_new_tf1.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_frommission(this._newMissions[1]);
            this._pStudSceneNew2.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusStudOffsetX;
            this._pStudSceneNew2.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusStudOffsetY;
            this._pStudSceneNew2.updateAnimation();
            this.missrew_new_tf1.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusRewardTextOffsetX;
            this.missrew_new_tf1.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusRewardTextOffsetY;
            this.missrew_new_tf1.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_frommission(this._newMissions[1]));
            this.misscomp_new_tf1.x = this._vMissionBoxOffset.x + 0.5 * this._missionBox.getSizeX() + kfBonusCompletionTextOffsetX;
            this.misscomp_new_tf1.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusCompletionTextOffsetY;
            this.misscomp_new_tf1.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_frommission(this._newMissions[1]);
         }
         this._pBonusPanelSceneNew3.alpha = this._fNewBonusAlpha2;
         if(this._fNewBonusAlpha2 > 0 && this._fNewBonusScale2 > 0)
         {
            this._pBonusPanelSceneNew3.x = this._vBonusPos[2].x;
            this._pBonusPanelSceneNew3.y = this._vBonusPos[2].y;
            this._pBonusPanelSceneNew3.x += Number(LegoChima.Instance().zGetScreenWidth()) * (1 - this._fNewBonusAlpha2);
            this.missdesc_new_tf2.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX();
            this.missdesc_new_tf2.y = this._vMissionBoxOffset.y - 0.5 * this._missionBox.getSizeY();
            this.missdesc_new_tf2.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_frommission(this._newMissions[2]);
            this._pStudSceneNew3.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusStudOffsetX;
            this._pStudSceneNew3.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusStudOffsetY;
            this._pStudSceneNew3.updateAnimation();
            this.missrew_new_tf2.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusRewardTextOffsetX;
            this.missrew_new_tf2.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusRewardTextOffsetY;
            this.missrew_new_tf2.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_frommission(this._newMissions[2]));
            this.misscomp_new_tf2.x = this._vMissionBoxOffset.x + 0.5 * this._missionBox.getSizeX() + kfBonusCompletionTextOffsetX;
            this.misscomp_new_tf2.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusCompletionTextOffsetY;
            this.misscomp_new_tf2.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_frommission(this._newMissions[2]);
         }
         this._pBonusPanelSceneCurr1.alpha = this._fCurrentBonusAlpha0;
         if(this._fCurrentBonusAlpha0 > 0 && this._fCurrentBonusScale0 > 0)
         {
            this._pBonusPanelSceneCurr1.x = this._vBonusPos[0].x;
            this._pBonusPanelSceneCurr1.y = this._vBonusPos[0].y;
            this._pBonusPanelSceneCurr1.x += Number(LegoChima.Instance().zGetScreenWidth()) * (1 - this._fCurrentBonusAlpha0);
            this.missdesc_curr_tf0.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX();
            this.missdesc_curr_tf0.y = this._vMissionBoxOffset.y - 0.5 * this._missionBox.getSizeY();
            this.missdesc_curr_tf0.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_frommission(this._currentMissions[0]);
            this._pStudSceneCurr1.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusStudOffsetX;
            this._pStudSceneCurr1.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusStudOffsetY;
            this._pStudSceneCurr1.updateAnimation();
            this.missrew_curr_tf0.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusRewardTextOffsetX;
            this.missrew_curr_tf0.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusRewardTextOffsetY;
            this.missrew_curr_tf0.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_frommission(this._currentMissions[0]));
            this.misscomp_curr_tf0.x = this._vMissionBoxOffset.x + 0.5 * this._missionBox.getSizeX() + kfBonusCompletionTextOffsetX;
            this.misscomp_curr_tf0.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusCompletionTextOffsetY;
            this.misscomp_curr_tf0.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_frommission(this._currentMissions[0]);
         }
         this._pBonusPanelSceneCurr2.alpha = this._fCurrentBonusAlpha1;
         if(this._fCurrentBonusAlpha1 > 0 && this._fCurrentBonusScale1 > 0)
         {
            this._pBonusPanelSceneCurr2.x = this._vBonusPos[1].x;
            this._pBonusPanelSceneCurr2.y = this._vBonusPos[1].y;
            this._pBonusPanelSceneCurr2.x -= Number(LegoChima.Instance().zGetScreenWidth()) * (1 - this._fCurrentBonusAlpha1);
            this.missdesc_curr_tf1.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX();
            this.missdesc_curr_tf1.y = this._vMissionBoxOffset.y - 0.5 * this._missionBox.getSizeY();
            this.missdesc_curr_tf1.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_frommission(this._currentMissions[1]);
            this._pStudSceneCurr2.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusStudOffsetX;
            this._pStudSceneCurr2.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusStudOffsetY;
            this._pStudSceneCurr2.updateAnimation();
            this.missrew_curr_tf1.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusRewardTextOffsetX;
            this.missrew_curr_tf1.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusRewardTextOffsetY;
            this.missrew_curr_tf1.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_frommission(this._currentMissions[1]));
            this.misscomp_curr_tf1.x = this._vMissionBoxOffset.x + 0.5 * this._missionBox.getSizeX() + kfBonusCompletionTextOffsetX;
            this.misscomp_curr_tf1.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusCompletionTextOffsetY;
            this.misscomp_curr_tf1.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_frommission(this._currentMissions[1]);
         }
         this._pBonusPanelSceneCurr3.alpha = this._fCurrentBonusAlpha2;
         if(this._fCurrentBonusAlpha2 > 0 && this._fCurrentBonusScale2 > 0)
         {
            this._pBonusPanelSceneCurr3.x = this._vBonusPos[2].x;
            this._pBonusPanelSceneCurr3.y = this._vBonusPos[2].y;
            this._pBonusPanelSceneCurr3.x += Number(LegoChima.Instance().zGetScreenWidth()) * (1 - this._fCurrentBonusAlpha2);
            this.missdesc_curr_tf2.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX();
            this.missdesc_curr_tf2.y = this._vMissionBoxOffset.y - 0.5 * this._missionBox.getSizeY();
            this.missdesc_curr_tf2.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_frommission(this._currentMissions[2]);
            this._pStudSceneCurr3.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusStudOffsetX;
            this._pStudSceneCurr3.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusStudOffsetY;
            this._pStudSceneCurr3.updateAnimation();
            this.missrew_curr_tf2.x = this._vMissionBoxOffset.x - 0.5 * this._missionBox.getSizeX() + kfBonusRewardTextOffsetX;
            this.missrew_curr_tf2.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusRewardTextOffsetY;
            this.missrew_curr_tf2.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_frommission(this._currentMissions[2]));
            this.misscomp_curr_tf2.x = this._vMissionBoxOffset.x + 0.5 * this._missionBox.getSizeX() + kfBonusCompletionTextOffsetX;
            this.misscomp_curr_tf2.y = this._vMissionBoxOffset.y + 0.5 * this._missionBox.getSizeY() + kfBonusCompletionTextOffsetY;
            this.misscomp_curr_tf2.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_frommission(this._currentMissions[2]);
         }
         if(!_bActive)
         {
            return;
         }
         this._fDt = param1.getTime().dt;
         this._pTweener.tick(this._fDt);
         this._pParticles.update(param1.getTime());
         ++this.m_iFrameCount;
         if(this._bNewBestDistance && this._uDisplayDistance > this._uOldBestDistance)
         {
            if(this.m_iFrameCount > 20)
            {
               this.m_iFrameCount = 0;
               if((_loc7_ = this._pParticles.addParticle()) != null)
               {
                  _loc7_.setDrawType(ParticleManager2D.Z_PARTICLE_DRAW_NORMAL);
                  _loc7_.setSprite(GameRes.get()._pPickUpGreenSparkleSprite);
                  _loc8_ = new Vec2F(this._vNewBestPos.x,this._vNewBestPos.y);
                  _loc8_.x += Random.RandomFloatRangeUniform(-75,75);
                  _loc8_.y += Random.RandomFloatRangeUniform(-50,50);
                  _loc7_.setPosition(_loc8_,true);
                  _loc7_.setRotationAndSpeed(Random.RandomFloatRangeUniform(0,Math.PI * 2),Random.RandomFloatRangeUniform(-10,10));
                  _loc7_.setSize(0);
                  _loc7_.addSizeKeyF(0);
                  _loc7_.addSizeKeyF(Random.RandomFloatRangeUniform(0.8,2.3));
                  _loc7_.addSizeKeyF(0);
                  _loc7_.setLife(0.3);
                  _loc7_.setColor(new RGBA(255,255,255,255));
                  _loc7_.addAlphaKey(0);
                  _loc7_.addAlphaKey(255);
                  _loc7_.addAlphaKey(0);
                  _loc7_.finalise();
               }
            }
         }
         this._state.update();
      }
      
      public function StateRackUpDistance(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._fTicker = 0;
               this._fDistanceAlpha = 0;
               this._uDisplayDistance = 0;
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(Main.Instance().m_app.GetTouchJustPressed() && this._fDistanceAlpha > 0)
               {
                  if(this._uDisplayDistance < this._uDistanceAchieved)
                  {
                     this._uDisplayDistance = this._uDistanceAchieved;
                  }
               }
               if(this._fDistanceAlpha < 1)
               {
                  this._fDistanceAlpha += this._fDt * kfAlphaSpeed;
               }
               else
               {
                  this._fDistanceAlpha = 1;
               }
               if(this._fDistanceAlpha >= 1)
               {
                  if(this._uDisplayDistance < this._uDistanceAchieved)
                  {
                     this._fTicker += this._fDt;
                     if(this._fTicker >= kfTickerTime)
                     {
                        this._fTicker = kfTickerTime;
                        this._uDisplayDistance = this._uDistanceAchieved;
                     }
                     else
                     {
                        this._uDisplayDistance = uint(this._uDistanceAchieved * (this._fTicker / kfTickerTime));
                     }
                  }
               }
               if(this._uDisplayDistance >= this._uDistanceAchieved && this._fDistanceAlpha >= 1)
               {
                  this._state.gotoState(this.StateRackUpStuds);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateRackUpStuds(param1:int, param2:int) : uint
      {
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._fTicker = 0;
               this._fStudAlpha = 0;
               this._uDisplayStuds = 0;
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(Main.Instance().m_app.GetTouchJustPressed() && this._fStudAlpha > 0)
               {
                  if(this._uDisplayStuds < this._uStudsCollected)
                  {
                     this._uDisplayStuds = this._uStudsCollected;
                  }
               }
               if(this._fStudAlpha < 1)
               {
                  this._fStudAlpha += this._fDt * kfAlphaSpeed;
               }
               else
               {
                  this._fStudAlpha = 1;
               }
               if(this._fStudAlpha >= 1)
               {
                  if(this._uDisplayStuds < this._uStudsCollected)
                  {
                     this._fTicker += this._fDt;
                     if(this._fTicker >= kfTickerTime)
                     {
                        this._fTicker = kfTickerTime;
                        this._uDisplayStuds = this._uStudsCollected;
                     }
                     else
                     {
                        GameRes.get()._pCoinSound.play();
                        this._uDisplayStuds = uint(this._uStudsCollected * (this._fTicker / kfTickerTime));
                     }
                  }
               }
               if(this._uDisplayStuds >= this._uStudsCollected && this._fStudAlpha >= 1)
               {
                  this._state.gotoState(this.StateRackUpFlags);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateRackUpFlags(param1:int, param2:int) : uint
      {
         var _loc3_:Number = NaN;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._fTicker = 0;
               this._fFlagsAlpha = 0;
               this._uDisplayFlags = 0;
               break;
            case StateManager.Z_ACTION_UPDATE:
               _loc3_ = 1;
               if(Main.Instance().m_app.GetTouchJustPressed() && this._fFlagsAlpha > 0)
               {
                  if(this._uDisplayFlags < this._uFlagsCollected)
                  {
                     this._uDisplayFlags = this._uFlagsCollected;
                  }
               }
               if(this._fFlagsAlpha < 1)
               {
                  this._fFlagsAlpha += this._fDt * kfAlphaSpeed;
               }
               else
               {
                  this._fFlagsAlpha = 1;
               }
               if(this._fFlagsAlpha >= 1)
               {
                  if(this._uDisplayFlags < this._uFlagsCollected)
                  {
                     this._fTicker += this._fDt;
                     if(this._fTicker >= 1)
                     {
                        this._fTicker += this._fDt;
                        if(this._fTicker >= _loc3_)
                        {
                           this._fTicker = _loc3_;
                           this._uDisplayFlags = this._uFlagsCollected;
                        }
                        else
                        {
                           this._uDisplayFlags = uint(this._uFlagsCollected * (this._fTicker / _loc3_));
                        }
                     }
                  }
               }
               if(this._uDisplayFlags >= this._uFlagsCollected && this._fFlagsAlpha >= 1)
               {
                  this._state.gotoState(this.StateFadeBonusesIn);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateFadeBonusesIn(param1:int, param2:int) : uint
      {
         var _loc3_:uint = 0;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               this._fBonusHold = 0;
               _loc3_ = 0;
               while(_loc3_ < BonusMissions.NUM_CONCURRENT_BONUS_MISSIONS)
               {
                  this._currentMissions[_loc3_] = GameWorld.get().getBonusMissions().getBonusMission(_loc3_);
                  _loc3_++;
               }
               this._fCurrentBonusAlpha0 = 0;
               this._fCurrentBonusAlpha1 = 0;
               this._fCurrentBonusAlpha2 = 0;
               this._fCurrentBonusScale0 = 1;
               this._fCurrentBonusScale1 = 1;
               this._fCurrentBonusScale2 = 1;
               this._fNewBonusAlpha0 = 0;
               this._fNewBonusAlpha1 = 0;
               this._fNewBonusAlpha2 = 0;
               this._fNewBonusScale0 = kfBonusScaleInFrom;
               this._fNewBonusScale1 = kfBonusScaleInFrom;
               this._fNewBonusScale2 = kfBonusScaleInFrom;
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(Main.Instance().m_app.GetTouchJustPressed())
               {
                  this._fBonusHold = kfBonusHoldTime;
               }
               this._fBonusHold += this._fDt;
               this._fCurrentBonusAlpha0 += this._fDt * kfAlphaSpeed;
               if(this._fCurrentBonusAlpha0 > 0.3 * Number(_loc3_))
               {
                  this._fCurrentBonusAlpha1 += this._fDt * kfAlphaSpeed;
               }
               if(this._fCurrentBonusAlpha1 > 0.3 * Number(_loc3_))
               {
                  this._fCurrentBonusAlpha2 += this._fDt * kfAlphaSpeed;
               }
               if(this._fCurrentBonusAlpha0 >= 1)
               {
                  this._fCurrentBonusAlpha0 = 1;
               }
               if(this._fCurrentBonusAlpha1 >= 1)
               {
                  this._fCurrentBonusAlpha1 = 1;
               }
               if(this._fCurrentBonusAlpha2 >= 1)
               {
                  this._fCurrentBonusAlpha2 = 1;
               }
               if(this._fBonusHold >= kfBonusHoldTime)
               {
                  this._fCurrentBonusAlpha0 = 1;
                  this._fCurrentBonusAlpha1 = 1;
                  this._fCurrentBonusAlpha2 = 1;
                  this._fCurrentBonusScale0 = 1;
                  this._fCurrentBonusScale1 = 1;
                  this._fCurrentBonusScale2 = 1;
                  this._state.gotoState(this.StateDoNewBonuses);
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateDoNewBonuses(param1:int, param2:int) : uint
      {
         var _loc3_:uint = 0;
         var _loc4_:Number = NaN;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               GameWorld.get().getBonusMissions().assignNewMissionsIfNecessary();
               _loc3_ = 0;
               while(_loc3_ < BonusMissions.NUM_CONCURRENT_BONUS_MISSIONS)
               {
                  this._newMissions[_loc3_] = GameWorld.get().getBonusMissions().getBonusMission(_loc3_);
                  _loc3_++;
               }
               _loc4_ = 0;
               if(this._currentMissions[0].completed == true)
               {
                  this._pTweener.addTween(this,"gobonusoldalpha","_fCurrentBonusAlpha0",1,0,0.25,_loc4_,cTweener.LINEAR);
                  this._pTweener.addTween(this,"gobonusoldscale","_fCurrentBonusScale0",1,kfBonusScaleOutTo,0.25,_loc4_,cTweener.CUBIC,cTweener.EASE_OUT);
                  this._pTweener.addTween(this,"gobonusnewalpha","_fNewBonusAlpha0",0,1,0.25,0.25 + _loc4_,cTweener.LINEAR);
                  this._pTweener.addTween(this,"gobonusnewscale","_fNewBonusScale0",kfBonusScaleInFrom,1,0.25,0.25 + _loc4_,cTweener.CUBIC);
                  _loc4_ += 0.25;
               }
               if(this._currentMissions[1].completed == true)
               {
                  this._pTweener.addTween(this,"gobonusoldalpha","_fCurrentBonusAlpha1",1,0,0.25,_loc4_,cTweener.LINEAR);
                  this._pTweener.addTween(this,"gobonusoldscale","_fCurrentBonusScale1",1,kfBonusScaleOutTo,0.25,_loc4_,cTweener.CUBIC,cTweener.EASE_OUT);
                  this._pTweener.addTween(this,"gobonusnewalpha","_fNewBonusAlpha1",0,1,0.25,0.25 + _loc4_,cTweener.LINEAR);
                  this._pTweener.addTween(this,"gobonusnewscale","_fNewBonusScale1",kfBonusScaleInFrom,1,0.25,0.25 + _loc4_,cTweener.CUBIC);
                  _loc4_ += 0.25;
               }
               if(this._currentMissions[2].completed == true)
               {
                  this._pTweener.addTween(this,"gobonusoldalpha","_fCurrentBonusAlpha2",1,0,0.25,_loc4_,cTweener.LINEAR);
                  this._pTweener.addTween(this,"gobonusoldscale","_fCurrentBonusScale2",1,kfBonusScaleOutTo,0.25,_loc4_,cTweener.CUBIC,cTweener.EASE_OUT);
                  this._pTweener.addTween(this,"gobonusnewalpha","_fNewBonusAlpha2",0,1,0.25,0.25 + _loc4_,cTweener.LINEAR);
                  this._pTweener.addTween(this,"gobonusnewscale","_fNewBonusScale2",kfBonusScaleInFrom,1,0.25,0.25 + _loc4_,cTweener.CUBIC);
                  _loc4_ += 0.25;
               }
               break;
            case StateManager.Z_ACTION_UPDATE:
               this._state.gotoState(this.StateRackUpAdditionalStuds);
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateRackUpAdditionalStuds(param1:int, param2:int) : uint
      {
         var _loc3_:uint = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               _loc4_ = this._uStudsCollected;
               _loc3_ = 0;
               while(_loc3_ < BonusMissions.NUM_CONCURRENT_BONUS_MISSIONS)
               {
                  if(this._currentMissions[_loc3_].completed == true)
                  {
                     this._uStudsCollected += this._currentMissions[_loc3_].reward;
                  }
                  _loc3_++;
               }
               _loc5_ = this._uStudsCollected - _loc4_;
               _loc6_ = Math.min(_loc5_ / Number(this._uStudsCollected),1);
               this._fTicker = kfTickerTime - kfTickerTime * _loc6_;
               GameWorld.get().getSaveData().addToStudsCollected(this._uStudsCollected);
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(this._uDisplayStuds >= this._uStudsCollected)
               {
                  this._state.gotoState(this.StateButtonPress);
               }
               if(this._uDisplayStuds < this._uStudsCollected)
               {
                  this._fTicker += this._fDt;
                  if(this._fTicker >= kfTickerTime)
                  {
                     this._fTicker = kfTickerTime;
                     this._uDisplayStuds = this._uStudsCollected;
                  }
                  else
                  {
                     this._uDisplayStuds = uint(this._uStudsCollected * (this._fTicker / kfTickerTime));
                  }
               }
               if(Main.Instance().m_app.GetTouchJustPressed())
               {
                  this._uDisplayStuds = this._uStudsCollected;
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      public function StateButtonPress(param1:int, param2:int) : uint
      {
         var _loc3_:GlaMsg = null;
         switch(param1)
         {
            case StateManager.Z_ACTION_START:
               break;
            case StateManager.Z_ACTION_UPDATE:
               if(this._fButtonAlpha < 1)
               {
                  this._fButtonAlpha += 0.1;
                  if(this._fButtonAlpha >= 1)
                  {
                     this._fButtonAlpha = 1;
                  }
               }
               if(this._fButtonAlpha == 1)
               {
                  this._pScene.update();
                  while(this._pScene.hasMsg())
                  {
                     _loc3_ = this._pScene.popMsg();
                     this._bRetry = false;
                     if(_loc3_.getText() == "retry")
                     {
                        this._bRetry = true;
                     }
                     this._bDone = true;
                  }
               }
               break;
            case StateManager.Z_ACTION_END:
         }
         return 0;
      }
      
      override public function show() : void
      {
         _bActive = true;
      }
      
      override public function hide() : void
      {
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         _bActive = false;
      }
      
      override public function isAnythingVisible() : Boolean
      {
         return _bActive;
      }
      
      override public function reset() : void
      {
         this._state.gotoState(this.StateRackUpDistance);
         this._bDone = false;
         this._bRetry = false;
         this._fDistanceAlpha = 0;
         this._fStudAlpha = 0;
         this._fFlagsAlpha = 0;
         this._fButtonAlpha = 0;
         this._fBonusHold = 0;
         this._pTweener.reset();
         this._fCurrentBonusAlpha0 = 0;
         this._fCurrentBonusAlpha1 = 0;
         this._fCurrentBonusAlpha2 = 0;
         this._fCurrentBonusScale0 = 1;
         this._fCurrentBonusScale1 = 1;
         this._fCurrentBonusScale2 = 1;
         this._fNewBonusAlpha0 = 0;
         this._fNewBonusAlpha1 = 0;
         this._fNewBonusAlpha2 = 0;
         this._fNewBonusScale0 = kfBonusScaleInFrom;
         this._fNewBonusScale1 = kfBonusScaleInFrom;
         this._fNewBonusScale2 = kfBonusScaleInFrom;
      }
   }
}
