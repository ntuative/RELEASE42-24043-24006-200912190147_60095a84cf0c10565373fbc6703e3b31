package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1641:int;
      
      private var var_1640:int = 0;
      
      private var var_1643:String;
      
      private var var_1644:int;
      
      private var var_1642:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1641 = param1;
         var_1644 = param2;
         var_1642 = param3;
         var_1643 = param4;
      }
      
      public function get length() : int
      {
         return var_1644;
      }
      
      public function get name() : String
      {
         return var_1642;
      }
      
      public function get creator() : String
      {
         return var_1643;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1640;
      }
      
      public function get id() : int
      {
         return var_1641;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1640 = param1;
      }
   }
}
