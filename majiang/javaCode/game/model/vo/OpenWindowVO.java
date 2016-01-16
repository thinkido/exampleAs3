
package game.model.vo;

import game.constant.WindowType;

public class OpenWindowVO
{

	public WindowType windowType;

	public Object args;

	public OpenWindowVO(WindowType _windowType, Object _args)
	{
		windowType = _windowType;
		args = _args;
	}
}
