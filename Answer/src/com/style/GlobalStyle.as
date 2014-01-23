package com.style
{
	import flash.text.TextFormat;
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.ColorMatrixFilter;
	
	public class GlobalStyle
	{
		public static const textFormat1:TextFormat = new TextFormat("宋体", 12, 0xffffff);  //默认文字样式
		/**黑色描边*/
		public static const FILTERS_UNLIGHT:Array = [new GlowFilter(3148544, 1, 2, 2, 15, BitmapFilterQuality.LOW)];
		public static const FILTERS_LIGHT:Array = [new GlowFilter(12568381, 1, 2, 2, 15, BitmapFilterQuality.LOW)];
		public static const filterArr:Array = [new GlowFilter(4737096, 0.5, 4, 4, 8, BitmapFilterQuality.LOW)];
		public static const GRAYSCALE:ColorMatrixFilter = new ColorMatrixFilter([0.3086,0.6094,0.0820,0,0,0.3086,0.6094,0.0820,0,0,0.3086,0.6094,0.0820,0,0,0,0,0,1,0]);
		
		public function GlobalStyle()
		{
		}
	}
}