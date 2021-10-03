package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_124:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1074:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_124);
         var_1074 = param1;
      }
      
      public function get vote() : int
      {
         return var_1074;
      }
   }
}
