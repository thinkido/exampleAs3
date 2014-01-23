package app.answer.manager.layer
{
	import app.answer.manager.layer.LayerManager;
	import app.answer.manager.layer.View;
	
	import com.thinkido.framework.common.Global;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import lm.mui.interfaces.ILayer;

    public class RightTopUILayer extends View implements ILayer
    {
        private var _iconContainer:Sprite;
        private var vcDisplaObject:Vector.<DisplayObject>;

        public function RightTopUILayer()
        {
            this.vcDisplaObject = new Vector.<DisplayObject>;
            tabChildren = false;
            mouseEnabled = false;
            layer = LayerManager.uiLayer;
            this.createChildren();
            this.resetPosition();
            return;
        }

        private function createChildren() : void
        {
            this._iconContainer = new Sprite();
            this._iconContainer.mouseEnabled = false;
            this.addChild(this._iconContainer);
            return;
        }

        private function resetChildPosition() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < this.vcDisplaObject.length)
            {
                
                this.vcDisplaObject[_loc_1].x = _loc_1 * 65;
                this.vcDisplaObject[_loc_1].y = 0;
                _loc_1++;
            }
            this._iconContainer.x = -1 * (this.vcDisplaObject.length * 65);
            return;
        }

        public function addPopUp(param1:DisplayObject, param2:Boolean = false) : void
        {
            if (param1 && this.contains(param1) == false)
            {
                this._iconContainer.addChild(param1);
                this.vcDisplaObject.push(param1);
                this.resetChildPosition();
            }
            return;
        }

        public function centerPopup(param1:DisplayObject) : void
        {
            return;
        }

        public function setPosition(param1:DisplayObject, param2:int, param3:int) : void
        {
            return;
        }

        public function isTop(param1:DisplayObject) : Boolean
        {
            if (this._iconContainer.contains(param1))
            {
                return this._iconContainer.getChildIndex(param1) == (this._iconContainer.numChildren - 1);
            }
            return false;
        }

        public function removePopup(param1:DisplayObject) : void
        {
            var _loc_2:int = 0;
            if (this._iconContainer.contains(param1))
            {
                this._iconContainer.removeChild(param1);
                _loc_2 = this.vcDisplaObject.indexOf(param1);
                if (_loc_2 >= 0)
                {
                    this.vcDisplaObject.splice(_loc_2, 1);
                }
                this.resetChildPosition();
            }
            return;
        }

        public function isPopup(param1:DisplayObject) : Boolean
        {
            return this._iconContainer.contains(param1);
        }

        public function setTop(param1:DisplayObject) : void
        {
            if (this._iconContainer.contains(param1))
            {
                if (this._iconContainer.getChildIndex(param1) != (this._iconContainer.numChildren - 1))
                {
                    this._iconContainer.setChildIndex(param1, (this._iconContainer.numChildren - 1));
                }
            }
            return;
        }

        public function resetPosition() : void
        {
            this.x = Global.stage.stageWidth - 295;
            this.y = 10;
            return;
        }

    }
}
