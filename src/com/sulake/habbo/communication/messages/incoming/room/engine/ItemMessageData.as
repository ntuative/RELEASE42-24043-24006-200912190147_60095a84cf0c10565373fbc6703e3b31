package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_90:Number = 0;
      
      private var _data:String = "";
      
      private var var_2259:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1882:Boolean = false;
      
      private var var_2260:String = "";
      
      private var _id:int = 0;
      
      private var var_203:Boolean = false;
      
      private var var_236:String = "";
      
      private var var_1885:int = 0;
      
      private var var_1883:int = 0;
      
      private var var_1884:int = 0;
      
      private var var_1881:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1882 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_203)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1882;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_203)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_236;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_203)
         {
            var_1884 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_203)
         {
            var_1885 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_203)
         {
            var_1883 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_203)
         {
            var_236 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_203)
         {
            var_1881 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_203)
         {
            _state = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1884;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_203)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1885;
      }
      
      public function get wallY() : Number
      {
         return var_1883;
      }
      
      public function get localY() : Number
      {
         return var_1881;
      }
      
      public function setReadOnly() : void
      {
         var_203 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_90;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_203)
         {
            var_90 = param1;
         }
      }
   }
}
