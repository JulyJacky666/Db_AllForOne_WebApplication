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
	
<script  language="javascript"> 


function  Save(){ 
	document.formName.action="save.htm"; 
	formName.submit(); 
	alert("save success!!");
} 

function  Run(){ 
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
	
	






<div align ="center">
	<form action="" method="post" name ="formName">
	
	
	<div align="left">
<c:forEach items="${dbs}" var="item">
   ${item} <input type = "radio" name= "database" value ="${item}"><br>
</c:forEach>


</div>
	<textarea name = "statement" rows="5" cols="70" > ${statement} </textarea></br>
	
	<input type = "submit" value = "Save" onClick="Save()"/>
	<input type = "submit" value = "Run" onClick="Run()"/>
	
	</form>
</div>

<hr>

<c:if test="${requestScope.errorMessage == null}">

	<c:if test="${requestScope.results != null }">
    <table class="table table-striped">

  
  
  <%  ArrayList<ArrayList<Object>> results = (ArrayList<ArrayList<Object>>) request.getAttribute("results"); %>
  <thead>
  <tr>
  <%	for(int j=0;j<results.get(0).size();j++){ %>
  	<th scope="col"> <%=results.get(0).get(j)%> </th>
  <% } %>
  </tr>
  </thead>
  
<% int resultsSize = results.size();
for(int i =1;i<resultsSize;i ++){
	ArrayList<Object> result = results.get(i); %>
		    <tr>
      	<%-- 	<th scope="row"><%= i+1 %></th> --%>
	
	<%	for(int j=0;j<result.size();j++){ %>
     		 <td><%=results.get(i).get(j)%></td>
 <%  } %>
   </tr>
<% } %>
  
  </tbody>
</table>
		
	
	</c:if>
   	
</c:if>


<c:if test="${requestScope.errorMessage != null}">

    <table class="table table-striped">
    <tr>
    <td>Error:</td>
    
    <td><font size="3" color="red">${errorMessage}</font></td>
    </tr>
    
    </table>

</c:if>

</body>
</html>