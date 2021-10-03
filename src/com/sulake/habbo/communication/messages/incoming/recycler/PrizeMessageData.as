package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeMessageData
   {
       
      
      private var var_1486:int;
      
      private var var_1918:String;
      
      public function PrizeMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1918 = param1.readString();
         var_1486 = param1.readInteger();
      }
      
      public function get productItemTypeId() : int
      {
         return var_1486;
      }
      
      public function get productItemType() : String
      {
         return var_1918;
      }
   }
}
