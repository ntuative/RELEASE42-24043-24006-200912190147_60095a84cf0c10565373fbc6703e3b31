package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_906:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1226:Boolean = true;
      
      private var var_1145:int = 0;
      
      private var var_782:int = 0;
      
      private var var_1144:int = 0;
      
      private var var_783:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1146:int = 15;
      
      private var var_178:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1147:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1144 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1226)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_782,var_783);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1145;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_782 == 0 && var_783 == 0;
      }
      
      private function resetLog() : void
      {
         var_782 = 0;
         var_783 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1226)
         {
            return;
         }
         if(getTimer() - var_1144 > var_1147 * 1000 && var_1145 < var_1146)
         {
            var_1144 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_178 = param1;
         var_1147 = int(var_178.getKey("lagwarninglog.interval","60"));
         var_1146 = int(var_178.getKey("lagwarninglog.reportlimit","15"));
         var_1226 = Boolean(int(var_178.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_783 += 1;
            case const_906:
               var_782 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
