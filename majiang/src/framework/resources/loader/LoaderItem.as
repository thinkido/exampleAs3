package framework.resources.loader
{
import framework.resources.ResItem;

/**
 * ¼ÓÔØÏî
 * @author Jing
 *
 */
public class LoaderItem
{
	private var _item:ResItem= null;
	public function item():ResItem{
		return _item;
	}
	
	private var _obj:Object= null;
	public function obj():Object{
		return _obj;
	}
	
	protected function LoaderItem(item:ResItem, obj:Object)
	{
		_item = item;
		_obj = obj;
	}
}
}