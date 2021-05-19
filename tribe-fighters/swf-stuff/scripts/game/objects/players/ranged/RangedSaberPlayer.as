package game.objects.players.ranged
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerBomb;
   
   public class RangedSaberPlayer extends Player
   {
       
      
      public function RangedSaberPlayer()
      {
         super(GameConsts.eIceChima,GameRes.get()._pIcePlayerCharSet,"player_saber_ranged");
         setClassType(GameConsts.eChimaRangedClass);
         setAnimal(ePlayerAnimalSaber);
         setClassStr("ranged");
         setTribeStr("saber");
         getController().setFireOnFrame(10);
         addChimaPower(new ChimaPowerBomb());
         setSaveSlot(SaveData.ePlayerCharRangedSaberSlot);
         setEnableShadow(true);
      }
   }
}
