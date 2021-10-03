package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1693:int;
      
      private var var_511:String;
      
      private var var_1695:int;
      
      private var var_1698:int;
      
      private var var_1688:int;
      
      private var var_2110:int;
      
      private var _nutrition:int;
      
      private var var_1230:int;
      
      private var var_2112:int;
      
      private var var_2113:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1553:int;
      
      private var var_2111:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1695;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2110;
      }
      
      public function flush() : Boolean
      {
         var_1230 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2112;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2113;
      }
      
      public function get maxNutrition() : int
      {
         return var_2111;
      }
      
      public function get figure() : String
      {
         return var_511;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1698;
      }
      
      public function get petId() : int
      {
         return var_1230;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1230 = param1.readInteger();
         _name = param1.readString();
         var_1695 = param1.readInteger();
         var_2112 = param1.readInteger();
         var_1688 = param1.readInteger();
         var_2113 = param1.readInteger();
         _energy = param1.readInteger();
         var_2110 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2111 = param1.readInteger();
         var_511 = param1.readString();
         var_1698 = param1.readInteger();
         var_1553 = param1.readInteger();
         var_1693 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1688;
      }
      
      public function get ownerId() : int
      {
         return var_1553;
      }
      
      public function get age() : int
      {
         return var_1693;
      }
   }
}
