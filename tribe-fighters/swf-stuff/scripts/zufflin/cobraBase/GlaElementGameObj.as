package zufflin.cobraBase
{
   import util.Vec2F;
   
   public class GlaElementGameObj extends GlaElementPos
   {
       
      
      public var trkRotation:GlaTrackFloat;
      
      public var trkScale:GlaTrackVec2f;
      
      public function GlaElementGameObj()
      {
         super();
         this.trkRotation = new GlaTrackFloat();
         this.trkScale = new GlaTrackVec2f();
      }
      
      public function getRotation(param1:int) : Number
      {
         return this.trkRotation.getValue(param1);
      }
      
      public function getScale(param1:int) : Vec2F
      {
         return this.trkScale.getValue(0);
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         if(param1.bSprites)
         {
            this.trkScale.scaleData(param1);
         }
      }
   }
}
