package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_121:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1554:int;
      
      private var var_401:int;
      
      private var var_674:RoomData;
      
      private var var_1553:int;
      
      private var _ownerName:String;
      
      private var var_1555:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_401 = param1.readInteger();
         var_1554 = param1.readInteger();
         var_1555 = param1.readBoolean();
         var_1553 = param1.readInteger();
         _ownerName = param1.readString();
         var_121 = new RoomData(param1);
         var_674 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1554;
      }
      
      public function get event() : RoomData
      {
         return var_674;
      }
      
      public function get room() : RoomData
      {
         return var_121;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_121 != null)
         {
            var_121.dispose();
            var_121 = null;
         }
         if(var_674 != null)
         {
            var_674.dispose();
            var_674 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_401;
      }
      
      public function get ownerId() : int
      {
         return var_1553;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_1555;
      }
   }
}
