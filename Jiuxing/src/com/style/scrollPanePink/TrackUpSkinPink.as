package com.style.scrollPanePink
{
	import com.style.scrollPane.*;
    
    import flash.geom.*;

    public class TrackUpSkinPink extends BaseScrollSkill
    {

        public function TrackUpSkinPink(param1:String = null, param2:Rectangle = null)
        {
            super('trackUpSkin', new Rectangle(5, 8, 6, 17));
            return;
        }

        override public function set width(param1:Number) : void
        {
            if (bitmap && _scale9Grid && !isNaN(param1))
            {
                bitmap.width = 16;
            }
            return;
        }

    }
}
