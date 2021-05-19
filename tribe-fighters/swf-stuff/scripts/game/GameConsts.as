package game
{
   public class GameConsts
   {
      
      public static const WORLD_2_GFX:Number = 1;
      
      public static const GFX_2_WORLD:Number = 1 / WORLD_2_GFX;
      
      public static const AUDIO_CHANNEL_BUTTONS:int = 0;
      
      public static const AUDIO_CHANNEL_FRONTEND_START:int = 1;
      
      public static const AUDIO_CHANNEL_FRONTEND_END:int = 2;
      
      public static const AUDIO_CHANNEL_HUD_START:int = 3;
      
      public static const AUDIO_CHANNEL_HUD_END:int = 4;
      
      public static const AUDIO_CHANNEL_PAUSE_START:int = 5;
      
      public static const AUDIO_CHANNEL_PAUSE_END:int = 6;
      
      public static const AUDIO_CHANNEL_LEVEL_AMBIENT:int = 6;
      
      public static const AUDIO_CHANNEL_GAME_START:int = 7;
      
      public static const eFireChima:int = 0;
      
      public static const eIceChima:int = 1;
      
      public static const NUM_CHIMA_TEAMS:int = 2;
      
      public static const eChimaNoClass:int = 0;
      
      public static const eChimaRangedClass:int = 1;
      
      public static const eChimaMageClass:int = 2;
      
      public static const eChimaWarriorClass:int = 3;
      
      public static const GROUP_NOTHING:int = 0;
      
      public static const GROUP_PLAYER:int = 1;
      
      public static const GROUP_LANDSCAPE:int = 2;
      
      public static const GROUP_UNDEF1:int = 3;
      
      public static const GROUP_UNDEF2:int = 4;
      
      public static const GROUP_UNDEF3:int = 5;
      
      public static const GROUP_UNDEF4:int = 6;
      
      public static const GROUP_UNDEF5:int = 7;
      
      public static const GROUP_UNDEF6:int = 8;
      
      public static const GROUP_UNDEF7:int = 9;
      
      public static const GROUP_UNDEF8:int = 10;
      
      public static const GROUP_UNDEF9:int = 11;
      
      public static const GROUP_UNDEF10:int = 12;
      
      public static const GROUP_MAX:int = 13;
      
      public static const eNO_COLLISION:int = 0;
      
      public static const eSceneryCollisionCat:int = 1 << 0;
      
      public static const ePlayerCollisionCat:int = 1 << 1;
      
      public static const ePlayerBulletCollisionCat:int = 1 << 2;
      
      public static const ePlayerMissileCollisionCat:int = 1 << 3;
      
      public static const ePlayerMissileDestructableCollisionCat:int = 1 << 4;
      
      public static const ePlayerCollisionMasterMask:int = ePlayerCollisionCat | ePlayerMissileCollisionCat | ePlayerBulletCollisionCat | ePlayerMissileDestructableCollisionCat;
      
      public static const eEnemyCollisionCat:int = 1 << 5;
      
      public static const eEnemyBulletCollisionCat:int = 1 << 6;
      
      public static const eEnemyMissileCollisionCat:int = 1 << 7;
      
      public static const eEnemyMissileDestructableCollisionCat:int = 1 << 8;
      
      public static const eEnemyCollisionMasterMask:int = eEnemyCollisionCat | eEnemyBulletCollisionCat | eEnemyMissileCollisionCat | eEnemyMissileDestructableCollisionCat;
      
      public static const ePickupCollisionCat:int = 1 << 9;
      
      public static const DEPTH_HIGHEST:int = 0;
      
      public static const DEPTH_OVERLAY:int = 500;
      
      public static const DEPTH_STUDS_PICKED_UP:int = 1000;
      
      public static const DEPTH_DEBRIS:int = 2000;
      
      public static const DEPTH_GAME_OBJECTS:int = 5000;
      
      public static const DEPTH_GROUND:int = 10000;
      
      public static const DEPTH_GROUND_PARTS:int = 9000;
      
      public static const DEPTH_OFFSET_PICKUP_INDICATOR:int = -2000;
      
      public static const DEPTH_OFFSET_BULLETS:int = -1000;
      
      public static const DEPTH_OFFSET_FLYING_ENEMIES:int = -500;
      
      public static const DEPTH_OFFSET_FLOOR_OBJECTS:int = 1000;
      
      public static const DEPTH_OFFSET_HIGHSCORE_MARKER:int = 1500;
       
      
      public function GameConsts()
      {
         super();
      }
   }
}
