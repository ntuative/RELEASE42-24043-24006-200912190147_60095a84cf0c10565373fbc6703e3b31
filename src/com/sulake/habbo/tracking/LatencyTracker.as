package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_162:Array;
      
      private var _state:Boolean = false;
      
      private var var_1514:int = 0;
      
      private var var_1515:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_493:Map;
      
      private var var_2161:int = 0;
      
      private var var_1516:int = 0;
      
      private var var_178:IHabboConfigurationManager;
      
      private var var_1288:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1513:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!_state)
         {
            return;
         }
         if(getTimer() - var_1514 > var_1515)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1514 = getTimer();
         var_493.add(var_1288,var_1514);
         _connection.send(new LatencyPingRequestMessageComposer(var_1288));
         ++var_1288;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_178 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1515 = int(var_178.getKey("latencytest.interval"));
         var_1513 = int(var_178.getKey("latencytest.report.index"));
         var_2161 = int(var_178.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1515 < 1)
         {
            return;
         }
         var_493 = new Map();
         var_162 = new Array();
         _state = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_493 == null || var_162 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_493.getValue(_loc2_.requestId);
         var_493.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_162.push(_loc4_);
         if(var_162.length == var_1513 && var_1513 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_162.length)
            {
               _loc5_ += var_162[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_162.length)
            {
               if(var_162[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_162[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_162 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1516) > var_2161 || var_1516 == 0)
            {
               var_1516 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_162.length);
               _connection.send(_loc11_);
            }
            var_162 = [];
         }
      }
      
      public function dispose() : void
      {
         _state = false;
         var_178 = null;
         _communication = null;
         _connection = null;
         if(var_493 != null)
         {
            var_493.dispose();
            var_493 = null;
         }
         var_162 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_178 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
