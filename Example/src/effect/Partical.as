package effect
{
	import com.thinkido.example.Application;

	public class Partical extends Application
	{
		public function Partical()
		{
		}

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
			var text3:TextMc3 = new TextMc3();
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
			
		}


	}
}