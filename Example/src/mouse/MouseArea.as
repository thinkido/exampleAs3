package mouse
{
	import com.thinkido.example.Application;
	import com.thinkido.framework.common.vo.StyleData;
	import com.thinkido.framework.utils.DrawUtil;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class MouseArea extends Application
	{
		private var red:Sprite = new Sprite(); 
		private var blue:Sprite = new Sprite(); 
		private var green:Sprite = new Sprite(); 
		
		private var redContainer:Sprite = new Sprite();
		private var blueContainer:Sprite = new Sprite();
		private var greenContainer:Sprite = new Sprite();
		
		private var redsty:StyleData ;
		private var bluesty:StyleData ;
		private var greensty:StyleData ;
		
		private var content:Sprite = new Sprite();
		
		public function MouseArea()
		{
		}
		
		override protected function initApp():void{
			
			redsty = new StyleData(1,0xff0000,1,0xcc0000,0.6) ;
			bluesty = new StyleData(1,0x0000ff,1,0x0000cc,0.6) ;
			greensty = new StyleData(1,0x00ff00,1,0x00cc00,0.6) ;
			
			DrawUtil.drawRect(red,new Point(100,60),new Point(160,120),redsty);
			DrawUtil.drawRect(blue,new Point(60,100),new Point(120,160),bluesty);
			DrawUtil.drawRect(green,new Point(140,100),new Point(200,160),greensty);
			
			addChild(content);
			content.addChild(redContainer);
			content.addChild(blueContainer);
			content.addChild(greenContainer);			
			redContainer.addChild(red);
			blueContainer.addChild(blue);
			greenContainer.addChild(green);
			
			red.name =  "red" ;
			blue.name =  "blue" ;
			green.name =  "green" ;
			redContainer.name =  "redContainer" ;
			blueContainer.name =  "blueContainer" ;
			greenContainer.name =  "greenContainer" ;
			
			red.addEventListener(MouseEvent.CLICK,doclick);
			blue.addEventListener(MouseEvent.CLICK,doclick);
			green.addEventListener(MouseEvent.CLICK,doclick);
			
			redContainer.addEventListener(MouseEvent.CLICK,doclick);
			blueContainer.addEventListener(MouseEvent.CLICK,doclick);
			greenContainer.addEventListener(MouseEvent.CLICK,doclick);
			
			
			showMessage();
//			居中
			content.x = (stage.width - content.width)/2 ;
			content.y = (stage.height - content.height)/2 ;
			
			trace(greenContainer.x,greenContainer.y,greenContainer.width,greenContainer.height);
			
			blue.mouseEnabled = false ;
		}
		
		private function showMessage():void
		{
			var txt:TextField = createTxt();
			txt.text = "结果：\n" +
				"1、绿色green.mouseEnable = false,仍然点击不了red部分\n" +
				"2、greenContainer.addChild(green),\n" +
				"greenContainer.x 和 y = 0,\n" +
				"greenContainer.width 和 height 和 green 一样\n" ;
			txt.x = 300 ;
			txt.y = 100 ;
		}

		private function createTxt():TextField
		{
			var txt:TextField = new TextField();
			content.addChild(txt);
			txt.width = 300 ;
			txt.wordWrap =true ;
			var tf:TextFormat = new TextFormat(null,14,0xffffff);
			txt.defaultTextFormat = tf ;
			return txt;
		}

		
		private function doclick(evt:MouseEvent):void{
			
			trace(evt.currentTarget.name ) ;
		}
		
	}
}