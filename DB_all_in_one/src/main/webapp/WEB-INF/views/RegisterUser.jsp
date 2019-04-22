<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/home.css" />" />

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="<c:url value="/resources/javascript/homescroll.js"/>"></script>

<script language="JavaScript"
	src="<c:url value="/resources/javascript/home.js" />"></script>
</head>
<body>

<<c:if test="${sessionScope.user != null}">
		<nav class="myNav">
			<div class="dropdown">
				<button class="dropdown-toggle" type="button" id="dropdownMenu1"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<span>Welcome ${sessionScope.user.user_name}!</span><span
						class="caret"></span>
				</button>
	
			</div>
			<div class="hoverpart">

			
				
			<a href="logout.htm">Log Out</a>
			<a href="history.htm"> Saved History</a>
			<c:if test="${sessionScope.user.user_name == 'root'}">
			<a href="registeruser.htm">Create User</a> 			
			</c:if>
			
			<a href="userHome.htm"> Home Page</a>
			<!-- <a href="logout.htm">Log Out</a> -->
			

			</div>
		</nav>
	</c:if>
		
		
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>
		</br>





		<form action="registeruser.htm" method="post">
			<div align="center">
				User Name: <input type="text" name="user_name"> </br>
			</div>
			<div align="center">
				User Password: <input type="password" name="user_password">
				</br>				
			</div>
			
			<div align="center">
				Grants On:

<%-- 				<select name="database">
				<c:forEach var="db" items="${dbs}">
					<option value="${db}" }>${db}</option>
				</c:forEach>
				</select> --%>
				
			</div>
			
			<div align="center">
				Privileges :
				<input type="checkbox" name="Privileges" value="select" checked> select
				<input type="checkbox" name="Privileges" value="delete"> delete
				<input type="checkbox" name="Privileges" value="update" > update
				<input type="checkbox" name="Privileges" value="insert" > insert
			</div>
			
			<div align="center">
				<input type="submit" value="Register">
			</div>
		<form action="registeruser.htm" method="post">
		<hr>
		
		
				<c:forEach var="user" items="${users}">
					<a> ${user}</a><br>
				</c:forEach>
		
		

</body>
</html>