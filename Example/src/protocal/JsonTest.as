package protocal
{
	import com.adobe.serialization.json.JSON;
	import com.thinkido.example.Application;
	
	import flash.utils.getTimer;
	
	public class JsonTest extends Application
	{
		public function JsonTest()
		{
			super();
		}


		protected override function initApp():void
		{
			var str:String = '{"monster_id":4,"speed":250,"pos":[{"y":117,"x":31},{"y":117,"x":32},{"y":118,"x":33},{"y":118,"x":34}]}' ;
			var str1:String = '{"monster_id":66,"speed":250,"pos":[{"y":142,"x":217},{"y":142,"x":216},{"y":141,"x":215},{"y":141,"x":214},{"y":141,"x":213},{"y":140,"x":212},{"y":140,"x":211}]}'  ;
			
			var n:int  = getTimer() ;
			var obj:Object ;
			for (var i:int = 0; i < 400 ; i++) 
			{
				obj = JSON.decode(str1);
			}
			trace("json:" + (getTimer() - n) );   
			// len:40 time:13
			//str len:400 time:90  str1 len:400 time:140
			// len:4000 time:960
		}

	}
}