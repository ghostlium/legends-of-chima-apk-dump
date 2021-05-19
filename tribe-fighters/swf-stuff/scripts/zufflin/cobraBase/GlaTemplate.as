package zufflin.cobraBase
{
   import flash.utils.Dictionary;
   import zufflin.core.StringHash;
   
   public class GlaTemplate
   {
       
      
      public var name:String;
      
      public var nameHash:StringHash;
      
      public var vTypes:Dictionary;
      
      public function GlaTemplate()
      {
         super();
         this.nameHash = new StringHash();
         this.vTypes = new Dictionary();
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function getNameHash() : StringHash
      {
         return this.nameHash;
      }
      
      public function dispose() : void
      {
         this.name = null;
         this.nameHash = null;
         this.vTypes = null;
      }
   }
}
