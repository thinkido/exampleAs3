package network;

import java.util.Enumeration;
import java.util.Hashtable;

/**
 *
 * @author jmulro
 */
public class ProtocolList {
    public static class ProtocolNode {
        public int      mId;
        public String   mName;
        public Class    mClazz;

        public ProtocolNode( int id, String name, Class clazz )
        {
            mId = id;
            mName = name;
            mClazz = clazz;
        }
    }

    public static Hashtable mHallMap = new Hashtable();
    public static Hashtable mGameMap = new Hashtable();
    public static Hashtable mNameHallMap = new Hashtable();
    public static Hashtable mNameGameMap = new Hashtable();

    protected static boolean sInited = false;

    public static void init()
    {
        if (sInited) return;
        sInited = true;

        mHallMap.put( new Integer(8712), new ProtocolNode( 8712, "cs_friend_del", null) );
        mHallMap.put( new Integer(8711), new ProtocolNode( 8711, "cs_friend_add", null) );
        mHallMap.put( new Integer(5124), new ProtocolNode( 5124, "sc_mg_shaker_bet", null) );
        mHallMap.put( new Integer(4637), new ProtocolNode( 4637, "sc_itemlist", null) );
        mHallMap.put( new Integer(4865), new ProtocolNode( 4865, "cs_shoplist", null) );
        mHallMap.put( new Integer(4617), new ProtocolNode( 4617, "sc_friend_add", null) );
        mHallMap.put( new Integer(4609), new ProtocolNode( 4609, "sc_enter_hall", null) );
        mHallMap.put( new Integer(4613), new ProtocolNode( 4613, "sc_leave_hall", null) );
        mHallMap.put( new Integer(8719), new ProtocolNode( 8719, "cs_quest_list", null) );
        mHallMap.put( new Integer(5125), new ProtocolNode( 5125, "sc_mg_shaker_cancel", null) );
        mHallMap.put( new Integer(8962), new ProtocolNode( 8962, "sc_shop_myitem_list", null) );
        mHallMap.put( new Integer(8718), new ProtocolNode( 8718, "cs_achievement_list", null) );
        mHallMap.put( new Integer(4629), new ProtocolNode( 4629, "sc_broadcast_msg", null) );
        mHallMap.put( new Integer(9217), new ProtocolNode( 9217, "cs_mg_shaker_enter", null) );
        mHallMap.put( new Integer(4628), new ProtocolNode( 4628, "sc_friend_online", null) );
        mHallMap.put( new Integer(8707), new ProtocolNode( 8707, "cs_leave_hall", null) );
        mHallMap.put( new Integer(8965), new ProtocolNode( 8965, "sc_be_vip", null) );
        mHallMap.put( new Integer(4633), new ProtocolNode( 4633, "sc_quest_list", null) );
        mHallMap.put( new Integer(4615), new ProtocolNode( 4615, "sc_friend_list", null) );
        mHallMap.put( new Integer(8706), new ProtocolNode( 8706, "cs_enter_place", null) );
        mHallMap.put( new Integer(4634), new ProtocolNode( 4634, "sc_achievement_fetched", null) );
        mHallMap.put( new Integer(8961), new ProtocolNode( 8961, "sc_shoplist", null) );
        mHallMap.put( new Integer(8714), new ProtocolNode( 8714, "cs_invite_company", null) );
        mHallMap.put( new Integer(8963), new ProtocolNode( 8963, "sc_shop_mylog_list", null) );
        mHallMap.put( new Integer(4631), new ProtocolNode( 4631, "sc_notify_quest", null) );
        mHallMap.put( new Integer(4625), new ProtocolNode( 4625, "sc_invite_jump", null) );
        mHallMap.put( new Integer(254), new ProtocolNode( 254, "cs_debug_record", null) );
        mHallMap.put( new Integer(5127), new ProtocolNode( 5127, "sc_mg_shaker_info_update", null) );
        mHallMap.put( new Integer(4623), new ProtocolNode( 4623, "sc_friend_watch", null) );
        mHallMap.put( new Integer(4616), new ProtocolNode( 4616, "sc_friend_profile", null) );
        mHallMap.put( new Integer(4868), new ProtocolNode( 4868, "cs_shop_buy", null) );
        mHallMap.put( new Integer(4627), new ProtocolNode( 4627, "sc_invite_company", null) );
        mHallMap.put( new Integer(8964), new ProtocolNode( 8964, "sc_get_item", null) );
        mHallMap.put( new Integer(4619), new ProtocolNode( 4619, "sc_friend_be_added", null) );
        mHallMap.put( new Integer(4866), new ProtocolNode( 4866, "cs_shop_myitem_list", null) );
        mHallMap.put( new Integer(8708), new ProtocolNode( 8708, "cs_update_places", null) );
        mHallMap.put( new Integer(8717), new ProtocolNode( 8717, "cs_friend_watch", null) );
        mHallMap.put( new Integer(5126), new ProtocolNode( 5126, "sc_mg_shaker_round_result", null) );
        mHallMap.put( new Integer(4618), new ProtocolNode( 4618, "sc_friend_del", null) );
        mHallMap.put( new Integer(4621), new ProtocolNode( 4621, "sc_hall_common_error", null) );
        mHallMap.put( new Integer(9219), new ProtocolNode( 9219, "cs_mg_shaker_bet", null) );
        mHallMap.put( new Integer(9218), new ProtocolNode( 9218, "cs_mg_shaker_leave", null) );
        mHallMap.put( new Integer(8720), new ProtocolNode( 8720, "cs_achievement_award", null) );
        mHallMap.put( new Integer(9222), new ProtocolNode( 9222, "cs_mg_shaker_round_result", null) );
        mHallMap.put( new Integer(4626), new ProtocolNode( 4626, "sc_invite_refuse", null) );
        mHallMap.put( new Integer(4867), new ProtocolNode( 4867, "cs_shop_mylog_list", null) );
        mHallMap.put( new Integer(255), new ProtocolNode( 255, "heartbeat", null) );
        mHallMap.put( new Integer(9221), new ProtocolNode( 9221, "cs_mg_shaker_info_update", null) );
        mHallMap.put( new Integer(4636), new ProtocolNode( 4636, "sc_rank_list", null) );
        mHallMap.put( new Integer(9220), new ProtocolNode( 9220, "cs_mg_shaker_cancel", null) );
        mHallMap.put( new Integer(8724), new ProtocolNode( 8724, "cs_wp8_eval", null) );
        mHallMap.put( new Integer(8723), new ProtocolNode( 8723, "cs_itemlist", null) );
        mHallMap.put( new Integer(4622), new ProtocolNode( 4622, "sc_friend_follow", null) );
        mHallMap.put( new Integer(5122), new ProtocolNode( 5122, "sc_mg_shaker_leave", null) );
        mHallMap.put( new Integer(4863), new ProtocolNode( 4863, "sc_hall_debug", null) );
        mHallMap.put( new Integer(8716), new ProtocolNode( 8716, "cs_friend_follow", null) );
        mHallMap.put( new Integer(4620), new ProtocolNode( 4620, "sc_friend_profile_ext", null) );
        mHallMap.put( new Integer(4612), new ProtocolNode( 4612, "sc_enter_place", null) );
        mHallMap.put( new Integer(4624), new ProtocolNode( 4624, "sc_be_invited_company", null) );
        mHallMap.put( new Integer(4630), new ProtocolNode( 4630, "sc_notify_achievement", null) );
        mHallMap.put( new Integer(4608), new ProtocolNode( 4608, "sc_enter_hall_failed", null) );
        mHallMap.put( new Integer(8715), new ProtocolNode( 8715, "cs_confirm_be_invited_company", null) );
        mHallMap.put( new Integer(5121), new ProtocolNode( 5121, "sc_mg_shaker_enter", null) );
        mHallMap.put( new Integer(4870), new ProtocolNode( 4870, "sc_shop_buy_result", null) );
        mHallMap.put( new Integer(4610), new ProtocolNode( 4610, "sc_force_continue_game", null) );
        mHallMap.put( new Integer(8722), new ProtocolNode( 8722, "cs_rank_list", null) );
        mHallMap.put( new Integer(4869), new ProtocolNode( 4869, "cs_gfan_buy", null) );
        mHallMap.put( new Integer(4611), new ProtocolNode( 4611, "sc_enter_place_failed", null) );
        mHallMap.put( new Integer(4635), new ProtocolNode( 4635, "sc_quest_fetched", null) );
        mHallMap.put( new Integer(8709), new ProtocolNode( 8709, "cs_friend_list", null) );
        mHallMap.put( new Integer(4614), new ProtocolNode( 4614, "sc_update_places", null) );
        mHallMap.put( new Integer(8721), new ProtocolNode( 8721, "cs_quest_award", null) );
        mHallMap.put( new Integer(8710), new ProtocolNode( 8710, "cs_friend_profile", null) );
        mHallMap.put( new Integer(8713), new ProtocolNode( 8713, "cs_friend_profile_ext", null) );
        mHallMap.put( new Integer(4632), new ProtocolNode( 4632, "sc_achievement_list", null) );
        mHallMap.put( new Integer(0x1602), new ProtocolNode( 0x1602, "sc_exchange_fee_result", null) );
        mHallMap.put( new Integer(0x2601), new ProtocolNode( 0x2601, "cs_exchange_fee", null) );
        mHallMap.put( new Integer(0x1601), new ProtocolNode( 0x1601, "sc_exchange_gift_result", null) );
        mHallMap.put( new Integer(0x2602), new ProtocolNode( 0x2602, "cs_exchange_gift", null) );
        mHallMap.put( new Integer(0x1603), new ProtocolNode( 0x1603, "sc_exchange_fee_list", null) );
        mHallMap.put( new Integer(0x2603), new ProtocolNode( 0x2603, "cs_exchange_fee_list", null) );
        mGameMap.put( new Integer(0x1208), new ProtocolNode( 0x1208, "sc_friend_profile", null) );
        mGameMap.put( new Integer(0x2206), new ProtocolNode( 0x2206, "cs_friend_profile", null) );
       
        
        mGameMap.put( new Integer(4379), new ProtocolNode( 4379, "sc_lack_infos", null) );
        mGameMap.put( new Integer(8458), new ProtocolNode( 8458, "cs_get_online_gift", null) );
        mGameMap.put( new Integer(4607), new ProtocolNode( 4607, "sc_game_debug", null) );
        mGameMap.put( new Integer(4357), new ProtocolNode( 4357, "sc_ready_game_notify", null) );
        mGameMap.put( new Integer(255), new ProtocolNode( 255, "heartbeat", null) );
        mGameMap.put( new Integer(9491), new ProtocolNode( 9491, "cs_minigame_egg_quit", null) );
        mGameMap.put( new Integer(9490), new ProtocolNode( 9490, "cs_minigame_egg_change_group", null) );
        mGameMap.put( new Integer(4367), new ProtocolNode( 4367, "sc_game_turn_notify", null) );
        mGameMap.put( new Integer(5393), new ProtocolNode( 5393, "sc_minigame_egg_open", null) );
        mGameMap.put( new Integer(9488), new ProtocolNode( 9488, "cs_minigame_egg_start", null) );
        mGameMap.put( new Integer(9474), new ProtocolNode( 9474, "cs_minigame_01_done", null) );
        mGameMap.put( new Integer(9473), new ProtocolNode( 9473, "cs_minigame_01_choose", null) );
        mGameMap.put( new Integer(4378), new ProtocolNode( 4378, "sc_ready_timer", null) );
        mGameMap.put( new Integer(8452), new ProtocolNode( 8452, "cs_inspect_player", null) );
        mGameMap.put( new Integer(4362), new ProtocolNode( 4362, "sc_game_action_notify", null) );
        mGameMap.put( new Integer(5395), new ProtocolNode( 5395, "sc_minigame_egg_quit", null) );
        mGameMap.put( new Integer(4363), new ProtocolNode( 4363, "sc_start_game", null) );
        mGameMap.put( new Integer(8454), new ProtocolNode( 8454, "cs_game_auto", null) );
        mGameMap.put( new Integer(4353), new ProtocolNode( 4353, "sc_enter_game", null) );
        mGameMap.put( new Integer(4361), new ProtocolNode( 4361, "sc_game_action", null) );
        mGameMap.put( new Integer(8455), new ProtocolNode( 8455, "cs_game_manual", null) );
        mGameMap.put( new Integer(4359), new ProtocolNode( 4359, "sc_leave_game", null) );
        mGameMap.put( new Integer(4368), new ProtocolNode( 4368, "sc_continue_game", null) );
        mGameMap.put( new Integer(5392), new ProtocolNode( 5392, "sc_minigame_egg_start", null) );
        mGameMap.put( new Integer(8451), new ProtocolNode( 8451, "cs_game_voice", null) );
        mGameMap.put( new Integer(5379), new ProtocolNode( 5379, "sc_minigame_01_timeout", null) );
        mGameMap.put( new Integer(5394), new ProtocolNode( 5394, "sc_minigame_egg_change_group", null) );
        mGameMap.put( new Integer(4369), new ProtocolNode( 4369, "sc_game_voice", null) );
        mGameMap.put( new Integer(5378), new ProtocolNode( 5378, "sc_minigame_01_done", null) );
        mGameMap.put( new Integer(4370), new ProtocolNode( 4370, "sc_inspect_player", null) );
        mGameMap.put( new Integer(4355), new ProtocolNode( 4355, "sc_ready_game_failed", null) );
        mGameMap.put( new Integer(8448), new ProtocolNode( 8448, "cs_ready_game", null) );
        mGameMap.put( new Integer(8457), new ProtocolNode( 8457, "cs_chat", null) );
        mGameMap.put( new Integer(9489), new ProtocolNode( 9489, "cs_minigame_egg_open", null) );
        mGameMap.put( new Integer(8453), new ProtocolNode( 8453, "cs_add_bot", null) );
        mGameMap.put( new Integer(5376), new ProtocolNode( 5376, "sc_minigame_01_start", null) );
        mGameMap.put( new Integer(8450), new ProtocolNode( 8450, "cs_game_action", null) );
        mGameMap.put( new Integer(4380), new ProtocolNode( 4380, "sc_send_online_gift", null) );
        mGameMap.put( new Integer(8449), new ProtocolNode( 8449, "cs_leave_game", null) );
        mGameMap.put( new Integer(4354), new ProtocolNode( 4354, "sc_enter_game_notify", null) );
        mGameMap.put( new Integer(4364), new ProtocolNode( 4364, "sc_game_show_actions", null) );
        mGameMap.put( new Integer(4366), new ProtocolNode( 4366, "sc_game_turn", null) );
        mGameMap.put( new Integer(5377), new ProtocolNode( 5377, "sc_minigame_01_choose", null) );
        mGameMap.put( new Integer(4375), new ProtocolNode( 4375, "sc_notify_achievement", null) );
        mGameMap.put( new Integer(4377), new ProtocolNode( 4377, "sc_gold_reset", null) );
        mGameMap.put( new Integer(4360), new ProtocolNode( 4360, "sc_leave_game_notify", null) );
        mGameMap.put( new Integer(4372), new ProtocolNode( 4372, "sc_end_game", null) );
        mGameMap.put( new Integer(4381), new ProtocolNode( 4381, "sc_online_gift_countdown", null) );
        mGameMap.put( new Integer(4376), new ProtocolNode( 4376, "sc_notify_quest", null) );
        mGameMap.put( new Integer(4374), new ProtocolNode( 4374, "sc_invite_jump", null) );
        mGameMap.put( new Integer(4373), new ProtocolNode( 4373, "sc_game_hide_actions", null) );
        mGameMap.put( new Integer(9472), new ProtocolNode( 9472, "cs_minigame_01_start", null) );
        mGameMap.put( new Integer(4365), new ProtocolNode( 4365, "sc_sure_lack", null) );
        mGameMap.put( new Integer(8456), new ProtocolNode( 8456, "cs_resend_action", null) );
        mGameMap.put( new Integer(4352), new ProtocolNode( 4352, "sc_enter_game_failed", null) );
        mGameMap.put( new Integer(4371), new ProtocolNode( 4371, "sc_game_action_failed", null) );
        mGameMap.put( new Integer(4358), new ProtocolNode( 4358, "sc_leave_game_failed", null) );
        mGameMap.put( new Integer(4356), new ProtocolNode( 4356, "sc_ready_game", null) );
        mGameMap.put( new Integer(4606), new ProtocolNode( 4606, "sc_protocol_pack", null) );        
        mGameMap.put( new Integer(8725), new ProtocolNode( 8725, "cs_get_collect_box", null) );
        mGameMap.put( new Integer(8726), new ProtocolNode( 8726, "cs_get_award_collect_box", null) );
        mGameMap.put( new Integer(8966), new ProtocolNode( 8966, "sc_get_collect_box", null) );
        mGameMap.put( new Integer(8967), new ProtocolNode( 8967, "sc_get_award_collect_box", null) );
        mGameMap.put( new Integer(9985), new ProtocolNode( 9985, "cs_update_profile", null) );
        
        Enumeration eHall = mHallMap.elements();
        while (eHall.hasMoreElements())
        {
            ProtocolNode node = (ProtocolNode)eHall.nextElement();
            mNameHallMap.put( node.mName, node );
        }

        Enumeration eGame = mGameMap.elements();
        while (eGame.hasMoreElements())
        {
            ProtocolNode node = (ProtocolNode)eGame.nextElement();
            mNameGameMap.put( node.mName, node );
        }
    }

    public static ProtocolNode getNode(int id)
    {
        ProtocolNode node = null;
        Integer key = new Integer(id);
        
        node = (ProtocolNode)mGameMap.get( key );
        if (node != null) return node;

        node = (ProtocolNode)mHallMap.get( key );
        return node;
    }

    public static ProtocolNode getNode(String name)
    {
        ProtocolNode node = null;

        node = (ProtocolNode)mNameGameMap.get( name );
        if (node != null) return node;

        node = (ProtocolNode)mNameHallMap.get( name );
        return node;
    }
}
