package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1417:GarbageMonitor = null;
      
      private var var_1144:int = 0;
      
      private var var_1061:Boolean = false;
      
      private var var_1546:String = "";
      
      private var var_1418:String = "";
      
      private var var_326:Number = 0;
      
      private var var_1146:int = 10;
      
      private var var_2203:Array;
      
      private var var_586:int = 0;
      
      private var var_1147:int = 60;
      
      private var var_922:int = 0;
      
      private var var_923:int = 0;
      
      private var var_1544:String = "";
      
      private var var_1811:Number = 0;
      
      private var var_1148:int = 1000;
      
      private var var_1812:Boolean = true;
      
      private var var_1813:Number = 0.15;
      
      private var var_178:IHabboConfigurationManager = null;
      
      private var var_1545:String = "";
      
      private var var_1145:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2203 = [];
         super();
         var_1418 = Capabilities.version;
         var_1546 = Capabilities.os;
         var_1061 = Capabilities.isDebugger;
         var_1545 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1417 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1144 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1417.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1417.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_326;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1147 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1418;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_923;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1148)
         {
            ++var_922;
            _loc3_ = true;
         }
         else
         {
            ++var_586;
            if(var_586 <= 1)
            {
               var_326 = param1;
            }
            else
            {
               _loc4_ = Number(var_586);
               var_326 = var_326 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1144 > var_1147 * 1000 && var_1145 < var_1146)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_326);
            _loc5_ = true;
            if(var_1812 && var_1145 > 0)
            {
               _loc6_ = differenceInPercents(var_1811,var_326);
               if(_loc6_ < var_1813)
               {
                  _loc5_ = false;
               }
            }
            var_1144 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1811 = var_326;
               if(sendReport())
               {
                  ++var_1145;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1146 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1148 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1545,var_1418,var_1546,var_1544,var_1061,_loc4_,_loc3_,var_923,var_326,var_922);
            _connection.send(_loc1_);
            var_923 = 0;
            var_326 = 0;
            var_586 = 0;
            var_922 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_178 = param1;
         var_1147 = int(var_178.getKey("performancetest.interval","60"));
         var_1148 = int(var_178.getKey("performancetest.slowupdatelimit","1000"));
         var_1146 = int(var_178.getKey("performancetest.reportlimit","10"));
         var_1813 = Number(var_178.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1812 = Boolean(int(var_178.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
