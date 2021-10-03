package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1897:Number = 1;
      
      private var var_191:Number = 1;
      
      private var var_2027:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2027 = param1;
         var_191 = param2;
         var_1897 = param3;
      }
      
      public function get scale() : Number
      {
         return var_191;
      }
      
      public function get heightScale() : Number
      {
         return var_1897;
      }
   }
}
