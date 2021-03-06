package app.answer.modules.shell.controller
{
	import app.answer.common.GameConfig;
	import app.answer.common.GameInstance;
	
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.loadingtypes.BinaryItem;
	
	import com.thinkido.framework.manager.BrowerManager;
	import com.thinkido.framework.utils.BrowerUtil;
	
	import flash.system.Security;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class Shell_StartupCommand extends SimpleCommand
	{
		private var _noteBody:Object;
		
		public function Shell_StartupCommand()
		{
			return;
		}
		
		override public function execute(param1:INotification) : void
		{
			this._noteBody = param1.getBody();
			this.registerFileTypes();
			this.readParameters();
			return;
		}
		
		private function registerFileTypes() : void
		{
			
			return;
		}
		
		private function readParameters() : void
		{
			Security.allowDomain("*");
			Security.allowInsecureDomain("*");
			GameConfig.flashParameters = this._noteBody.parameters;
			
			GameConfig.sceneWidth = GameInstance.stage.stageWidth ;
			GameConfig.sceneHeight = GameInstance.stage.stageHeight ;
			GameConfig.fileBaseFolder = GameConfig.flashParameters["baseDir"] || "";
			GameConfig.filePath = GameConfig.flashParameters["filePath"] || "";
			GameConfig.serverUrl = GameConfig.flashParameters["serverUrl"] || "";
			GameConfig.gameId = GameConfig.flashParameters["gameid"] || "";
			
			if(!BrowerManager.instance.isNet){
				GameConfig.fileBaseFolder =  "";
			}

		}
	}
}