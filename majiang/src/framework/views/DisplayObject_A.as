package framework.views
{
	import framework.consts.TransType;
	import framework.events.EventDispatcher;
	import framework.geom.Point;
	import framework.geom.Rectangle;
	
	import javax.microedition.lcdui.Graphics;
	
	import starling.events.EventDispatcher;
	
	/**
	 * ÏÔʾ¶ÔÏó
	 * 
	 * @author Jing
	 */
	public class DisplayObject_A extends starling.events.EventDispatcher
	{
		
		public static const ANCHOR_TOP_LEFT:int= Graphics.TOP | Graphics.LEFT;
		
		public static const ANCHOR_TOP_RIGHT:int= Graphics.TOP | Graphics.RIGHT;
		
		public static const ANCHOR_BOTTOM_LEFT:int= Graphics.BOTTOM | Graphics.LEFT;
		
		public static const ANCHOR_BOTTOM_RIGHT:int= Graphics.BOTTOM | Graphics.RIGHT;
		
		public static const ANCHOR_CENTER:int= Graphics.HCENTER | Graphics.VCENTER;
		
		protected var _anchor:int= DisplayObject.ANCHOR_TOP_LEFT;
		
		protected var _name:String= null;
		
		/**
		 * ÉèÖÃÃû³Æ
		 * 
		 * @param name
		 */
		public function setName(name:String):void{
			_name = name;
		}
		
		/**
		 * »ñȡÃû³Æ
		 * 
		 * @return
		 */
		public function getName():String{
			return _name;
		}
		
		protected var _x:int= 0;
		
		/**
		 * »ñȡ¶ÔÏóX×ø±êֵ
		 * 
		 * @return
		 */
		public function getX():int{
			return _x;
		}
		
		protected var _y:int= 0;
		
		/**
		 * »ñȡ¶ÔÏóY×ø±êֵ
		 * 
		 * @return
		 */
		public function getY():int{
			return _y;
		}
		
		protected var _width:int= 0;
		
		/**
		 * »ñȡ¶ÔÏó¿í¶È
		 * 
		 * @return
		 */
		public function getWidth():int{
			return _width;
		}
		
		protected var _height:int= 0;
		
		/**
		 * »ñȡ¶ÔÏó¸߶È
		 * 
		 * @return
		 */
		public function getHeight():int{
			return _height;
		}
		
		protected var _trans:int= TransType.NONE;
		
		public function getTrans():int{
			return _trans;
		}
		
		/**
		 * ÉèÖÃÐýת½ǶÈ,ʹÓÃTransTypeµÄֵ
		 * 
		 * @param vlaue
		 * @return
		 */
		public function setTrans(value:int):void{
			_trans = value;
		}
		
		protected var _visible:Boolean= true;
		
		public function getVisible():Boolean{
			return _visible;
		}
		
		/**
		 * ÉèÖöÔÏóÊǷñ¿ɼû
		 * 
		 * @param v
		 */
		public function setVisible(v:Boolean):void{
			_visible = v;
		}
		
		protected var _scrollRect:Rectangle= null;
		
		public function getScrollRect():Rectangle{
			return _scrollRect;
		}
		
		/**
		 * ÉèÖùö¶¯ÏÔʾÇøÓò
		 * 
		 * @param rect
		 */
		public function setScrollRect(rect:Rectangle):void{
			_scrollRect = rect;
		}
		
		protected var _parent:DisplayObject= null;
		
		/**
		 * »ñȡ¶ÔÏóµĸ¸¶ÔÏ󣬲»´æÔÚÔòΪnull
		 * 
		 * @return
		 */
		public function getParent():DisplayObject{
			return _parent;
		}
		
		protected var _inStage:Boolean= false;
		
		/**
		 * ¶ÔÏóÊǷñÔÚÎę̀ÉÏ
		 * 
		 * @return
		 */
		public function inStage():Boolean{
			return _inStage;
		}
		
		protected function setParent(parent:DisplayObject):void{
			if(_parent == parent)
			{
				return;
			}
			
			// ¼ì²鵱ǰµĸ¸¶ÔÏóÊǷñÔÚÎę̀ÉÏ
			var isParentInStage:Boolean= false;
			var pp:DisplayObject= parent != null ? parent : _parent;
			while(null != pp)
			{
				if(pp == pp.getParent())
				{
					isParentInStage = true;
					break;
				}
				else
				{
					pp = pp.getParent();
				}
			}
			
			if(true == isParentInStage)
			{
				if(null == parent)
				{
					_inStage = false;
					removedFromStage();
				}
				else
				{
					_inStage = true;
					addedToStage();
				}
			}
			
			_parent = parent;
		}
		
		public function DisplayObject()
		{
			
		}
		
		public function setAnchor(anchor:int):void{
			_anchor = anchor;
		}
		
		/**
		 * ÏÔʾ¶ÔÏóµÄêµã
		 * 
		 * @return
		 */
		public function getAnchor():int{
			return _anchor;
		}
		
		/**
		 * äÖȾº¯Êý
		 * 
		 * @param g
		 */
		abstract public function paint(g:Graphics):void;
		
		/**
		 * ÉèÖÃ×ø±êλÖÃ
		 * 
		 * @param x
		 * @param y
		 */
		public function setPosition(x:int, y:int):void{
			_x = x;
			_y = y;
		}
		
		/**
		 * ·µ»Øһ¸ö¾ØÐΣ¬¸þØÐζ¨ÒåÏà¶ÔÓڸ¸¶ÔÏó×ø±êϵµÄÏÔʾ¶ÔÏóÇøÓò
		 * 
		 * @return
		 */
		public function getBounds():Rectangle{
			var x:int= _x;
			var y:int= _y;
			switch(_anchor)
			{
				case ANCHOR_CENTER:
					x -= (_width >> 1);
					y -= (_height >> 1);
					break;
				case ANCHOR_TOP_RIGHT:
					x -= _width;
					break;
				case ANCHOR_BOTTOM_LEFT:
					y -= _height;
					break;
				case ANCHOR_BOTTOM_RIGHT:
					x -= _width;
					y -= _height;
					break;
			}
			var rect:Rectangle= new Rectangle(x, y, _width, _height);
			return rect;
		}
		
		/**
		 * µ±ǰµÄʱ¼ä
		 * 
		 * @param time
		 */
		abstract protected function enterFrame(time:Number):void;
		
		/**
		 * ±»Ìí¼ӵ½Îę̀ÉÏ
		 */
		abstract protected function addedToStage():void;
		
		/**
		 * ´ÓÎę̀Éϱ»ÒƳý
		 */
		abstract protected function removedFromStage():void;
		
		/**
		 * ½«ÏÔʾ¶ÔÏóÖеĵãת»»³ÉÎę̀ÉϵÄ×ø±ê
		 * 
		 * @return
		 */
		public function local2Global(x:int, y:int):Point{
			var gX:int= x;
			var gY:int= y;
			var parent:DisplayObject= this.getParent();
			while(parent != null)
			{
				var offX:int= parent.getX();
				var offY:int= parent.getY();
				
				if(parent.getAnchor() != ANCHOR_TOP_LEFT)
				{
					var parentBound:Rectangle= parent.getBounds();
					switch(parent.getAnchor())
					{
						case ANCHOR_TOP_RIGHT:
							break;
						case ANCHOR_CENTER:
							offX -= parentBound.w() >> 1;
							offY -= parentBound.h() >> 1;
							break;
						case ANCHOR_BOTTOM_LEFT:
							offY -= parentBound.h();
							break;
						case ANCHOR_BOTTOM_RIGHT:
							offX -= parentBound.w();
							break;
					}
				}
				
				gX += offX;
				gY += offY;
				if(parent != parent.getParent())
				{
					parent = parent.getParent();
				}
				else
				{
					parent = null;
				}
			}
			return new Point(gX, gY);
		}
		
		/**
		 * ¶Ôimage½øÐÐËõ·Å
		 * 
		 * @param srcImage
		 * @param newW
		 * @param newH
		 * @return
		 */
		// public static const Image scale(Image srcImage, int newW, int newH)
		// {
		// int srcW = srcImage.getWidth();
		// int srcH = srcImage.getHeight();
		//
		// int[] colors = new int[srcW * srcH];
		// srcImage.getRGB(colors, 0, srcW, 0, 0, srcW, srcH);
		//
		// int[] targetColors = new int[newW * newH];
		//
		// double kw = (double)srcW / newW;
		// double kh = (double)srcH / newH;
		//
		// for(int y = 0; y < newH; y++)
		// {
		// for(int x = 0; x < newW; x++)
		// {
		// int newIndex = y * newW + x;
		// int srcIndex = (int)(y * kh) * srcW + (int)(x * kw);
		// targetColors[newIndex] = colors[srcIndex];
		// }
		// }
		//
		// return Image.createRGBImage(targetColors, newW, newH, false);
		// }
		
		/**
		 * ¶Ôimage½øÐÐËõ·Å
		 * 
		 * @param srcImage
		 * @param newW
		 * @param newH
		 * @return
		 */
		// public static const void scale(Image srcImage, Image targetImage)
		// {
		// int srcW = srcImage.getWidth();
		// int srcH = srcImage.getHeight();
		// int newW = targetImage.getWidth();
		// int newH = targetImage.getHeight();
		//
		// Graphics g = targetImage.getGraphics();
		//
		// // ÏÈ×öˮƽ·½ÏòÉϵÄÉìËõ±任
		// for(int x = 0; x < newW; x++)
		// {
		// g.setClip(x, 0, 1, srcH); // °´±ÈÀý·ÅËõ
		// g.drawImage(srcImage, x - x * srcW / newW, 0, Graphics.LEFT |
		// Graphics.TOP);
		// }
		//
		// // ÔÙ×ö´¹ֱ·½ÏòÉϵÄÉìËõ±任
		// for(int y = 0; y < newH; y++)
		// {
		// g.setClip(0, y, newW, 1); // °´±ÈÀý·ÅËõ
		// g.drawImage(srcImage, 0, y - y * srcH / newH, Graphics.LEFT |
		// Graphics.TOP);
		// }
		// }
		
	}
}
import framework.views;

