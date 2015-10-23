<%@page import="com.google.gson.JsonObject"%>
<%@page import="varun.kumar.sparql.SparqlClient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 

String endpoint="http://localhost:5820/annex/indoorhub/sparql/query";

String username="admin";
String password="admin"; 
SparqlClient sparqlClient=new SparqlClient();
String query = request.getParameter("action");
String isReasoningEnabled = request.getParameter("reasoning");

String data=SparqlClient.execute(endpoint, query, username, password, Boolean.valueOf(isReasoningEnabled));

out.print(data);

%>
