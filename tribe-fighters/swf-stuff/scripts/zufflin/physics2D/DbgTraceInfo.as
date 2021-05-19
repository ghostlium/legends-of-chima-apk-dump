package zufflin.physics2D
{
   import util.Vec2F;
   
   public class DbgTraceInfo
   {
       
      
      public var a:Vec2F;
      
      public var b:Vec2F;
      
      public var bHit:Boolean;
      
      public function DbgTraceInfo()
      {
         super();
         this.a = new Vec2F();
         this.b = new Vec2F();
      }
   }
}
