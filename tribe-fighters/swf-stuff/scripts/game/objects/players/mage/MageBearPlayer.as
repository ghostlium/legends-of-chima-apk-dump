package game.objects.players.mage
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerBolt;
   
   public class MageBearPlayer extends Player
   {
       
      
      public function MageBearPlayer()
      {
         super(GameConsts.eIceChima,GameRes.get()._pIcePlayerCharSet,"player_bear_mage");
         setClassType(GameConsts.eChimaMageClass);
         setAnimal(ePlayerAnimalBear);
         setClassStr("mage");
         setTribeStr("bear");
         getController().setFireOnFrame(4);
         addChimaPower(new ChimaPowerBolt());
         setSaveSlot(SaveData.ePlayerCharMageBearSlot);
         setEnableShadow(true);
      }
   }
}
