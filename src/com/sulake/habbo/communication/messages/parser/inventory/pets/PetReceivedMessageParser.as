package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_948:PetData;
      
      private var var_1433:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1433 = param1.readBoolean();
         var_948 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1433 + ", " + var_948.id + ", " + var_948.name + ", " + pet.figure + ", " + var_948.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1433;
      }
      
      public function get pet() : PetData
      {
         return var_948;
      }
   }
}
