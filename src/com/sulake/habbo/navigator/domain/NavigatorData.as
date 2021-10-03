package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1399:int = 10;
       
      
      private var var_1501:NavigatorSettingsMessageParser;
      
      private var var_1268:int;
      
      private var var_2117:Boolean;
      
      private var var_2115:int;
      
      private var var_846:Dictionary;
      
      private var var_2237:int;
      
      private var var_2114:int;
      
      private var var_1588:int;
      
      private var var_343:Array;
      
      private var var_2118:int;
      
      private var var_1265:Array;
      
      private var var_574:PublicRoomShortData;
      
      private var var_402:RoomEventData;
      
      private var var_144:MsgWithRequestId;
      
      private var var_2119:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2116:Boolean;
      
      private var var_205:GuestRoomData;
      
      private var var_689:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_343 = new Array();
         var_846 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2115;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2116;
      }
      
      public function startLoading() : void
      {
         this.var_689 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2116 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_402 != null)
         {
            var_402.dispose();
         }
         var_402 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_144 != null && var_144 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_144 != null && var_144 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_144 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_205;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_574 = null;
         var_205 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_574 = param1.publicSpace;
            var_402 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_402 != null)
         {
            var_402.dispose();
            var_402 = null;
         }
         if(var_574 != null)
         {
            var_574.dispose();
            var_574 = null;
         }
         if(var_205 != null)
         {
            var_205.dispose();
            var_205 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_144 = param1;
         var_689 = false;
         if(var_1265 == null)
         {
            var_1265 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1501;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_144 = param1;
         var_689 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_343.length > param1)
         {
            return var_343[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2237 = param1.limit;
         this.var_1268 = param1.favouriteRoomIds.length;
         this.var_846 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_846[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_144 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_343;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_574;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1588 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2117;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_144 = param1;
         var_689 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_343.length)
         {
            if((var_343[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_205 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_689;
      }
      
      public function set categories(param1:Array) : void
      {
         var_343 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_2114;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2118;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1501 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_144 == null)
         {
            return;
         }
         var_144.dispose();
         var_144 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_402;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_846[param1] = !!param2 ? "yes" : null;
         var_1268 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_144 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1265;
      }
      
      public function get avatarId() : int
      {
         return var_1588;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_144 != null && var_144 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2117 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2114 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2119 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_205 != null)
         {
            var_205.dispose();
         }
         var_205 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_343)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_205 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1501.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1268 >= var_2237;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2118 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2119;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_205 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2115 = param1;
      }
   }
}
