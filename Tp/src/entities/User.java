package entities;

public class User {
	private static final long serialVersionUID = 1L;
	private int CodeU;
	private String login;
	private String password;
	private String nomPren;
	private boolean admin;
	
	
	public int getCodeU() {
		return CodeU;
	}


	public void setCodeU(int codeU) {
		CodeU = codeU;
	}


	public String getLogin() {
		return login;
	}


	public void setLogin(String login) {
		this.login = login;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getNomPren() {
		return nomPren;
	}


	public void setNomPren(String nomPren) {
		this.nomPren = nomPren;
	}


	public User() {
		super();
	}


	public User(String login, String password, String nomPren,boolean admin) {
		super();
		this.login = login;
		this.password = password;
		this.nomPren = nomPren;
		this.admin=admin;
	}
	public boolean isValid() {
        return true;
	}


	public boolean isAdmin() {
		return admin;
	}


	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	
}
