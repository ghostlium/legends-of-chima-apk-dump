package game.objects.players.ranged
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerBomb;
   
   public class RangedLionPlayer extends Player
   {
       
      
      public function RangedLionPlayer()
      {
         super(GameConsts.eFireChima,GameRes.get()._pFirePlayerCharSet,"player_lion_ranged");
         setClassType(GameConsts.eChimaRangedClass);
         setAnimal(ePlayerAnimalLion);
         setClassStr("ranged");
         setTribeStr("lion");
         getController().setFireOnFrame(10);
         addChimaPower(new ChimaPowerBomb());
         setSaveSlot(SaveData.ePlayerCharRangedLionSlot);
         setEnableShadow(true);
      }
   }
}
