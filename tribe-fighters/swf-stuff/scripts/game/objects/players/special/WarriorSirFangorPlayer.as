package game.objects.players.special
{
   import game.GameConsts;
   import game.GameRes;
   import game.SaveData;
   import game.objects.Player;
   import game.objects.powers.ChimaPowerVortex;
   
   public class WarriorSirFangorPlayer extends Player
   {
       
      
      public function WarriorSirFangorPlayer()
      {
         super(GameConsts.eIceChima,GameRes.get()._pIcePlayerCharSet,"player_sirfangor_warrior");
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
