package framework.views
{
import javax.microedition.lcdui.Graphics;

import framework.geom.Point;
import framework.geom.Rectangle;
import framework.resources.Texture;
import framework.resources.TextureData;

/**
 * λͼÏÔʾ¶ÔÏó
 * 
 * @author Jing
 */
public class Bitmap extends DisplayObject
{

	/**
	 * ÓÃÀ´չÏֵÄimg£¬¿ÉÄÜÊÇËõ·źóµÄÑù×Ó
	 */
	protected var _t:Texture= null;

	/**
	 * ԭʼimg
	 */
	protected var _source:Texture= null;

	public function Bitmap(t:Texture)
	{
		setTexture(t);
	}

	public function Bitmap(t:Texture, anchor:int)
	{
		setTexture(t);
		setAnchor(anchor);
	}

	public function setTexture(t:Texture):void{
		_source = _t = t;
		if(null != t)
		{
			_width = t.data().w();
			_height = t.data().h();
		}
	}

	/**
	 * ÇåÀíλͼÖÐʹÓõÄÎÆÀíÊý¾Ý
	 */
	public function clearTexture():void{
		setTexture(null);
	}

	public function paint(g:Graphics):void{
		if(null == _t)
		{
			return;
		}

		var td:TextureData= _t.data();

		var x:int= _x + td.offX();
		var y:int= _y + td.offY();

		if(_anchor == DisplayObject.ANCHOR_CENTER)
		{
			x -= _width >> 1;
			y -= _height >> 1;
		}
		var gp:Point= local2Global(x, y);

		var drawRect:Rectangle= Rectangle.getIntersectRect(new Rectangle(gp.x(), gp.y(), td.w(), td.h()), Stage.current.viewPort());
		if(null != drawRect)
		{
			var clipX:int= td.x() + drawRect.x() - gp.x();
			var clipY:int= td.y() + drawRect.y() - gp.y();
			var clipW:int= drawRect.w();
			var clipH:int= drawRect.h();

			if(null != _scrollRect)
			{
				clipX += _scrollRect.x();
				clipY += _scrollRect.y();
				if(clipW > _scrollRect.w())
				{
					clipW = _scrollRect.w();
				}
				if(clipH > _scrollRect.h())
				{
					clipH = _scrollRect.h();
				}
			}

			g.drawRegion(_t.img(), clipX, clipY, clipW, clipH, _trans, drawRect.x(), drawRect.y(), 0);
		}
	}

	protected function enterFrame(time:Number):void{

	}

	protected function addedToStage():void{

	}

	protected function removedFromStage():void{

	}
}
}