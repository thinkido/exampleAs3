package game.common.globle
{
	import flash.filters.BitmapFilterQuality;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;

    public class FilterConst extends Object
    {
        public static const glowFilter:GlowFilter = new GlowFilter(0, 1, 2, 2, 10);
        public static const titleFilter:GlowFilter = new GlowFilter(480077, 1, 2, 2, 10);
        public static const titleShadowFilter:DropShadowFilter = new DropShadowFilter(0, 120, 3086, 0.75, 5, 5);
        public static const nameGlowFilter:GlowFilter = new GlowFilter(5143, 1, 2, 2, 10);
        public static const fightTextFilter:GlowFilter = new GlowFilter(16777215, 1, 1, 1, 1, 1, false, false);
        public static const skillItemFilter:GlowFilter = new GlowFilter(65280);
        public static const itemChooseFilter:GlowFilter = new GlowFilter(65280);
        public static const guideTipsFilter:GlowFilter = new GlowFilter(16776960, 1, 10, 10, 2);
        public static const worldMapFilter:GlowFilter = new GlowFilter(16776960, 1, 10, 10, 2);
        public static const worldMapFilter2:DropShadowFilter = new DropShadowFilter();
        public static const guideLifeBarFilter:GlowFilter = new GlowFilter(65280, 1, 10, 10, 2);
        public static const guidePetCall:GlowFilter = new GlowFilter(16711680, 1, 10, 10, 2);
        public static const uiBtnFilter:GlowFilter = new GlowFilter(16776960, 1, 10, 10, 2);
        public static const fightAvatarFilter:GlowFilter = new GlowFilter();
        public static const chatTipsFilter:GlowFilter = new GlowFilter(16776960, 1, 4, 4, 2, 1, false);
        public static const taskShowTargetFilter:GlowFilter = new GlowFilter(16711935, 1, 10, 10, 4, 10);
        public static const vipGlowFilter:GlowFilter = new GlowFilter(10690304, 1, 2, 2, 10);
        public static const careerFilter_1:GlowFilter = new GlowFilter(16773120, 1, 10, 10, 2);
        public static const careerFilter_2:GlowFilter = new GlowFilter(61695, 1, 10, 10, 2);
        public static const careerFilter_4:GlowFilter = new GlowFilter(16719874, 1, 10, 10, 2);
        public static const careerFilter_8:GlowFilter = new GlowFilter(16712956, 1, 10, 10, 2);
        public static const BossFilter:GlowFilter = new GlowFilter(10690304, 1, 2, 2, 10);
        public static const hintIconFilter:GlowFilter = new GlowFilter(268435302, 1, 3, 2, 3);
        public static const noticeItemFilter:GlowFilter = new GlowFilter(47765, 0.6, 15, 15, 2, 1);
        public static const noticeItemFilter2:GlowFilter = new GlowFilter(2236962, 1, 2, 2, 10);
        public static const sceneDesFilter:GlowFilter = new GlowFilter(26367, 0.6, 5, 5, 3, 10);
        public static const plotShowFilter:DropShadowFilter = new DropShadowFilter(2, 45, 0);
        public static const plotShowFilter2:GlowFilter = new GlowFilter(0, 1, 2, 2, 4);
        public static const acupointBtnFilter:GlowFilter = new GlowFilter(271655, 1, 2, 2, 4);
        public static const rollTipsFilter:GlowFilter = new GlowFilter(0, 1, 2, 2, 2);
        public static const rollTipsFilter2:DropShadowFilter = new DropShadowFilter(1, 45, 47765, 1);
        public static const colorFilter:ColorMatrixFilter = new ColorMatrixFilter([1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0]);
        public static const colorFilter2:ColorMatrixFilter = new ColorMatrixFilter([0.5086, 0.2094, 0.082, 0, 0, 0.5086, 0.2094, 0.082, 0, 0, 0.5086, 0.2094, 0.082, 0, 0, 0, 0, 0, 1, 0]);
        public static const colorFilterRed:ColorMatrixFilter = new ColorMatrixFilter([0.5, 0.5, 1, 0, 0, 0.2, 0.2, 0.2, 0, 0, 0.2, 0.2, 0.2, 0, 0, 0, 0, 0, 1, 0]);
		/**灰色*/
		public static const HUISE:GlowFilter = new GlowFilter(0x666666, 0.8, 50, 50, 10, 3, true);
		
		/**红色内*/
		public static const RED:GlowFilter = new GlowFilter(0xff0000, 0.8, 2, 2, 2, 3, true);
		
		/**黑色文本*/
		public static const BLACK_TEXT:GlowFilter = new GlowFilter(0x000000, 1, 3, 3, 10, 1);
		
		/***/
		public static const ONE_PIXEL_BLACK:GlowFilter = new GlowFilter(0x000000,1,2,2,50,1);
		
		/***/
		public static const WAIFAGUANG:GlowFilter = new GlowFilter(0xff6600,1,6,6,1,2,false);
		
		public static const SELECT_LIGHT_FILTER:Array = [new GlowFilter(0xff6600,1,6,6,1,2,false)];
        public function FilterConst()
        {
            return;
        }

        public static function textStrokeFilter(param1:uint = 0) : GlowFilter
        {
            return new GlowFilter(param1, 1, 2, 2, 50, 1, false, false);
        }

    }
}
