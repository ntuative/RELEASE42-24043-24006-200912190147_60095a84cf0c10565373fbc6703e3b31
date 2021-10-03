package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1159:String = "DisconnectReasonPeerConnectionLost";
      
      public static const const_790:String = "DisconnectReasonTimeout";
      
      public static const const_527:String = "DisconnectReasonDisconnected";
      
      public static const const_274:String = "DisconnectReasonBanned";
      
      public static const const_816:String = "DisconnectReasonLoggedOut";
      
      public static const const_788:String = "DisconnectReasonConcurrentLogin";
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : String
      {
         var _loc1_:int = (this.var_21 as DisconnectReasonParser).reason;
         switch(_loc1_)
         {
            case -1:
               return const_527;
            case 0:
               return const_527;
            case 1:
               return const_816;
            case 1009:
            case 2:
               return const_788;
            case 3:
               return const_790;
            case 4:
               return const_1159;
            default:
               return const_527;
         }
      }
   }
}
