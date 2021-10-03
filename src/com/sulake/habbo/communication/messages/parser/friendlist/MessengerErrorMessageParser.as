package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MessengerErrorMessageParser implements IMessageParser
   {
       
      
      private var var_1108:int;
      
      private var var_2238:int;
      
      public function MessengerErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2238 = param1.readInteger();
         this.var_1108 = param1.readInteger();
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1108;
      }
      
      public function get clientMessageId() : int
      {
         return this.var_2238;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
