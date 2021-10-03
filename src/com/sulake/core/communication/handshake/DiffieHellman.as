package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1489:BigInteger;
      
      private var var_942:BigInteger;
      
      private var var_2083:BigInteger;
      
      private var var_1488:BigInteger;
      
      private var var_2081:BigInteger;
      
      private var var_2082:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1489 = param1;
         var_2083 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2081.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1488 = new BigInteger();
         var_1488.fromRadix(param1,param2);
         var_2081 = var_1488.modPow(var_942,var_1489);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_2082.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_942 = new BigInteger();
         var_942.fromRadix(param1,param2);
         var_2082 = var_2083.modPow(var_942,var_1489);
         return true;
      }
   }
}
