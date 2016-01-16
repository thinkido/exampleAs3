
package ui;

import org.json.me.JSONObject;

import framework.consts.EventType;
import framework.consts.KeyType;
import framework.events.EventDispatcher;
import framework.events.IEventListener;
import framework.views.Stage;

public abstract class UICurrentView extends UIContainer implements IEventListener
{

	public static final int TEXT_INPUT_MAX_LENGTH = 999;

	protected UIObject _selected = null;

	protected boolean _isInput = false;

	protected Object _args;

	/**
	 * 初始化UI
	 * 
	 * @param path
	 */
	protected abstract void initUI();

	public void buildUI(String confName)
	{
		JSONObject data = getJson(confName);
		initWithJsonObject(data);
		initUI();
	}

	public void updateData(Object args)
	{
		_args = args;
	}

	public void startInput()
	{
		UIText tf = (UIText)_selected;
		if(null != tf)
		{
			tf.setText(tf.getText() + "|");
			_isInput = true;
		}
	}

	public void stopInput()
	{
		_isInput = false;
		UIText tf = (UIText)_selected;
		String text = tf.getText();
		tf.setText(text.substring(0, text.length() - 1));
	}

	public void onReciveEvent(byte type, EventDispatcher dispatcher, Object data)
	{
		if(type == EventType.EVENT_KEY_PRESSED)
		{
			onKeyPressed(type, dispatcher, data);
		}
	}

	protected void onKeyPressed(byte type, EventDispatcher dispatcher, Object data)
	{
		if(_selected != null)
		{
			byte keyCode = ((Integer)data).byteValue();
			if(_isInput)
			{
				UIText tf = (UIText)_selected;
				String text = tf.getText();
				switch(keyCode)
				{
					case KeyType.UP:
					case KeyType.DOWN:
						stopInput();
						onReciveEvent(type, dispatcher, data);
						break;
					case KeyType.LEFT:
						int strlen = text.length();
						if(strlen > 2)
						{
							text = text.substring(0, strlen - 2) + "|";
						}
						else
						{
							text = "|";
						}
						tf.setText(text);
						break;
					case KeyType.NUM_0:
					case KeyType.NUM_1:
					case KeyType.NUM_2:
					case KeyType.NUM_3:
					case KeyType.NUM_4:
					case KeyType.NUM_5:
					case KeyType.NUM_6:
					case KeyType.NUM_7:
					case KeyType.NUM_8:
					case KeyType.NUM_9:
						if(text.length() > TEXT_INPUT_MAX_LENGTH)
						{
							break;
						}
						text = text.substring(0, text.length() - 1) + (keyCode - 48) + "|";
						tf.setText(text);
						break;
					case KeyType.BACK:
					case KeyType.ITV_BACK:
					case KeyType.CONFIRM:
						stopInput();
						break;
				}
			}
			else
			{
				byte dir = -1;
				switch(keyCode)
				{
					case KeyType.UP:
						dir = DIR_UP;
						break;
					case KeyType.DOWN:
						dir = DIR_DOWN;
						break;
					case KeyType.LEFT:
						dir = DIR_LEFT;
						break;
					case KeyType.RIGHT:
						dir = DIR_RIGHT;
						break;
					case KeyType.CONFIRM:
						if(_selected.getClass() == UICheckBox.class)
						{
							((UICheckBox)_selected).swapCheckedState();
						}
						onConfirm(_selected);
						break;
					case KeyType.BACK:
					case KeyType.ITV_BACK:
						onGoBack();
						break;
				}
				if(dir != -1)
				{
					onMove(dir);
				}
			}
		}
	}

	/**
	 * 处理选中对象变更
	 * 
	 * @param dir
	 */
	protected void onMove(byte dir)
	{
		if(_selected.getClass() != UIListView.class || !((UIListView)_selected).tryMoveOnce(dir))
		{
			UIObject target = _selected.getNeighbor(dir);
			while(null != target && STATE_DISABLE == target.getState())
			{
				target = target.getNeighbor(dir);
				if(target == _selected)
				{
					target = null;
					break;
				}
			}
			if(null != target)
			{
				switchFocus(target);
			}
		}
	}

	/**
	 * 变更选中对象
	 * 
	 * @param target
	 */
	public void switchFocus(UIObject target)
	{
		if(_selected != target)
		{
			if(_selected != null)
			{
				if(_selected.getClass() == UICheckBox.class)
					_selected.setState(((UICheckBox)_selected).isChecked() ? STATE_CHECKED_NORMAL : STATE_NORMAL);
				else
					_selected.setState(STATE_NORMAL);
			}
			_selected = target;
			if(_selected.getClass() == UICheckBox.class)
				_selected.setState(((UICheckBox)_selected).isChecked() ? STATE_CHECKED_FOCUS : STATE_FOCUS);
			else
				_selected.setState(STATE_FOCUS);
		}
	}

	/**
	 * 获得焦点
	 */
	public void onStageFocus()
	{
		Stage.current.keyboard.addEventListener(EventType.EVENT_KEY_PRESSED, this);
	}

	/**
	 * 失去焦点
	 */
	public void onStageBlur()
	{
		Stage.current.keyboard.removeEventListener(EventType.EVENT_KEY_PRESSED, this);
	}

	/**
	 * 返回
	 */
	public abstract void onGoBack();

	/**
	 * 进入
	 */
	public abstract void onEnter();

	/**
	 * 离开
	 */
	public abstract void onLeave();

	/**
	 * confirm处理
	 * 
	 * @param target
	 */
	public abstract void onConfirm(UIObject target);

	public void onDispose()
	{
		_args = null;
		_selected = null;
		super.onDispose();
	}
}
