package managers
{
	
	import game.model.Global;
	
	import zhida.ui.UILayer;

	public class LayerManager
	{
		public function LayerManager()
		{
		}
		
		public static var sceneLayer:UILayer;
		public static var effectLayer:UILayer;
		public static var uiLayer:UILayer;
		public static var windowLayer:UILayer;
		public static var topLayer:UILayer;
		public static var popupLayer:UILayer;
		public static var msgTipLayer:UILayer;
		
		public static function init() : void
		{
			sceneLayer = new UILayer();
			sceneLayer.name = "sceneLayer" ;
			Global.game.addChild(sceneLayer);
						
			uiLayer = new UILayer();
			uiLayer.name = "uiLayer" ;
			uiLayer.touchable = true;
			Global.game.addChild(uiLayer);			
			
			windowLayer = new UILayer();
			windowLayer.name = "windowLayer" ;
			Global.game.addChild(windowLayer);			
			
			topLayer = new UILayer();
			topLayer.name = "topLayer" ;
			topLayer.touchable = false;
			Global.game.addChild(topLayer);
			
			popupLayer = new UILayer();
			popupLayer.name = "popupLayer" ;
			Global.game.addChild(popupLayer);
			
			effectLayer = new UILayer();
			effectLayer.name = "effectLayer" ;
			Global.game.addChild(effectLayer);
			
			msgTipLayer = new UILayer();
			msgTipLayer.touchable = false ;
			msgTipLayer.name = "msgTipLayer" ;
			Global.game.addChild(msgTipLayer);
			
			return;
		}
	}
}