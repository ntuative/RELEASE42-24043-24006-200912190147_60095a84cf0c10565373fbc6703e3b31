package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1756:int;
      
      private var var_909:int;
      
      private var var_1759:int;
      
      private var var_1760:int;
      
      private var var_1758:int;
      
      private var var_1393:int;
      
      private var var_1757:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1756;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_909;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1760;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1758;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1393;
      }
      
      public function get commission() : int
      {
         return var_1759;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1757;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1757 = param1.readBoolean();
         var_1759 = param1.readInteger();
         var_909 = param1.readInteger();
         var_1393 = param1.readInteger();
         var_1760 = param1.readInteger();
         var_1756 = param1.readInteger();
         var_1758 = param1.readInteger();
         return true;
      }
   }
}
