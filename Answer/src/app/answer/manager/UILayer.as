package app.answer.manager
{
	import com.thinkido.framework.common.Global;
	
	import flash.display.DisplayObject;
	
	import lm.mui.interfaces.ILayer;
	import lm.mui.interfaces.IView;

    public class UILayer extends View implements ILayer
    {

		public var modal:Boolean = false;
		public var modalAlpha:Number = 0.5;
		
        public function UILayer()
        {
            tabChildren = false;
            mouseEnabled = false;
            return;
        }

        public function addPopUp(param1:DisplayObject, param2:Boolean = false) : void
        {
            if (param1 && this.contains(param1) == false)
            {
                this.addChild(param1);
            }
            return;
        }

        public function centerPopup(param1:DisplayObject) : void
        {
            param1.x = (Global.stage.stageWidth - param1.width) / 2;
            param1.y = (Global.stage.stageHeight - param1.height) / 2;
            return;
        }

        public function setPosition(param1:DisplayObject, param2:int, param3:int) : void
        {
            param1.x = param2;
            param1.y = param3;
            return;
        }

        public function isTop(param1:DisplayObject) : Boolean
        {
            if (this.contains(param1))
            {
                return this.getChildIndex(param1) == (this.numChildren - 1);
            }
            return false;
        }

        public function removePopup(param1:DisplayObject) : void
        {
            if (this.contains(param1))
            {
                this.removeChild(param1);
            }
            return;
        }

        public function isPopup(param1:DisplayObject) : Boolean
        {
            return this.contains(param1);
        }

        public function setTop(param1:DisplayObject) : void
        {
            if (this.contains(param1))
            {
                if (this.getChildIndex(param1) != (this.numChildren - 1))
                {
                    this.setChildIndex(param1, (this.numChildren - 1));
                }
            }
            return;
        }

        public function resize(param1:Number, param2:Number) : void
        {
            var _loc_3:DisplayObject = null;
            var _loc_4:int = 0;
            while (_loc_4 < numChildren)
            {
                
                _loc_3 = this.getChildAt(_loc_4);
                if (_loc_3 is IView)
                {
                    _loc_3.x = _loc_3.x * param1;
                    _loc_3.y = _loc_3.y * param2;
                }
                _loc_4++;
            }
            return;
        }
		
		public function resetAlpha():void
		{
			this.graphics.clear();
			this.modal = false;
			this.modalAlpha = 1;
		}

    }
}
