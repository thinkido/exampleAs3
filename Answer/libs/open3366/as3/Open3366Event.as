package open3366.as3
{
	import flash.events.Event;
	
	/**
	 * 自定义事件类 
	 * @author mandyxiong
	 * 
	 */
	public class Open3366Event extends Event
	{
		public static const EXTERNAL_WRONG:String = "ExternalInterface_wrong";
		public static const SERVICE_READY_ERR:String = "serverice_ready_err";
		public static const SERVICE_READY:String = "service_ready";
		
		public static const STORE_GET:String = "store_get";
		public static const STORE_SET:String = "store_set";
		public static const STORE_GET_LIST:String = "store_get_list";
		
		public static const STORE_SET_EX:String = "store_set_ex";
		
		public static const SCORE_SUBMIT:String = "score_submit";
		
		public static const SHOW_SHOP:String = "pay_show_shop";
		public static const SHOP_BACK:String = "pay_shop_back";
		public static const ITEM_LIST:String = "pay_get_user_item_list";
		public static const ITEM_DETAIL:String = "pay_get_user_item_detail";
		public static const CONSUME_ITEM:String = "pay_consume_item";
		public static const BUY_ITEM:String = "pay_buy_item";
		
		public static const CHECK_LOGIN:String = "check_login";
		public static const GET_SERVER_TIME:String = "get_server_time";
		public static const ACCESS_TOKEN:String = "access_token";
		public static const CONSUME_TOTAL:String = "consume_total";
		public static const GET_CONSUME:String = "get_consume";
		public static const SHOW_LOGIN:String = "show_login";
		
		public static const SEND_MSG_TO_FLASH:String = "send_msg_to_flash";
		
		public static const SIGN_IN:String = "signIn";
		public static const GET_ACTIVE_DETAIL:String = "getActiveDetail";
		public static const QUIRE_ACTIVE_LIMIT:String = "quireActiveLimit";
		public static const RECEIVE_REWARD:String = "receiveReward";
		
		public static const SEND_WEIBO:String = "sendWeibo";
		public static const INVITE_FRIEND:String = "invite_friend";
		public static const GET_INVITE_INFO:String = "get_invite_info";
		public static const CHECK_IS_INVITED:String = "check_is_invited";
		
		public static const RECOME_BOX:String = "recome_box";
		
		protected var _data:*;
		
		public function Open3366Event(type:String, data:* = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			_data = data;
		}
		
		public function get data():*
		{
			return _data;
		}
		
		override public function toString():String
		{
			return formatToString("Open3366Event:", "type", "bubbles", "cancelable", "data");
		}	
		
		override public function clone():Event
		{
			return new Open3366Event(type, data, bubbles, cancelable);
		}
	}
	
}