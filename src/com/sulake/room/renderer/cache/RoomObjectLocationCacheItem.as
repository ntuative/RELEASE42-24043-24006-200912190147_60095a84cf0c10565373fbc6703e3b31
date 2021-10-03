package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_1995:int = -1;
      
      private var var_1242:int = -1;
      
      private var var_664:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_664 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_1995;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_1995 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_664.assign(param1);
         var_664.x = Math.round(var_664.x);
         var_664.y = Math.round(var_664.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1242 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_664;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1242;
      }
   }
}
