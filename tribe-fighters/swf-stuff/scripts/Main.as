package
{
   import game.App;
   import starling.display.Sprite;
   import zufflin.core.MusicSystem;
   
   public class Main extends Sprite
   {
      
      private static var m_Instance:Main = null;
       
      
      private var m_StarlingSprite:Sprite;
      
      public var m_app:App;
      
      public function Main()
      {
         if(m_Instance == null)
         {
            m_Instance = this;
            super();
            return;
         }
         throw new Error("Error: Cannot create more than one instance of singleton.");
      }
      
      public static function Instance() : Main
      {
         if(m_Instance == null)
         {
            m_Instance = new Main();
         }
         return m_Instance;
      }
      
      public function Initialise() : void
      {
         this.scaleX = LegoChima.kfWindowScaleX;
         this.scaleY = LegoChima.kfWindowScaleY;
         if(LegoChima.kbDEBUG_ShowStats)
         {
            LegoChima.Instance().GetStarlingCurrent().showStats = true;
         }
         var _loc1_:MusicSystem = new MusicSystem();
         this.m_app = new App();
         this.addChild(this.m_app);
         this.m_app.Init();
      }
      
      public function Tick(param1:Number) : void
      {
         MusicSystem.getSingleton().eventUpdate(param1);
         this.m_app.update(param1);
      }
   }
}
