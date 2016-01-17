
package ui;

public abstract class UIListItem extends UIContainer
{

	protected UIListItem _pre;

	protected UIListItem _next;

	protected byte _state = STATE_NORMAL;

	public void setNeighbors(UIListItem pre, UIListItem next)
	{
		_pre = pre;
		_next = next;
	}

	public UIListItem getNeighbor(boolean isNext)
	{
		if(isNext)
		{
			return _next;
		}
		else
		{
			return _pre;
		}
	}

	public byte getState()
	{
		return _state;
	}

	public void setState(byte state)
	{
		_state = state;
	}

	public abstract int getWidth();

	public abstract int getHeight();

	public abstract int getGap();

	public abstract void setItemData(Object data, int index);

	public void onDispose()
	{
		_pre = null;
		_next = null;
		super.onDispose();
	}
}
