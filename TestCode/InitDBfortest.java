package TestCode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class InitDBfortest {
	public static Connection con = null;

	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking_manager", "root", "root");

		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}

	public static void closeConnection() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}