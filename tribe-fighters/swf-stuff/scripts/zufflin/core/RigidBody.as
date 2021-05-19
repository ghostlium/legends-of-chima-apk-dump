package zufflin.core
{
   public class RigidBody
   {
      
      public static const Z_RIGID_BODY_STATIC:int = 0;
      
      public static const Z_RIGID_BODY_DYNAMIC:int = 1;
      
      public static const Z_RIGID_BODY_KINEMATIC:int = 2;
       
      
      public function RigidBody()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
   }
}
