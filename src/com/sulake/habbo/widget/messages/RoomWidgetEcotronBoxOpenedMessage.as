package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1330:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1204:int;
      
      private var var_994:String;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_994 = param2;
         var_1204 = param3;
      }
      
      public function get classId() : int
      {
         return var_1204;
      }
      
      public function get itemType() : String
      {
         return var_994;
      }
   }
}
