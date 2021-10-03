package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_521:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_558:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_621:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_1614:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         var_1614 = param2;
      }
      
      public function get effectType() : int
      {
         return var_1614;
      }
   }
}
