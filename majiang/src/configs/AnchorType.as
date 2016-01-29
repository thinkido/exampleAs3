package configs
{
	public class AnchorType
	{
		private static const HCENTER:int = 1;
		private static const VCENTER:int = 2;
		private static const TOP:int = 16;
		private static const LEFT:int = 4;
		private static const RIGHT:int = 8;
		private static const BOTTOM:int = 32;
		
		public static const ANCHOR_TOP_LEFT:int= TOP | LEFT;
		
		public static const ANCHOR_TOP_RIGHT:int= TOP | RIGHT;
		
		public static const ANCHOR_BOTTOM_LEFT:int= BOTTOM | LEFT;
		
		public static const ANCHOR_BOTTOM_RIGHT:int= BOTTOM | RIGHT;
		
		public static const ANCHOR_CENTER:int= HCENTER | VCENTER;
		
		protected var _anchor:int= ANCHOR_TOP_LEFT;
		
		public function AnchorType()
		{
		}
	}
}