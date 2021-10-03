package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRedeemClubPromoMessage extends RoomWidgetMessage
   {
      
      public static const const_559:String = "rwrcp_redeem_club_promo";
       
      
      private var var_1662:String;
      
      private var var_1663:Boolean;
      
      public function RoomWidgetRedeemClubPromoMessage(param1:String, param2:String, param3:Boolean)
      {
         super(param1);
         var_1662 = param2;
         var_1663 = param3;
      }
      
      public function get code() : String
      {
         return var_1662;
      }
      
      public function get isTrial() : Boolean
      {
         return var_1663;
      }
   }
}
