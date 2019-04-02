<%@ page import="bean.users.RolesBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="base_url" value="${req.getContextPath()}"/>
<%
if (session.getAttribute("user") != null) {
	String setPage = null;
	RolesBean rb = (RolesBean) session.getAttribute("userRole");
	int id = rb.getId();
	if (id == 1) {
		setPage = "/Library/admin/dashboard";
	} else if (id == 2) {
		setPage = "/Library/agent/dashboard";
	} else if (id == 3) {
		setPage = "/Library/user/dashboard";
	}	
	response.sendRedirect(setPage);

}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login System</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>">

<!-- Bootstrap -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/custom.css'/>" />

<!-- jQuery library -->
<script	src="<c:url value='/resources/js/jquery-3.3.1.js'/>"></script>

<!-- Latest compiled JavaScript -->
<script	src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<!-- Font-Awesome -->
<script	src="<c:url value='/resources/js/fontawesome.min.js'/>"></script>
<script	src="<c:url value='/resources/js/custom.js'/>"></script>
</head>
<body>
