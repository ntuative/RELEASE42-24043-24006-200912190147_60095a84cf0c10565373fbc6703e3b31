package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_882:IID;
      
      private var var_365:uint;
      
      private var var_1070:IUnknown;
      
      private var var_1071:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_882 = param1;
         var_1071 = getQualifiedClassName(var_882);
         var_1070 = param2;
         var_365 = 0;
      }
      
      public function get iid() : IID
      {
         return var_882;
      }
      
      public function get references() : uint
      {
         return var_365;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_365) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1070;
      }
      
      public function get iis() : String
      {
         return var_1071;
      }
      
      public function reserve() : uint
      {
         return ++var_365;
      }
      
      public function dispose() : void
      {
         var_882 = null;
         var_1071 = null;
         var_1070 = null;
         var_365 = 0;
      }
   }
}
