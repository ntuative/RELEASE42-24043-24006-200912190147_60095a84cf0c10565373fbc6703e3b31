package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_104:String = "RSPE_POLL_CONTENT";
      
      public static const const_120:String = "RSPE_POLL_OFFER";
      
      public static const const_60:String = "RSPE_POLL_ERROR";
       
      
      private var var_1023:Array = null;
      
      private var var_1280:String = "";
      
      private var var_1202:String;
      
      private var var_1279:String = "";
      
      private var var_1022:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_1023;
      }
      
      public function get startMessage() : String
      {
         return var_1280;
      }
      
      public function get summary() : String
      {
         return var_1202;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1280 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_1022 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1202 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_1022;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1279 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1279;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1023 = param1;
      }
   }
}
