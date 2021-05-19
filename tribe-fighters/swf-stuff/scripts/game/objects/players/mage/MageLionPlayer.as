package game.objects.players.mage
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerBolt;
   
   public class MageLionPlayer extends Player
   {
       
      
      public function MageLionPlayer()
      {
         super(GameConsts.eFireChima,GameRes.get()._pFirePlayerCharSet,"player_lion_mage");
         setClassType(GameConsts.eChimaMageClass);
         setAnimal(ePlayerAnimalLion);
         setClassStr("mage");
         setTribeStr("lion");
         getController().setFireOnFrame(4);
         addChimaPower(new ChimaPowerBolt());
         setSaveSlot(SaveData.ePlayerCharMageLionSlot);
         setEnableShadow(true);
      }
   }
}
