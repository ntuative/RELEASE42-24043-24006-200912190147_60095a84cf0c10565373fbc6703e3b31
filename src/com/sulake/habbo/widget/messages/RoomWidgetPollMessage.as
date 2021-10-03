package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPollMessage extends RoomWidgetMessage
   {
      
      public static const const_557:String = "RWPM_START";
      
      public static const ANSWER:String = "RWPM_ANSWER";
      
      public static const const_384:String = "RWPM_REJECT";
       
      
      private var var_1110:int = 0;
      
      private var var_1835:Array = null;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollMessage(param1:String, param2:int)
      {
         _id = param2;
         super(param1);
      }
      
      public function get questionId() : int
      {
         return var_1110;
      }
      
      public function set questionId(param1:int) : void
      {
         var_1110 = param1;
      }
      
      public function set answers(param1:Array) : void
      {
         var_1835 = param1;
      }
      
      public function get answers() : Array
      {
         return var_1835;
      }
      
      public function get id() : int
      {
         return _id;
      }
   }
}
