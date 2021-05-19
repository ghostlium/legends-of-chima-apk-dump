package game.objects.ui
{
   import util.SpriteExt;
   import zufflin.world.EventUpdate;
   import zufflin.world2D.World2Obj;
   
   public class UIMenu extends World2Obj
   {
       
      
      public function UIMenu()
      {
         super();
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
      }
      
      public function specificUpdate(param1:EventUpdate) : void
      {
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         this.specificUpdate(param1);
      }
      
      public function show() : void
      {
         var _loc3_:int = 0;
         var _loc1_:SpriteExt = this.getComponents_Layer();
         var _loc2_:int = _loc1_.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc1_.getChildAt(_loc3_) is UIComponent)
            {
               (_loc1_.getChildAt(_loc3_) as UIComponent).show();
            }
            _loc3_++;
         }
      }
      
      public function hide() : void
      {
         var _loc3_:int = 0;
         var _loc1_:SpriteExt = this.getComponents_Layer();
         var _loc2_:int = _loc1_.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc1_.getChildAt(_loc3_) is UIComponent)
            {
               (_loc1_.getChildAt(_loc3_) as UIComponent).hide();
            }
            _loc3_++;
         }
      }
      
      public function forceShow() : void
      {
         var _loc3_:int = 0;
         var _loc1_:SpriteExt = this.getComponents_Layer();
         var _loc2_:int = _loc1_.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc1_.getChildAt(_loc3_) is UIComponent)
            {
               (_loc1_.getChildAt(_loc3_) as UIComponent).forceShow();
            }
            _loc3_++;
         }
      }
      
      public function forceHide() : void
      {
         var _loc3_:int = 0;
         var _loc1_:SpriteExt = this.getComponents_Layer();
         var _loc2_:int = _loc1_.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            if(_loc1_.getChildAt(_loc3_) is UIComponent)
            {
               (_loc1_.getChildAt(_loc3_) as UIComponent).forceHide();
            }
            _loc3_++;
         }
      }
   }
}
