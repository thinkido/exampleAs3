
package framework.time;

import java.util.Vector;

/**
 * ��ʱ���ӿ�
 */
public class Ticker
{

	/**
	 * ���һ�α�
	 */
	private long _lastTime = 0;

	private Vector _vector = new Vector();

	/**
	 * ʹ�ú��Զ����ӵ�ID
	 */
	private int _incrementId = 1;

	public Ticker()
	{

	}

	/**
	 * ��������
	 * 
	 * @params now ��ǰʱ��(����)
	 */
	public void tick(long now)
	{
		_lastTime = now;
		int size = _vector.size();
		while(--size > -1)
		{
			TickItem item = (TickItem)_vector.elementAt(size);
			if(now >= item.tickTime())
			{
				item.listener().onTick(item);

				if(item.type == 1)
				{
					item.setTickTime(now + item.interval());
				}
				else
				{
					_vector.removeElementAt(size);
				}
			}
		}
	}

	/**
	 * ��ָ����ʱ��(����)����ýӿ�
	 */
	public int setTimeout(long delay, ITickListener listener, Object params)
	{
		TickItem item = createItem(0, delay, listener, params);
		return item.id();
	}

	/**
	 * ��ָ����ʱ��(����)��������ӿ�
	 */
	public int setTimeInterval(long interval, ITickListener listener, Object params)
	{
		TickItem item = createItem(1, interval, listener, params);
		return item.id();
	}

	/**
	 * �ͷ�ʱ�䴥��
	 * 
	 * @param id ������ID
	 */
	public void release(int id)
	{
		int size = _vector.size();
		for(int i = 0; i < size; i++)
		{
			TickItem item = (TickItem)_vector.elementAt(i);
			if(item.id() == id)
			{
				_vector.removeElementAt(i);
				break;
			}
		}
	}

	/**
	 * get ticker item
	 */
	public TickItem getItem(int id)
	{
		int size = _vector.size();
		for(int i = 0; i < size; i++)
		{
			TickItem item = (TickItem)_vector.elementAt(i);
			if(item.id() == id)
			{
				return item;
			}
		}

		return null;
	}

	/**
	 * ����һ����
	 * 
	 * @param type
	 * @param interval
	 * @param listener
	 * @param params
	 * @return
	 */
	private TickItem createItem(int type, long interval, ITickListener listener, Object params)
	{
		TickItem item = new TickItem(type, interval, listener, params);
		item.setTickTime(_lastTime + interval);
		item.setId(_incrementId++);
		_vector.addElement(item);
		return item;
	}

}
