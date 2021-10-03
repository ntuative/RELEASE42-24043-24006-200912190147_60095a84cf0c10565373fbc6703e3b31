package com.sulake.habbo.inventory.items
{
   public interface IItem
   {
       
      
      function get type() : int;
      
      function get extras() : String;
      
      function get recyclable() : Boolean;
      
      function get category() : int;
      
      function get locked() : Boolean;
      
      function get sellable() : Boolean;
      
      function set locked(param1:Boolean) : void;
      
      function get groupable() : Boolean;
      
      function get ref() : int;
      
      function get id() : int;
      
      function get tradeable() : Boolean;
   }
}
