package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_994:int;
      
      private var var_1241:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_994 = param1;
         var_1241 = param2;
      }
      
      public function get itemType() : int
      {
         return var_994;
      }
      
      public function get itemName() : String
      {
         return var_1241;
      }
   }
}
