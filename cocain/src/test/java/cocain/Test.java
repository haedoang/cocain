package cocain;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Test {
	public static void main(String[] args) {
		Date date = new Date();
		System.out.println(date);
		
		SimpleDateFormat sdf = 
				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE,1);
		String day = sdf.format(cal.getTime());
		System.out.println(day);
		
	}
}
