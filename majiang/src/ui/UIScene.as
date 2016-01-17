package ui
{
	
	import game.model.callback.ICallbackB;
	import game.util.CommonUtil;
	
	import org.json.me.JSONArray;
	import org.json.me.JSONObject;
	
	public abstract class UIScene extends UICurrentView
	{
		
		public UIScene()
		{
			
		}
		
		public void onGoBack()
		{
			CommonUtil.showPopupWindow(true, "ȷ���˳���Ϸ?", new ICallbackB() {
				
				public void run(boolean data) {
					if(data)
						System.exit(0);
				}
			});
		}
		
		public void initWithJsonObject(JSONObject data)
		{
			try
			{
				data = data.getJSONObject("Content").getJSONObject("Content").getJSONObject("ObjectData");
				JSONArray children = data.getJSONArray("Children");
				for(int i = 0; i < children.length(); ++i)
				{
					JSONObject child = children.getJSONObject(i);
					UIComponent item = decodeType(child.getString("ctype"));
					if(item != null)
					{
						item.initWithJsonObject(child);
						addChild(item);
					}
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
	}
}