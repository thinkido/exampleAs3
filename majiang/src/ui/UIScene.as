package ui
{
	
	import game.util.CommonUtil;
	
	public class UIScene extends UICurrentView
	{
		
		public function UIScene()
		{
			
		}
		
		public function onGoBack():void
		{
			CommonUtil.showPopupWindow(true, "确定退出游戏?",new CallBack);
		}


		
		public function initWithJsonObject( data:JSONObject):void
		{
			try
			{
				data = data.getJSONObject("Content").getJSONObject("Content").getJSONObject("ObjectData");
				var children:JSONArray = data.getJSONArray("Children");
				for(var i:int = 0; i < children.length(); ++i)
				{
					var child:JSONObject = children.getJSONObject(i);
					var item:UIComponent = decodeType(child.getString("ctype"));
					if(item != null)
					{
						item.initWithJsonObject(child);
						addChild(item);
					}
				}
			}
			catch( e:Error)
			{
				e.printStackTrace();
			}
		}

	}
}
import flash.system.System;

import game.model.callback.ICallbackB;

class CallBack implements ICallbackB
{
	public function run( data:Boolean):void
	{
		if(data)
			System.exit(0);
	}
}