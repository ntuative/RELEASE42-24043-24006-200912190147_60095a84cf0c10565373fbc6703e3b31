package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1104:int = 0;
       
      
      private var var_78:Vector3d;
      
      private var _updateID:uint;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_88:RoomObjectModel;
      
      private var var_369:IRoomObjectEventHandler;
      
      private var var_1365:Vector3d;
      
      private var var_1706:int = 0;
      
      private var _id:int;
      
      private var var_1364:Vector3d;
      
      private var var_236:Vector3d;
      
      private var var_429:Array;
      
      public function RoomObject(param1:int, param2:uint)
      {
         super();
         _id = param1;
         var_78 = new Vector3d();
         var_236 = new Vector3d();
         var_1365 = new Vector3d();
         var_1364 = new Vector3d();
         var_429 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_429[_loc3_] = 0;
            _loc3_--;
         }
         var_88 = new RoomObjectModel();
         _visualization = null;
         var_369 = null;
         _updateID = 0;
         var_1706 = var_1104++;
      }
      
      public function getInstanceId() : int
      {
         return var_1706;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : uint
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_78 = null;
         var_236 = null;
         if(var_88 != null)
         {
            var_88.dispose();
            var_88 = null;
         }
         var_429 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1365.assign(var_78);
         return var_1365;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_78.x != param1.x || var_78.y != param1.y || var_78.z != param1.z)
         {
            var_78.x = param1.x;
            var_78.y = param1.y;
            var_78.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_236.x != param1.x || var_236.y != param1.y || var_236.z != param1.z)
         {
            var_236.x = (param1.x % 360 + 360) % 360;
            var_236.y = (param1.y % 360 + 360) % 360;
            var_236.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_369;
      }
      
      public function getDirection() : IVector3d
      {
         var_1364.assign(var_236);
         return var_1364;
      }
      
      public function setState(param1:int, param2:uint) : Boolean
      {
         if(param2 < var_429.length)
         {
            if(var_429[param2] != param1)
            {
               var_429[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_369)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_369;
         if(_loc2_ != null)
         {
            var_369 = null;
            _loc2_.object = null;
         }
         var_369 = param1;
         if(var_369 != null)
         {
            var_369.object = this;
         }
      }
      
      public function getState(param1:uint) : int
      {
         if(param1 < var_429.length)
         {
            return var_429[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return var_88;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return var_88;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
