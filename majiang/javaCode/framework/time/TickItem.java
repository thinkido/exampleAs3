
package framework.time;

/**
 * 时间触发项
 * 
 * @author Jing
 */
public class TickItem
{

	/**
	 * 类型 0:触发一次 1:间隔触发
	 */
	protected int type = 0;

	private int _id;

	/**
	 * 触发项的ID
	 */
	public int id()
	{
		return _id;
	}
	
	protected void setId(int id)
	{
		_id = id;
	}

	private Object _data = null;

	/**
	 * 携带的数据
	 */
	public Object data()
	{
		return _data;
	}

	private long _interval = 0;

	/**
	 * 每次被触发的间隔
	 */
	public long interval()
	{
		return _interval;
	}
	
	private long _tickTime = 0;

	/**
	 * 下次触发的时间
	 * 
	 * @return
	 */
	public long tickTime()
	{
		return _tickTime;
	}

	//---------------------------非公开数据
	
	private ITickListener _listener = null;
	/**
	 * 监听者
	 * @return
	 */
	protected ITickListener listener()
	{
		return _listener;
	}

	/**
	 * 设置下次触发的时间
	 * 
	 * @param tickTime
	 */
	protected void setTickTime(long tickTime)
	{
		_tickTime = tickTime;
	}

	protected TickItem(int type, long interval, ITickListener listener, Object data)
	{		
		this.type = type;
		this._interval = interval;
		this._listener = listener;
		this._data = data;
	}
}
