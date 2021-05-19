package game.objects.ui.pause
{
   import game.GameRes;
   import game.GameWorld;
   import game.Util;
   import game.objects.events.EventShowTutorial;
   import game.objects.ui.UIComponent;
   import game.tween.cTweener;
   import starling.display.Quad;
   import starling.display.Sprite;
   import starling.text.TextField;
   import starling.utils.HAlign;
   import starling.utils.VAlign;
   import util.Vec2F;
   import zufflin.cobraBase.GlaControllerButton;
   import zufflin.cobraBase.GlaControllerRectangle;
   import zufflin.cobraBase.GlaControllerScene;
   import zufflin.cobraBase.GlaMsg;
   import zufflin.math.AABox2f;
   import zufflin.world.EventUpdate;
   
   public class PauseMenuScreen extends UIComponent
   {
      
      public static const kfStudOffsetX:Number = 20;
      
      public static const kfStudOffsetY:Number = -20;
      
      public static const kfRewardTextOffsetX:Number = 40;
      
      public static const kfRewardTextOffsetY:Number = -17;
      
      public static const kfCompletionTextOffsetX:Number = -20;
      
      public static const kfCompletionTextOffsetY:Number = -17;
       
      
      public var _pScene:GlaControllerScene;
      
      public var _pStudScene1:GlaControllerScene;
      
      public var _pStudScene2:GlaControllerScene;
      
      public var _pStudScene3:GlaControllerScene;
      
      public var _pTweener:cTweener;
      
      public var _vMissionPos:Vector.<Vec2F>;
      
      public var _missionBoxes:Vector.<AABox2f>;
      
      public var _fAlpha:Number;
      
      public var _fScale:Number;
      
      private var q:Quad;
      
      private var but_tf1:TextField;
      
      private var but_tf2:TextField;
      
      private var but_tf3:TextField;
      
      private var miss_desc_ft_1:TextField;
      
      private var miss_rew_ft_1:TextField;
      
      private var miss_comp_ft_1:TextField;
      
      private var miss_desc_ft_2:TextField;
      
      private var miss_rew_ft_2:TextField;
      
      private var miss_comp_ft_2:TextField;
      
      private var miss_desc_ft_3:TextField;
      
      private var miss_rew_ft_3:TextField;
      
      private var miss_comp_ft_3:TextField;
      
      private var text_container:Sprite;
      
      public function PauseMenuScreen()
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:GlaControllerRectangle = null;
         super();
         this._vMissionPos = new Vector.<Vec2F>(3,true);
         this._missionBoxes = new Vector.<AABox2f>(3,true);
         this._fAlpha = 0;
         this._fScale = 0;
         this._pScene = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("pause_screen"));
         this._pStudScene1 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudScene1.playAnimation(true);
         this._pStudScene2 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudScene2.playAnimation(true);
         this._pStudScene3 = new GlaControllerScene(null,null,GameRes.get()._pUISet.findScene("frontend_charselect_stud"));
         this._pStudScene3.playAnimation(true);
         var _loc1_:Vec2F = new Vec2F(0.5 * Number(LegoChima.Instance().zGetScreenWidth()),0.5 * Number(LegoChima.Instance().zGetScreenHeight()));
         this._pScene.setPosition(_loc1_);
         _loc2_ = 0;
         while(_loc2_ < 3)
         {
            _loc3_ = "mission" + _loc2_.toString();
            _loc4_ = this._pScene.getRectangle(_loc3_);
            this._vMissionPos[_loc2_] = new Vec2F(_loc4_.getPosition().x + _loc1_.x,_loc4_.getPosition().y + _loc1_.y);
            this._missionBoxes[_loc2_] = _loc4_.getSrcRectangle().getAABox(0);
            _loc2_++;
         }
         this._pTweener = new cTweener();
         this.q = new Quad(768,1024,0);
         this.q.alpha = 0;
         this.q.touchable = false;
         this.addChild(this.q);
         this.addChild(this._pScene);
         this.text_container = new Sprite();
         this.text_container.touchable = false;
         this.text_container.alignPivot();
         this.text_container.x = 768 / 2;
         this.text_container.y = 1024 / 2;
         this.addChild(this.text_container);
         this.but_tf1 = new TextField(250,90,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.but_tf1.touchable = false;
         this.but_tf1.autoScale = true;
         this.but_tf1.alignPivot();
         this.but_tf1.hAlign = HAlign.CENTER;
         this.but_tf1.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.but_tf1);
         this.but_tf2 = new TextField(250,90,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.but_tf2.touchable = false;
         this.but_tf2.autoScale = true;
         this.but_tf2.alignPivot();
         this.but_tf2.hAlign = HAlign.CENTER;
         this.but_tf2.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.but_tf2);
         this.but_tf3 = new TextField(250,90,"",GameRes.get()._pArialUnicode32,32,16777215);
         this.but_tf3.touchable = false;
         this.but_tf3.autoScale = true;
         this.but_tf3.alignPivot();
         this.but_tf3.hAlign = HAlign.CENTER;
         this.but_tf3.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.but_tf3);
         this.miss_desc_ft_1 = new TextField(this._missionBoxes[0].getSizeX(),80,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_desc_ft_1.touchable = false;
         this.miss_desc_ft_1.autoScale = true;
         this.miss_desc_ft_1.hAlign = HAlign.LEFT;
         this.miss_desc_ft_1.vAlign = VAlign.TOP;
         this.text_container.addChild(this.miss_desc_ft_1);
         this.miss_desc_ft_2 = new TextField(this._missionBoxes[1].getSizeX(),80,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_desc_ft_2.touchable = false;
         this.miss_desc_ft_2.autoScale = true;
         this.miss_desc_ft_2.hAlign = HAlign.LEFT;
         this.miss_desc_ft_2.vAlign = VAlign.TOP;
         this.text_container.addChild(this.miss_desc_ft_2);
         this.miss_desc_ft_3 = new TextField(this._missionBoxes[2].getSizeX(),80,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_desc_ft_3.touchable = false;
         this.miss_desc_ft_3.autoScale = true;
         this.miss_desc_ft_3.hAlign = HAlign.LEFT;
         this.miss_desc_ft_3.vAlign = VAlign.TOP;
         this.text_container.addChild(this.miss_desc_ft_3);
         this.miss_rew_ft_1 = new TextField(this._missionBoxes[0].getSizeX(),40,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_rew_ft_1.touchable = false;
         this.miss_rew_ft_1.autoScale = true;
         this.miss_rew_ft_1.alignPivot(HAlign.LEFT,VAlign.CENTER);
         this.miss_rew_ft_1.hAlign = HAlign.LEFT;
         this.miss_rew_ft_1.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.miss_rew_ft_1);
         this.miss_rew_ft_2 = new TextField(this._missionBoxes[1].getSizeX(),40,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_rew_ft_2.touchable = false;
         this.miss_rew_ft_2.autoScale = true;
         this.miss_rew_ft_2.alignPivot(HAlign.LEFT,VAlign.CENTER);
         this.miss_rew_ft_2.hAlign = HAlign.LEFT;
         this.miss_rew_ft_2.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.miss_rew_ft_2);
         this.miss_rew_ft_3 = new TextField(this._missionBoxes[2].getSizeX(),40,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_rew_ft_3.touchable = false;
         this.miss_rew_ft_3.autoScale = true;
         this.miss_rew_ft_3.alignPivot(HAlign.LEFT,VAlign.CENTER);
         this.miss_rew_ft_3.hAlign = HAlign.LEFT;
         this.miss_rew_ft_3.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.miss_rew_ft_3);
         this.miss_comp_ft_1 = new TextField(this._missionBoxes[0].getSizeX(),40,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_comp_ft_1.alignPivot(HAlign.RIGHT,VAlign.CENTER);
         this.miss_comp_ft_1.touchable = false;
         this.miss_comp_ft_1.autoScale = true;
         this.miss_comp_ft_1.hAlign = HAlign.RIGHT;
         this.miss_comp_ft_1.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.miss_comp_ft_1);
         this.miss_comp_ft_2 = new TextField(this._missionBoxes[1].getSizeX(),40,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_comp_ft_2.alignPivot(HAlign.RIGHT,VAlign.CENTER);
         this.miss_comp_ft_2.touchable = false;
         this.miss_comp_ft_2.autoScale = true;
         this.miss_comp_ft_2.hAlign = HAlign.RIGHT;
         this.miss_comp_ft_2.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.miss_comp_ft_2);
         this.miss_comp_ft_3 = new TextField(this._missionBoxes[2].getSizeX(),40,"",GameRes.get()._pScoreFont,24,16777215);
         this.miss_comp_ft_3.alignPivot(HAlign.RIGHT,VAlign.CENTER);
         this.miss_comp_ft_3.touchable = false;
         this.miss_comp_ft_3.autoScale = true;
         this.miss_comp_ft_3.hAlign = HAlign.RIGHT;
         this.miss_comp_ft_3.vAlign = VAlign.CENTER;
         this.text_container.addChild(this.miss_comp_ft_3);
         this.text_container.addChild(this._pStudScene1);
         this.text_container.addChild(this._pStudScene2);
         this.text_container.addChild(this._pStudScene3);
      }
      
      override public function dispose() : void
      {
         this.text_container.removeChild(this._pStudScene1);
         this.text_container.removeChild(this._pStudScene2);
         this.text_container.removeChild(this._pStudScene3);
         this.text_container.removeChild(this.miss_comp_ft_1);
         this.miss_comp_ft_1 = null;
         this.text_container.removeChild(this.miss_comp_ft_2);
         this.miss_comp_ft_2 = null;
         this.text_container.removeChild(this.miss_comp_ft_3);
         this.miss_comp_ft_3 = null;
         this.text_container.removeChild(this.miss_rew_ft_1);
         this.miss_rew_ft_1 = null;
         this.text_container.removeChild(this.miss_rew_ft_2);
         this.miss_rew_ft_2 = null;
         this.text_container.removeChild(this.miss_rew_ft_3);
         this.miss_rew_ft_3 = null;
         this.text_container.removeChild(this.miss_desc_ft_1);
         this.miss_desc_ft_1 = null;
         this.text_container.removeChild(this.miss_desc_ft_2);
         this.miss_desc_ft_2 = null;
         this.text_container.removeChild(this.miss_desc_ft_3);
         this.miss_desc_ft_3 = null;
         this.text_container.removeChild(this.but_tf1,true);
         this.text_container.removeChild(this.but_tf2,true);
         this.text_container.removeChild(this.but_tf3,true);
         this.but_tf1 = null;
         this.but_tf2 = null;
         this.but_tf3 = null;
         this.removeChild(this.text_container,true);
         this.text_container = null;
         this.removeChild(this.q,true);
         this.q = null;
         this.removeChild(this._pScene);
         this._pScene.dispose();
         this._pScene = null;
         this._pStudScene1.dispose();
         this._pStudScene1 = null;
         this._pStudScene2.dispose();
         this._pStudScene2 = null;
         this._pStudScene3.dispose();
         this._pStudScene3 = null;
         this._pTweener.dispose();
         this._pTweener = null;
         super.dispose();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
         var _loc2_:GlaControllerButton = null;
         var _loc3_:GlaMsg = null;
         this._pTweener.tick(param1.getTime().dt);
         this.q.alpha = 0.5 * this._fAlpha;
         this._pScene.alpha = this._fAlpha;
         this.but_tf1.alpha = this._fAlpha;
         this.but_tf2.alpha = this._fAlpha;
         this.but_tf3.alpha = this._fAlpha;
         this.miss_desc_ft_1.alpha = this._fAlpha;
         this.miss_desc_ft_2.alpha = this._fAlpha;
         this.miss_desc_ft_3.alpha = this._fAlpha;
         this.miss_rew_ft_1.alpha = this._fAlpha;
         this.miss_rew_ft_2.alpha = this._fAlpha;
         this.miss_rew_ft_3.alpha = this._fAlpha;
         this.miss_comp_ft_1.alpha = this._fAlpha;
         this.miss_comp_ft_2.alpha = this._fAlpha;
         this.miss_comp_ft_3.alpha = this._fAlpha;
         this._pStudScene1.alpha = this._fAlpha;
         this._pStudScene2.alpha = this._fAlpha;
         this._pStudScene3.alpha = this._fAlpha;
         if(this._fAlpha > 0)
         {
            this._pScene.scaleX = this._fScale;
            this._pScene.scaleY = this._fScale;
            this.text_container.scaleX = this._fScale;
            this.text_container.scaleY = this._fScale;
            _loc2_ = this._pScene.findButton("resume");
            this.but_tf1.x = this._pScene.getPosition().x + _loc2_.getPosition().x - 384;
            this.but_tf1.y = this._pScene.getPosition().y + _loc2_.getPosition().y - 512;
            this.but_tf1.text = GameWorld.get().getLanguage().getString("pause_resume");
            _loc2_ = this._pScene.findButton("retry");
            this.but_tf2.x = this._pScene.getPosition().x + _loc2_.getPosition().x - 384;
            this.but_tf2.y = this._pScene.getPosition().y + _loc2_.getPosition().y - 512;
            this.but_tf2.text = GameWorld.get().getLanguage().getString("pause_retry");
            _loc2_ = this._pScene.findButton("quit");
            this.but_tf3.x = this._pScene.getPosition().x + _loc2_.getPosition().x - 384;
            this.but_tf3.y = this._pScene.getPosition().y + _loc2_.getPosition().y - 512;
            this.but_tf3.text = GameWorld.get().getLanguage().getString("pause_quit");
            this.miss_desc_ft_1.x = this._vMissionPos[0].x - 384 - 0.5 * this._missionBoxes[0].getSizeX();
            this.miss_desc_ft_1.y = this._vMissionPos[0].y - 512 - 0.5 * this._missionBoxes[0].getSizeY();
            this.miss_desc_ft_1.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_fromindex(0);
            this.miss_desc_ft_2.x = this._vMissionPos[1].x - 384 - 0.5 * this._missionBoxes[1].getSizeX();
            this.miss_desc_ft_2.y = this._vMissionPos[1].y - 512 - 0.5 * this._missionBoxes[1].getSizeY();
            this.miss_desc_ft_2.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_fromindex(1);
            this.miss_desc_ft_3.x = this._vMissionPos[2].x - 384 - 0.5 * this._missionBoxes[2].getSizeX();
            this.miss_desc_ft_3.y = this._vMissionPos[2].y - 512 - 0.5 * this._missionBoxes[2].getSizeY();
            this.miss_desc_ft_3.text = GameWorld.get().getBonusMissions().getBonusMissionDescription_fromindex(2);
            this.miss_rew_ft_1.x = this._vMissionPos[0].x - 384 - 0.5 * this._missionBoxes[0].getSizeX() + kfRewardTextOffsetX;
            this.miss_rew_ft_1.y = this._vMissionPos[0].y - 512 + 0.5 * this._missionBoxes[0].getSizeY() + kfRewardTextOffsetY;
            this.miss_rew_ft_1.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_fromindex(0));
            this.miss_rew_ft_2.x = this._vMissionPos[1].x - 384 - 0.5 * this._missionBoxes[1].getSizeX() + kfRewardTextOffsetX;
            this.miss_rew_ft_2.y = this._vMissionPos[1].y - 512 + 0.5 * this._missionBoxes[1].getSizeY() + kfRewardTextOffsetY;
            this.miss_rew_ft_2.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_fromindex(1));
            this.miss_rew_ft_3.x = this._vMissionPos[2].x - 384 - 0.5 * this._missionBoxes[2].getSizeX() + kfRewardTextOffsetX;
            this.miss_rew_ft_3.y = this._vMissionPos[2].y - 512 + 0.5 * this._missionBoxes[2].getSizeY() + kfRewardTextOffsetY;
            this.miss_rew_ft_3.text = Util.getFormattedNumber(GameWorld.get().getBonusMissions().getBonusMissionReward_fromindex(2));
            this.miss_comp_ft_1.x = this._vMissionPos[0].x - 384 + 0.5 * this._missionBoxes[0].getSizeX() + kfCompletionTextOffsetX;
            this.miss_comp_ft_1.y = this._vMissionPos[0].y - 512 + 0.5 * this._missionBoxes[0].getSizeY() + kfCompletionTextOffsetY;
            this.miss_comp_ft_1.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_fromindex(0);
            this.miss_comp_ft_2.x = this._vMissionPos[1].x - 384 + 0.5 * this._missionBoxes[1].getSizeX() + kfCompletionTextOffsetX;
            this.miss_comp_ft_2.y = this._vMissionPos[1].y - 512 + 0.5 * this._missionBoxes[1].getSizeY() + kfCompletionTextOffsetY;
            this.miss_comp_ft_2.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_fromindex(1);
            this.miss_comp_ft_3.x = this._vMissionPos[2].x - 384 + 0.5 * this._missionBoxes[2].getSizeX() + kfCompletionTextOffsetX;
            this.miss_comp_ft_3.y = this._vMissionPos[2].y - 512 + 0.5 * this._missionBoxes[2].getSizeY() + kfCompletionTextOffsetY;
            this.miss_comp_ft_3.text = GameWorld.get().getBonusMissions().getBonusMissionCompletion_fromindex(2);
            this._pStudScene1.x = this._vMissionPos[0].x - 384 - 0.5 * this._missionBoxes[0].getSizeX() + kfStudOffsetX;
            this._pStudScene1.y = this._vMissionPos[0].y - 512 + 0.5 * this._missionBoxes[0].getSizeY() + kfStudOffsetY;
            this._pStudScene2.x = this._vMissionPos[1].x - 384 - 0.5 * this._missionBoxes[1].getSizeX() + kfStudOffsetX;
            this._pStudScene2.y = this._vMissionPos[1].y - 512 + 0.5 * this._missionBoxes[1].getSizeY() + kfStudOffsetY;
            this._pStudScene3.x = this._vMissionPos[2].x - 384 - 0.5 * this._missionBoxes[2].getSizeX() + kfStudOffsetX;
            this._pStudScene3.y = this._vMissionPos[2].y - 512 + 0.5 * this._missionBoxes[2].getSizeY() + kfStudOffsetY;
            this._pStudScene1.updateAnimation();
            this._pStudScene2.updateAnimation();
            this._pStudScene3.updateAnimation();
         }
         if(_bActive)
         {
            this._pScene.update();
            while(this._pScene.hasMsg())
            {
               _loc3_ = this._pScene.popMsg();
               if(_loc3_.getText() == "resume")
               {
                  GameWorld.get().gotoPlayingGame();
               }
               else if(_loc3_.getText() == "retry")
               {
                  GameWorld.get().gotoRestartGame();
               }
               else if(_loc3_.getText() == "quit")
               {
                  GameWorld.get().gotoQuitGame();
               }
               else if(_loc3_.getText() == "tutorial")
               {
                  Main.Instance().m_app.dispatchEvent(new EventShowTutorial(EventShowTutorial.EVENT_SHOW_TUTORIAL,false));
                  GameWorld.get().gotoPlayingGame();
               }
            }
         }
      }
      
      override public function show() : void
      {
         this._pTweener.addTween(this,"pauseScreenAlpha","_fAlpha",0,1,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"pauseScreenScale","_fScale",0.5,1,0.5,0,cTweener.CUBIC);
         _bActive = true;
      }
      
      override public function hide() : void
      {
         this._pTweener.addTween(this,"pauseScreenAlpha","_fAlpha",1,0,0.5,0,cTweener.LINEAR);
         this._pTweener.addTween(this,"pauseScreenScale","_fScale",1,0.5,0.5,0,cTweener.CUBIC,cTweener.EASE_OUT);
         _bActive = false;
      }
      
      override public function forceShow() : void
      {
         this._pTweener.reset();
         this._fAlpha = 1;
         this._fScale = 1;
         _bActive = true;
      }
      
      override public function forceHide() : void
      {
         this._pTweener.reset();
         this._fAlpha = 0;
         this._fScale = 0.5;
         _bActive = false;
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
