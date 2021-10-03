package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2131:int;
      
      private var var_2156:Boolean;
      
      private var var_1641:int;
      
      private var var_2158:String;
      
      private var var_2154:Boolean = false;
      
      private var var_2155:int;
      
      private var var_418:int;
      
      private var var_994:String;
      
      private var var_1842:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1204:int;
      
      private var var_2159:Boolean;
      
      private var var_2157:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_2131 = param1;
         var_994 = param2;
         _objId = param3;
         var_1204 = param4;
         var_2158 = param5;
         var_2156 = param6;
         var_2159 = param7;
         var_2155 = param8;
         var_1842 = param9;
         var_1641 = param10;
         var_418 = -1;
      }
      
      public function get songId() : int
      {
         return var_1641;
      }
      
      public function get iconCallbackId() : int
      {
         return var_418;
      }
      
      public function get method_4() : int
      {
         return var_2155;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2157 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2154 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_418 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2159;
      }
      
      public function get slotId() : String
      {
         return var_1842;
      }
      
      public function get classId() : int
      {
         return var_1204;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2156;
      }
      
      public function get stuffData() : String
      {
         return var_2158;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_2131;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2154;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2157;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_994;
      }
   }
}
