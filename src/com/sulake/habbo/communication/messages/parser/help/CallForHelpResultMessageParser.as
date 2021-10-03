package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CallForHelpResultMessageParser implements IMessageParser
   {
       
      
      private var var_1158:int;
      
      public function CallForHelpResultMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_1158 = -1;
         return true;
      }
      
      public function get resultType() : int
      {
         return var_1158;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1158 = param1.readInteger();
         return true;
      }
   }
}
