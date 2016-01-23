package game.control
{
	import framework.time.ITickListener;
	import framework.time.TickItem;
	
	import game.model.Global;
	import game.util.CommonUtil;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.text.TextField;
	
	public class LogManager implements ITickListener
	{
		
		public static var LEVEL_PRINT:int = 0;
		
		public static var LEVEL_WARNING:int = 1;
		
		public static var LEVEL_ERROR:int = 2;
		
		public static var _instance:LogManager;
		
		private var _isTest:Boolean;
		
		private static var MAX_LEN:int = 15;
		
		private var _testLayer:Sprite;
		
		private var _quad:Image;
		
		private var _tfSystem:TextField;
		
		private var _tfPrintList:Vector.<TextField>;
		
		private var _startIndex:int;
		
		private var _printLen:int;
		
		// private int _tickerId;
		
		public function LogManager()
		{
		}
		
		static public function getInstance():LogManager
		{
			if(_instance == null)
				_instance = new LogManager();
			return _instance;
		}
		
		public function showPanel():void
		{
			_isTest = true;
			_testLayer = new Sprite();
			Global.root().addChild(_testLayer);
			_quad = new Image(Global.imgDarkBg);
			_testLayer.addChild(_quad);
			_tfSystem = new TextField(100,12,'');
//			_tfSystem.setColor(0xffffff);
			_testLayer.addChild(_tfSystem);
			_tfPrintList = new TextField[MAX_LEN];
			for(var i:int = 0; i < MAX_LEN; i++)
			{
				_tfPrintList[i] = new TextField(100,22,'');
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
		
		public function log(content:String):void
		{
			log_a(content, LEVEL_PRINT);
		}
		
		public function log_a(content:String, level:int):void
		{
			var color:int = 0;
			if(level == LEVEL_ERROR)
			{
				//			Global.heartbeatCmd.stop();
				color = 0xff0000;
				CommonUtil.showPopupWindow(false, content, new callBackA);
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
				var curIndex:int = (_startIndex + _printLen - 1) % MAX_LEN;
				_tfPrintList[curIndex].setText(content);
				_tfPrintList[curIndex].setColor(color);
				for(var i:int = 0; i < MAX_LEN; i++)
				{
					curIndex = (_startIndex + i) % MAX_LEN;
					_tfPrintList[curIndex].setPosition(0, 60 + i * 15);
				}


			}
//			trace(content);
			trace(content);
		}
		
		public function onTick(tickItem:TickItem):void
		{
			/*var free:Number = Runtime.getRuntime().freeMemory() >> 10;
			var total:Number = Runtime.getRuntime().totalMemory() >> 10;
			var content:String = "Time:" + (int)(Stage.current.now() / 1000) + "\n";
			content += "FPS:" + Stage.current.getFPS() + "\n";
			content += "MEM_USED:[" + (total - free) + "/" + total + "KB]";
			_tfSystem.text = content;*/
		}
	}
}
import flash.system.System;

import game.model.callback.ICallbackB;

class callBackA implements ICallbackB
{
	public function run(data:Boolean):void
	{
		System.exit(0);
	}
}
