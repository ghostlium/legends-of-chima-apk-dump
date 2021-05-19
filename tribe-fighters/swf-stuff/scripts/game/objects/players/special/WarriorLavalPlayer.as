package game.objects.players.special
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerVortex;
   
   public class WarriorLavalPlayer extends Player
   {
       
      
      public function WarriorLavalPlayer()
      {
         super(GameConsts.eFireChima,GameRes.get()._pFirePlayerCharSet,"player_laval_warrior");
         setClassType(GameConsts.eChimaWarriorClass);
         setAnimal(ePlayerAnimalLion);
         setClassStr("warrior");
         setTribeStr("lion");
         getController().setFireOnFrame(7);
         addChimaPower(new ChimaPowerVortex());
         setSaveSlot(SaveData.ePlayerCharWarriorLionSlot);
         setEnableShadow(true);
      }
   }
}
