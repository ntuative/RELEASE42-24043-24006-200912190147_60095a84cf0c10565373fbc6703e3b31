package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_218:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2058:Boolean = false;
      
      private var var_2059:int = 0;
      
      private var var_2057:int = 0;
      
      private var var_2060:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_218,param5,param6);
         var_2060 = param1;
         var_2057 = param2;
         var_2059 = param3;
         var_2058 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_2059;
      }
      
      public function get periodsLeft() : int
      {
         return var_2057;
      }
      
      public function get daysLeft() : int
      {
         return var_2060;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2058;
      }
   }
}
