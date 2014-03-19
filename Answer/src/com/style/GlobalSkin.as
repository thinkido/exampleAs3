package com.style
{
	import com.style.button.ButtonStyle;
	import com.style.button.GButtonStyle;
	import com.style.button.RedButtonStyle;
	import com.style.checkbox.GCheckBoxStyle;
	import com.style.radioButton.GRadioButtonStyle;
	import com.style.scrollBar.ScrollBarStyle;
	import com.style.tabBar.GTabButtomStyle;
	import com.style.textInput.GTextInputStyle;
	import com.style.tileList.GTileListStyle;
	
	import lm.mui.skins.SkinManager;

    public class GlobalSkin extends Object
    {
        private static var _componentCss:Object = {Button:ButtonStyle,GButton:GButtonStyle,RedButton:RedButtonStyle ,
			GLabel:GLabelStyle, GCheckBox:GCheckBoxStyle ,GRadio:GRadioButtonStyle ,GTabBarButton:GTabButtomStyle,
			GText:GTextInputStyle,GTileList:GTileListStyle,GScrollBar:ScrollBarStyle
			
			
			
		};



        public function GlobalSkin()
        {
            return;
        }

        public static function initStyleSkin() : void
        {
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
