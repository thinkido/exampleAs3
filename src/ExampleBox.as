package
{
	import com.thinkido.example.Application;
	import com.thinkido.framework.manager.BrowerManager;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import gear.net.AssetData;
	import gear.net.LibData;
	import gear.net.RESManager;
	import gear.net.SWFLoader;
	import gear.net.XMLLoader;
	import gear.ui.cell.LabelSource;
	import gear.ui.controls.GList;
	import gear.ui.core.ScaleMode;
	import gear.ui.data.GListData;
	import gear.ui.manager.UIManager;
	import gear.ui.skin.ASSkin;
	import gear.ui.theme.BlackTheme;
	import gear.utils.Global;
	
	import org.osflash.thunderbolt.Logger;
	
	[SWF(frameRate="5")]
	public class ExampleBox extends Application
	{
		public function ExampleBox()
		{
			super();
		}
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
		
		private var exampleConfigKey:String = "exampleConfigXml";
		override protected function initApp():void{
			
			ASSkin.setTheme(AssetData.AS_LIB, new BlackTheme());
			
			UIManager.root = this ;
			_res = RESManager.instance;
			
			Logger.info("load ui begin");
			_res.add(new SWFLoader(new LibData("assets/ui.swf",null,"1")));
//			_res.add(new XMLLoader(new LibData("assets/exampleConfig.xml",exampleConfigKey)));
			_res.addEventListener(Event.COMPLETE, this.completeHandler);
			_res.load();
			
		}
		
		private function completeHandler(event:Event) : void
		{
			Logger.info("load ui complate");
			/*var gd:GButtonData = new GButtonData();
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
			addChild(gtxt);*/
			
//			var exampleXml:XML = RESManager.getXML(exampleConfigKey) ;
			var glistdata:GListData = new GListData();
			glistdata = new GListData();
			glistdata.x = 10;
			glistdata.y = 100;
			glistdata.scaleMode = ScaleMode.AUTO_SIZE;
			glistdata.cellData.width = 100;
			glistdata.cellData.height = 22;
			var list:GList = new GList(glistdata);
			addChild(list);
			list.model.source = [new LabelSource("上传方法","taction/upload.swf"),
				new LabelSource("下载方法1","taction/download1.swf"), 
				new LabelSource("下载方法2","taction/download2.swf")];
			list.addEventListener(MouseEvent.CLICK,listclick);
			loader.load(new URLRequest("taction/upload.swf"));
			loader.x = 115 ;
			loader.y = -70 ;
			loader.scaleX = 0.9 ;
			loader.scaleY = 0.9 ;
			addChild(loader);
		}
		
		private var loader:Loader = new Loader();
		
		protected function listclick(event:MouseEvent):void
		{
			var lb:LabelSource = GList(event.currentTarget).selection as LabelSource ;
			if( lb == null ){
				return;
			}
			var url:String = lb.value ;
			loader.load(new URLRequest(url));
			
		}
	}
}