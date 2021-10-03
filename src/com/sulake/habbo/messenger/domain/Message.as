package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_530:int = 2;
      
      public static const const_919:int = 6;
      
      public static const const_509:int = 1;
      
      public static const const_495:int = 3;
      
      public static const const_924:int = 4;
      
      public static const const_496:int = 5;
       
      
      private var var_2133:String;
      
      private var var_927:int;
      
      private var var_1729:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_927 = param2;
         var_1729 = param3;
         var_2133 = param4;
      }
      
      public function get time() : String
      {
         return var_2133;
      }
      
      public function get senderId() : int
      {
         return var_927;
      }
      
      public function get messageText() : String
      {
         return var_1729;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
