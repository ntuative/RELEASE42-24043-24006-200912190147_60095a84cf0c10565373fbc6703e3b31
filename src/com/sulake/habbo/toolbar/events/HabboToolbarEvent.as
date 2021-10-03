package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_77:String = "HTE_INITIALIZED";
      
      public static const const_58:String = "HTE_TOOLBAR_CLICK";
      
      public static const TOOLBAR_ORIENTATION:String = "HTE_TOOLBAR_ORIENTATION";
       
      
      private var var_438:String;
      
      private var var_699:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set orientation(param1:String) : void
      {
         var_438 = param1;
      }
      
      public function get iconId() : String
      {
         return var_699;
      }
      
      public function get orientation() : String
      {
         return var_438;
      }
      
      public function set iconId(param1:String) : void
      {
         var_699 = param1;
      }
   }
}
