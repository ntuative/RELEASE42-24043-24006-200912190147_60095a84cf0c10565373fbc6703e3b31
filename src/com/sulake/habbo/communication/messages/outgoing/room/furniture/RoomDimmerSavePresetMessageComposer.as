package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1611:int;
      
      private var var_1610:int;
      
      private var var_2152:Boolean;
      
      private var var_2151:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2153:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1610 = param1;
         var_1611 = param2;
         var_2151 = param3;
         var_2153 = param4;
         var_2152 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1610,var_1611,var_2151,var_2153,int(var_2152)];
      }
      
      public function dispose() : void
      {
      }
   }
}
