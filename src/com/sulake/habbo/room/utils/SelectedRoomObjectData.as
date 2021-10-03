package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_78:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_236:Vector3d = null;
      
      private var var_1723:int = 0;
      
      private var var_1724:String = null;
      
      private var _category:int = 0;
      
      private var var_1722:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_1722 = param3;
         var_78 = new Vector3d();
         var_78.assign(param4);
         var_236 = new Vector3d();
         var_236.assign(param5);
         var_1723 = param6;
         var_1724 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_78;
      }
      
      public function get typeId() : int
      {
         return var_1723;
      }
      
      public function get dir() : Vector3d
      {
         return var_236;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_1724;
      }
      
      public function get operation() : String
      {
         return var_1722;
      }
      
      public function dispose() : void
      {
         var_78 = null;
         var_236 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
