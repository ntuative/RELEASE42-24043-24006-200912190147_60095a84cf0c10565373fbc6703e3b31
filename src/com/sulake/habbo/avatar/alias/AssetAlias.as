package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_900:Boolean;
      
      private var _name:String;
      
      private var var_1650:String;
      
      private var var_899:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1650 = String(param1.@link);
         var_899 = Boolean(parseInt(param1.@fliph));
         var_900 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_899;
      }
      
      public function get flipV() : Boolean
      {
         return var_900;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1650;
      }
   }
}
