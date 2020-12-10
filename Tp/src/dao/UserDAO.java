package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entities.User;

public class UserDAO {
	
	public void ajouter (User u) {
		Connection cnx = ConnectionBD.getConnection();
		try {
			PreparedStatement ps = cnx.prepareStatement("insert into user Values (null,?,?,?,?) ");
			ps.setString(1, u.getLogin());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getNomPren());
			ps.setBoolean(4,u.isAdmin());
			ps.executeUpdate();
		}catch (Exception e) {
			
			e.printStackTrace();
		}
			
			
	}
	public void supprimer (int code) {
		Connection cnx = ConnectionBD.getConnection();
		try {
			PreparedStatement ps = cnx.prepareStatement("delete from user where codeU = ? ");
			ps.setInt(1, code);
			ps.executeUpdate();
		}catch (Exception e) {
			
			e.printStackTrace();
		}
			
			
	}
	public void modifier (User u) {
		Connection cnx = ConnectionBD.getConnection();
		try {
			PreparedStatement ps = cnx.prepareStatement("update user set login = ? ,password = ? ,nomPren = ? , admin =? where codeU = ? ");
			ps.setString(1, u.getLogin());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getNomPren());
			ps.setBoolean(4,u.isAdmin());
			ps.setInt(5, u.getCodeU());
			ps.executeUpdate();
		}catch (Exception e) {
			
			e.printStackTrace();
		}
			
			
	}

	public User Connexion(String username ,String password) {
		Connection connection = ConnectionBD.getConnection();
		User u =new User();
		try {
			 PreparedStatement ps= connection.prepareStatement("Select * from User Where login = ? and password = ? ");
			 ps.setString(1, username);
			 ps.setString(2, password);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 u.setCodeU(rs.getInt("codeU"));
				 u.setLogin(rs.getString("login"));
				 u.setPassword(rs.getString("password"));
				 u.setNomPren(rs.getString("nomPren"));
				 u.setAdmin(rs.getBoolean("admin"));
			 }
			 ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
		
	}
	public User getUserById(int code) {
		Connection connection = ConnectionBD.getConnection();
		User u =new User();
		try {
			 PreparedStatement ps= connection.prepareStatement("Select * from User Where codeU = ? ");
			 ps.setInt(1, code);
			
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 u.setCodeU(rs.getInt("codeU"));
				 u.setLogin(rs.getString("login"));
				 u.setPassword(rs.getString("password"));
				 u.setNomPren(rs.getString("nomPren"));
				 u.setAdmin(rs.getBoolean("admin"));
			 }
			 ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
		
	}
	
	
	public List<User> getAllUsers() {
		Connection connection = ConnectionBD.getConnection();
	
		List<User> users = new ArrayList<User>();
		try {
			 PreparedStatement ps= connection.prepareStatement("Select * from User  ");
			 
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				User u =new User();
				 u.setCodeU(rs.getInt("codeU"));
				 u.setLogin(rs.getString("login"));
				 u.setPassword(rs.getString("password"));
				 u.setNomPren(rs.getString("nomPren"));
				 u.setAdmin(rs.getBoolean("admin"));
				 users.add(u);
			 }
			 ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return users;
		
	}
	
	public Boolean isValid(String username ,String password) {
		Connection connection = ConnectionBD.getConnection();
		int nb = 0;
		try {
			 PreparedStatement ps= connection.prepareStatement("Select Count(*) as 'nb' from User Where login = ? and password = ? ");
			 ps.setString(1, username);
			 ps.setString(2, password);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 nb=rs.getInt("nb");
			 }
			 ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return nb==1; 
		
	}
	
	
}
