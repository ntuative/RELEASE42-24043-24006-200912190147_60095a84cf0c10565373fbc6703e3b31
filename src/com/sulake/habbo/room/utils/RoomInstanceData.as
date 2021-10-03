package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_823:LegacyWallGeometry = null;
      
      private var var_567:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_566:TileHeightMap = null;
      
      private var var_2027:String = null;
      
      private var _roomId:int = 0;
      
      private var var_822:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_823 = new LegacyWallGeometry();
         var_822 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_566 != null)
         {
            var_566.dispose();
         }
         var_566 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2027 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_823;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_822;
      }
      
      public function dispose() : void
      {
         if(var_566 != null)
         {
            var_566.dispose();
            var_566 = null;
         }
         if(var_823 != null)
         {
            var_823.dispose();
            var_823 = null;
         }
         if(var_822 != null)
         {
            var_822.dispose();
            var_822 = null;
         }
         if(var_567 != null)
         {
            var_567.dispose();
            var_567 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_566;
      }
      
      public function get worldType() : String
      {
         return var_2027;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_567 != null)
         {
            var_567.dispose();
         }
         var_567 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_567;
      }
   }
}
