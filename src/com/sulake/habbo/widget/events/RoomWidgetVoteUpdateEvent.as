package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_123:String = "RWPUE_VOTE_RESULT";
      
      public static const const_129:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1060:int;
      
      private var var_998:String;
      
      private var var_627:Array;
      
      private var var_880:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_998 = param2;
         var_880 = param3;
         var_627 = param4;
         if(var_627 == null)
         {
            var_627 = [];
         }
         var_1060 = param5;
      }
      
      public function get votes() : Array
      {
         return var_627.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1060;
      }
      
      public function get question() : String
      {
         return var_998;
      }
      
      public function get choices() : Array
      {
         return var_880.slice();
      }
   }
}
