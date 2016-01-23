package framework.views
{
import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;

import framework.consts.EventType;
import framework.events.EventDispatcher;
import framework.geom.Rectangle;
import framework.time.ITickListener;
import framework.time.TickItem;
import framework.time.Ticker;
import framework.util.Keyboard;
import game.model.Global;

/**
 * ³¡¾°ÀàµĻùÀà
 * 
 * @author Jing
 */
public class Stage extends Canvas implements Runnable
{

	public static var current:Stage= null;

	/**
	 * ÓÎϷÿ֡µÄԤ¼ƺÄʱ
	 */
	private var _frameMS:int= 16;

	private var _now:Number= 0;

	/**
	 * µ±ǰµÄʱ¼ä(ºÁÃë)
	 * 
	 * @return
	 */
	public function now():Number{
		return _now;
	}

	/**
	 * ʱ¼äÐÄÌøÆ÷
	 */
	public const ticker:Ticker= new Ticker();

	private var _realFPS:int= 0;

	/**
	 * ʵ¼ÊÓÎϷÖÐÕæʵµÄ֡Êý
	 */
	public function getFPS():int{
		return _realFPS;
	}

	/**
	 * ¼ì²éÓÎϷ֡ÊýµÄʱ¼äµã
	 */
	private var _checkFPSTime:Number= 0;

	/**
	 * ÔÚһÃëÖÐִÐеÄ֡Êý
	 */
	private var _frameInSecond:int= 0;

	/**
	 * ±³¾°ɫ
	 */
	private var _bgColor:int= 0;

	/**
	 * Îę̀¿í¶È
	 */
	private var _stageWidth:int= 640;

	public function stageWidth():int{
		return _stageWidth;
	}

	/**
	 * Îę̀¸߶È
	 */
	private var _stageHeight:int= 530;

	public function stageHeight():int{
		return _stageHeight;
	}

	private var _viewWidth:int= 0;

	/**
	 * Îę̀µÄÊӾõ¿í¶È
	 */
	public function viewWidth():int{
		return _viewWidth;
	}

	private var _viewHeight:int= 0;

	/**
	 * Îę̀µÄÊӾõ¸߶È
	 */
	public function viewHeight():int{
		return _viewHeight;
	}

	/**
	 * ÉèÖÃÎę̀µÄÊӾõ¿í¸ß
	 * 
	 * @param w
	 * @param h
	 */
	public function setViewSize(w:int, h:int):void{
		_viewWidth = w;
		_viewHeight = h;
	}

	/**
	 * ÓÎϷµĻ­²¼
	 */
	// private Image _canvas = null;

	private var _viewPort:Rectangle= null;

	/**
	 * ÊӿÚ
	 * 
	 * @return
	 */
	public function viewPort():Rectangle{
		return _viewPort;
	}

	private var _root:Sprite= null;

	/**
	 * Ö÷ÏÔʾÈÝÆ÷(ÎĵµÀà)
	 */
	public function getRoot():Sprite{
		return _root;
	}

	private var _stats:Stats= null;

	/**
	 * ״̬Æ÷
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
	 * ÏÔʾÒýÇæ״̬
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
	 * ÊǷñÒѳõʼ»¯ÁË
	 */
	private var _inited:Boolean= false;

	/**
	 * ¼üÅÌ
	 */
	public const keyboard:Keyboard= new Keyboard();

	/**
	 * ֪ͨÕß
	 */
	public const notice:EventDispatcher= new EventDispatcher();

	public function Stage()
	{

	}

	public function Stage(_rootCls:Class)
	{
		init(_rootCls);
	}

	public function Stage(_rootCls:Class, fps:int, bgColor:int, stageW:int, stageH:int)
	{
		setFPS(fps);
		_bgColor = bgColor;
		_viewWidth = _stageWidth = stageW;
		_viewHeight = _stageHeight = stageH;
		_viewPort = new Rectangle(0, 0, stageW, stageH);
		// _canvas = Image.createImage(_stageWidth, _stageHeight);
		init(_rootCls);
	}

	public function init(_rootCls:Class):void{
		if(_inited)
		{
			return;
		}
		_inited = true;
		setFullScreenMode(true);
		current = this;
		_now = System.currentTimeMillis();
		// ³õʼ»¯ʱ¼äÆ÷µÄʱ¼ä
		ticker.tick(_now);
		setRoot(_rootCls);
		new Thread(this).start();
	}

	public function setRoot(_rootCls:Class):void{
		try
		{
			_root = Sprite(_rootCls.newInstance());
		}
		catch(var e:InstantiationException)
		{
			trace( e.getStackTrace() );   //e.printStackTrace();
		}
		catch(var e:IllegalAccessException)
		{
			trace( e.getStackTrace() );   //e.printStackTrace();
		}
		// ÎĵµÀàµĸ¸ÀàÊÇËü×Լº,ÒԴË×÷Ϊ±ê¼Ç
		_root.setParent(_root);
		// ´¥·¢ÎĵµÀàµÄaddedToStage
		_root.addedToStage();
	}

	public function setFPS(fps:int):void{
		_frameMS = 1000/ fps;
	}

	public function run():void{
		_checkFPSTime = System.currentTimeMillis() + 1000;
		while(true)
		{
			try
			{
				_now = System.currentTimeMillis();
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
					// ½øÈë֡
					_root.enterFrame(startTime);
					// Öػæ
					repaint(); // Æäʵ¿ÉÒÔËã³öÔà¾ØÐÎÇøÓòȻºó½øÐÐÖػ棬ÒԺó¸ù¾ÝÐèҪÓŻ¯
					serviceRepaints();
				}

				var usedTime:Number= System.currentTimeMillis() - startTime;

				if(usedTime < _frameMS)
				{
					System.gc();
					usedTime = System.currentTimeMillis() - startTime;
					if(usedTime < _frameMS)
					{
						Thread.sleep(_frameMS - usedTime);
					}
				}
			}
			catch(var e:InterruptedException)
			{
				trace( e.getStackTrace() );   //e.printStackTrace();
			}
		}
	}

	protected function paint(g:Graphics):void{
		if(_viewWidth == _stageWidth && _viewHeight == _stageHeight)
		{
			// ʹÓÃֱ»淽ʽ

			// Çå³򳡾°
			g.setClip(0, 0, _stageWidth, _stageHeight);
			g.setColor(_bgColor);
			g.fillRect(0, 0, _stageWidth, _stageHeight);

			if(null != _root)
			{
				_root.paint(g);
			}
		}
		else
		{
			// ʹÓûº´滭·¨
			// Graphics cg = _canvas.getGraphics();
			// // Çå³򳡾°
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
			// //trace("ºÄʱ£º" + (e - s));
			// g.drawImage(cache, 0, 0, 0);
		}
	}

	/**
	 * °´¼ü°´ÏÂÊ¼þ
	 */
	protected function keyPressed(keyCode:int):void{
		keyboard.pressed(keyCode);
	}

	/**
	 * °´¼üÖظ´´¥·¢Ê¼þ
	 */
	protected function keyRepeated(keyCode:int):void{

	}

	/**
	 * °´¼üÊͷÅÊ¼þ
	 */
	protected function keyReleased(keyCode:int):void{
		keyboard.released(keyCode);
	}
}

/**
 * ÒýÇæ״̬
 * 
 * @author Jing
 */
class Stats extends Sprite implements ITickListener
{

	/**
	 * FPSÏÔʾÎı¾
	 */
	private var _tf:TextField= null;

	private var _quad:Bitmap= null;

	private var _output:String= "";

	public function Stats()
	{
		_tf = createTF();
		Stage.current.ticker.setTimeInterval(1000, this, null);
		_quad = new Bitmap(Global.imgDarkBg);
		this.addChildAt(_quad, 0);
	}

	private function createTF():TextField{
		var tf:TextField= new TextField();
		tf.setBold(true);
		tf.setSize(Font.SIZE_LARGE);
		tf.setColor(0xFFFFFF);
		// tf.setLinegap(-10);
		this.addChild(tf);
		return tf;
	}

	public function onTick(tickItem:TickItem):void{
		(Sprite(this.getParent())).addChild(this);

		// Runtime.getRuntime().gc();

		var free:Number= Runtime.getRuntime().freeMemory() >> 10;
		var total:Number= Runtime.getRuntime().totalMemory() >> 10;

		var content:String= "Time:" + int((Stage.current.now() / 1000) )+ "\n";
		content += "FPS:" + Stage.current.getFPS() + "\n";
		content += "MEM_USED:" + (total - free) + "kb";
		content += _output;
		_tf.setText(content);
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
}