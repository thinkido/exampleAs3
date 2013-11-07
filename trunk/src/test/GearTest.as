package test
{
	import com.thinkido.example.Application;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextFormat;
	
	import gear.net.AssetData;
	import gear.net.LibData;
	import gear.net.RESManager;
	import gear.net.SWFLoader;
	import gear.net.XMLLoader;
	import gear.ui.controls.GButton;
	import gear.ui.controls.GTextArea;
	import gear.ui.data.GButtonData;
	import gear.ui.data.GTextAreaData;
	import gear.ui.data.GToolTipData;
	import gear.ui.manager.UIManager;
	import gear.ui.skin.ASSkin;
	import gear.ui.theme.BlackTheme;
	import gear.utils.Global;
	
	public class GearTest extends Application
	{
		/**
		 * @private
		 */
		protected var _global : Global;
		/**
		 * @private
		 */
		protected var _res : RESManager;
		/**
		 * @private
		 */
		protected var _libs : XMLLoader;
		
		public function GearTest()
		{
		}
		
		override protected function initApp():void{
			
			ASSkin.setTheme(AssetData.AS_LIB, new BlackTheme());
			
			UIManager.root = this ;
			_res = RESManager.instance;
			
			_res.add(new SWFLoader(new LibData("assets/ui.swf")));
			_res.addEventListener(Event.COMPLETE, this.completeHandler);
			_res.load();
			
		}
		
		private function completeHandler(event:Event) : void
		{
			var gd:GButtonData = new GButtonData();
			gd.labelData.text = "thinkido" ;
			gd.toolTipData = new GToolTipData();
			gd.toolTipData.labelData.text = "this is a button!confgratuation thinkido";
			
			var gb:GButton = new GButton(gd);
			addChild(gb);
			gb.moveTo(300,200);
			
			var gtd:GTextAreaData = new GTextAreaData();
			var tf:TextFormat = new TextFormat(null,14,0xffff00);
			gtd.textFormat = tf ;
			var gtxt:GTextArea = new GTextArea(gtd);
			gtxt.text = "hello thinkido" ;
			gtxt.setSize(200,500);
			gtxt.moveTo(10,100);
			addChild(gtxt);
		}
	}
}