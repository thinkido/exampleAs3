package style
{
	import lm.mui.skins.SkinManager;
	
	import style.btnStyle.ButtonCloseStyle;
	import style.btnStyle.ButtonRedStyle;

    public class GlobalSkin extends Object
    {
        private static var _componentCss:Object = {ButtonRed:ButtonRedStyle,CloseBtn:ButtonCloseStyle
		};



        public function GlobalSkin()
        {
            return;
        }

        public static function initStyleSkin() : void
        {
//            StyleManager.setStyle("textFormat", StyleConst.defaultTextFormat);
            registerSkin(_componentCss);
            return;
        }

        public static function registerSkin(param1:Object) : void
        {
            var _loc_2:String = null;
            for (_loc_2 in param1)
            {
                SkinManager.addStyleSkin(_loc_2, param1[_loc_2]);
            }
            return;
        }

    }
}
