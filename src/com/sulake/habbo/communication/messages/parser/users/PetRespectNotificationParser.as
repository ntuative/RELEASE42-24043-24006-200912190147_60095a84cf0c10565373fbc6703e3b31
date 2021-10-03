package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1698:int;
      
      private var var_1098:PetData;
      
      private var var_1699:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1698;
      }
      
      public function get petData() : PetData
      {
         return var_1098;
      }
      
      public function flush() : Boolean
      {
         var_1098 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1699;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1698 = param1.readInteger();
         var_1699 = param1.readInteger();
         var_1098 = new PetData(param1);
         return true;
      }
   }
}
