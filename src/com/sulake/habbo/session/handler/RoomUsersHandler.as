package com.sulake.habbo.session.handler
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.DoorbellMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserMessageData;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserRemoveMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UsersMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetCommandsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetPlacingErrorEvent;
   import com.sulake.habbo.communication.messages.incoming.users.HabboUserBadgesMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.parser.room.engine.UserRemoveMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.UsersMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.pets.PetCommandsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.pets.PetInfoMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.session.IRoomHandlerListener;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.PetInfo;
   import com.sulake.habbo.session.UserData;
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   import com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionPetInfoUpdateEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionUserFigureUpdateEvent;
   
   public class RoomUsersHandler extends BaseHandler
   {
       
      
      public function RoomUsersHandler(param1:IConnection, param2:IRoomHandlerListener)
      {
         super(param1,param2);
         if(param1 == null)
         {
            return;
         }
         param1.addMessageEvent(new UsersMessageEvent(onUsers));
         param1.addMessageEvent(new UserRemoveMessageEvent(onUserRemove));
         param1.addMessageEvent(new HabboUserBadgesMessageEvent(onUserBadges));
         param1.addMessageEvent(new DoorbellMessageEvent(onDoorbell));
         param1.addMessageEvent(new UserChangeMessageEvent(onUserChange));
         param1.addMessageEvent(new UserNameChangedMessageEvent(onUserNameChange));
         param1.addMessageEvent(new PetInfoMessageEvent(onPetInfo));
         param1.addMessageEvent(new PetCommandsMessageEvent(onEnabledPetCommands));
         param1.addMessageEvent(new PetPlacingErrorEvent(onPetPlacingError));
      }
      
      private function onDoorbell(param1:IMessageEvent) : void
      {
         var _loc2_:DoorbellMessageEvent = param1 as DoorbellMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.userName == "")
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc3_ == null)
         {
            return;
         }
         listener.events.dispatchEvent(new RoomSessionDoorbellEvent(RoomSessionDoorbellEvent.const_93,_loc3_,_loc2_.userName));
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.userDataManager.updateFigure(_loc2_.id,_loc2_.figure);
         listener.events.dispatchEvent(new RoomSessionUserFigureUpdateEvent(_loc3_,_loc2_.id,_loc2_.figure));
      }
      
      private function onPetPlacingError(param1:PetPlacingErrorEvent) : void
      {
         var _loc3_:* = null;
         if(param1 == null || param1.getParser() == null)
         {
            return;
         }
         var _loc2_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc2_ == null)
         {
            return;
         }
         switch(param1.getParser().errorCode)
         {
            case 0:
               _loc3_ = "null";
               break;
            case 1:
               _loc3_ = "null";
               break;
            case 2:
               _loc3_ = "null";
               break;
            case 3:
               _loc3_ = "null";
               break;
            case 4:
               _loc3_ = "null";
         }
         if(_loc3_ != null)
         {
            listener.events.dispatchEvent(new RoomSessionErrorMessageEvent(_loc3_,_loc2_));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         var _loc4_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.userDataManager.updateName(_loc3_.webId,_loc3_.newName);
      }
      
      private function onUsers(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:UsersMessageEvent = param1 as UsersMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:UsersMessageParser = _loc2_.getParser();
         var _loc4_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.getUserCount())
         {
            _loc6_ = _loc3_.getUser(_loc5_);
            _loc7_ = new UserData(_loc6_.id);
            _loc7_.name = _loc6_.name;
            _loc7_.custom = _loc6_.custom;
            _loc7_.figure = _loc6_.figure;
            _loc7_.type = _loc6_.userType;
            _loc7_.webID = _loc6_.webID;
            _loc7_.groupID = _loc6_.groupID;
            _loc7_.groupStatus = _loc6_.groupStatus;
            _loc7_.sex = _loc6_.sex;
            _loc7_.xp = _loc6_.xp;
            _loc4_.userDataManager.setUserData(_loc7_);
            _loc5_++;
         }
      }
      
      private function onUserBadges(param1:IMessageEvent) : void
      {
         var _loc2_:HabboUserBadgesMessageEvent = param1 as HabboUserBadgesMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.userDataManager.setUserBadges(_loc2_.userId,_loc2_.badges);
         listener.events.dispatchEvent(new RoomSessionUserBadgesEvent(_loc3_,_loc2_.userId,_loc2_.badges));
      }
      
      private function onEnabledPetCommands(param1:IMessageEvent) : void
      {
         var _loc2_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:PetCommandsMessageEvent = param1 as PetCommandsMessageEvent;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:PetCommandsMessageParser = _loc3_.getParser();
         if(_loc4_ != null)
         {
            listener.events.dispatchEvent(new RoomSessionPetCommandsUpdateEvent(_loc2_,_loc4_.petId,_loc4_.enabledCommands));
         }
      }
      
      private function onPetInfo(param1:IMessageEvent) : void
      {
         var _loc2_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:PetInfoMessageEvent = param1 as PetInfoMessageEvent;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:PetInfoMessageParser = _loc3_.getParser();
         var _loc5_:PetInfo = new PetInfo();
         _loc5_.petId = _loc4_.petId;
         _loc5_.level = _loc4_.level;
         _loc5_.levelMax = _loc4_.maxLevel;
         _loc5_.experience = _loc4_.experience;
         _loc5_.experienceMax = _loc4_.experienceRequiredToLevel;
         _loc5_.energy = _loc4_.energy;
         _loc5_.energyMax = _loc4_.maxEnergy;
         _loc5_.nutrition = _loc4_.nutrition;
         _loc5_.nutritionMax = _loc4_.maxNutrition;
         _loc5_.ownerId = _loc4_.ownerId;
         _loc5_.ownerName = _loc4_.ownerName;
         _loc5_.respect = _loc4_.respect;
         _loc5_.age = _loc4_.age;
         listener.events.dispatchEvent(new RoomSessionPetInfoUpdateEvent(_loc2_,_loc5_));
      }
      
      private function onUserRemove(param1:IMessageEvent) : void
      {
         var _loc2_:UserRemoveMessageEvent = param1 as UserRemoveMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomSession = listener.getSession(_xxxRoomId,_xxxRoomCategory);
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = (_loc2_.getParser() as UserRemoveMessageParser).id;
         _loc3_.userDataManager.removeUserDataByIndex(_loc4_);
      }
   }
}
