package game.objects.players.warrior
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerVortex;
   
   public class WarriorSaberPlayer extends Player
   {
       
      
      public function WarriorSaberPlayer()
      {
         super(GameConsts.eIceChima,GameRes.get()._pIcePlayerCharSet,"player_saber_warrior");
         setClassType(GameConsts.eChimaWarriorClass);
         setAnimal(ePlayerAnimalSaber);
         setClassStr("warrior");
         setTribeStr("saber");
         getController().setFireOnFrame(7);
         addChimaPower(new ChimaPowerVortex());
         setSaveSlot(SaveData.ePlayerCharWarriorSaberSlot);
         setEnableShadow(true);
      }
   }
}
