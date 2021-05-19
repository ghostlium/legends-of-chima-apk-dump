package game.objects.players.warrior
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerVortex;
   
   public class WarriorBearPlayer extends Player
   {
       
      
      public function WarriorBearPlayer()
      {
         super(GameConsts.eIceChima,GameRes.get()._pIcePlayerCharSet,"player_bear_warrior");
         setClassType(GameConsts.eChimaWarriorClass);
         setAnimal(ePlayerAnimalBear);
         setClassStr("warrior");
         setTribeStr("bear");
         getController().setFireOnFrame(7);
         addChimaPower(new ChimaPowerVortex());
         setSaveSlot(SaveData.ePlayerCharWarriorBearSlot);
         setEnableShadow(true);
      }
   }
}
