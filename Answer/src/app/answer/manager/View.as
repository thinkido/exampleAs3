package app.answer.manager
{
	import flash.display.Sprite;
	
	import lm.mui.interfaces.ILayer;
	import lm.mui.interfaces.IView;

    public class View extends Sprite implements IView
    {
        protected var _layer:ILayer;
        protected var _isHide:Boolean = true;

        public function View()
        {
            return;
        }

        public function get isHide() : Boolean
        {
            return this._isHide;
        }

        public function set layer(param1:ILayer) : void
        {
            this._layer = param1;
            return;
        }

        public function get layer() : ILayer
        {
            return this._layer;
        }

        public function update(param1:Object, ... args) : void
        {
            if (param1 is int)
            {
            }
            else if (param1 is Number)
            {
            }
            return;
        }

        public function hide() : void
        {
            if (this._layer)
            {
                this._isHide = true;
                dispatchEvent(new ViewEvent(ViewEvent.Hide));
                this._layer.removePopup(this);
            }
            return;
        }

        public function show(param1:int = 0, param2:int = 0) : void
        {
            if (this._layer)
            {
                this._isHide = false;
                this._layer.addPopUp(this);
                dispatchEvent(new ViewEvent(ViewEvent.Show));
                if (param1 != 0 && param2 != 0)
                {
                    this._layer.setPosition(this, param1, param2);
                }
            }
            return;
        }

        public function dispose() : void
        {
            return;
        }

    }
}
