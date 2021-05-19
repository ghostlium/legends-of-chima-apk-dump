package game
{
   public class CharSaveData
   {
       
      
      public var upgradeLevel:uint;
      
      public var unused1:uint;
      
      public var unused2:uint;
      
      public var unlocked:Boolean;
      
      public var highestScore:uint;
      
      public var highestStudsCollected:uint;
      
      public var highestDistanceTravelled:uint;
      
      public function CharSaveData()
      {
         super();
      }
      
      public function CreateFromCharData(param1:CharData) : void
      {
         this.upgradeLevel = param1.upgradeLevel;
         this.unused1 = param1.unused1;
         this.unused2 = param1.unused2;
         this.unlocked = param1.unlocked;
         this.highestScore = param1.highestScore;
         this.highestStudsCollected = param1.highestStudsCollected;
         this.highestDistanceTravelled = param1.highestDistanceTravelled;
      }
      
      public function CreateFromSaveDataObject(param1:Object) : void
      {
         this.upgradeLevel = param1.upgradeLevel;
         this.unused1 = param1.unused1;
         this.unused2 = param1.unused2;
         this.unlocked = param1.unlocked;
         this.highestScore = param1.highestScore;
         this.highestStudsCollected = param1.highestStudsCollected;
         this.highestDistanceTravelled = param1.highestDistanceTravelled;
      }
      
      public function FillOutCharDataFromSave(param1:CharData) : void
      {
         param1.upgradeLevel = this.upgradeLevel;
         param1.unused1 = this.unused1;
         param1.unused2 = this.unused2;
         param1.unlocked = this.unlocked;
         param1.highestScore = this.highestScore;
         param1.highestStudsCollected = this.highestStudsCollected;
         param1.highestDistanceTravelled = this.highestDistanceTravelled;
      }
   }
}
