package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomsData implements IDisposable, MsgWithRequestId
   {
       
      
      private var var_1265:Array;
      
      private var _disposed:Boolean;
      
      private var var_688:Array;
      
      public function OfficialRoomsData(param1:IMessageDataWrapper)
      {
         var _loc6_:* = null;
         var_1265 = new Array();
         var_688 = new Array();
         super();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1265.push(new NavigationNodeData(param1.readInteger(),param1.readString()));
            _loc3_++;
         }
         var _loc4_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = new OfficialRoomEntryData(_loc5_,param1);
            var_688.push(_loc6_);
            if(_loc6_.type == OfficialRoomEntryData.const_958)
            {
               var_1265.push(new NavigationNodeData(_loc6_.flatCategoryId,_loc6_.popupCaption));
            }
            _loc5_++;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1265;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_688 != null)
         {
            for each(_loc1_ in var_688)
            {
               _loc1_.dispose();
            }
         }
         var_688 = null;
      }
      
      public function get entries() : Array
      {
         return var_688;
      }
   }
}
