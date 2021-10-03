package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_542:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1010:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_542);
         var_1010 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1010;
      }
   }
}
