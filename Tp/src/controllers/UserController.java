package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HistoriqueDAO;
import dao.UserDAO;
import entities.Historique;
import entities.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet(urlPatterns ={"/Login","/AjouterUser","/Deconnexion","/ModifierUser","/DeleteUser","/modifierPassword"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=request.getServletPath() ;
		PrintWriter out = response.getWriter();
		UserDAO userdao = new UserDAO();
		HttpSession session = request.getSession();
		if(path.equals("/Deconnexion")) {
			session.setAttribute("user", null);
			response.sendRedirect("Login.jsp");
		}else if(path.equals("/DeleteUser")) {
			if(request.getParameter("code") !=null) {
				int code =Integer.parseInt(request.getParameter("code"));
				userdao.supprimer(code);
				response.sendRedirect("users.jsp");
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path=request.getServletPath() ;
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		UserDAO userdao = new UserDAO();
		
        if(path.equals("/Login")) {
        	if (request.getParameter("username") != null && request.getParameter("password") != null) {
    			String username = request.getParameter("username");
    	        String password = request.getParameter("password");
    	        
    	       if (userdao.isValid(username, password)){
    	    	   User u = userdao.Connexion(username, password);       
    	        	Historique h =new Historique();
    	        	Date DateAccees= new Date(System.currentTimeMillis());
    	        	h.setCodeU(u.getCodeU());
    	        	h.setDateAcces(DateAccees);
    	        	HistoriqueDAO hs=new HistoriqueDAO();
    	        	hs.addHistorique(h);
    	        	List<Historique>historiques = hs.getAll();
    	            List<Historique>historiquesByUser = hs.getHistoriqueByUser(u.getCodeU());
    	            session.setAttribute("user", u);
    	            session.setAttribute("date", DateAccees);
    	            session.setAttribute("historiques", historiques);
    	            session.setAttribute("historiquesByUser", historiquesByUser);
    	            session.setAttribute("nom", u.getNomPren());
    	            response.sendRedirect("dashbord.jsp");
    	       }else {
    	    	   response.sendRedirect("Login.jsp?erreur=invalide");
    	       }
    	        	 
    	        }
    		}else if(path.equals("/AjouterUser")) {
    			if (request.getParameter("nom") != null && request.getParameter("prenom") != null && 
    				request.getParameter("login") != null && request.getParameter("password") != null && 
    				request.getParameter("admin") != null) {
    				User u =new User();
    				u.setNomPren(request.getParameter("nom") +" "+request.getParameter("prenom"));
    				u.setLogin(request.getParameter("login"));
    				u.setPassword(request.getParameter("password"));
    				u.setAdmin(Boolean.parseBoolean(request.getParameter("admin")));
    				userdao.ajouter(u);
    				response.sendRedirect("users.jsp");
    				
    				
    			}
    		}else if (path.equals("/ModifierUser")) {
    			
    			if (request.getParameter("nom") != null  && request.getParameter("codeU") != null &&
        				request.getParameter("login") != null && request.getParameter("password") != null && 
        				request.getParameter("admin") != null) {
        				User u =new User();
        				u.setCodeU(Integer.parseInt(request.getParameter("codeU")));
        				u.setNomPren(request.getParameter("nom") );
        				u.setLogin(request.getParameter("login"));
        				u.setPassword(request.getParameter("password"));
        				u.setAdmin(Boolean.parseBoolean(request.getParameter("admin")));
        				userdao.modifier(u);
        				response.sendRedirect("users.jsp");
        				
    		}
        }else if (path.equals("/modifierPassword")) {
        	
        	if (request.getParameter("ancien") != null && request.getParameter("nouveau") != null && request.getParameter("confirmer") != null) {
        		
        		User u =(User)session.getAttribute("user");
        		if(!request.getParameter("ancien").equals(u.getPassword()) ) 
        			response.sendRedirect("modifierPassword.jsp?erreur=ancien");   		
        		else if( !request.getParameter("nouveau").equals(request.getParameter("confirmer")))
        			response.sendRedirect("modifierPassword.jsp?erreur=confirmer");
        		else {
        			u.setPassword(request.getParameter("nouveau"));
        			userdao.modifier(u);
        			session.setAttribute("user", u);
        			response.sendRedirect("dashbord.jsp");
        		}
        	}
        }
        	
        }
        
        
	}


