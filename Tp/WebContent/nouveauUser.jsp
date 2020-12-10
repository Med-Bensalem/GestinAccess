<% session.setAttribute("page", "dashbord") ;%>
<%@ include file="styles.jsp" %>
<%@ include file="navbar.jsp" %>
<%@ include file="sidebar.jsp" %>
  <div id="page-wrapper">
		  <div class="header"> 
                        <h1 class="page-header">
                            Ajoute Utilisateur
                        </h1>
						<ol class="breadcrumb">
					  <li><a href="#">Acceuil</a></li>
					  <li><a href="#">Ajout Utilisateur</a></li>
					 
					</ol> 
									
		</div>
     <div id="page-inner">
     
     <div class="panel-body">
                                    <form class="form-horizontal" action="AjouterUser" method="post">
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Nom</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="nom"id="nom" placeholder="Nom">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Prénom</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name ="prenom" id="prenom" placeholder="Prénom">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">Login</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="login" id="login" placeholder="Login">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                                            <div class="col-sm-10">
                                                <input type="password" class="form-control" name="password" id="password" placeholder="Password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                        <label  class="col-sm-2 control-label">Admin</label>
                                            <div class=" col-sm-10">
                                            <label></label>
                                              <div >
                                                <input type="radio" name="admin" id="radio1" value="true" checked>
                                                <label for="radio1">
                                                  Oui
                                                </label>
                                                 <input type="radio" name="admin" id="radio2" value ="false">
                                                <label for="radio2">
                                                  Non
                                                </label>
                                              </div>
                                              
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-success">Enregistrer</button>
                                                <button type="submit" class="btn btn-danger">Annuler</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
     </div>
   </div>
<%@ include file="scripts.jsp" %>
