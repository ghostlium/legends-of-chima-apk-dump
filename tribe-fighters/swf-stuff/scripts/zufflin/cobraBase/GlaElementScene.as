package zufflin.cobraBase
{
   import util.Vec2F;
   
   public class GlaElementScene extends GlaElementPos
   {
       
      
      public var trkRotation:GlaTrackFloat;
      
      public var trkScale:GlaTrackVec2f;
      
      public var trkPivot:GlaTrackVec2f;
      
      public var trkColor:GlaTrackRGBA;
      
      public var trkSceneRef:GlaTrackSceneRef;
      
      public var trkSceneStateIndex:GlaTrackInt;
      
      public var bClipping:Boolean;
      
      public var layer:int;
      
      public var startFrame:int;
      
      public function GlaElementScene()
      {
         super();
         this.layer = 0;
         this.bClipping = false;
         this.startFrame = 0;
         this.trkRotation = new GlaTrackFloat();
         this.trkScale = new GlaTrackVec2f();
         this.trkPivot = new GlaTrackVec2f();
         this.trkColor = new GlaTrackRGBA();
         this.trkSceneRef = new GlaTrackSceneRef();
         this.trkSceneStateIndex = new GlaTrackInt();
      }
      
      override public function scaleData(param1:ScaleInfo) : void
      {
         super.scaleData(param1);
         this.trkPivot.scaleData(param1);
      }
      
      public function getRotation(param1:int) : Number
      {
         return this.trkRotation.getValue(param1);
      }
      
      public function hasAnimation() : Boolean
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.trkSceneRef.vKeys.length)
         {
            if(this.trkSceneRef.vKeys[_loc1_].getValue().getState(0).hasAnimation())
            {
               return true;
            }
            _loc1_++;
         }
         return false;
      }
      
      public function getSceneRef(param1:int) : GlaScene
      {
         return this.trkSceneRef.getValue(param1);
      }
      
      public function getScale(param1:int) : Vec2F
      {
         return this.trkScale.getValue(param1);
      }
   }
}
