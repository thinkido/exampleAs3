package com.style.scrollPane
{
    import flash.display.*;
    import flash.geom.*;
	import lm.mui.core.GlobalClass;
	import lm.mui.display.ScaleBitmap;

    public class BaseScrollSkill extends Sprite
    {
        protected var bitmap:ScaleBitmap;
        protected var _scale9Grid:Rectangle;

        public function BaseScrollSkill(param1:String = null, param2:Rectangle = null)
        {
            this._scale9Grid = param2;
            if (param1)
            {
                this.bitmap = GlobalClass.getScaleBitmap(param1, param2);
            }
            if (this.bitmap)
            {
                this.addChild(this.bitmap);
            }
            return;
        }

        override public function set width(param1:Number) : void
        {
            if (this.bitmap && this._scale9Grid && !isNaN(param1))
            {
                this.bitmap.width =   16;
            }
            return;
        }

        override public function set height(param1:Number) : void
        {
            if (this.bitmap && this._scale9Grid && !isNaN(param1))
            {
                this.bitmap.height = param1;
            }
            return;
        }

    }
}
