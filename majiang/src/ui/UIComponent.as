package ui
{	
	import framework.resources.Res;
	
	import game.view.inline.LoadingView;
	
	import managers.ResManager;
	
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class UIComponent extends Sprite
	{
		
		protected var _resList:Array = [];
		
		/**
		 * 普通状态
		 */
		public static var STATE_NORMAL:int = 0;
		
		/**
		 * 焦点状态
		 */
		public static var STATE_FOCUS:int = 1;
		
		/**
		 * 禁用状态
		 */
		public static const STATE_DISABLE:int = 2;
		
		/**
		 * checked普通状态
		 */
		public static const STATE_CHECKED_NORMAL:int = 3;
		
		/**
		 * checked焦点状态
		 */
		public static const STATE_CHECKED_FOCUS:int= 4;
		
		/**
		 * checked禁用状态
		 */
		public static const STATE_CHECKED_DISABLE:int = 5;
		
		/**
		 * 向上
		 */
		public static const DIR_UP:int = 0;
		
		/**
		 * 向下
		 */
		public static const DIR_DOWN:int = 1;
		
		/**
		 * 向左
		 */
		public static const DIR_LEFT:int = 2;
		
		/**
		 * 向右
		 */
		public static const DIR_RIGHT:int = 3;
		
		/**
		 * 正方向
		 */
		public static var DIR_POSITIVE:Boolean = true;
		
		/**
		 * 负方向
		 */
		public static var DIR_NEGATIVE:Boolean = false;
		
		/**
		 * 纵向
		 */
		public static const SCROLL_VERTICAL:int = 0;
		
		/**
		 * 横向
		 */
		public static const SCROLL_HORIZONTAL:int = 1;
		
		/**
		 * 将相对路径转换为Res key
		 * 
		 * @param path 相对路径
		 * @return Res中对应的key
		 */
		protected static function transformPath(path:String):String
		{
			return path.replace('.', '_');
		}
		
		public function removeAllChildren():void
		{
			var num:int = this.numChildren;
			while(num-- > 0)
			{
				this.removeChildAt(0);
			}
		}
		
		protected static function decodeType(type:String):UIComponent
		{
			if(type == "ButtonObjectData")
//				return new UIButton();
				return new UIButton;
			else if(type == "CheckBoxObjectData")
				return new UICheckBox();
			else if(type == "ImageViewObjectData" || type == "SpriteObjectData")
				return new UIImageView();
			else if(type == "ListViewObjectData")
				return new UIListView();
			else if(type == "LoadingViewObjectData")
				return new LoadingView();
			else if(type == "TextBMFontObjectData")
				return new UITextBMFont();
			else if(type == "TextObjectData")
				return new UIText();
//				return new TextField(100,22,'');
			else if(type == "ProjectNodeObjectData")
				return new UILayer();
			else
				return null;
		}
		
		public function initWithJsonObject(data:Object):void
		{
			
		}
		
		public function getJson(name:String):Object
		{
			_resList.addElement(name);
			return ResManager.getFile( name , Res.TYPE_JSON ) ;
		}
		
		public function getTexture(name:String):Texture
		{
			_resList.addElement(name);
			return ResManager.getFile(name , Res.TYPE_TEXTURE ) ; 
		}
		
		public function releaseRes():void
		{
			if(_resList != null)
			{
				/*for(Enumeration enumobj = _resList.elements(); enumobj.hasMoreElements();)
				{
					String name = (String)enumobj.nextElement();
					ResManager.release(name);
				}
				_resList.removeAllElements();*/
				for each( var name:String in _resList)
				{
					ResManager.release(name);
				}
				_resList.length = 0;
			}
		}
		
		public function onDispose():void
		{
			_resList = null;
		}
	}
}