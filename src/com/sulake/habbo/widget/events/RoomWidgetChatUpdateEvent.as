package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_119:int = 1;
      
      public static const const_256:int = 4;
      
      public static const const_225:int = 3;
      
      public static const const_113:int = 0;
      
      public static const const_534:String = "RWCUE_EVENT_CHAT";
      
      public static const const_100:int = 2;
       
      
      private var var_1736:int;
      
      private var var_195:String = "";
      
      private var var_1734:BitmapData;
      
      private var _userName:String;
      
      private var var_1150:int = 0;
      
      private var var_1738:uint;
      
      private var _userId:int = 0;
      
      private var _roomCategory:int;
      
      private var var_1735:Number;
      
      private var var_1737:Number;
      
      private var _roomId:int;
      
      public function RoomWidgetChatUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Number, param7:Number, param8:BitmapData, param9:uint, param10:int, param11:int, param12:int = 0, param13:Boolean = false, param14:Boolean = false)
      {
         super(param1,param13,param14);
         _userId = param2;
         var_195 = param3;
         var_1150 = param12;
         _userName = param4;
         var_1736 = param5;
         var_1735 = param6;
         var_1737 = param7;
         var_1734 = param8;
         var_1738 = param9;
         _roomId = param10;
         _roomCategory = param11;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get userImage() : BitmapData
      {
         return var_1734;
      }
      
      public function get text() : String
      {
         return var_195;
      }
      
      public function get userX() : Number
      {
         return var_1735;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get userCategory() : int
      {
         return var_1736;
      }
      
      public function get chatType() : int
      {
         return var_1150;
      }
      
      public function get userColor() : uint
      {
         return var_1738;
      }
      
      public function get userY() : Number
      {
         return var_1737;
      }
   }
}
