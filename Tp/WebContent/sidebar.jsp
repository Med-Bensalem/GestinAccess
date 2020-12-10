<%if(request.getSession().getAttribute("user")==null)
	response.sendRedirect("Login.jsp?erreur=login");%>
	
<%@page import="entities.User"%>
<nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a <% if (session.getAttribute("page").equals("dashbord"))
                        	out.print ("class='active-menu'");%> href="dashbord.jsp"><i class="fa fa-dashboard"></i> Dashboard</a>
                    </li>
                    <% if(request.getSession().getAttribute("user") != null){
                    	User u = (User) request.getSession().getAttribute("user");
                		if (u.isAdmin())
                			out.print("<li><a href='users.jsp'><i class='fa fa-users'></i> Gestion Utilisateur</a></li> " );
                    }
                    		%>
                  
					 <li>
                        <a href="historique.jsp"><i class="fa fa-file"></i> Historique</a>
                    </li>
                    <% if(request.getSession().getAttribute("user") != null){
                    	User u = (User) request.getSession().getAttribute("user");
                		if (!u.isAdmin())
                			out.print("<li><a href='modifierPassword.jsp'><i class='fa fa-key'></i>Modifier Mot de Passe</a></li> " );
                    }
                    		%>
					 
                   
                </ul>
            </div>
        </nav>