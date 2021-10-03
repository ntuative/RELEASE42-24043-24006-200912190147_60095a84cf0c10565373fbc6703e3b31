package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1689:String;
      
      private var var_511:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_511 = param1;
         var_1689 = param2;
      }
      
      public function get race() : String
      {
         return var_1689;
      }
      
      public function get figure() : String
      {
         return var_511;
      }
   }
}
