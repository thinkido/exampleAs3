package framework.views
{
import javax.microedition.lcdui.Graphics;

import framework.consts.EventType;
import framework.geom.Point;
import framework.geom.Rectangle;
import framework.resources.SpriteSheet;
import framework.resources.TextureData;

/**
 * ¶¯»­֡Àà
 * 
 * @author Jing
 */
public class MovieClip extends DisplayObject
{

	private var _ssd:TextureData= null;

	private var _sheet:SpriteSheet= null;

	private var _interval:int= 0;

	private var _playIndex:int= 0;

	private var _changeTime:Number= 0;

	private var _isStop:Boolean= false;

	private var _isLoop:Boolean= false;

	public function isLoop():Boolean{
		return _isLoop;
	}

	/**
	 * ÊǷñѭ»·²¥·Å
	 * 
	 * @param v
	 */
	public function setIsLoop(v:Boolean):void{
		if(_isLoop != v)
		{
			_isLoop = v;
		}
	}

	private var _autoDispose:Boolean= false;

	public function autoDispsoe():Boolean{
		return _autoDispose;
	}

	/**
	 * ÊǷñÔڲ¥·ÅÍêһ´κó×Զ¯Ïú»٣¬Èç¹ûÉèÖÃΪtrue£¬Çëȷ±£mcûÓб»ÆäËü¶ÔÏóÒýÓã¬ÒÔÃâÄڴæй¶
	 * 
	 * @param v
	 */
	public function setAutoDispose(v:Boolean):void{
		if(_autoDispose != v)
		{
			_autoDispose = v;
		}
	}

	public function MovieClip(sheet:SpriteSheet, interval:int)
	{
		init(sheet, interval, DisplayObject.ANCHOR_TOP_LEFT);
	}

	public function MovieClip(sheet:SpriteSheet, interval:int, anchor:int)
	{
		init(sheet, interval, anchor);
	}

	private function init(sheet:SpriteSheet, interval:int, anchor:int):void{
		_sheet = sheet;
		_interval = interval;
		setAnchor(anchor);
	}

	public function paint(g:Graphics):void{
		if(null == _ssd)
		{
			return;
		}

		var x:int= _x + _ssd.offX();
		var y:int= _y + _ssd.offY();
		if(_anchor == DisplayObject.ANCHOR_CENTER)
		{
			x -= _ssd.sourceW() >> 1;
			y -= _ssd.sourceH() >> 1;
		}
		var gp:Point= local2Global(x, y);
		var drawRect:Rectangle= Rectangle.getIntersectRect(new Rectangle(gp.x(), gp.y(), _ssd.w(), _ssd.h()), Stage.current.viewPort());
		if(null != drawRect)
		{
			var clipX:int= _ssd.x() + drawRect.x() - gp.x();
			var clipY:int= _ssd.y() + drawRect.y() - gp.y();
			g.drawRegion(_sheet.sheet(), clipX, clipY, drawRect.w(), drawRect.h(), _trans, drawRect.x(), drawRect.y(), 0);
		}
	}

	public function nextFrame():void{
		_playIndex++;
		if(_playIndex == _sheet.datas().length)
		{
			this.dispatchEvent(EventType.EVENT_MOVIE_CLIP_RESTART);

			if(_autoDispose)
			{
				if(null != this.getParent())
				{
					(Sprite(this.getParent())).removeChild(this);
				}
				return;
			}

			if(false == _isLoop)
			{
				_isStop = true;
				return;
			}

			_playIndex = 0;

		}

		var ssd:TextureData= _sheet.datas()[_playIndex];
		setSSD(ssd);
	}

	private function setSSD(ssd:TextureData):void{
		_ssd = ssd;
		_width = ssd.sourceW();
		_height = ssd.sourceH();
	}

	protected function enterFrame(time:Number):void{
		if(time >= _changeTime && false == _isStop)
		{
			_changeTime = time + _interval;
			nextFrame();
		}
	}

	/**
	 * µ±ǰ²¥·ŵÄ֡
	 * 
	 * @return
	 */
	public function currentFrame():int{
		return _playIndex;
	}

	/**
	 * µ±ǰ²¥·ŵıêǩ
	 * 
	 * @return
	 */
	public function currentLabel():String{
		if(_ssd != null)
		{
			return _ssd.name();
		}
		return null;
	}

	/**
	 * Ìøתµ½ָ¶¨±êǩ²¢ֹͣ²¥·Å
	 * 
	 * @param label
	 */
	public function gotoAndStop(label:String):void{
		if(null != _sheet)
		{
			var ssd:TextureData= _sheet.getSSD(label);
			if(ssd != null)
			{
				setSSD(ssd);
				_isStop = true;
			}
		}
	}

	/**
	 * Ìøתµ½ָ¶¨֡²¢ֹͣ²¥·Å
	 * 
	 * @param frame
	 */
	public function gotoAndStop(frame:int):void{
		if(null != _sheet && frame >= 0&& frame < _sheet.datas().length)
		{
			var ssd:TextureData= _sheet.datas()[frame];
			setSSD(ssd);
			_isStop = true;
		}
	}

	/**
	 * Ìøתµ½ָ¶¨±êǩ²¢ֹͣ²¥·Å
	 * 
	 * @param label
	 */
	public function gotoAndPlay(label:String):void{
		if(null != _sheet)
		{
			var ssd:TextureData= _sheet.getSSD(label);
			if(ssd != null)
			{
				setSSD(ssd);
				_isStop = false;
			}
		}
	}

	/**
	 * Ìøתµ½ָ¶¨֡²¢ֹͣ²¥·Å
	 * 
	 * @param frame
	 */
	public function gotoAndPlay(frame:int):void{
		if(null != _sheet && frame >= 0&& frame < _sheet.datas().length)
		{
			var ssd:TextureData= _sheet.datas()[frame];
			setSSD(ssd);
			_isStop = false;
		}
	}

	public function play():void{
		_isStop = true;
	}

	public function stop():void{
		_isStop = false;
	}

	protected function onScaleChange(scaleX:Number, scaleY:Number):void{

	}

	protected function addedToStage():void{

	}

	protected function removedFromStage():void{

	}

}
}