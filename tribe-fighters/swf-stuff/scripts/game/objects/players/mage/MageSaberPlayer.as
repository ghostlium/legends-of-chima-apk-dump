package game.objects.players.mage
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerBolt;
   
   public class MageSaberPlayer extends Player
   {
       
      
      public function MageSaberPlayer()
      {
         super(GameConsts.eIceChima,GameRes.get()._pIcePlayerCharSet,"player_saber_mage");
         setClassType(GameConsts.eChimaMageClass);
         setAnimal(ePlayerAnimalSaber);
         setClassStr("mage");
         setTribeStr("saber");
         getController().setFireOnFrame(4);
         addChimaPower(new ChimaPowerBolt());
         setSaveSlot(SaveData.ePlayerCharMageSaberSlot);
         setEnableShadow(true);
      }
   }
}
