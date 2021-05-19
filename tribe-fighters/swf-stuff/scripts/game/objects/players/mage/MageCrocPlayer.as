package game.objects.players.mage
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerBolt;
   
   public class MageCrocPlayer extends Player
   {
       
      
      public function MageCrocPlayer()
      {
         super(GameConsts.eFireChima,GameRes.get()._pFirePlayerCharSet,"player_croc_mage");
         setClassType(GameConsts.eChimaMageClass);
         setAnimal(ePlayerAnimalCroc);
         setClassStr("mage");
         setTribeStr("croc");
         getController().setFireOnFrame(4);
         addChimaPower(new ChimaPowerBolt());
         setSaveSlot(SaveData.ePlayerCharMageCrocSlot);
         setEnableShadow(true);
      }
   }
}
