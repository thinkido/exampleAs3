package app.answer.manager
{
	import app.answer.common.GameConfig;
	import app.answer.common.GameInstance;
	import app.answer.common.control.IResize;
	import app.answer.manager.layer.LayerManager;
	import app.answer.manager.layer.UILayer;
	import app.answer.manager.layer.WindowLayer;
	
	import com.google.analytics.AnalyticsTracker;
	import com.google.analytics.GATracker;
	import com.greensock.TweenLite;
	import com.thinkido.framework.manager.keyBoard.KeyBoardManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	public class POPWindowManager implements IResize
	{
//		private static  var modal:Boolean;
		public static var popWindow:POPWindowManager;
		/***/
		public static const SHOW:String = "SHOW";
		/***/
		public static const HIDE:String = "HIDE";
		private static var container:Sprite;
		public static var childMap:Dictionary = new Dictionary();
		/**需要同时打开2个面板时，等待重置坐标*/
		private static var waitMap:Dictionary = new Dictionary();
		/**存储各个面板共存布局的表*/
		private static var panelLayout:Dictionary = new Dictionary();
		
		/**正在移除面板的列表*/
		private static var _removeList:Array = [];
		
		public function POPWindowManager()
		{
			if (instance)
				throw new Error();
			return;
		}
		
		private static var instance:POPWindowManager;
		public static function getInstance():POPWindowManager
		{
			if (!instance)
				instance = new POPWindowManager();
			return instance;
		}
		
		/***/
		public function resize(width:Number, height:Number):void
		{
			resize2(LayerManager.windowLayer, width, height, LayerManager.windowLayer.modalAlpha);
			resize2(LayerManager.topLayer, width, height, LayerManager.topLayer.modalAlpha);
		}
		
		public static function resize2(layer:UILayer, param1:Number, param2:Number, alpha:Number=0.5) : void
		{
			var _loc_3:DisplayObject = null;
			if (layer.modal)
			{
				layer.graphics.clear();
				layer.graphics.beginFill(0, alpha);
				layer.graphics.drawRect(0, 0, param1, param2);
				layer.graphics.endFill();
			}
			return;
		}
		
		
		
		/**
		 * 添加一个view,显示在舞台中央
		 * @param param1:DisplayObject 要添加的VIEW
		 * @param container:Sprite 要添加VIEW到哪个父容器里
		 * @param mapName:String 要添加的View的所属模块名,XXXX_facade.NAME,如果该窗口是某模块的VIEW，则为模块的NAME，否则不填
		 * @param param2:Boolean default false
		 * @param alone:Boolean 是否移除同一层内其他的view,default:true
		 * 
		 */
		public static function centerWindow(param1:DisplayObject, container:Sprite, mapName:String="", param2:Boolean = false, alone:Boolean = true, alpha:Number=0.5):void
		{
			if (popWindow == null)
			{
				popWindow = getInstance();
			}
			if (!container)
				container = LayerManager.windowLayer;
			container.graphics.clear();
			(container as UILayer).modalAlpha = alpha;
			if (mapName == "" && alone)
			{
				closeAllWindow(container);
			}
			(container as UILayer).modal = param2;
			if (param2)
			{
				KeyBoardManager.enable = false;
				(container as UILayer).modalAlpha = alpha;
				resize2(container as UILayer, GameConfig.sceneWidth, GameConfig.sceneHeight, alpha);
			}
			else
			{
				container.graphics.clear();
			}
			if (includeRemoveList(param1))
			{
				param1.alpha = 1;
				TweenLite.killTweensOf(param1);
				deleteRemoveList(param1);
			}
			param1.alpha = 1;
			param1.x = (GameConfig.sceneWidth - param1.width) / 2;
			param1.y = (GameConfig.sceneHeight - param1.height) / 2;
			container.addChild(param1);
//			popWindow.analyticsTrack(param1,mapName);
			if (mapName != "" && container == LayerManager.windowLayer)
			{
				var olds:int = container.numChildren, i:int = olds-2, childUI:DisplayObject, cmapname:String = "", pos:int;
				for (i;i>=0;i--)
				{
					childUI = container.getChildAt(i);
					if (includeRemoveList(childUI))
						continue;
					cmapname = isBelongToModule(childUI);
					if (cmapname != null)
					{
						pos = isTogether(mapName, cmapname);
						if ( pos <= 0 ){
//							removeSmallWindow(childUI, cmapname);
							FacadeManager.killFacade(cmapname);
						}else{
							if (pos == 2)
								container.setChildIndex(childUI, container.numChildren-1);
						}
					}else{
						removeSmallWindow(childUI, "");
					}
				}
				var lefts:Array = getLeftChild();
				if (lefts.length > 1)
					layoutLayerChild(lefts);
			}
			if (mapName != "")
			{
				childMap[mapName] = param1;
				
				//如果在打开2个面板时，两个面板处于加载期间，玩家点击打开其他模块面板并且也处于WindowLayer层并且不属于等待队列的任何一个时，则删除之前等待的2个面板的等待请求
//				if (!waitMap.hasOwnProperty(mapName))
//				{
//					deleteWaitMap();
//				}
//				else
//				{
//					//否则，置标志位为true
//					waitMap[mapName].com = true;
//					//判断其他是否加载完成
//					if (isWaitMapAllComplete())
//					{
//						//加载完成，处理坐标
//						handleWaitPanels();
//						deleteWaitMap();
//					}
//				}
				
			}
			else
			{
				//如果在打开2个面板时，两个面板处于加载期间，玩家点击打开非模块其他面板并且也处于WindowLayer层时，则删除之前等待的2个面板
				/*if (container is WindowLayer)
					deleteWaitMap();*/
			}
		}
		
		/**
		 * 弹出窗提示,即flex中的Alert
		 * @param text:String 要提示的文字
		 * @param title:String 标题 default ""
		 */
		public static function showAlert(popUp:DisplayObject,parent:Sprite = null,$modal:Boolean = true):void
		{
			/**浏览器缩放时、遮罩未跟随缩放*/
			if(popUp.stage == null)
			{
				parent = parent == null ? LayerManager.alertLayer : parent;
				parent.addChild(popUp);
				popUp.x = (GameConfig.sceneWidth - popUp.width) / 2;
				popUp.y = (GameConfig.sceneHeight - popUp.height) / 2;
				
//				(parent as UILayer).modal = $modal;
//				modal = $modal;
				KeyBoardManager.enable = false;
				resize2(parent as UILayer, GameConfig.sceneWidth, GameConfig.sceneHeight);
			}
			else
			{
				(popUp.parent as Sprite).graphics.clear();
				if (popUp.parent is UILayer)
					(popUp.parent as UILayer).modal = false;
				popUp.parent.removeChild(popUp);
//				(parent as UILayer).modal = false;
//				modal = false;
				KeyBoardManager.enable = true;
			}
			
		}
		
		/**
		 * 移除一个窗口
		 * @param mapName:String 如果该窗口是某模块的VIEW，则为模块的NAME，否则不填
		 */
		public static function removeSmallWindow(popUp:DisplayObject, mapName:String = ""):void
		{
			if (popUp && popWindow)
			{
				if (includeRemoveList(popUp))
					return;
				GameInstance.stage.focus = GameInstance.stage ;
				_removeList.push(popUp);
				TweenLite.to(popUp, 0.2, {alpha:0, onComplete:function():void{
					if (popUp.parent != null)
						popUp.parent.removeChild(popUp);
					popUp.alpha = 1;
					deleteRemoveList(popUp);
					if (mapName != "" && childMap.hasOwnProperty(mapName) && childMap[mapName] == popUp){
						childMap[mapName] = null;
						delete childMap[mapName];
					}
				}
				});
				
				
			}
		}

		/**
		 * 关闭所有窗口
		 */
		public static function closeAllWindow(container:Sprite) : void
		{
			for (var q:String in childMap)
			{
//				childMap[q] = false;
				if((childMap[q] as DisplayObject).parent is WindowLayer)
				{
					childMap[q] = null;
					delete childMap[q];
				}
			}
			while (container.numChildren > 0)
			{
				if (includeRemoveList(container.getChildAt(0)))
					deleteRemoveList(container.getChildAt(0));
				container.removeChildAt(0);
			}
			KeyBoardManager.enable = true;
			return;
		}
		
		/**
		 * 把某一个小窗口提到最顶层
		 */
		public static function topView(view:DisplayObject):void
		{
			if (view && view.parent)
			{
				view.parent.setChildIndex(view, view.parent.numChildren-1);
			}
		}
		
		/**
		 *	判断功能是否开启，如果已开启，则打开窗口
		 * @param index
		 * @param moduleName
		 * @param panel
		 * @param param
		 * 
		 */		
		public static function openWindow( index:int, moduleName:String, panel:String, param:Object = null):void
		{
			
		}
		
		/**
		 * @param module:String see PipeEvent.START_XX
		 */
		public static function showModule(module:String, panel:String, param2:Object = null):void
		{
			if (FacadeManager.hasFacade(module))
			{
				if (childMap[module])
				{
					childMap[module] = null;
					delete childMap[module];
					FacadeManager.killFacade(module);
				}
				else{
					PipeManager.sendMsg(panel, param2);
				}
			}else{
				FacadeManager.startupFacade(module, {panelKey:panel, data:param2});
//				var tracker:AnalyticsTracker = new GATracker( this, "UA-40324677-2", "AS3", false );
//				tracker.trackPageview("/main");
			}
		}
		
		/**根据state来显示或者隐藏模块面板*/
		public static function updateModule(module:String, panel:String, param2:Object = null, state:String=SHOW):void
		{
			if (state == SHOW)
			{
				if (FacadeManager.hasFacade(module))
				{
					PipeManager.sendMsg(panel, param2);
				}else{
					FacadeManager.startupFacade(module, {panelKey:panel, data:param2});
				}
			}else{
				if (FacadeManager.hasFacade(module))
				{
					if (childMap[module])
					{
						childMap[module] = null;
						delete childMap[module];
						FacadeManager.killFacade(module);
					}
				}
			}
		}
		
		/***/
		public static function hasModule(name:String):Boolean
		{
			return childMap.hasOwnProperty(name);
		}
		
		/**
		 * 删除其他不属于2个等待打开的面板的面板
		 * 
		 */		
		private static function closeAllOtherWindow():void
		{
			var l:WindowLayer = LayerManager.windowLayer;
			var num:int = l.numChildren, i:int = 0;
			var c:DisplayObject, tempModule:String;
			for (;i<num;)
			{
				c = l.getChildAt(i);
				//搜索是否属于模块界面
				tempModule = isBelongToModule(c);
				if (tempModule != null)
				{
					if (!isBelongToWaitModule(tempModule))
					{
						removeSmallWindow(c, tempModule);
						num--;
					}else{
						i++;
					}
				}
				else
				{
					l.removeChild(c);
					num--;
				}
			}
		}
		
		/**
		 * 判断某个面板是否属于模块界面，属于则返回模块名
		 * @return 
		 * 
		 */		
		private static function isBelongToModule(c:DisplayObject):String
		{
			for (var q:String in childMap)
			{
				if (childMap[q] == c)
				{
					return q;
				}
			}
			return null;
		}
		
		/**
		 * 判断某个模块是否在等待模块列表中
		 * @return 
		 * 
		 */		
		private static function isBelongToWaitModule(module:String):Boolean
		{
			for (var q:String in waitMap)
			{
				if (q == module)
				{
					return true;
				}
			}
			return false;
		}
		
		/** */
		private static function deleteWaitMap():void
		{
			for (var s:String in waitMap)
			{
				waitMap[s] = null;
				delete waitMap[s];
			}
		}
		
		/** */
		private static function isWaitMapAllComplete():Boolean
		{
			for (var s:String in waitMap)
			{
				if (waitMap[s].com == false)
					return false;
			}
			return true;
		}
		
		private static function handleWaitPanels():void
		{
			var totalW:Number = 0;
			var maxH:Number = 0;
			var maxOrder:int = 1;
			for (var s:String in waitMap)
			{
				totalW += childMap[s].width;
				maxH = maxH > childMap[s].height ? maxH : childMap[s].height;
				maxOrder++;
			}
			var beginx:Number = (GameConfig.sceneWidth - totalW) / 2;
			var beginy:Number = (GameConfig.sceneHeight - maxH) / 2;
			var px:Number = beginx;
			var moduleName:String = "";
			for (var i:int=1;i<maxOrder;i++)
			{
				moduleName = getOrderModule(i);
				if (moduleName != null)
				{
					LayerManager.windowLayer.tweenWindow(childMap[moduleName], childMap[moduleName].x, childMap[moduleName].y, px, beginy, 0.7);
					px += childMap[moduleName].width;
				}
			}	
		}
		
		private static function getOrderModule(o:int):String
		{
			for (var s:String in waitMap)
			{
				if (waitMap[s].order == o)
					return s;
			}
			return null;
		}
		
		/**解析面板布局配置文件*/
		public static function parsePanelLayoutXML(xml:XML):void
		{
			var ps:XMLList = xml.p;
			var p:XML, mname:String, refer:XMLList;
			for each (p in ps)
			{
				mname = p.@name;
				panelLayout[mname] = {};
				refer = p.friend;
				for each (p in refer)
				{
					panelLayout[mname][String(p.@name)] = p.@pos;
				}
			}
		}
		
		/**判断是否2个面板共存,如果可以，则返回old相对now的位置，1表示左边，2表示右边*/
		private static function isTogether(now:String, old:String):int
		{
			if (panelLayout.hasOwnProperty(now) == false)
				return -1;
			if (panelLayout[now].hasOwnProperty(old) == false)
				return -1;
			return panelLayout[now][old];
		}
		
		/**布局*/
		private static function layoutLayerChild(childs:Array):void
		{
			var totalW:Number = 0;
			var maxH:Number = 0;
			var maxOrder:int = 1;
			var len:int = childs.length, i:int = 0, childUI:DisplayObject;
			for (;i<len;i++)
			{
				childUI = childs[i] as DisplayObject;
				totalW += childUI.width;
				maxH = maxH > childUI.height ? maxH : childUI.height;
				maxOrder++;
			}
			var beginx:Number = (GameConfig.sceneWidth - totalW) / 2;
			var beginy:Number = (GameConfig.sceneHeight - maxH) / 2;
			var px:Number = beginx;
			var moduleName:String = "";
			for (i=0;i<len;i++)
			{
				childUI = childs[i] as DisplayObject;
				LayerManager.windowLayer.tweenWindow(childUI, childUI.x, childUI.y, px, beginy, 0.7);
				px += childUI.width;
			}	
		}
		
		private static function getLeftChild():Array
		{
			var len:int = LayerManager.windowLayer.numChildren, i:int = 0, childUI:DisplayObject;
			var ret:Array = [];
			for (;i<len;i++)
			{
				childUI = LayerManager.windowLayer.getChildAt(i);
				if (includeRemoveList(childUI))
					continue;
				ret.push(childUI);
			}
			return ret;
		}
		
		private static function includeRemoveList(ui:DisplayObject):Boolean
		{
			if (_removeList.indexOf(ui) < 0)
				return false;
			return true;
		}
		
		private static function deleteRemoveList(ui:DisplayObject):void
		{
			var index:int = _removeList.indexOf(ui);
			if (index < 0)
				return ;
			TweenLite.killTweensOf(ui);
			_removeList.splice(index, 1);
		}
		
		/**
		 *	面板打开次数收集 
		 * @param param1
		 * @param moduleName
		 * 
		 */		
		private function analyticsTrack(param1:DisplayObject, moduleName:String):void
		{
			var tracker:AnalyticsTracker = new GATracker( param1, "UA-40324677-2", "AS3", false );
			if(moduleName == '')
			{
				moduleName = getQualifiedClassName(param1);
				var arr:Array = moduleName.split('::');
				moduleName = arr.length > 1 ? arr[1] : arr[0];
			}
			else
			{
				var index:int = moduleName.lastIndexOf('.');
				moduleName = moduleName.substring(index+1);
				moduleName = moduleName.split('_')[0];
			}
			tracker.trackPageview(moduleName);
		}
	}
}