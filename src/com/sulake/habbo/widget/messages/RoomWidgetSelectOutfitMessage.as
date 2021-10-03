package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_933:String = "select_outfit";
       
      
      private var var_2002:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_933);
         var_2002 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2002;
      }
   }
}
