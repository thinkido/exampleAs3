package framework.views
{
import flash.display.Graphics;

import configs.AnchorType;

import framework.geom.Point;
import framework.geom.Rectangle;
import framework.resources.FontSheet;
import framework.resources.TextureData;
import framework.util.ImageUtil;

import starling.display.DisplayObject;
import starling.display.Image;

/**
 * λͼ×ÖÌå
 * 
 * @author Jing
 */
public class BitmapFont extends DisplayObject
{

	private var _sheet:FontSheet= null;

	private var _textImageCache:Image= null;

	private var _textChars:String = null;

	private var _text:String= "";

	public function get text():String{
		return _text;
	}

	public function setText(text:String):void{
		if(text != null && _text != text)
		{
			_text = text;
		}

		if(_text.length > 0)
		{
//			_textChars = ;
//			_text.getChars(0, _text.length, _textChars, 0);
			_textChars = _text;
			
			updateSize();
			if(this.rotation != 0)
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
		if(this.rotation != value)
		{
//			_trans = value;
			this.rotation = value;
			if(value != 0)
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
		var td:TextureData;
		for(var i:int= 0; i < _textChars.length; i++)
		{
			td = _sheet.getCharData(_textChars[i]);
			if(null != td)
			{
				h = td.sourceH() > h ? td.sourceH() : h;
				w += td.sourceW();
			}
		}
		var flagColor:uint= 0xFF778899;
		_textImageCache = Image.createImage(w, h);
		var g:Graphics= _textImageCache.getGraphics();
		g.setColor(flagColor);
		g.fillRect(0, 0, _textImageCache.width, _textImageCache.height);

		var pos:int= 0;
		for(i = 0; i < _textChars.length; i++)
		{
			td = _sheet.getCharData(_textChars[i]);
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
			var gp:Point= local2Global(x, y);
			g.drawRegion(_textImageCache, 0, 0, _textImageCache.width, _textImageCache.height, _trans, gp.x(), gp.y(), _anchor);
			return;
		}
		else if(null != _textChars)
		{
			var posX:int= x;
			var posY:int= y;

			if(_anchor != AnchorType.ANCHOR_TOP_LEFT)
			{
				updateSize();

				switch(_anchor)
				{
					case AnchorType.ANCHOR_CENTER:
						posX -= width >> 1;
						posY -= height >> 1;
						break;
					case AnchorType.ANCHOR_BOTTOM_LEFT:
						posY -= height;
						break;
					case AnchorType.ANCHOR_BOTTOM_RIGHT:
						posX -= width;
						posY -= height;
						break;
					case AnchorType.ANCHOR_TOP_RIGHT:
						posX -= width;
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
			width = 0;
			height = 0;
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

		width = w;
		height = h;
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