package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_223:String = "RWFAM_MOVE";
      
      public static const const_633:String = "RWFUAM_ROTATE";
      
      public static const const_655:String = "RWFAM_PICKUP";
       
      
      private var var_1809:int = 0;
      
      private var var_1836:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1809 = param2;
         var_1836 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1809;
      }
      
      public function get furniCategory() : int
      {
         return var_1836;
      }
   }
}
