<%@page import="bean.users.UserBean"%>
<%@ page import="bean.users.RolesBean" %>
<%@ page import="admin.dao.BookDAO" %>
<%@ page import="services.users.UserService" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="base_url" value="${req.getContextPath()}"/>
<%
UserBean ub = null;
UserService us = null;
if (session.getAttribute("user") != null) {
	String setPage = null;
	ub = (UserBean)session.getAttribute("user");
	us = new UserService();
	RolesBean rb = (RolesBean) session.getAttribute("userRole");
	int id = rb.getId();
	if(id != 1){
		if (id == 2) {
			setPage = "/Library/agent/index.jsp";
		} else if (id == 3) {
			setPage = "/Library/user/index.jsp";
		}
		
		response.sendRedirect(setPage);	
	}
}
else{
	response.sendRedirect("/Library/login");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>LMS</title>

    <!-- Bootstrap Core CSS -->
    <link href="${base_url}/resources/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${base_url}/resources/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${base_url}/resources/admin/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${base_url}/resources/admin/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${base_url}/resources/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>
.sidebar-label{
	padding: 2px 15px 2px 15px;
    border-radius: 10px;
    background: #000;
    font-weight: bold;
    color:#fff;
}
</style>
<body>