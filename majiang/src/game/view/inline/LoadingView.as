
package game.view.inline
{
	import org.json.me.JSONObject;
	
	import starling.text.TextField;
	
	import ui.UIContainer;
	import ui.UIText;
	
	public class LoadingView extends UIContainer
	{
	
	//	protected static final int TIPS_LENGTH = 2;
	
		protected var _tfContent:TextField;
	
		protected var _stateFlag:int;
	
	//	protected UIImageView[] _imgTipsLiad = new UIImageView[TIPS_LENGTH];
	
		protected var _callback:Function;
	
		protected var _curIndex:int;
	
		protected function enterFrame(time:Number):void
		{
			if(_stateFlag == 0)
			{
				_stateFlag = 1;
			}
			else if(_stateFlag == 1)
			{
				_stateFlag = 2;
				if(_callback != null)
					_callback.call();
			}
		}
	
		public function buildUI(confName:String):void
		{
			var data:Object = getJson(confName);
			initWithJsonObject(data);
			initUI();
		}
	
		public function initUI():void
		{
			_tfContent = this.getChildByName("tf_content") as TextField;
//			_tfContent.setAnchor(ANCHOR_CENTER);
	//		for(int i = 0; i < TIPS_LENGTH; i++)
	//		{
	//			_imgTipsLiad[i] = (UIImageView)getChildByName("img_tips_" + i);
	//		}
		}
	
		public function update(text:String, callback:Function):void
		{
			_stateFlag = 0;
	//		updateTips();
			_tfContent.text = text;
			_callback = callback;
		}
	
		// public void updateTips()
		// {
		// for(int i = 0; i < TIPS_LENGTH; i++)
		// {
		// _imgTipsLiad[i].setVisible(i == _curIndex);
		// }
		// _curIndex++;
		// if(_curIndex >= TIPS_LENGTH)
		// _curIndex = 0;
		// }
	}
}
