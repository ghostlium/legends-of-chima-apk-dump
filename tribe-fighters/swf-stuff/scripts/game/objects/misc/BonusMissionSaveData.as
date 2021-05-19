package game.objects.misc
{
   public class BonusMissionSaveData
   {
       
      
      public var bonusMissionName:String;
      
      public var bonusType:uint;
      
      public var singleRun:Boolean;
      
      public var chimatribe:String;
      
      public var chimaclass:String;
      
      public var currValue:uint;
      
      public var targetValue:uint;
      
      public var missionLevel:uint;
      
      public var missionLevelMultiplier:uint;
      
      public var missionLevelIncrement:uint;
      
      public var languageString:String;
      
      public var completed:Boolean;
      
      public var reward:uint;
      
      public var countdown:uint;
      
      public function BonusMissionSaveData()
      {
         super();
      }
      
      public function CreateFromSaveDataObject(param1:Object) : void
      {
         this.bonusMissionName = param1.bonusMissionName;
         this.bonusType = param1.bonusType;
         this.singleRun = param1.singleRun;
         this.chimatribe = param1.chimatribe;
         this.chimaclass = param1.chimaclass;
         this.currValue = param1.currValue;
         this.targetValue = param1.targetValue;
         this.missionLevel = param1.missionLevel;
         this.missionLevelMultiplier = param1.missionLevelMultiplier;
         this.missionLevelIncrement = param1.missionLevelIncrement;
         this.languageString = param1.languageString;
         this.completed = param1.completed;
         this.reward = param1.reward;
         this.countdown = param1.countdown;
      }
      
      public function CreateFromBonusMission(param1:BonusMission) : void
      {
         this.bonusMissionName = param1.bonusMissionName;
         this.bonusType = param1.bonusType;
         this.singleRun = param1.singleRun;
         this.chimatribe = param1.chimatribe;
         this.chimaclass = param1.chimaclass;
         this.currValue = param1.currValue;
         this.targetValue = param1.targetValue;
         this.missionLevel = param1.missionLevel;
         this.missionLevelMultiplier = param1.missionLevelMultiplier;
         this.missionLevelIncrement = param1.missionLevelIncrement;
         this.languageString = param1.languageString;
         this.completed = param1.completed;
         this.reward = param1.reward;
         this.countdown = param1.countdown;
      }
      
      public function FillOutBonusMissionFrom(param1:BonusMission) : void
      {
         param1.bonusMissionName = this.bonusMissionName;
         param1.bonusType = this.bonusType;
         param1.singleRun = this.singleRun;
         param1.chimatribe = this.chimatribe;
         param1.chimaclass = this.chimaclass;
         param1.currValue = this.currValue;
         param1.targetValue = this.targetValue;
         param1.missionLevel = this.missionLevel;
         param1.missionLevelMultiplier = this.missionLevelMultiplier;
         param1.missionLevelIncrement = this.missionLevelIncrement;
         param1.languageString = this.languageString;
         param1.completed = this.completed;
         param1.reward = this.reward;
         param1.countdown = this.countdown;
      }
   }
}
