package zufflin.core
{
   import util.Vec2F;
   
   public class TouchInfo
   {
       
      
      public var position:Vec2F;
      
      public var delta:Vec2F;
      
      public var pressed:Boolean;
      
      public function TouchInfo()
      {
         super();
         this.position = new Vec2F();
         this.delta = new Vec2F();
         this.pressed = false;
      }
      
      public function isPressed() : Boolean
      {
         return this.pressed;
      }
      
      public function getPosition() : Vec2F
      {
         return this.position;
      }
      
      public function getDelta() : Vec2F
      {
         return this.delta;
      }
   }
}
