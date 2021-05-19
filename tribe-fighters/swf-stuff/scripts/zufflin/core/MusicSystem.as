package zufflin.core
{
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class MusicSystem
   {
      
      private static var pSingleton:MusicSystem = null;
      
      private static const FADE_TO_PAUSE:int = 0;
      
      private static const FADE_TO_STOP:int = 1;
      
      public static const AUDIO_CHANNEL_BUTTONS:int = 0;
      
      public static const AUDIO_CHANNEL_HUD_START:int = 1;
      
      public static const AUDIO_CHANNEL_HUD_END:int = 2;
      
      public static const AUDIO_CHANNEL_LEVEL_AMBIENT:int = 3;
      
      public static const AUDIO_CHANNEL_END_LEVEL_HACK:int = 4;
      
      public static const AUDIO_CHANNEL_GAME_START:int = 5;
      
      public static const NUM_AUDIO_CHANNELS:int = 6;
       
      
      private var fadeToTarget:Number;
      
      private var fadeSpeed:Number;
      
      private var fadeCurrent:Number;
      
      private var pauseCount:int;
      
      private var volume:Number;
      
      private var defaultFadeTime:Number;
      
      private var fadeAction:int;
      
      private var musicChannel:SoundChannel;
      
      private var musicSound:Sound;
      
      private var pausePosition:int;
      
      private var _soundChannels:Vector.<SoundChannel>;
      
      private var _channelSounds:Vector.<Sound>;
      
      private var _channelVolumes:Vector.<Number>;
      
      private var _channelListeners:Vector.<Boolean>;
      
      private var levelAmbientChannel:SoundChannel;
      
      private var levelAmbientSound:Sound;
      
      private var levelAmbientVolume:Number;
      
      private var endLevelHackChannel:SoundChannel;
      
      private var endLevelHackSound:Sound;
      
      private var endLevelHackListener:Boolean;
      
      public function MusicSystem()
      {
         super();
         pSingleton = this;
         this.fadeToTarget = 1;
         this.fadeCurrent = 1;
         this.fadeSpeed = 0;
         this.defaultFadeTime = 0;
         this.fadeAction = FADE_TO_STOP;
         this.volume = 1;
         this.pauseCount = 0;
         this.musicChannel = null;
         this.musicSound = null;
         this.levelAmbientChannel = null;
         this.levelAmbientSound = null;
         this.levelAmbientVolume = 1;
         this.endLevelHackChannel = null;
         this.endLevelHackSound = null;
         this.endLevelHackListener = false;
         this._soundChannels = new Vector.<SoundChannel>(NUM_AUDIO_CHANNELS,true);
         this._channelSounds = new Vector.<Sound>(NUM_AUDIO_CHANNELS,true);
         this._channelVolumes = new Vector.<Number>(NUM_AUDIO_CHANNELS,true);
         this._channelListeners = new Vector.<Boolean>(NUM_AUDIO_CHANNELS,true);
         var _loc1_:int = 0;
         while(_loc1_ < NUM_AUDIO_CHANNELS)
         {
            this._soundChannels[_loc1_] = null;
            this._channelSounds[_loc1_] = null;
            this._channelVolumes[_loc1_] = 1;
            this._channelListeners[_loc1_] = false;
            _loc1_++;
         }
      }
      
      public static function getSingleton() : MusicSystem
      {
         return pSingleton;
      }
      
      public static function zMusicPlay(param1:Sound) : void
      {
         if(param1 && MusicSystem.getSingleton())
         {
            MusicSystem.getSingleton().play(param1);
         }
      }
      
      public static function zMusicStop() : void
      {
         if(MusicSystem.getSingleton())
         {
            MusicSystem.getSingleton().stop();
         }
      }
      
      public function getFade() : Number
      {
         return this.fadeCurrent;
      }
      
      public function eventUpdate(param1:Number) : void
      {
         if(this.fadeSpeed > 0)
         {
            this.fadeCurrent += this.fadeSpeed * param1;
            if(this.fadeCurrent >= this.fadeToTarget)
            {
               this.fadeCurrent = this.fadeToTarget;
               this.fadeSpeed = 0;
            }
            this.setVolume(this.getVolume());
         }
         else if(this.fadeSpeed < 0)
         {
            this.fadeCurrent += this.fadeSpeed * param1;
            if(this.fadeCurrent <= this.fadeToTarget)
            {
               this.fadeCurrent = this.fadeToTarget;
               this.fadeSpeed = 0;
               switch(this.fadeAction)
               {
                  case FADE_TO_PAUSE:
                     if(this.musicChannel != null)
                     {
                        this.pausePosition = this.musicChannel.position;
                        this.musicChannel.stop();
                        this.musicChannel = null;
                     }
                     break;
                  case FADE_TO_STOP:
                     if(this.musicChannel != null)
                     {
                        this.musicChannel.stop();
                        this.musicChannel = null;
                        this.musicSound = null;
                     }
               }
            }
            this.setVolume(this.getVolume());
         }
      }
      
      public function setFade(param1:Number, param2:Number) : void
      {
         this.fadeToTarget = param1;
         this.fadeSpeed = (this.fadeToTarget - this.fadeCurrent) / param2;
      }
      
      public function pause() : void
      {
         if(++this.pauseCount == 1)
         {
            if(this.defaultFadeTime <= 0)
            {
               if(this.musicChannel != null)
               {
                  this.pausePosition = this.musicChannel.position;
                  this.musicChannel.stop();
                  this.musicChannel = null;
               }
            }
            else
            {
               this.fadeAction = FADE_TO_PAUSE;
               this.setFade(0,this.defaultFadeTime);
            }
         }
      }
      
      public function resume() : void
      {
         if(--this.pauseCount == 0)
         {
            if(this.defaultFadeTime <= 0)
            {
               if(this.musicSound != null)
               {
                  this.musicChannel = this.musicSound.play(this.pausePosition,999999);
                  this.setVolume(this.getVolume());
               }
            }
            else
            {
               if(this.musicSound != null)
               {
                  this.musicChannel = this.musicSound.play(this.pausePosition,999999);
                  this.setVolume(this.getVolume());
               }
               this.setFade(1,this.defaultFadeTime);
            }
         }
      }
      
      public function setVolume(param1:Number) : void
      {
         this.volume = param1;
         if(this.musicChannel != null)
         {
            this.musicChannel.soundTransform = new SoundTransform(this.volume * this.fadeCurrent);
         }
      }
      
      public function play(param1:Sound) : void
      {
         if(this.defaultFadeTime > 0)
         {
            this.setFade(1,this.defaultFadeTime);
         }
         if(this.musicChannel != null)
         {
            this.musicChannel.stop();
            this.musicChannel = null;
            this.musicSound = null;
         }
         this.musicSound = param1;
         this.musicChannel = param1.play(0,99999);
         this.setVolume(this.getVolume());
      }
      
      public function stop() : void
      {
         if(this.defaultFadeTime > 0)
         {
            this.setFade(0,this.defaultFadeTime);
            this.fadeAction = FADE_TO_STOP;
         }
         else if(this.musicChannel != null)
         {
            this.musicChannel.stop();
            this.musicChannel = null;
            this.musicSound = null;
         }
      }
      
      public function getVolume() : Number
      {
         return this.volume;
      }
      
      public function isPlaying() : Boolean
      {
         return this.musicChannel != null;
      }
      
      public function setFadeTime(param1:Number) : void
      {
         this.defaultFadeTime = param1;
      }
      
      public function GetChannelIsPlaying(param1:int) : Boolean
      {
         return this._soundChannels[param1] != null;
      }
      
      public function SetChannelVolume(param1:int, param2:Number) : void
      {
         this._channelVolumes[param1] = param2;
         if(this._soundChannels[param1] != null)
         {
            this._soundChannels[param1].soundTransform = new SoundTransform(param2);
         }
      }
      
      public function PlaySoundOnChannel(param1:int, param2:Sound, param3:Number, param4:Boolean = false) : void
      {
         if(this._soundChannels[param1] != null)
         {
            if(this._channelListeners[param1])
            {
               this._soundChannels[param1].removeEventListener(Event.SOUND_COMPLETE,this.SoundChannelComplete);
               this._channelListeners[param1] = false;
            }
            this._soundChannels[param1].stop();
            this._soundChannels[param1] = null;
            this._channelSounds[param1] = null;
         }
         this._channelSounds[param1] = param2;
         if(param4)
         {
            this._soundChannels[param1] = param2.play(0,999999);
         }
         else
         {
            this._soundChannels[param1] = param2.play();
            this._soundChannels[param1].addEventListener(Event.SOUND_COMPLETE,this.SoundChannelComplete);
            this._channelListeners[param1] = true;
         }
         if(this._soundChannels[param1] != null)
         {
            this._soundChannels[param1].soundTransform = new SoundTransform(param3);
         }
      }
      
      public function StopSoundOnChannel(param1:int) : void
      {
         if(this._soundChannels[param1] != null)
         {
            if(this._channelListeners[param1])
            {
               this._soundChannels[param1].removeEventListener(Event.SOUND_COMPLETE,this.SoundChannelComplete);
               this._channelListeners[param1] = false;
            }
            this._soundChannels[param1].stop();
            this._soundChannels[param1] = null;
            this._channelSounds[param1] = null;
         }
      }
      
      private function SoundChannelComplete(param1:Event) : void
      {
         var _loc2_:SoundChannel = param1.currentTarget as SoundChannel;
         var _loc3_:int = 0;
         while(_loc3_ < NUM_AUDIO_CHANNELS)
         {
            if(_loc2_ == this._soundChannels[_loc3_])
            {
               this._soundChannels[_loc3_].removeEventListener(Event.SOUND_COMPLETE,this.SoundChannelComplete);
               this._channelListeners[_loc3_] = false;
               if(this._soundChannels[_loc3_] != null)
               {
                  this._soundChannels[_loc3_].stop();
                  this._soundChannels[_loc3_] = null;
                  this._channelSounds[_loc3_] = null;
               }
            }
            _loc3_++;
         }
      }
   }
}
