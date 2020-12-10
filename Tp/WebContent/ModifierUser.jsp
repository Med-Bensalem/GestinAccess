<%@page import="dao.UserDAO"%>
<% session.setAttribute("page", "dashbord") ;%>
<%@ include file="styles.jsp" %>
<%@ include file="navbar.jsp" %>
<%@ include file="sidebar.jsp" %>
  <div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            Modifier Utilisateur
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Acceuil</a></li>
					  <li><a href="#">Modifier Utilisateur</a></li>
					 
					</ol> 
									
		</div>
     <div id="page-inner">
     
     <div class="panel-body">
     
     <% if (request.getParameter("code") != null)
    	 {
    	 UserDAO userdao = new UserDAO();
    	 User u =new User();
    	 u = userdao.getUserById(Integer.parseInt(request.getParameter("code")));
    	  %>
    	
                                    <form class="form-horizontal" action="ModifierUser" method="post">
                                    <input type="hidden" name ="codeU" value ="<% out.print(u.getCodeU()); %>">
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Nom & Prénom</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" value ="<% out.print(u.getNomPren()); %>" name="nom"id="nom" placeholder="Nom">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Login</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" value ="<% out.print(u.getLogin()); %>"name="login" id="login" placeholder="Login">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" value ="<% out.print(u.getPassword()); %>" name="password" id="password" placeholder="Password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                        <label  class="col-sm-2 control-label">Admin</label>
                                            <div class=" col-sm-10">
                                            <label></label>
                                              <div >
                                                <input type="radio" name="admin" id="radio1" value="true" <% if(u.isAdmin()) out.print("checked"); %>>
                                                <label for="radio1">
                                                  Oui
                                                </label>
                                                 <input type="radio" name="admin" id="radio2" value ="false"<% if(!u.isAdmin()) out.print("checked"); %>>
                                                <label for="radio2">
                                                  Non
                                                </label>
                                              </div>
                                              
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-success">Modifier</button>
                                                <button type="submit" class="btn btn-danger">Annuler</button>
                                            </div>
                                        </div>
                                    </form>
                                    
                                </div>
                                <%  }else out.print("Quelque chose");
    	 
    	 %>
     </div>
   </div>
<%@ include file="scripts.jsp" %>
