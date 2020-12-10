package entities;

import java.io.Serializable;
import java.util.Date;

public class Historique implements Serializable {

	private static final long serialVersionUID = 1L;
	private int CodeH;
	private Date dateAcces;
	private int codeU;
	
	public Historique() {
		super();
	}

	

	public int getCodeU() {
		return codeU;
	}



	public void setCodeU(int codeU) {
		this.codeU = codeU;
	}



	public Historique(int codeH, Date dateAcces, int codeU) {
		super();
		CodeH = codeH;
		this.dateAcces = dateAcces;
		this.codeU = codeU;
	}



	public int getCodeH() {
		return CodeH;
	}

	public void setCodeH(int codeH) {
		CodeH = codeH;
	}

	public Date getDateAcces() {
		return dateAcces;
	}

	public void setDateAcces(Date dateAcces) {
		this.dateAcces = dateAcces;
	}
	
	
	

}
