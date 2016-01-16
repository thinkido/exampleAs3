package net.jarlehansen.protobuf.javame.input.taghandler
{

	/**
	 * A custom class should be used instead of this implementation when you want
	 * any specific functionality if the implementation finds any unknown tags.
	 * Useful for logging. This default implementation does nothing with the result.
	 * 
	 * @author hansjar@gmail.com Jarle Hansen
	 * 
	 */
	public class DefaultUnknownTagHandlerImpl implements UnknownTagHandler 
	{
	
		static public function newInstance():DefaultUnknownTagHandlerImpl 
		{
			return new DefaultUnknownTagHandlerImpl();
		}
		
		 public function DefaultUnknownTagHandlerImpl():void
		{
		}
		
		public function unknownTag(unknownTag:String):void
		{
			// Default implementation does nothing.
			// Applications are meant to add their own implementation, can be useful
			// for logging.
		}
	}
}
