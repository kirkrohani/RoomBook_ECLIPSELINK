package roombook.unittest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Locale;



public class Tests
{

	public static void main(String[] args) throws SQLException
	{
		Calendar now = Calendar.getInstance(Locale.ENGLISH);
		System.out.println("CALENDAR: " + now.getTime());
		now.add(Calendar.DAY_OF_YEAR, -30);
		System.out.println("CALENDAR MINUS 30: " + now.getTime());
		
		Connection c = DriverManager.getConnection("hello");
		
		

	}

}
