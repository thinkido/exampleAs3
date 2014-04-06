package com.style.scrollPane
{
    import flash.geom.*;

    public class TrackUpSkin extends BaseScrollSkill
    {

        public function TrackUpSkin()
        {
            super("trackUpSkin", new Rectangle(5, 6, 4, 22));
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
