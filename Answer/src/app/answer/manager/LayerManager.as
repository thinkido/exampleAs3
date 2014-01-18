package app.answer.manager
{
	import com.thinkido.framework.common.Global;
	import com.thinkido.framework.manager.CursorManager;

    public class LayerManager extends Object
    {
        public static var sceneLayer:UILayer;
        public static var effectLayer:UILayer;
        public static var uiLayer:UILayer;
        public static var windowLayer:WindowLayer;
        public static var topLayer:UILayer;
        public static var popupLayer:UILayer;
        public static var guideLayer:UILayer;
        public static var alertLayer:UILayer;
        public static var dragLayer:UILayer;
        public static var msgTipLayer:UILayer;
        public static var toolTipLayer:UILayer;
        public static var issmBtnLayer:UILayer;
        public static var highestLayer:UILayer;
        public static var rightTopUILayer:RightTopUILayer;
		public static var secondLayer:UILayer;

        public function LayerManager()
        {
            return;
        }

        public static function init() : void
        {
            sceneLayer = new UILayer();
			sceneLayer.name = "sceneLayer" ;
            sceneLayer.tabChildren = false;
            Global.application.addChild(sceneLayer);
			
			secondLayer = new UILayer();
			secondLayer.name = "secondLayer" ;
			secondLayer.tabChildren = false;
			secondLayer.mouseEnabled = false;
			Global.application.addChild(secondLayer);
			
            uiLayer = new UILayer();
			uiLayer.name = "uiLayer" ;
            uiLayer.tabChildren = false;
            uiLayer.mouseEnabled = false;
            Global.application.addChild(uiLayer);
			
            issmBtnLayer = new UILayer();
			issmBtnLayer.name = "issmBtnLayer" ;
            issmBtnLayer.tabChildren = false;
            Global.application.addChild(issmBtnLayer);
//			临时注释
            windowLayer = new WindowLayer();
			windowLayer.name = "windowLayer" ;
            windowLayer.tabChildren = false;
            Global.application.addChild(windowLayer);
			
			effectLayer = new UILayer();
			effectLayer.name = "effectLayer" ;
			effectLayer.tabChildren = false;
			Global.application.addChild(effectLayer);
			
            topLayer = new UILayer();
			topLayer.name = "topLayer" ;
            topLayer.tabChildren = false;
			LayerManager.topLayer.mouseEnabled = false;
            Global.application.addChild(topLayer);
            popupLayer = new UILayer();
			popupLayer.name = "popupLayer" ;
            popupLayer.tabChildren = false;
            Global.application.addChild(popupLayer);
            guideLayer = new UILayer();
			guideLayer.name = "guideLayer" ;
            guideLayer.tabChildren = false;
            Global.application.addChild(guideLayer);
            alertLayer = new UILayer();
			alertLayer.name = "alertLayer" ;
            alertLayer.tabChildren = false;
            Global.application.addChild(alertLayer);
            dragLayer = new UILayer();
			dragLayer.name = "dragLayer" ;
            dragLayer.tabChildren = false;
            Global.application.addChild(dragLayer);
            CursorManager.init(Global.stage);
//			临时注释
//            MsgManager.addBroadStage(windowLayer);
//            MsgManager.addIssmNoticeItemPanelStage(Global.application);
            msgTipLayer = new UILayer();
			msgTipLayer.mouseChildren = true ;
			msgTipLayer.name = "msgTipLayer" ;
            msgTipLayer.tabChildren = false;
            Global.application.addChild(msgTipLayer);
            toolTipLayer = new UILayer();
			toolTipLayer.name = "toolTipLayer" ;
            toolTipLayer.tabChildren = false;
            Global.application.addChild(toolTipLayer);
            highestLayer = new UILayer();
			highestLayer.name = "highestLayer" ;
            Global.application.addChild(highestLayer);
            rightTopUILayer = new RightTopUILayer();
            rightTopUILayer.show();
            return;
        }

    }
}
