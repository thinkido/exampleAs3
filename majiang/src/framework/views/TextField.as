package framework.views
{
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import starling.display.Image;

import framework.geom.Point;
import framework.util.ImageUtil;
import framework.util.StringUtil;

/**
 * Îı¾¿ò
 * 
 * @author Jing
 */
public class TextField extends DisplayObject
{

	public function TextField()
	{
		updateFont();
	}

	private var _font:Font= null;

	private var _text:String= "";

	private var _lines:Array= {""};

	private var _maxLength:int= -1;

	/**
	 * ×î´ó×ַ󴮳¤¶È,-1±íʾ²»ÏÞÖÆ
	 */
	public function maxLength():int{
		return _maxLength;
	}

	/**
	 * ÉèÖÃ×î´ó×ַûÊý
	 * 
	 * @param length
	 */
	public function setMaxLength(length:int):void{
		_maxLength = length;
		if(_maxLength != -1&& _text.length > _maxLength)
		{
			_text = _text.substring(0, _maxLength);
		}
	}

	public function getText():String{
		return _text;
	}

	/**
	 * ÉèÖÃÎı¾ÄÚÈÝ
	 * 
	 * @param text
	 */
	public function setText(text:String):void{
		if(_text == text)
		{
			return;
		}

		_text = text;
		if(_maxLength != -1&& _text.length > _maxLength)
		{
			_text = _text.substring(0, _maxLength);
		}

		_lines = text.split('\n');
		computeSize();
	}

	private var _imgCache:Image= null;

	public function setTrans(value:int):void{
		if(_trans != value)
		{
			_trans = value;
			updateImageCache();
		}
	}

	public function setAnchor(anchor:int):void{
		if(_anchor != anchor)
		{
			_anchor = anchor;
			updateImageCache();
		}
	}

	private var _color:int= 0;

	/**
	 * ÉèÖÃÎı¾ÑÕɫ
	 * 
	 * @param color
	 */
	public function setColor(color:int):void{
		_color = color;
	}

	private var _bold:Boolean= false;

	private var _italic:Boolean= false;

	private var _underlined:Boolean= false;

	private var _size:int= Font.SIZE_MEDIUM;

	private var _linegap:int= 0;

	/**
	 * Ðмä¾à
	 */
	public function linegap():int{
		return _linegap;
	}

	/**
	 * ÉèÖÃÐмä¾à
	 */
	public function setLinegap(linegap:int):void{
		_linegap = linegap;
		computeSize();
	}

	public function isBold():Boolean{
		return _bold;
	}

	public function setBold(v:Boolean):void{
		_bold = v;
		updateFont();
	}

	public function isItalic():Boolean{
		return _italic;
	}

	public function setItalic(v:Boolean):void{
		_italic = v;
		updateFont();
	}

	public function isUnderlined():Boolean{
		return _underlined;
	}

	public function setUnderlined(v:Boolean):void{
		_underlined = v;
		updateFont();
	}

	public function size():int{
		return _size;
	}

	public function setSize(size:int):void{
		_size = size;
		updateFont();
	}

	private var _lineHeight:int= 0;

	/**
	 * Ðиß
	 * 
	 * @return
	 */
	public function lineHeight():int{
		return _lineHeight;
	}

	/**
	 * ÉèÖÃÐиß
	 * 
	 * @param lineHeight
	 */
	public function setLineHeight(lineHeight:int):void{
		_lineHeight = lineHeight;
	}

	protected function updateFont():void{
		var style:int= 0;

		if(_bold)
		{
			style |= Font.STYLE_BOLD;
		}

		if(_italic)
		{
			style |= Font.STYLE_ITALIC;
		}

		if(_underlined)
		{
			style |= Font.STYLE_UNDERLINED;
		}

		if(0== style)
		{
			style = Font.STYLE_PLAIN;
		}

		_font = Font.getFont(Font.FACE_MONOSPACE, style, _size);
		_lineHeight = _font.getHeight();
		computeSize();
	}

	public function paint(g:Graphics):void{
		if(_text == "")
		{
			return;
		}

		if(null != _imgCache)
		{
			var gp:Point= local2Global(_x, _y);
			g.drawRegion(_imgCache, 0, 0, _imgCache.getWidth(), _imgCache.getHeight(), _trans, gp.x(), gp.y(), _anchor);
			return;
		}
		else
		{
			var gp:Point= local2Global(_x, _y);
			if(_font != null)
			{
				g.setFont(_font);
			}
			g.setColor(_color);

			var pos:int= gp.y();
			var gap:int= _lineHeight + _linegap;
			for(var i:int= 0; i < _lines.length; i++)
			{
				g.drawString(_lines[i], gp.x(), pos, 0);
				pos += gap;
			}
		}
	}

	private function computeSize():void{
		_width = 0;
		_height = _lineHeight + (_lineHeight + _linegap) * (_lines.length - 1);
		for(var i:int= 0; i < _lines.length; i++)
		{
			var line:String= null;
			line = _lines[i];
			var w:int= _font.stringWidth(line);
			if(w > _width)
			{
				_width = w;
			}
		}

		updateImageCache();
	}

	protected function updateImageCache():void{
		if("" == _text || (0== _trans && DisplayObject.ANCHOR_TOP_LEFT == _anchor))
		{
			_imgCache = null;
			return;
		}
		var flagColor:int= 0xFF000000| (~_color);

		_imgCache = Image.createImage(_width, _height);
		var g:Graphics= _imgCache.getGraphics();
		g.setColor(flagColor);
		g.fillRect(0, 0, _width, _height);

		if(_font != null)
		{
			g.setFont(_font);
		}
		g.setColor(_color);

		var pos:int= 0;
		var gap:int= _lineHeight + _linegap;
		for(var i:int= 0; i < _lines.length; i++)
		{
			g.drawString(_lines[i], (_width - _font.stringWidth(_lines[i])) / 2, pos, 0);
			pos += gap;
		}

		_imgCache = ImageUtil.alpha(_imgCache, flagColor);
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