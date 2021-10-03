package com.sulake.habbo.communication.messages.outgoing.marketplace
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetOffersMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_40:Array;
      
      public function GetOffersMessageComposer(param1:String, param2:int)
      {
         var_40 = new Array();
         super();
         var_40.push(param2);
         var_40.push(param1);
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return this.var_40;
      }
      
      public function dispose() : void
      {
         this.var_40 = null;
      }
   }
}
