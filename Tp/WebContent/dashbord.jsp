<%@page import="dao.HistoriqueDAO"%>
<%@page import="dao.UserDAO"%>
<% session.setAttribute("page", "dashbord") ;%>
<%@ include file="styles.jsp" %>
<%@ include file="navbar.jsp" %>
<%@ include file="sidebar.jsp" %>
  <div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            <small>Bienvenue <%out.print(session.getAttribute("nom")); 
                            User u =(User) session.getAttribute("user");%></small>
                        </h1>
             <%if(u.isAdmin()){%>           
						<ol class="breadcrumb">
					  <li><a href="#">Acceuil</a></li>
					  
					  
					</ol> 
									
		</div>
     <div id="page-inner">
     <div class="row">
                    <div class="col-md-3 col-sm-12 col-xs-12">
					<div class="board">
                        <div class="panel panel-primary">
						<div class="number">
							<h3>
								<h3><%UserDAO userdao = new UserDAO();
								out.print(userdao.getAllUsers().size());%></h3>
								<small>Utilisateurs</small>
							</h3> 
						</div>
						<div class="icon">
						   <i class="fa fa-user fa-5x red"></i>
						</div>
		 
                        </div>
						</div>
                    </div>
					
					       <div class="col-md-3 col-sm-12 col-xs-12">
					<div class="board">
                        <div class="panel panel-primary">
						<div class="number">
							<h3>
								<h3><%HistoriqueDAO histdao = new HistoriqueDAO();
								out.print(histdao.getAll().size());%></h3>
								<small>Historiques</small>
							</h3> 
						</div>
						<div class="icon">
						   <i class="fa fa-file fa-5x blue"></i>
						</div>
		 
                        </div>
						</div>
                    </div>
                    </div>
                    
     </div>
     <%
											 }
											 
											 %>
   </div>
<%@ include file="scripts.jsp" %>
