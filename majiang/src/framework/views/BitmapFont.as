package framework.views
{
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

import framework.geom.Point;
import framework.geom.Rectangle;
import framework.resources.FontSheet;
import framework.resources.TextureData;
import framework.util.ImageUtil;

/**
 * λͼ×ÖÌå
 * 
 * @author Jing
 */
public class BitmapFont extends DisplayObject
{

	private var _sheet:FontSheet= null;

	private var _textImageCache:Image= null;

	private var _textChars:Array= null;

	private var _text:String= "";

	public function text():String{
		return _text;
	}

	public function setText(text:String):void{
		if(text != null && _text != text)
		{
			_text = text;
		}

		if(_text.length() > 0)
		{
			_textChars = new char[_text.length()];
			_text.getChars(0, _text.length(), _textChars, 0);

			updateSize();
			if(_trans != 0)
			{
				updateTextImageCache();
			}
		}
		else
		{
			_textChars = null;
		}
	}

	public function BitmapFont(sheet:FontSheet)
	{
		init(sheet);
	}

	protected function init(sheet:FontSheet):void{
		_sheet = sheet;
	}

	public function setTrans(value:int):void{
		if(_trans != value)
		{
			_trans = value;
			if(_trans != 0)
			{
				updateTextImageCache();
			}
			else
			{
				_textImageCache = null;
			}
		}
	}

	/**
	 * ¸üÐÂÎı¾ͼƬ»º´æ(ͼƬÐèҪÐýתʱʹÓÃ)
	 */
	private function updateTextImageCache():void{
		var h:int= 0;
		var w:int= 0;
		for(var i:int= 0; i < _textChars.length; i++)
		{
			var td:TextureData= _sheet.getCharData(_textChars[i]);
			if(null != td)
			{
				h = td.sourceH() > h ? td.sourceH() : h;
				w += td.sourceW();
			}
		}
		var flagColor:int= 0xFF778899;
		_textImageCache = Image.createImage(w, h);
		var g:Graphics= _textImageCache.getGraphics();
		g.setColor(flagColor);
		g.fillRect(0, 0, _textImageCache.getWidth(), _textImageCache.getHeight());

		var pos:int= 0;
		for(var i:int= 0; i < _textChars.length; i++)
		{
			var td:TextureData= _sheet.getCharData(_textChars[i]);
			if(null != td)
			{
				var x:int= td.offX() + pos;
				var y:int= td.offY();

				g.drawRegion(_sheet.sheet(), td.x(), td.y(), td.w(), td.h(), 0, x, y, 0);
				pos = x + td.w();
			}
		}

		_textImageCache = ImageUtil.alpha(_textImageCache, flagColor);
	}

	public function paint(g:Graphics):void{
		if(_textImageCache != null)
		{
			var gp:Point= local2Global(_x, _y);
			g.drawRegion(_textImageCache, 0, 0, _textImageCache.getWidth(), _textImageCache.getHeight(), _trans, gp.x(), gp.y(), _anchor);
			return;
		}
		else if(null != _textChars)
		{
			var posX:int= _x;
			var posY:int= _y;

			if(_anchor != DisplayObject.ANCHOR_TOP_LEFT)
			{
				updateSize();

				switch(_anchor)
				{
					case DisplayObject.ANCHOR_CENTER:
						posX -= _width >> 1;
						posY -= _height >> 1;
						break;
					case DisplayObject.ANCHOR_BOTTOM_LEFT:
						posY -= _height;
						break;
					case DisplayObject.ANCHOR_BOTTOM_RIGHT:
						posX -= _width;
						posY -= _height;
						break;
					case DisplayObject.ANCHOR_TOP_RIGHT:
						posX -= _width;
						break;
				}
			}

			for(var i:int= 0; i < _textChars.length; i++)
			{
				var td:TextureData= _sheet.getCharData(_textChars[i]);

				if(null != td)
				{
					var x:int= td.offX() + posX;
					var y:int= td.offY() + posY;

					var gp:Point= local2Global(x, y);
					var drawRect:Rectangle= Rectangle.getIntersectRect(new Rectangle(0, 0, _sheet.sheet().getWidth(), _sheet.sheet().getHeight()), new Rectangle(td.x(), td.y(), td.w(), td.h()));

					g.drawRegion(_sheet.sheet(), drawRect.x(), drawRect.y(), drawRect.w(), drawRect.h(), 0, gp.x(), gp.y(), 0);
					posX = x + td.w();
				}
			}
		}
	}

	private function updateSize():void{
		if(_textChars == null || _sheet == null)
		{
			_width = 0;
			_height = 0;
			return;
		}

		var w:int= 0;
		var h:int= 0;
		for(var i:int= 0; i < _textChars.length; i++)
		{
			var td:TextureData= _sheet.getCharData(_textChars[i]);
			if(null != td)
			{
				w += td.offX() + td.w();
				var fontH:int= td.offY() + td.h();
				if(h < fontH)
				{
					h = fontH;
				}
			}
		}

		_width = w;
		_height = h;
	}

	protected function onScaleChange(scaleX:Number, scaleY:Number):void{

	}

	protected function enterFrame(time:Number):void{

	}

	protected function addedToStage():void{

	}

	protected function removedFromStage():void{

	}

}
}