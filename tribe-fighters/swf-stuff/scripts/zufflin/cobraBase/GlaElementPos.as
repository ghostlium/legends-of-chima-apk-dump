package zufflin.cobraBase
{
   import util.Vec2F;
   
   public class GlaElementPos extends GlaElement
   {
       
      
      public var trkPosition:GlaTrackVec2f;
      
      public var trkDepth:GlaTrackFloat;
      
      public var depthE:int;
      
      public var bWordWrap:Boolean;
      
      public var customRendererName:String;
      
      public function GlaElementPos()
      {
         super();
         this.depthE = 0;
         this.trkPosition = new GlaTrackVec2f();
         this.trkDepth = new GlaTrackFloat();
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         this.trkPosition.scaleData(param1);
      }
      
      public function getPos(param1:int) : Vec2F
      {
         return this.trkPosition.getValue(param1);
      }
      
      public function getDepth(param1:int) : Number
      {
         return this.trkDepth.getValue(param1);
      }
      
      public function getDepthEnum() : int
      {
         return this.depthE;
      }
      
      public function isWordWrap() : Boolean
      {
         return this.bWordWrap;
      }
   }
}
