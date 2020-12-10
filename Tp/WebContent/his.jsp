<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
     <%@page import="entities.Historique" %>
      <%@page import="entities.User" %>
      <%@page import= "java.util.Date" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Historique</title>
</head>
<body>
<% User u = (User) session.getAttribute("user"); 
ArrayList<Historique> hist=(ArrayList<Historique>)session.getAttribute("historiquesByUser");
%>




<%if(!u.isAdmin()){%>
<div> <h1><b style="color:blue;" > Liste des Historiques User </b></h2>
<form >
<table border="1">
 <tr>
 
 <tr>
 <td><b>Nom & Prénom</b></td>
 <td><b>Date Accées</b></td>
 <td><b>Code User</b></td>
 </tr>
	 <%
	 // récupération d'une variable de session
	 
	 if (hist!=null){
	 for(Historique s : hist) {
	 %>
 <tr>
 <td> <%= u.getNomPren() %></td>
 <td> <%= s.getDateAcces()%></td>
 <td> <%= s.getCodeU() %></td>
 
 </tr>
 <%
 }
 }
 %>
 
 </table>
 <%
} 
%>
 


<form >
<%if(u.isAdmin()){
	%>
	<div> <h1><b style="color:blue;" >  Historiques de Tous Les Accées </b></h2>
	<table border="1">
 <tr>
 
 <tr>
 <td><b>Code Historique</b></td>
 <td><b>Date Accées</b></td>
 <td><b>Code User</b></td>
 </tr>
	 <%
	 // récupération d'une variable de session
	 ArrayList<Historique> histo=(ArrayList<Historique>)session.getAttribute("historiques");
	 if (hist!=null){
	 for(Historique s : histo) {
	 %>
 <tr>
 <td> <%= s.getCodeH() %></td>
 <td> <%= s.getDateAcces()%></td>
 <td> <%= s.getCodeU() %></td>
 
 </tr>
 <%
 }
 }
 %>
 
 </table>
<%
} 
%>
 



</body>
</html>