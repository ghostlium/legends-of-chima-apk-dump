package game.objects.flags
{
   import game.GameRes;
   import game.GameWorld;
   import game.objects.GameObject;
   import game.objects.Player;
   import game.objects.events.EventPlayerFlagCollected;
   import util.Random;
   import util.Vec2F;
   import zufflin.cobraBase.GlaSet;
   
   public class FlagGenerator extends GameObject
   {
      
      private static var tribes:Vector.<Vector.<String>> = new <Vector.<String>>[new <String>["croc","lion"],new <String>["bear","saber"]];
       
      
      public var _side:int;
      
      public var _pCurrSet:GlaSet;
      
      public var _bCanGenerate:Boolean;
      
      public var _currTribe:String;
      
      public var _uCurrPiece:uint;
      
      public var _uNumPiecesForFlag:uint;
      
      public function FlagGenerator(param1:int)
      {
         super();
         this.setSide(param1);
      }
      
      public function canGenerate() : Boolean
      {
         return this._bCanGenerate;
      }
      
      public function reset() : void
      {
         this._bCanGenerate = true;
         this._uCurrPiece = 0;
         var _loc1_:Vector.<GlaSet> = new Vector.<GlaSet>(2,true);
         _loc1_[0] = GameRes.get()._pFireFlagsSet;
         _loc1_[1] = GameRes.get()._pIceFlagsSet;
         var _loc2_:Vector.<String> = tribes[this._side];
         this._currTribe = _loc2_[Random.RandomNumberRange(0,10000) % 2];
         this._pCurrSet = _loc1_[this._side];
         this._uNumPiecesForFlag = this.countPiecesForTribe(this._currTribe);
         if(GameWorld.get().getHUD() != null)
         {
            GameWorld.get().getHUD().getFlagBuilder().setTribe(this._pCurrSet,this._currTribe,this._uNumPiecesForFlag,this._side);
         }
      }
      
      public function setSide(param1:int) : void
      {
         this._side = param1;
         this.reset();
      }
      
      public function pieceDestroyed() : void
      {
         this._bCanGenerate = true;
      }
      
      public function piecePickedUp() : void
      {
         var _loc1_:Player = null;
         GameWorld.get().getHUD().getFlagBuilder().piecePickedUp(this._uCurrPiece);
         this._bCanGenerate = true;
         ++this._uCurrPiece;
         if(this._uCurrPiece >= this._uNumPiecesForFlag)
         {
            _loc1_ = GameWorld.get().getPlayer();
            if(_loc1_ != null)
            {
               _loc1_.addNewFollower(this._currTribe);
            }
            Main.Instance().m_app.dispatchEvent(new EventPlayerFlagCollected(EventPlayerFlagCollected.EVENT_PLAYER_FLAG_COLLECTED,false));
            this.reset();
         }
      }
      
      public function getNewFlagPiece(param1:Vec2F) : FlagPiece
      {
         var _loc3_:String = null;
         var _loc2_:FlagPiece = null;
         if(this._bCanGenerate)
         {
            _loc3_ = "flag_" + this._currTribe + "_piece" + this._uCurrPiece.toString();
            _loc2_ = new FlagPiece(this._side,param1,this._pCurrSet,_loc3_);
            this._bCanGenerate = false;
         }
         return _loc2_;
      }
      
      public function countPiecesForTribe(param1:String) : uint
      {
         var _loc4_:* = null;
         var _loc2_:Boolean = true;
         var _loc3_:uint = 0;
         while(_loc2_)
         {
            _loc4_ = "flag_" + param1 + "_piece" + _loc3_.toString() + "_static";
            if(this._pCurrSet.findScene(_loc4_) != null)
            {
               _loc3_++;
            }
            else
            {
               _loc2_ = false;
            }
         }
         return _loc3_;
      }
   }
}
