package network
{
	public class ProtocolNode
	{
		public var mId:int;
		public var mName:String;
		public var mClazz:Class;
		
		public function ProtocolNode( id:int, name:String, clazz:Class )
		{
			mId = id;
			mName = name;
			mClazz = clazz;
		}
	}
}