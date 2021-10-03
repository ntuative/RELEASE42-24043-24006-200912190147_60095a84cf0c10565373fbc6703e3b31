package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_775:String = "inventory_badges";
      
      public static const const_1167:String = "inventory_clothes";
      
      public static const const_1313:String = "inventory_furniture";
      
      public static const const_638:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_917:String = "inventory_effects";
       
      
      private var var_1527:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_638);
         var_1527 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1527;
      }
   }
}
