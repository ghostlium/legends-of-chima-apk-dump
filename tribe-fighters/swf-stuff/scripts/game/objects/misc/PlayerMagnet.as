package game.objects.misc
{
   import game.GameWorld;
   import game.objects.Player;
   import util.Vec2F;
   import zufflin.world.EventUpdate;
   import zufflin.world.WorldLayer;
   import zufflin.world2D.Component2;
   
   public class PlayerMagnet extends Component2
   {
      
      public static const kfPlayerMagnetDistance:Number = 100;
      
      public static const kfPlayerMagnetSpeed:Number = 200;
       
      
      public function PlayerMagnet()
      {
         super();
         Main.Instance().m_app.addEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
      }
      
      override public function dispose() : void
      {
         Main.Instance().m_app.removeEventListener(EventUpdate.EVENT_UPDATE,this.eventUpdate);
         super.dispose();
      }
      
      public function eventUpdate(param1:EventUpdate) : void
      {
         var _loc4_:Vec2F = null;
         var _loc5_:Vec2F = null;
         var _loc6_:Vec2F = null;
         var _loc2_:WorldLayer = this.getLayer();
         if(_loc2_ && _loc2_.isUpdateEnabled() == false)
         {
            return;
         }
         var _loc3_:Player = GameWorld.get().getPlayer();
         if(_loc3_)
         {
            _loc4_ = getWorldObj().getPosition();
            _loc5_ = _loc3_.getPosition();
            if((_loc6_ = new Vec2F(_loc5_.x - _loc4_.x,_loc5_.y - _loc4_.y)).length <= kfPlayerMagnetDistance)
            {
               _loc6_.normalize(1);
               _loc4_.x += _loc6_.x * kfPlayerMagnetSpeed * param1.getTime().dt;
               _loc4_.y += _loc6_.y * kfPlayerMagnetSpeed * param1.getTime().dt;
               getWorldObj().setPosition(_loc4_);
            }
         }
      }
   }
}
