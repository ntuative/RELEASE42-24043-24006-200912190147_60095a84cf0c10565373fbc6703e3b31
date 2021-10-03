package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_628:String;
      
      private var var_1911:int;
      
      private var var_1312:Boolean;
      
      private var _roomId:int;
      
      private var var_1910:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1312 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_628 = param1.readString();
         var_1910 = param1.readInteger();
         var_1911 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1312;
      }
      
      public function get roomName() : String
      {
         return var_628;
      }
      
      public function get enterMinute() : int
      {
         return var_1911;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1910;
      }
   }
}
