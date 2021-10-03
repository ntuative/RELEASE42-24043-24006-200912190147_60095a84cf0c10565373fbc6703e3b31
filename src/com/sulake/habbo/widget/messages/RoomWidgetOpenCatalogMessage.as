package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_578:String = "RWOCM_CLUB_MAIN";
      
      public static const const_619:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_2095:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_619);
         var_2095 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_2095;
      }
   }
}
