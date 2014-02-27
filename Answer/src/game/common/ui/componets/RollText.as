package game.common.ui.componets
{
	import com.greensock.TweenLite;
	import com.thinkido.framework.utils.SystemUtil;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	public class RollText
	{
		private static var MAX_WIDTH:Number = 200;
		private static var MARGIN:Number = 10;
		private static var SPEED:Number = 1;
		private static var MAX_CHILD:Number = 10;
		private static var _parent:DisplayObjectContainer;
		private static var _container:Sprite;
		private static var _noticeArr:Array = [];
		private static var _callBack:Function;
		private static var _isRunning:Boolean = false;
		private static var _hasInit:Boolean = false;
		
		public function RollText()
		{
			throw new Error("can't new it");
		}
		
		public static function init(param1:DisplayObjectContainer, param2:Number, param3:Number = 0, param4:Number = 5, param5:Number = 1, param6:Number = 10, param7:Function = null) : void
		{
			_parent = param1;
			MAX_WIDTH = param2;
			MARGIN = param4;
			SPEED = param5;
			MAX_CHILD = param6;
			_callBack = param7;
			if (_container != null)
			{
				TweenLite.killTweensOf(_container);
				if (_container && _container.parent)
				{
					_container.parent.removeChild(_container);
					_container = null;
				}
			}
			_container = new Sprite();
			_container.mouseEnabled = false;
			_container.mouseChildren = true;
			_container.x = MAX_WIDTH;
			_container.y = param3;
			_parent.addChild(_container);
			_hasInit = true;
			return;
		}
		
		public static function hasInit() : Boolean
		{
			return _hasInit;
		}
		
		public static function resetMaxWidth(param1:Number) : void
		{
			MAX_WIDTH = param1;
			return;
		}
		
		public static function pushText(param1:String, param2:int = 1) : void
		{
			if (!_hasInit)
			{
				return;
			}
			_noticeArr[_noticeArr.length] = new RollTextFace(param1, param2);
			if (!_isRunning)
			{
				go();
			}
			return;
		}
		
		private static function go() : void
		{
			var toX:Number;
			var dur:Number;
			var lastRemoveChild:DisplayObject;
			var num:Number;
			var i:int;
			if (_noticeArr.length == 0)
			{
				toX = -_container.width;
				dur = Math.abs(_container.x - toX) * 0.01 / SPEED;
				TweenLite.to(_container, dur, {x:toX, ease:function (param1:Number, param2:Number, param3:Number, param4:Number) : Number
				{
					return param3 * param1 / param4 + param2;
				}
					, onComplete:onAllComplete});
				_isRunning = false;
				return;
			}
			TweenLite.killTweensOf(_container);
			_isRunning = true;
			if (_container.numChildren > MAX_CHILD)
			{
				do
				{
					
					lastRemoveChild = _container.removeChildAt(0);
				}while (_container.numChildren > MAX_CHILD)
				_container.x = _container.x + (lastRemoveChild.x + lastRemoveChild.width + MARGIN);
				num = _container.numChildren;
				i;
				while (i < num)
				{
					
					_container.getChildAt(i).x = _container.getChildAt(i).x - (lastRemoveChild.x + lastRemoveChild.width + MARGIN);
					i = (i + 1);
				}
			}
			var oldNum:* = _container.numChildren;
			var oldWidth:* = _container.width;
			var oldX:* = _container.x;
			addShowObj(oldWidth > 0 ? (MAX_WIDTH - oldX + MARGIN) : (0));
			if (_container.numChildren > oldNum)
			{
				toX = _container.x - (_container.width - oldWidth);
				dur = Math.abs(_container.x - toX) * 0.01 / SPEED;
				TweenLite.to(_container, dur, {x:toX, ease:function (param1:Number, param2:Number, param3:Number, param4:Number) : Number
				{
					return param3 * param1 / param4 + param2;
				}
					, onComplete:go});
			}
			else
			{
				go();
			}
			return;
		}
		
		private static function onAllComplete() : void
		{
			SystemUtil.clearChildren(_container);
			_container.x = MAX_WIDTH;
			if (_callBack != null)
			{
				_callBack();
			}
			return;
		}
		
		private static function addShowObj(param1:Number) : void
		{
			var _loc_2:RollTextFace = null;
			var _loc_3:RollTextFace = null;
			if (!_noticeArr || _noticeArr.length == 0)
			{
				return;
			}
			for each (_loc_2 in _noticeArr)
			{
				
				if (_loc_2.showCount >= _loc_2.maxShowCount)
				{
					_noticeArr.splice(_noticeArr.indexOf(_loc_2), 1);
					continue;
				}
				_loc_2.showCount += 1;
				_loc_2 = _container.contains(_loc_2) ? (_loc_2.clone()) : (_loc_2);
				_loc_2.x = _loc_3 ? (_loc_3.x + _loc_3.width + MARGIN) : (param1);
				_container.addChild(_loc_2);
				_loc_3 = _loc_2;
				if (_container.width - param1 >= MAX_WIDTH)
				{
					return;
				}
			}
			if (_loc_3 && _container.width - param1 < MAX_WIDTH && _noticeArr.length > 0)
			{
				addShowObj(_container.width + MARGIN);
			}
			return;
		}
	}
}