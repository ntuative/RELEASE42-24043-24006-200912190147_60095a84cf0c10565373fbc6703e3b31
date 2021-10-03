package com.sulake.habbo.messenger.domain
{
   import com.sulake.core.runtime.IDisposable;
   
   public class Conversation implements IDisposable
   {
       
      
      private var _id:int;
      
      private var var_511:String;
      
      private var _disposed:Boolean;
      
      private var var_720:Boolean;
      
      private var _name:String;
      
      private var var_965:Array;
      
      private var var_1200:Boolean;
      
      private var _selected:Boolean;
      
      public function Conversation(param1:int, param2:String, param3:String, param4:Boolean)
      {
         var_965 = new Array();
         super();
         _id = param1;
         _name = param2;
         var_511 = param3;
         var_1200 = param4;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get messages() : Array
      {
         return var_965;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1200;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(param1)
         {
            var_720 = false;
         }
         _selected = param1;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_965 = null;
      }
      
      public function get selected() : Boolean
      {
         return _selected;
      }
      
      public function setNewMessageArrived(param1:Boolean) : void
      {
         if(_selected)
         {
            var_720 = false;
         }
         else
         {
            var_720 = param1;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function addMessage(param1:Message) : void
      {
         var_965.push(param1);
      }
      
      public function get newMessageArrived() : Boolean
      {
         return var_720;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         var_1200 = param1;
      }
      
      public function get figure() : String
      {
         return var_511;
      }
   }
}
