package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1416:int;
      
      private var var_1415:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1416;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1416 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1416 = this.var_1416;
         _loc1_.var_1415 = this.var_1415;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1415 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1415;
      }
   }
}
