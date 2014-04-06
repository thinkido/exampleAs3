package app.answer.modules.mainui.controller
{
	
	import app.answer.manager.layer.LayerManager;
	import app.answer.modules.answer.model.AnswerModel;
	import app.answer.modules.mainui.view.LinkPanel;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class MainUi_StartupCommand extends SimpleCommand
	{
		public function MainUi_StartupCommand()
		{
		}
		override public function execute(_name:INotification) : void
		{
			var linkPanel:LinkPanel = new LinkPanel() ;
			LayerManager.uiLayer.addChild(linkPanel);
			linkPanel.x = 0 ;
			linkPanel.y = 100 ;
			linkPanel.eqTxt.text = AnswerModel.getInstance().head.substr(0,5) ;
			return;
		}
	}
}