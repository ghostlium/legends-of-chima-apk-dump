package game.objects.ui.frontend
{
   import game.objects.ui.UIComponent;
   import starling.display.Quad;
   import zufflin.core.RGBA;
   import zufflin.world.EventUpdate;
   
   public class FullScreenRect extends UIComponent
   {
       
      
      public var _colour:RGBA;
      
      public var _bShown:Boolean;
      
      public var q:Quad;
      
      public function FullScreenRect()
      {
         super();
         this._bShown = false;
         this._colour = new RGBA();
         this.q = new Quad(768,1024);
         this.addChild(this.q);
      }
      
      override public function dispose() : void
      {
         this.removeChild(this.q);
         this.q.dispose();
         super.dispose();
      }
      
      public function setColour(param1:RGBA) : void
      {
         this._colour.r = param1.r;
         this._colour.g = param1.g;
         this._colour.b = param1.b;
         this._colour.a = param1.a;
         this.q.color = this._colour.getDrawColour();
         this.q.alpha = this._colour.getDrawAlpha();
      }
      
      override public function specificUpdate(param1:EventUpdate) : void
      {
      }
      
      override public function show() : void
      {
         this._bShown = true;
         this.q.visible = this._bShown;
      }
      
      override public function hide() : void
      {
         this._bShown = false;
         this.q.visible = this._bShown;
      }
      
      override public function forceShow() : void
      {
         this.show();
      }
      
      override public function forceHide() : void
      {
         this.hide();
      }
      
      override public function isAnythingVisible() : Boolean
      {
         if(this._bShown && this._colour.a > 0)
         {
            return true;
         }
         return false;
      }
   }
}
