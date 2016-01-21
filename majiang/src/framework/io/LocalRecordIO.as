package framework.io
{
import javax.microedition.rms.RecordStore;

public class LocalRecordIO {
	
	public function LocalRecordIO()
	{
		
	}
	
	public static function writeRecord(strName:String, strData:Array):void{  
		if(strData != null)
		{
			for (var i:int= 0; i < strData.length; i++)
	        {
				writeRecord(strName, strData[i], i+1);
	        }
		}
	}
	
	public static function writeRecord(strName:String, strData:String, intID:int):Boolean{  
	    //----------------------------  
	    //--- RecordStoreµĴ洢  
	    //----------------------------  
	    var rsWrite:RecordStore= null;
	    try
	    {
	        rsWrite = RecordStore.openRecordStore(strName, true);
	        var bytWrite:Array= strData.getBytes();
	        var index:int= rsWrite.getNumRecords();
	        if (index >= intID)
	        {
	            //--- RecordStore²»´æÔڣ¬ÔòÉú³É֮  
	        	rsWrite.setRecord(intID, bytWrite, 0, bytWrite.length);
	        }else
	        {
	            //--- RecordStore¸üÐÂ 
	        	rsWrite.addRecord(bytWrite, 0, bytWrite.length);
	        }
	        rsWrite.closeRecordStore();
	        return true;
	    }
	    catch(var e:Exception)
	    {
	        if (rsWrite != null)
	        {
	            try
	            {
	                rsWrite.closeRecordStore();
	            }
	            catch(var e2:Exception){}
	        }
	        return false;
	    }
	}
	
	public static String[] readRecord(var strName:String)
	{
		var rsRead:RecordStore= null;
		var str:Array= null;
	    try
	    {
	    	rsRead = RecordStore.openRecordStore(strName, true);
	        var num:int= rsRead.getNumRecords();
	        str = new String[num];
			for(var i:int= 0; i < num; i++)
			{
				str[i] = readRecord(strName, i+1);
			}
			return str;
	    }
	    catch(var e:Exception)
	    {
	        if (rsRead != null)
	        {
	            try
	            {
	            	rsRead.closeRecordStore();
	            }
	            catch(var e2:Exception){}
	        }
	        return str;
	    }
	}
	
	public static function readRecord(strName:String, intID:int):String{
	    //----------------------------
	    //--- RecordStoreµĶÁȡ 
	    //----------------------------
	    var rsRead:RecordStore= null;
	    try
	    {
	        rsRead = RecordStore.openRecordStore(strName, false);
	        var bytRead:Array= rsRead.getRecord(intID);
	        rsRead.closeRecordStore();
	        return new String(bytRead);
	    }
	    catch(var e:Exception)
	    {
	        if (rsRead != null)
	        {
	            try
	            {
	                rsRead.closeRecordStore();
	            }
	            catch(var e2:Exception){}
	        }
	        return null;
	    }
	}
}
}