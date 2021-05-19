package zufflin.cobraBase
{
   public class GlaElementTextBox extends GlaElementRectangle
   {
       
      
      public var text:String;
      
      public var bOutline:Boolean;
      
      public var anchor:int;
      
      public var wrapAnchor:int;
      
      public var trkColor:GlaTrackRGBA;
      
      public function GlaElementTextBox()
      {
         super();
         this.trkColor = new GlaTrackRGBA();
         this.bOutline = false;
         this.anchor = 0;
      }
      
      public function getText() : String
      {
         return this.text;
      }
      
      public function setText(param1:String) : void
      {
         this.text = param1;
      }
      
      public function getAnchor() : int
      {
         return this.anchor;
      }
      
      public function getWrapAnchor() : int
      {
         return this.wrapAnchor;
      }
      
      public function getOutline() : Boolean
      {
         return this.bOutline;
      }
   }
}
