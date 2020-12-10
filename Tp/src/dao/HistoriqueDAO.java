package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entities.Historique;
import entities.User;

public class HistoriqueDAO {
	
	public void addHistorique(Historique h) {
		Connection cnx = ConnectionBD.getConnection();
		try {
			 PreparedStatement ps= cnx.prepareStatement("insert into historique Values (null,now(),?) ");
			 ps.setInt(1, h.getCodeU());
			 ps.executeUpdate(); 	
			 ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Historique> getAll(){
		Connection cnx = ConnectionBD.getConnection();
		List<Historique> historiques = new ArrayList<Historique>();
		try {
			 PreparedStatement ps= cnx.prepareStatement("select * from Historique ");
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				 Historique h =new Historique();
				 h.setCodeH(rs.getInt("codeH"));
				 h.setDateAcces(rs.getDate("dateAccees"));
				 h.setCodeU(rs.getInt("codeU"));
				 historiques.add(h);
			 }
			 ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return historiques;
	}
	
	public List<Historique> getHistoriqueByUser(int id ){
		Connection cnx = ConnectionBD.getConnection();
		List<Historique> historiques = new ArrayList<Historique>();
		try {
			 PreparedStatement ps= cnx.prepareStatement("select * from Historique where codeU = ?  ");
			 ps.setInt(1,id);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()){
				 Historique h =new Historique();
				 h.setCodeH(rs.getInt("codeH"));
				 h.setDateAcces(rs.getDate("dateAccees"));
				 h.setCodeU(rs.getInt("codeU"));
				 historiques.add(h);
			 }
			 ps.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return historiques;
	}

}
