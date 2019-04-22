<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/home.css" />" />

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
	
	<script type="text/javacript" language="javascript"> 

<script> 
function Save(){ 
document.formName.action="save.htm"; 
formName.submit(); 
} 
function Run(){ 
document.formName.action="run.htm"; 
formName.submit(); 
} 
</script> 

</head>
<body>



<c:if test="${sessionScope.user != null}">
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
	

<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Time</th>
      <th scope="col">Content</th>

    </tr>
  </thead>
  <tbody>
  <c:if test="${sessionScope.historys != null }">
  
  <%  

ArrayList<ArrayList<String>> historys = (ArrayList<ArrayList<String>>) session.getAttribute("historys");
int historySize = historys.size();
for(int i =0;i<historySize;i ++){
ArrayList<String> history = historys.get(i);
		 %>
	    <tr>
      <th scope="row"><%= i+1 %></th>
      <td><%=history.get(0)%></td>
      <td><a href="userHome.htm?statement=<%=history.get(1)%>"><%=history.get(1)%></td>

    </tr>

 <%  }

%>
  </c:if>

  </tbody>
</table>


</body>
</html>