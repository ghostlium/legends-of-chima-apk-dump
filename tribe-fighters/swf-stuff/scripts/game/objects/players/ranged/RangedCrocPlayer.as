package game.objects.players.ranged
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerBomb;
   
   public class RangedCrocPlayer extends Player
   {
       
      
      public function RangedCrocPlayer()
      {
         super(GameConsts.eFireChima,GameRes.get()._pFirePlayerCharSet,"player_croc_ranged");
         setClassType(GameConsts.eChimaRangedClass);
         setAnimal(ePlayerAnimalCroc);
         setClassStr("ranged");
         setTribeStr("croc");
         getController().setFireOnFrame(10);
         addChimaPower(new ChimaPowerBomb());
         setSaveSlot(SaveData.ePlayerCharRangedCrocSlot);
         setEnableShadow(true);
      }
   }
}
