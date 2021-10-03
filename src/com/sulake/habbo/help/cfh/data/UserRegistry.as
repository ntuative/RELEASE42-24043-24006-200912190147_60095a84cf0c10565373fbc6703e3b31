package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1051:int = 80;
       
      
      private var var_441:Map;
      
      private var var_628:String = "";
      
      private var var_1143:Array;
      
      public function UserRegistry()
      {
         var_441 = new Map();
         var_1143 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_441.getValue(var_1143.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_628;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_441.getValue(param1) != null)
         {
            var_441.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_628);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_628 == "")
         {
            var_1143.push(param1);
         }
         var_441.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_441;
      }
      
      public function unregisterRoom() : void
      {
         var_628 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_441.length > const_1051)
         {
            _loc1_ = var_441.getKey(0);
            var_441.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_628 = param1;
         if(var_628 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
