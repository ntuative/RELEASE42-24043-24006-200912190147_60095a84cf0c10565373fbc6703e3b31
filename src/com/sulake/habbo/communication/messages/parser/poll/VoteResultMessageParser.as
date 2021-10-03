package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1060:int;
      
      private var var_998:String;
      
      private var var_627:Array;
      
      private var var_880:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_627.slice();
      }
      
      public function flush() : Boolean
      {
         var_998 = "";
         var_880 = [];
         var_627 = [];
         var_1060 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1060;
      }
      
      public function get question() : String
      {
         return var_998;
      }
      
      public function get choices() : Array
      {
         return var_880.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_998 = param1.readString();
         var_880 = [];
         var_627 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_880.push(param1.readString());
            var_627.push(param1.readInteger());
            _loc3_++;
         }
         var_1060 = param1.readInteger();
         return true;
      }
   }
}
