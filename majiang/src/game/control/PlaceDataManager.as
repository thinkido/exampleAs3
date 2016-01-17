package game.control
{
	public class PlaceDataManager
	{
	
		private static var _inst:PlaceDataManager;
	
		public static function getInstance():PlaceDataManager
		{
			if(null == _inst)
			{
				_inst = new PlaceDataManager();
			}
			return _inst;
		}
	
		private var _data:Object = {};
	
		/**
		 * 初始化...嗯...
		 */
		public function init( v:Array):void
		{
			var len:int = v.length;
			for(var i:int = 0; i < len; ++i)
			{
//				this.add((place_info)v.elementAt(i));
				this.add(v[i]);
				// _data.put(((place_info)v.elementAt(i)).getId(), new
				// PlaceData((place_info)v.elementAt(i)));
			}
		}
	
		public function add( info:place_info):void
		{
//			_data.put(info.getId(), new PlaceData(v));
			_data[info.getId()] = new PlaceData(info);
		}
	
		public function del(id:String):void
		{
//			_data.remove(id);
			_data[id] = null
		}
	
		public function get(id:String):PlaceData 
		{
			return _data[id];
		}
	
		public function reset():void
		{
			_data = {};
		}
	}
}
