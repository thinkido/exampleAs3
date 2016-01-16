
package game.view.inline;

import game.model.callback.ICallback;

import org.json.me.JSONObject;

import ui.UIContainer;
import ui.UIText;

public class LoadingView extends UIContainer
{

//	protected static final int TIPS_LENGTH = 2;

	protected UIText _tfContent;

	protected int _stateFlag;

//	protected UIImageView[] _imgTipsLiad = new UIImageView[TIPS_LENGTH];

	protected ICallback _callback;

	protected int _curIndex;

	protected void enterFrame(long time)
	{
		if(_stateFlag == 0)
		{
			_stateFlag = 1;
		}
		else if(_stateFlag == 1)
		{
			_stateFlag = 2;
			ICallback callback = _callback;
			_callback = null;
			if(callback != null)
				callback.run();
		}
	}

	public void buildUI(String confName)
	{
		JSONObject data = getJson(confName);
		initWithJsonObject(data);
		initUI();
	}

	protected void initUI()
	{
		_tfContent = (UIText)getChildByName("tf_content");
		_tfContent.setAnchor(ANCHOR_CENTER);
//		for(int i = 0; i < TIPS_LENGTH; i++)
//		{
//			_imgTipsLiad[i] = (UIImageView)getChildByName("img_tips_" + i);
//		}
	}

	public void update(String text, ICallback callback)
	{
		_stateFlag = 0;
//		updateTips();
		_tfContent.setText(text);
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
