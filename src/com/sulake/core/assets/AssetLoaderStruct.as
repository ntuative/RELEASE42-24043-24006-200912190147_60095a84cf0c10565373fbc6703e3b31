package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_701:IAssetLoader;
      
      private var var_1273:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1273 = param1;
         var_701 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_701;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_701 != null)
            {
               if(true)
               {
                  var_701.dispose();
                  var_701 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1273;
      }
   }
}
