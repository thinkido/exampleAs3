package framework.views
{
	import flash.display.Graphics;
	import flash.system.System;
	import flash.utils.getTimer;
	
	import framework.consts.EventType;
	import framework.events.EventDispatcher;
	import framework.geom.Rectangle;
	import framework.time.Ticker;
	import framework.util.Keyboard;
	
	import starling.display.Sprite;
	
	/**
	 * 场景类的基类
	 * 
	 * @author Jing
	 */
	public class Stage extends Sprite /*implements Runnable*/
	{
		
		public static var current:Stage= null;
		
		/**
		 * 游戏每帧的预计耗时
		 */
		private var _frameMS:int= 16;
		
		private var _now:Number= 0;
		
		/**
		 *	当前的时间(毫秒)
		 * 
		 * @return
		 */
		public function now():Number{
			return _now;
		}
		
		/**
		 * 时间心跳器
		 */
		public const ticker:Ticker= new Ticker();
		
		private var _realFPS:int= 0;
		
		/**
		 * 实际游戏中真实的帧数
		 */
		public function getFPS():int{
			return _realFPS;
		}
		
		/**
		 * 检查游戏帧数的时间点
		 */
		private var _checkFPSTime:Number= 0;
		
		/**
		 * 在一秒中执行的帧数
		 */
		private var _frameInSecond:int= 0;
		
		/**
		 * 背景色
		 */
		private var _bgColor:int= 0;
		
		/**
		 * 舞台宽度
		 */
		private var _stageWidth:int= 640;
		
		public function stageWidth():int{
			return _stageWidth;
		}
		
		/**
		 * 舞台高度
		 */
		private var _stageHeight:int= 530;
		
		public function stageHeight():int{
			return _stageHeight;
		}
		
		private var _viewWidth:int= 0;
		
		/**
		 *	舞台的视觉宽度
		 */
		public function viewWidth():int{
			return _viewWidth;
		}
		
		private var _viewHeight:int= 0;
		
		/**
		 * 舞台的视觉高度
		 */
		public function viewHeight():int{
			return _viewHeight;
		}
		
		/**
		 * 设置舞台的视觉宽高
		 * 
		 * @param w
		 * @param h
		 */
		public function setViewSize(w:int, h:int):void{
			_viewWidth = w;
			_viewHeight = h;
		}
		
		/**
		 * 游戏的画布
		 */
		// private Image _canvas = null;
		
		private var _viewPort:Rectangle= null;
		
		/**
		 * 视口
		 * 
		 * @return
		 */
		public function viewPort():Rectangle{
			return _viewPort;
		}
		
		private var _root:Sprite= null;
		
		/**
		 *  主显示容器(文档类)
		 */
		public function getRoot():Sprite{
			return _root;
		}
		
		private var _stats:Stats= null;
		
		/**
		 *	状态器
		 * 
		 * @return
		 */
		public function setStatsOutput(content:String):void{
			if(null != _stats)
			{
				_stats.output(content);
			}
		}
		
		/**
		 * 显示引擎状态״̬
		 * 
		 * @param b
		 */
		public function showStats(b:Boolean):void{
			if(true == b)
			{
				if(null == _stats)
				{
					_stats = new Stats();
					_root.addChild(_stats);
				}
			}
			else
			{
				if(null != _stats)
				{
					_root.removeChild(_stats);
					_stats = null;
				}
			}
		}
		
		/**
		 * 是否已初始化了
		 */
		private var _inited:Boolean= false;
		
		/**
		 * 键盘
		 */
		public const keyboard:Keyboard= new Keyboard();
		
		/**
		 * 键盘
		 */
		public const notice:EventDispatcher= new EventDispatcher();
		
		public function Stage()
		{
			
		}
		
		public function Stage_1(_rootCls:Class):void
		{
			init(_rootCls);
		}
		
		public function Stage_2(_rootCls:Class, fps:int, bgColor:int, stageW:int, stageH:int):void
		{
			setFPS(fps);
			_bgColor = bgColor;
			_viewWidth = _stageWidth = stageW;
			_viewHeight = _stageHeight = stageH;
			_viewPort = new Rectangle(0, 0, stageW, stageH);
			// _canvas = Image.createImage(_stageWidth, _stageHeight);
			init(_rootCls);
//			trace( e.getStackTrace() );   //e.printStackTrace();
		}
		
		public function init(_rootCls:Class):void{
			if(_inited)
			{
				return;
			}
			_inited = true;
//			setFullScreenMode(true);
			current = this;
//			_now = System.currentTimeMillis();
			_now = getTimer();
			// 初始化时间器的时间
			ticker.tick(_now);
			setRoot(_rootCls);
//			new Thread(this).start();
		}
		
		public function setRoot(_rootCls:Class):void{
			try
			{
				_root = Sprite(_rootCls.newInstance());
			}
			catch(evt:Error)
			{
//				e.printStackTrace();
				trace(evt.message);
			}
			/*catch(e:*)
			{
				e.printStackTrace();
			}*/
			// 文档类的父类是它自己,以此作为标记
//			_root.setParent(_root);
			// 触发文档类的addedToStage
//			_root.addedToStage();
		}
		
		public function setFPS(fps:int):void{
			_frameMS = 1000/ fps;
		}
		
		public function run():void{
//			_checkFPSTime = System.currentTimeMillis() + 1000;
			_checkFPSTime = getTimer() + 1000;
			while(true)
			{
				try
				{
//					_now = System.currentTimeMillis();
					_now = getTimer();
					var startTime:Number= _now;
					if(startTime >= _checkFPSTime)
					{
						_realFPS = _frameInSecond;
						_frameInSecond = 0;
						_checkFPSTime += 1000;
					}
					
					_frameInSecond++;
					if(_root != null)
					{
						notice.dispatchEvent(EventType.EVENT_STAGE_ENTER_FRAME);
						ticker.tick(_now);
						// 进入帧֡
						_root.enterFrame(startTime);
						// 重绘
						repaint(); // 其实可以算出脏矩形区域然后进行重绘，以后根据需要优化
						serviceRepaints();
					}
					
//					var usedTime:Number= System.currentTimeMillis() - startTime;
					var usedTime:Number= getTimer() - startTime;
					
					if(usedTime < _frameMS)
					{
						System.gc();
//						usedTime = System.currentTimeMillis() - startTime;
						usedTime = getTimer() - startTime;
						if(usedTime < _frameMS)
						{
							Thread.sleep(_frameMS - usedTime);
						}
					}
				}
				catch(e:*)
				{
//					e.printStackTrace();
					trace(e.message);
				}
			}
		}
		
		protected function paint(g:Graphics):void{
			if(_viewWidth == _stageWidth && _viewHeight == _stageHeight)
			{
				// 使用直绘方式
				
				// 清楚场景
				g.setClip(0, 0, _stageWidth, _stageHeight);
				g.setColor(_bgColor);
				g.fillRect(0, 0, _stageWidth, _stageHeight);
				
				if(null != _root)
				{
					_root.paint(g);
				}
//				trace( e.getStackTrace() );   //e.printStackTrace();
			}
			else
			{
				//  使用缓存画法
				// Graphics cg = _canvas.getGraphics();
				// // 清楚场景
				// cg.setClip(0, 0, _stageWidth, _stageHeight);
				// cg.setColor(_bgColor);
				// cg.fillRect(0, 0, _stageWidth, _stageHeight);
				//
				// if(null != _root)
				// {
				// _root.paint(cg);
				// }
				//
				// //long s = System.currentTimeMillis();
				// Image cache = DisplayObject.scale(_canvas, _viewWidth,
				// _viewHeight);
				// //long e = System.currentTimeMillis();
				// //System.out.println("ºÄʱ£º" + (e - s));
				// g.drawImage(cache, 0, 0, 0);
			}
		}
		
		/**
		 * 按键按下事件
		 */
		protected function keyPressed(keyCode:int):void{
			keyboard.pressed(keyCode);
		}
		
		/**
		 * 按键重复触发事件
		 */
		protected function keyRepeated(keyCode:int):void{
			
		}
		
		/**
		 * 按键释放事件
		 */
		protected function keyReleased(keyCode:int):void{
			keyboard.released(keyCode);
		}
	}
}
import framework.time.ITickListener;
import framework.time.TickItem;

import game.model.Global;

import starling.display.Image;
import starling.display.Sprite;
import starling.display.Stage;
import starling.text.TextField;

/**
 * 引擎状态̬
 * 
 * @author Jing
 */
class Stats extends Sprite implements ITickListener
{
	
	/**
	 * FPSÏÔʾÎı¾
	 */
	private var _tf:TextField= null;
	
	private var _quad:Image= null;
	
	private var _output:String= "";
	
	public function Stats()
	{
		_tf = createTF();
		Stage.current.ticker.setTimeInterval(1000, this, null);
		_quad = new Image(Global.imgDarkBg);
		this.addChildAt(_quad, 0);
	}
	
	private function createTF():TextField{
		var tf:TextField= new TextField(100,22,'');
		tf.bold = true;
		tf.fontSize = 12;
		tf.color = 0xFFFFFF;
		/*tf.setBold(true);
		tf.setSize(Font.SIZE_LARGE);
		tf.setColor(0xFFFFFF);*/
		// tf.setLinegap(-10);
		this.addChild(tf);
		return tf;
	}
	
	public function onTick(tickItem:TickItem):void{
		(Sprite(this.parent)).addChild(this);
		
		// Runtime.getRuntime().gc();
		
		/*var free:Number= Runtime.getRuntime().freeMemory() >> 10;
		var total:Number= Runtime.getRuntime().totalMemory() >> 10;
		
		var content:String= "Time:" + int((Stage.current.now() / 1000) )+ "\n";
		content += "FPS:" + Stage.current.getFPS() + "\n";
		content += "MEM_USED:" + (total - free) + "kb";
		content += _output;
		_tf.setText(content);*/
	}
	
	public function output(content:String):void{
		if(content == null)
		{
			_output = "null";
		}
		else
		{
			_output = "\n" + content;
		}
	}
}