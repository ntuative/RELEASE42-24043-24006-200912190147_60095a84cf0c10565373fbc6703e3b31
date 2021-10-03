package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1464:int = -1;
      
      private var var_1209:Boolean;
      
      private var var_1208:String;
      
      private var var_1988:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1988 = String(param1["set-type"]);
         var_1208 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1209 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1464 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1208;
      }
      
      public function get staticId() : int
      {
         return var_1464;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1464 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1209;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1209 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1208 = param1;
      }
      
      public function get setType() : String
      {
         return var_1988;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
