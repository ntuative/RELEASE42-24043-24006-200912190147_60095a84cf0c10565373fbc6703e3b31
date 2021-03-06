package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindowContainer;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class OpenedToWebPopup
   {
       
      
      private var var_179:Timer;
      
      private var _friendList:HabboFriendList;
      
      private var var_242:IWindowContainer;
      
      public function OpenedToWebPopup(param1:HabboFriendList)
      {
         super();
         _friendList = param1;
      }
      
      private function getOpenedToWebAlert() : IWindowContainer
      {
         var _loc1_:IWindowContainer = IWindowContainer(_friendList.getXmlWindow("opened_to_web_popup"));
         _friendList.refreshButton(_loc1_,"opened_to_web",true,null,0);
         return _loc1_;
      }
      
      public function show(param1:int, param2:int) : void
      {
         if(var_242 != null)
         {
            close(null);
         }
         var_242 = getOpenedToWebAlert();
         if(var_179 != null)
         {
            var_179.stop();
         }
         var_179 = new Timer(2000,1);
         var_179.addEventListener(TimerEvent.TIMER,close);
         var_179.start();
         var_242.x = param1;
         var_242.y = param2;
      }
      
      private function close(param1:Event) : void
      {
         var_242.destroy();
         var_242 = null;
      }
   }
}
