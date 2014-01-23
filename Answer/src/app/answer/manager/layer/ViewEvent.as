package app.answer.manager.layer
{
	import flash.events.Event;

    public class ViewEvent extends Event
    {
        public static const Hide:String = "viewHide";
        public static const Show:String = "viewShow";

        public function ViewEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
        {
            super(param1, param2, param3);
            return;
        }

    }
}
