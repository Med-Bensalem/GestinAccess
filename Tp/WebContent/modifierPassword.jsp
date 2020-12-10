<% session.setAttribute("page", "dashbord") ;%>
<%@ include file="styles.jsp" %>
<%@ include file="navbar.jsp" %>
<%@ include file="sidebar.jsp" %>
  <div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            Modifier Mot de Passe
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Acceuil</a></li>
					  <li><a href="#">Modifier Mot de Passe</a></li>
					  
					</ol> 
									
		</div>
     <div id="page-inner">
     
     <div class="panel-body">
     <p style="color:red">  <% if(request.getParameter("erreur") != null){
    	 if(request.getParameter("erreur").equals("ancien"))
    		 out.print("Ancien mot de passe est incorrecte");
    	 else if(request.getParameter("erreur").equals("confirmer"))
    		 out.print("Confirmer mot de passe");
     }
    	 %> </p>
     
                                    <form class="form-horizontal" method ="post" action="modifierPassword">
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Ancien Mot de Passe </label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" name="ancien"id="ancien" placeholder="Ancien Mot de Passe" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Nouveau Mot de Passe</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" id="nouveau" name="nouveau" placeholder="Nouveau Mot de Passe" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Confirmer Mot de Passe</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" name="confirmer" id="confirmer" placeholder="Confirmer Mot de Passe" required>
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-success">Enregistrer</button>
                                                <button type="reset" class="btn btn-danger">Annuler</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
     </div>
   </div>
<%@ include file="scripts.jsp" %>
