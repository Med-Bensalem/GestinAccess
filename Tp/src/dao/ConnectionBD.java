package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionBD {
	static private Connection connection;
	static{
	 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 connection =
	DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionAcces", "root", "");
	 } catch (SQLException ex) {
	 ex.printStackTrace();
	 } catch (ClassNotFoundException e) {
	 // TODO Auto-generated catch block
	 e.printStackTrace();
	 }
	 }

	public static Connection getConnection() {
	return connection;
	} 
}
