package app.answer.manager
{
    import com.greensock.TweenLite;
    import com.greensock.easing.Cubic;
    import com.thinkido.framework.common.Global;
    
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.InteractiveObject;
    import flash.geom.Point;
    import flash.utils.Dictionary;
    
    import lm.components.window.Window;
    import lm.mui.interfaces.IView;

    public class WindowLayer extends UILayer
    {
        private var dcPopingWindow:Dictionary;

        public function WindowLayer()
        {
            this.dcPopingWindow = new Dictionary(true);
            return;
        }

        override public function addPopUp(param1:DisplayObject, param2:Boolean = false) : void
        {
            var tl:TweenLite;
            var displayObject:* = param1;
            var modal:* = param2;
            if (displayObject && (this.contains(displayObject) == false || this.isPoping(displayObject)))
            {
                if (displayObject.localToGlobal(new Point()).x + 100 > Global.stage.stageWidth)
                {
                    this.centerPopup(displayObject);
                }
                this.addChild(displayObject);
                if (displayObject is IView)
                {
                    displayObject.alpha = 0;
                    tl = new TweenLite(displayObject, 0.5, {alpha:1, ease:Cubic.easeOut, onComplete:function () : void
            {
                removePoping(displayObject);
                return;
            }
            });
                    this.addPoping(displayObject, tl);
                }
            }
            return;
        }

        override public function removePopup(param1:DisplayObject) : void
        {
            var tl:TweenLite;
            var displayObject:* = param1;
            if (this.contains(displayObject))
            {
                displayObject.alpha = 1;
                this.setObjMouseEnable(displayObject, false);
                tl = new TweenLite(displayObject, 0.5, {alpha:0, ease:Cubic.easeOut, onComplete:function () : void
            {
                removePoping(displayObject);
                removeChild(displayObject);
                setObjMouseEnable(displayObject, true);
                return;
            }
            });
                this.addPoping(displayObject, tl);
            }
            return;
        }

        private function addPoping(param1:Object, param2:TweenLite) : void
        {
            this.removePoping(param1);
            this.dcPopingWindow[param1] = param2;
            param2.play();
            return;
        }

        private function isPoping(param1:Object) : Boolean
        {
            var _loc_2:* = this.dcPopingWindow[param1];
            return _loc_2 != null;
        }

        private function removePoping(param1:Object) : void
        {
            var _loc_2:TweenLite = null;
            if (this.isPoping(param1))
            {
                _loc_2 = this.dcPopingWindow[param1];
                _loc_2.pause();
                _loc_2.kill();
                _loc_2 = null;
                this.setObjMouseEnable(param1, true);
                delete this.dcPopingWindow[param1];
            }
            return;
        }

        private function setObjMouseEnable(param1:Object, param2:Boolean) : void
        {
            if (param1 is InteractiveObject)
            {
                (param1 as InteractiveObject).mouseEnabled = param2;
            }
            if (param1 is DisplayObjectContainer)
            {
                (param1 as DisplayObjectContainer).mouseChildren = param2;
            }
            return;
        }

        override public function centerPopup(param1:DisplayObject) : void
        {
            param1.x = (Global.stage.stageWidth - param1.width) / 2;
            param1.y = (Global.stage.stageHeight - param1.height) / 2;
            if (Global.stage.stageHeight - param1.height - 100 < param1.y)
            {
                param1.y = Global.stage.stageHeight - param1.height - 100;
            }
            if (Global.stage.stageWidth - param1.width - param1.x - 280 < 0)
            {
                param1.x = Global.stage.stageWidth - param1.width - 280;
            }
            if (param1.x < 0)
            {
                param1.x = 0;
            }
            if (param1.y < 0)
            {
                param1.y = 0;
            }
            return;
        }

        public function leftToChat(param1:DisplayObject) : void
        {
            if (!this.contains(param1) || !(param1 is IView))
            {
                return;
            }
            param1.x = 280;
            return;
        }

        public function rightToTask(param1:DisplayObject) : void
        {
            if (!this.contains(param1))
            {
                return;
            }
            param1.x = Global.stage.stageWidth - param1.width - 280;
            return;
        }

        public function centerWindows(... args) : void
        {
			var _loc_2:int = 0;
            var _loc_3:* = new Vector.<Window>;
            var _loc_4:int = 10000;
            var _loc_5:int = 0;
            while (_loc_5 < args.length)
            {
                
                if (!args[_loc_5] is Window)
                {
                }
                else
                {
                    _loc_3.push(args[_loc_5] as Window);
                    _loc_2 = _loc_2 + (args[_loc_5] as Window).width;
                    this.centerPopup(args[_loc_5] as Window);
                    _loc_4 = Math.min(_loc_4, (args[_loc_5] as Window).y);
                }
                _loc_5++;
            }
            _loc_2 = _loc_2 + (_loc_3.length - 1) * 5;
            var _loc_6:* = (Global.stage.stageWidth - _loc_2) / 2;
            var _loc_7:int = 0;
            while (_loc_7 < _loc_3.length)
            {
                
                if (_loc_3[_loc_7].isHide)
                {
                    _loc_3[_loc_7].show();
                }
                this.setTop(_loc_3[_loc_7]);
                _loc_3[_loc_7].x = _loc_6;
                _loc_3[_loc_7].y = _loc_4;
                _loc_6 = _loc_6 + (_loc_3[_loc_7].width + 5);
                _loc_7++;
            }
            return;
        }

        public function tweenCenterWindow(...args) : void
        {
            var _loc_8:Number = NaN;
			var _loc_2:int = 0;
			var _loc_3:* = new Vector.<Window>;
            var _loc_4:int = 10000;
            var _loc_5:int = 0;
            while (_loc_5 < args.length)
            {
                
                if (!args[_loc_5] is Window)
                {
                }
                else
                {
                    _loc_3.push(args[_loc_5] as Window);
                    _loc_2 = _loc_2 + (args[_loc_5] as Window).width;
                    this.centerPopup(args[_loc_5] as Window);
                    _loc_4 = Math.min(_loc_4, (args[_loc_5] as Window).y);
                }
                _loc_5++;
            }
            _loc_2 = _loc_2 + (_loc_3.length - 1) * 5;
            var _loc_6:* = (Global.stage.stageWidth - _loc_2) / 2;
            var _loc_7:int = 0;
            while (_loc_7 < _loc_3.length)
            {
                
                if (_loc_3[_loc_7].isHide)
                {
                    _loc_3[_loc_7].show();
                }
                this.setTop(_loc_3[_loc_7]);
                _loc_8 = (Global.stage.stageWidth - _loc_3[_loc_7].width) / 2 >= _loc_6 ? (_loc_6 + _loc_3[_loc_7].width / 3) : (_loc_6 - _loc_3[_loc_7].width / 3);
                this.tweenWindow(_loc_3[_loc_7], _loc_8, _loc_4, _loc_6, _loc_4, 0.3);
                _loc_6 = _loc_6 + (_loc_3[_loc_7].width + 5);
                _loc_7++;
            }
            return;
        }

        public function tweenWindow(param1:DisplayObject, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number = 0.7) : void
        {
            param1.x = param2;
            param1.y = param3;
            TweenLite.to(param1, param6, {x:param4, y:param5});
            return;
        }
		
		

    }
}
