package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_623:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_471:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_623);
         var_471 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_471;
      }
   }
}
