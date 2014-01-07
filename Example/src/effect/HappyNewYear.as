package effect
{
	import com.thinkido.example.Application;
	import com.thinkido.framework.effect.LightingEffect;
	
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class HappyNewYear extends Application
	{
		public function HappyNewYear()
		{
			super();
		}
		

		protected override function initApp():void
		{
			var year:TextField = new TextField();
			var tf:TextFormat = new TextFormat( "Papyrus" , 60, 0xffffff, false, false, false, null, null, "center");
			year.defaultTextFormat = tf ;
			year.text = "2014 Happy New Year\nTa44";
			year.selectable = false ;
			year.mouseEnabled = false ;
			addChild(year);
			year.width = stage.stageWidth ;
			year.height = stage.stageHeight ;
			year.y = 120 ;
			var year1:TextField = new TextField();
			var tf1:TextFormat = new TextFormat( "RiWenMaoBiXingShu" , 60, 0xffffff, false, false, false, null, null, "center");
			year1.defaultTextFormat = tf1 ;
			year1.text = "一生一世 皆无難事";
			year1.selectable = false ;
			year1.mouseEnabled = false ;
			addChild(year1);
			year1.width = stage.stageWidth ;
			year1.height = stage.stageHeight ;
			year1.y = 300 ;
			
			var filtes:DropShadowFilter = new DropShadowFilter(8);
			year.filters = [filtes] ;
			year1.filters = [filtes] ;
//			year.x = this.stage.stageWidth - text3.width - 100;
//			year.y = this.stage.stageHeight - text3.height - 20 ;
			
//			LightingEffect.getInstance().addEffect(year);
			
			var text3:TextMc3 = new TextMc3();
			addChild(text3);
//			text3.x = (this.stage.stageWidth - text3.width)/2 ;
			text3.x = this.stage.stageWidth - text3.width - 100;
			text3.y = this.stage.stageHeight - text3.height - 20 ;
			
		}


	}
}