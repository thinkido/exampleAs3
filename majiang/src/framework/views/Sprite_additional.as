package framework.views
{
import java.util.Enumeration;
import java.util.Vector;

import javax.microedition.lcdui.Graphics;

import framework.geom.Rectangle;

public class Sprite_additional extends DisplayObject
{

	private var _childs:Vector= new Vector();

	public function Sprite_additional()
	{

	}
	
	/**
	 * ¸øÕâ¸öSpriteÈÝÆ÷É趨һ¸ö¿í¶È
	 * @param w
	 */
	public function setWidth(w:int):void{
		_width = w;
	}
	
	/**
	 * ¸øÕâ¸öSpriteÈÝÆ÷É趨һ¸ö¸߶È
	 * @param h
	 */
	public function setHeight(h:int):void{
		_height = h;
	}
	
	/**
	 * »ñȡÕâ¸öSpriteÈÝÆ÷ËùÓÐ×ӶÔÏóռ¾ݵķ¶Χ£¬x,yΪ0
	 * @return
	 */
	public function getBounds():Rectangle{
		var bounds:Rectangle= null;
		for(var enumobj:Enumeration= _childs.elements(); enumobj.hasMoreElements();)
		{
			var object:DisplayObject= DisplayObject(enumobj.nextElement());
			var objBounds:Rectangle= object.getBounds();
			if(null == bounds)
			{
				bounds = Rectangle.getUnionRect(objBounds, objBounds);
			}
			else
			{
				bounds = Rectangle.getUnionRect(objBounds, bounds);
			}
		}
		bounds.setX(_x);
		bounds.setY(_y);
		return bounds;
	}

	public function paint(g:Graphics):void{
		for(var enumobj:Enumeration= _childs.elements(); enumobj.hasMoreElements();)
		{
			var object:DisplayObject= DisplayObject(enumobj.nextElement());
			if(true == object.getVisible())
			{
				object.paint(g);
			}
		}
	}

	protected function addedToStage():void{
		for(var enumobj:Enumeration= _childs.elements(); enumobj.hasMoreElements();)
		{
			var object:DisplayObject= DisplayObject(enumobj.nextElement());
			object.addedToStage();
		}
	}

	protected function removedFromStage():void{
		for(var enumobj:Enumeration= _childs.elements(); enumobj.hasMoreElements();)
		{
			var object:DisplayObject= DisplayObject(enumobj.nextElement());
			object.removedFromStage();
		}
	}

	/**
	 * Ìí¼ÓÏÔʾ¶ÔÏóµ½Áбí
	 * 
	 * @param object
	 * @return
	 */
	public function addChild(object:DisplayObject):DisplayObject{
		if(object.getParent() != null)
		{
			var parent:Sprite_additional= Sprite_additional(object.getParent());
			parent.removeChild(object);
		}
		_childs.addElement(object);
		object.setParent(this);
		return object;
	}

	/**
	 * ½«ÏÔʾ¶ÔÏóÔÚָ¶¨λÖòåÈë
	 * 
	 * @param object
	 * @param index
	 * @return
	 */
	public function addChildAt(object:DisplayObject, index:int):DisplayObject{
		// ÓпÉÄÜ֮ǰÔÚÁбíÖУ¬ËùÒÔÏÈÒƳýһ´Î
		if(object.getParent() != null)
		{
			var parent:Sprite_additional= Sprite_additional(object.getParent());
			parent.removeChild(object);
		}

		_childs.insertElementAt(object, index);
		object.setParent(this);
		return object;
	}

	/**
	 * ´ÓÁбíÒƳýÏÔʾ¶ÔÏó
	 * 
	 * @param object
	 * @return
	 */
	public function removeChild(object:DisplayObject):DisplayObject{
		if(true == _childs.removeElement(object))
		{
			object.setParent(null);
		}
		return object;
	}

	/**
	 * ÒƳýָ¶¨Ë÷ÒýλÖõÄÏÔʾ¶ÔÏó
	 * 
	 * @param index
	 * @return
	 */
	public function removeChildAt(index:int):DisplayObject{
		if(index >= _childs.size())
		{
			return null;
		}

		var object:DisplayObject= DisplayObject(_childs.elementAt(index));
		_childs.removeElementAt(index);
		object.setParent(null);
		return object;
	}

	/**
	 * »ñȡÏÔʾ¶ÔÏóµÄË÷Òýֵ
	 * 
	 * @param object
	 */
	public function getChildIndex(object:DisplayObject):int{
		return _childs.indexOf(object);
	}

	/**
	 * »ñȡָ¶¨Ë÷ÒýλÖõĶÔÏó
	 * 
	 * @param index
	 * @return
	 */
	public function getChildAt(index:int):DisplayObject{
		if(index < 0|| index >= _childs.size())
		{
			return null;
		}

		return (DisplayObject)_childs.elementAt(index);
	}

	/**
	 * ͨ¹ýÃû³ƻñȡ¶ÔÏó
	 * 
	 * @param name
	 * @return
	 */
	public function getChildByName(name:String):DisplayObject{
		if(null != name)
		{
			for(var enumobj:Enumeration= _childs.elements(); enumobj.hasMoreElements();)
			{
				var object:DisplayObject= DisplayObject(enumobj.nextElement());
				if(null != object.getName() && object.getName().equals(name))
				{
					return object;
				}
			}
		}
		return null;
	}

	/**
	 * »ñȡ×ӶÔÏóÊýÁ¿
	 * 
	 * @return
	 */
	public function numChildren():int{
		return _childs.size();
	}

	/**
	 * ÒƳýËùÓеÄ×ӶÔÏó
	 */
	public function removeAllChildren():void{
		_childs.setSize(0);
	}

	/**
	 * ÓÎϷ½øÈëÐÂһ֡
	 */
	protected function enterFrame(time:Number):void
	{
		for(var enumobj:Enumeration= _childs.elements(); enumobj.hasMoreElements();)
		{
			var object:DisplayObject= DisplayObject(enumobj.nextElement());
			object.enterFrame(time);
		}
	}

	protected function onScaleChange(scaleX:Number, scaleY:Number):void{

	}
}
}