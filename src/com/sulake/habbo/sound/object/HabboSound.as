package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_914:SoundChannel = null;
      
      private var var_753:Boolean;
      
      private var var_913:Sound = null;
      
      private var var_601:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_913 = param1;
         var_913.addEventListener(Event.COMPLETE,onComplete);
         var_601 = 1;
         var_753 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_753;
      }
      
      public function stop() : Boolean
      {
         var_914.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_753 = false;
         var_914 = var_913.play(0);
         this.volume = var_601;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_601;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_914.position;
      }
      
      public function get length() : Number
      {
         return var_913.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_601 = param1;
         if(var_914 != null)
         {
            var_914.soundTransform = new SoundTransform(var_601);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_753 = true;
      }
   }
}
