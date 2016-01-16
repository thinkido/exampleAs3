
package game.control;

import game.model.vo.PlaceData;

import java.util.Hashtable;
import java.util.Vector;

import protocol.place_info;

public class PlaceDataManager
{

	private static PlaceDataManager _inst;

	public static PlaceDataManager getInstance()
	{
		if(null == _inst)
		{
			_inst = new PlaceDataManager();
		}
		return _inst;
	}

	private Hashtable _data = new Hashtable();

	/**
	 * ≥ı ºªØ...‡≈...
	 */

	public void init(Vector v)
	{
		for(int i = 0; i < v.size(); ++i)
		{
			this.add((place_info)v.elementAt(i));
			// _data.put(((place_info)v.elementAt(i)).getId(), new
			// PlaceData((place_info)v.elementAt(i)));
		}
	}

	public void add(place_info v)
	{
		_data.put(v.getId(), new PlaceData(v));
	}

	public void del(String id)
	{
		_data.remove(id);
	}

	public PlaceData get(String id)
	{
		return (PlaceData)_data.get(id);
	}

	public void reset()
	{
		_data.clear();
	}
}
