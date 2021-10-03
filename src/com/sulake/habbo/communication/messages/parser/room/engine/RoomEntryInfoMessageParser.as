package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1552:int;
      
      private var var_400:Boolean;
      
      private var var_1551:Boolean;
      
      private var var_715:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1551 = param1.readBoolean();
         if(var_1551)
         {
            var_1552 = param1.readInteger();
            var_400 = param1.readBoolean();
         }
         else
         {
            var_715 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_715 != null)
         {
            var_715.dispose();
            var_715 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1552;
      }
      
      public function get owner() : Boolean
      {
         return var_400;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1551;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_715;
      }
   }
}
