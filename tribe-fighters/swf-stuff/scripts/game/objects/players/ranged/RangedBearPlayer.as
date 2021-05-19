package game.objects.players.ranged
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerBomb;
   
   public class RangedBearPlayer extends Player
   {
       
      
      public function RangedBearPlayer()
      {
         super(GameConsts.eIceChima,GameRes.get()._pIcePlayerCharSet,"player_bear_ranged");
         setClassType(GameConsts.eChimaRangedClass);
         setAnimal(ePlayerAnimalBear);
         setClassStr("ranged");
         setTribeStr("bear");
         getController().setFireOnFrame(10);
         addChimaPower(new ChimaPowerBomb());
         setSaveSlot(SaveData.ePlayerCharRangedBearSlot);
         setEnableShadow(true);
      }
   }
}
