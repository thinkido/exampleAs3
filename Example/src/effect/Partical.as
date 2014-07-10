package effect
{
	import com.adobe.images.PNGEncoder;
	import com.thinkido.example.Application;
	import com.thinkido.framework.air.FileUtils;
	import com.thinkido.framework.utils.MathUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.net.FileReference;
	import flash.utils.ByteArray;

	[SWF(width="800",height="480")]
	public class Partical extends Application
	{
		public function Partical()
		{
		}

		private var text3:DisplayObject ;
		protected override function initApp():void
		{
//			var text:TextMc1 = new TextMc1();
//			addChild(text);
//			text.x = 100 ;
//			text.y = 100 ;
//			var text2:TextMc2 = new TextMc2();
//			addChild(text2);
//			text2.x = 100 ;
//			text2.y = 200 ;
			text3 = new TextMc3();
			addChild(text3);
			text3.x = 20 ;
			text3.y = this.stage.stageHeight - text3.height - 20 ;
			
//			var text4:TextMc4 = new TextMc4();
//			addChild(text4);
//			text4.x = 500 ;
//			text4.y = 100 ;
//			var text5:TextMc5 = new TextMc5();
//			addChild(text5);
//			text5.x = 500 ;
//			text5.y = 200 ;
			
			this.addEventListener(MouseEvent.CLICK,caputer);
		}
		
		protected function caputer(event:MouseEvent):void
		{
			var bitmap:Bitmap = new Bitmap();
			var bmd:BitmapData = new BitmapData(text3.width,text3.height,true,0x00ffffff);
			var _ty:int = text3.getBounds(text3).height ;
			bmd.draw(text3,new Matrix(1,0,0,1,0,100));
			bitmap.bitmapData = bmd ;
			var filename:String = "temp" + MathUtil.random(1,10000) +".png" ;
			saveFile(filename, PNGEncoder.encode(bmd)) ;
			trace("in");
		}
		
		//			保存整图
		private function saveFile($fielName:String,$by:ByteArray):void{
//			FileUtils.save($fielName,$fileData);
			$by.position = 0 ;
			var file:FileReference = new FileReference();
			file.save($by,$fielName);
		}

	}
}