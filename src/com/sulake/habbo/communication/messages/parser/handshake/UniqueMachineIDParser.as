package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UniqueMachineIDParser implements IMessageParser
   {
       
      
      private var var_860:String;
      
      public function UniqueMachineIDParser()
      {
         super();
         var_860 = "";
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_860 = param1.readString();
         return true;
      }
      
      public function get machineID() : String
      {
         return var_860;
      }
      
      public function flush() : Boolean
      {
         var_860 = "";
         return true;
      }
   }
}
