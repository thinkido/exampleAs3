package game.control
{
	import framework.time.ITickListener;
	import framework.time.TickItem;
	import framework.views.Bitmap;
	import framework.views.Sprite;
	import framework.views.Stage;
	import framework.views.TextField;
	
	import game.model.Global;
	import game.model.callback.ICallbackB;
	import game.util.CommonUtil;
	
	public class LogManager implements ITickListener
	{
		
		public static var LEVEL_PRINT:int = 0;
		
		public static var LEVEL_WARNING:int = 1;
		
		public static var LEVEL_ERROR:int = 2;
		
		public static var _instance:LogManager;
		
		private var _isTest:Boolean;
		
		private static var MAX_LEN:int = 15;
		
		private Sprite _testLayer;
		
		private Bitmap _quad;
		
		private TextField _tfSystem;
		
		private TextField[] _tfPrintList;
		
		private int _startIndex;
		
		private int _printLen;
		
		// private int _tickerId;
		
		private LogManager()
		{
		}
		
		public static LogManager getInstance()
		{
			if(_instance == null)
				_instance = new LogManager();
			return _instance;
		}
		
		public void showPanel()
		{
			_isTest = true;
			_testLayer = new Sprite();
			Global.root().addChild(_testLayer);
			_quad = new Bitmap(Global.imgDarkBg);
			_testLayer.addChild(_quad);
			_tfSystem = new TextField();
			_tfSystem.setColor(0xffffff);
			_testLayer.addChild(_tfSystem);
			_tfPrintList = new TextField[MAX_LEN];
			for(int i = 0; i < MAX_LEN; i++)
			{
				_tfPrintList[i] = new TextField();
				_testLayer.addChild(_tfPrintList[i]);
			}
			// _tickerId = Stage.current.ticker.setTimeInterval(1000, this, null);
			Stage.current.ticker.setTimeInterval(1000, this, null);
		}
		
		// public void hidePanel()
		// {
		// _isTest = false;
		// Stage.current.ticker.release(_tickerId);
		// _testLayer.removeAllChildren();
		// _quad = null;
		// _testLayer = null;
		// _tfSystem = null;
		// _tfPrintList = null;
		// Global.root().removeChild(_testLayer);
		// _testLayer = null;
		// }
		
		public void log(String content)
		{
			log(content, LEVEL_PRINT);
		}
		
		public void log(String content, int level)
		{
			int color = 0;
			if(level == LEVEL_ERROR)
			{
				//			Global.heartbeatCmd.stop();
				color = 0xff0000;
				CommonUtil.showPopupWindow(false, content, new ICallbackB()
					{
						
						public void run(boolean data)
						{
							System.exit(0);
						}
					});
			}
			else if(level == LEVEL_WARNING)
			{
				color = 0x00ff00;
				CommonUtil.showPopupWindow(false, content, null);
			}
			else if(level == LEVEL_PRINT)
			{
				color = 0xffffff;
			}
			if(_isTest)
			{
				if(_printLen == MAX_LEN)
				{
					_startIndex++;
					if(_startIndex == MAX_LEN)
						_startIndex = 0;
				}
				else
				{
					_printLen++;
				}
				int curIndex = (_startIndex + _printLen - 1) % MAX_LEN;
				_tfPrintList[curIndex].setText(content);
				_tfPrintList[curIndex].setColor(color);
				for(int i = 0; i < MAX_LEN; i++)
				{
					curIndex = (_startIndex + i) % MAX_LEN;
					_tfPrintList[curIndex].setPosition(0, 60 + i * 15);
				}
			}
			System.out.println(content);
		}
		
		public void onTick(TickItem tickItem)
		{
			long free = Runtime.getRuntime().freeMemory() >> 10;
			long total = Runtime.getRuntime().totalMemory() >> 10;
			String content = "Time:" + (int)(Stage.current.now() / 1000) + "\n";
			content += "FPS:" + Stage.current.getFPS() + "\n";
			content += "MEM_USED:[" + (total - free) + "/" + total + "KB]";
			_tfSystem.setText(content);
		}
	}
}
