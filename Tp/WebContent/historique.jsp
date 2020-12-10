<%@page import="entities.Historique"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.UserDAO"%>
<% session.setAttribute("page", "users") ;%>
<%@ include file="styles.jsp" %>
<%@ include file="navbar.jsp" %>
<%@ include file="sidebar.jsp" %>
<%@ include file="scripts.jsp" %>

<% User u = (User) session.getAttribute("user"); 
ArrayList<Historique> hist=(ArrayList<Historique>)session.getAttribute("historiquesByUser");
UserDAO userdao = new UserDAO();
%>

  <div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                           Historique Utilisateurs 
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Acceuil</a></li>
					  <li><a href="#">Historique Utilisateur</a></li>
					  
					</ol> 
									
		</div>
     <div id="page-inner">
     <%if(!u.isAdmin()){%>
     	<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Historique Utilisateur<br><br>
                              
                        </div>
                       
                        <div class="panel-body">
                            <div class="table-responsive" style="overflow-x:hidden">
                                <table class="table table-striped table-bordered table-hover text-center" id="dataTables">
                                    <thead class="text-center">
                                        <tr >
                                            <th class="text-center">Code</th>
                                            <th class="text-center">Nom & Prénom</th>
                                            <th class="text-center">Date Accées</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                <%if (hist!=null){
	                                for(Historique s : hist) {
	                              %>
										 <tr>
										 <td> <%= s.getCodeU() %></td>
										 <td> <%= u.getNomPren() %></td>
										 <td> <%= s.getDateAcces()%></td>
										 </tr>
										<%} 
										} %> 
                                    </tbody>
                                  </table>
                                 </div>
                               </div>
                              </div>
                             </div>
                            </div>
                            <%} %>
                          <script type="text/javascript">
                          
                          $(document).ready(function () {
							$("#dataTables").dataTable();
						});
                          
                          </script> 
     
    <div >
    <%if(u.isAdmin()){%>
     	<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             Historique Utilisateurs<br><br>
                              
                        </div>
                       
                        <div class="panel-body">
                            <div class="table-responsive" style="overflow-x:hidden">
                                <table class="table table-striped table-bordered table-hover text-center" id="dataTables-example">
                                    <thead class="text-center">
                                        <tr >
                                            <th class="text-center">Code</th>
                                            <th class="text-center">Nom & Prénom</th>
                                            <th class="text-center">Date Accées</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <%
											 ArrayList<Historique> histo=(ArrayList<Historique>)session.getAttribute("historiques");
											 if (hist!=null){
											 for(Historique s : histo) {
										 %>
										 <tr>
											 <td> <%= s.getCodeU() %></td>
											 <td> <%=userdao.getUserById(s.getCodeU()).getNomPren() %></td>
											 <td> <%= s.getDateAcces() %></td>
											 
											 </tr>
											 <%
											 }
											 }
											 %>
                                    </tbody>
                                  </table>
                                 </div>
                               </div>
                              </div>
                             </div>
                            </div>
                             <%} %>
                          <script type="text/javascript">
                          
                          $(document).ready(function () {
							$("#dataTables-example").dataTable();
						});
                          
                          </script> 
     </div>
     </div>
   </div>
