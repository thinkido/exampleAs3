package framework.util
{
import java.util.Date;


public class DateUtil
{
	/**
	 * ½«ʱ¼䰴ÕÕָ¶¨¸ñʽ´òӡ³öÀ´
	 * @param time
	 * @param format
	 * @return
	 */
	static public function getDateFormat(time:Number, format:String):String{
		var d:Date= new Date(time);
		var ds:String= d.toString();
		var arr:Array= ds.split( ' ');
		
		
		var mon:String= "00";
		if(arr[1].startsWith("Jan"))
		{
			mon = "01";
		}
		else if(arr[1].startsWith("Feb"))
		{
			mon = "02";
		}
		else if(arr[1].startsWith("Mar"))
		{
			mon = "03";
		}
		else if(arr[1].startsWith("Apr"))
		{
			mon = "04";
		}
		else if(arr[1].startsWith("May"))
		{
			mon = "05";
		}
		else if(arr[1].startsWith("Jun"))
		{
			mon = "06";
		}
		else if(arr[1].startsWith("Jul"))
		{
			mon = "07";
		}
		else if(arr[1].startsWith("Aug"))
		{
			mon = "08";
		}
		else if(arr[1].startsWith("Sep"))
		{
			mon = "09";
		}
		else if(arr[1].startsWith("Oct"))
		{
			mon = "10";
		}
		else if(arr[1].startsWith("Nov"))
		{
			mon = "11";
		}
		else if(arr[1].startsWith("Dec"))
		{
			mon = "12";
		}
		
		var dd:String= arr[2];
		var yyyy:String= arr[5];
		var hhmmss:String= arr[3];
		var hms:Array= hhmmss.split(':');
		
		
		
		
		format = StringUtil.replace(format, "YYYY", yyyy, false);
		format = StringUtil.replace(format, "MM", mon, false);
		format = StringUtil.replace(format, "DD", dd, false);
		format = StringUtil.replace(format, "hh", hms[0], false);
		format = StringUtil.replace(format, "mm", hms[1], false);
		format = StringUtil.replace(format, "ss", hms[2], false);
		
		
		return format;
	}
}
}