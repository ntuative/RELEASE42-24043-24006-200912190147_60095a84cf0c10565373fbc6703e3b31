package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_134:int = 1;
      
      public static const const_1205:int = 3;
      
      public static const const_409:int = 2;
       
      
      private var var_1627:int;
      
      private var var_1623:int;
      
      private var var_1617:int;
      
      private var var_1625:int;
      
      private var _state:int;
      
      private var var_401:int;
      
      private var var_1187:int;
      
      private var var_1620:int;
      
      private var var_1029:int;
      
      private var _roomResources:String;
      
      private var var_1628:int;
      
      private var var_1618:int;
      
      private var var_1621:String;
      
      private var var_1624:String;
      
      private var var_1619:int = 0;
      
      private var var_1286:String;
      
      private var _message:String;
      
      private var var_1626:int;
      
      private var var_1622:String;
      
      private var var_1130:int;
      
      private var var_628:String;
      
      private var var_1616:String;
      
      private var var_1345:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1029 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1619 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1618;
      }
      
      public function set roomName(param1:String) : void
      {
         var_628 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1628 = param1;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_628;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1625 = param1;
      }
      
      public function set state(param1:int) : void
      {
         _state = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1623;
      }
      
      public function get priority() : int
      {
         return var_1627 + var_1619;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1620 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1624;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1345) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1130;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1618 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1187;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1621 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1628;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1625;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1616 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1286 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1620;
      }
      
      public function set priority(param1:int) : void
      {
         var_1627 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1623 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1621;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1617 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1624 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1626 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1286;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1187 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1617;
      }
      
      public function set flatId(param1:int) : void
      {
         var_401 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1130 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1345 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1626;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1622 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1345;
      }
      
      public function get reportedUserId() : int
      {
         return var_1029;
      }
      
      public function get flatId() : int
      {
         return var_401;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1616;
      }
      
      public function get reporterUserName() : String
      {
         return var_1622;
      }
   }
}
