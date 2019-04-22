<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=windows-1252">
	<title>Home page</title>
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/home.css" />" />

	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="<c:url value="/resources/javascript/homescroll.js"/>"></script>
	
	<script language="JavaScript" src="<c:url value="/resources/javascript/home.js" />"></script>
</head>
<body>
	
<nav class="myNav">
	<div class="dropdown">
		<button class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span>Welcome ${sessionScope.user.username}!</span><span class="caret"></span></button>
		<ul class="dropdown-menu">
	    <li><a href='details.htm'>View My Profile</a></li> 
	    <li><a href='updateProfile.htm'>Update My Information</a></li>
	    <li><a href='#'>View My Contacts</a></li>
	    <li><a href='#'>Change my password</a></li>
	  	</ul>
	</div>
	<div class="hoverpart">
		<a href="logout.htm">Log Out</a>
		<a id="search" href="#searchSec">Quick Search</a>
		<a id="lookuser" href="#lookuserSec">Look Up Username</a>
		<a id="looknum" href="#looknumSec">Look Up Member Number</a>	
		<a id="messageBox" href="#messageBoxSec">Message Box</a>
	  </div>
</nav>

	<div class="sect sectOne"><div class="beginToContact">Begin to contact &#8681</div></div>

	<div id="messageBoxSec" class="subSection">
		<div style="float:left"><h2>Message Box</h2></div>
		<button style="float:right" class="btn btn-info btn-lg" onclick="newMessageWindow()">New Message</button>
		<div style="clear:both"></div>
		<c:forEach var="message" varStatus="status" items="${sessionScope.messageList }">
			<div class="perperson">
				<div><img class="messagehead" src="<c:url value="/resources/img/head.jpeg"/>"></div>
				<div class="messageFrom"><br /><span>${message.fromUser.username }</span></div>
				<div class="messageContent"><span>${message.message }</span></div>
				<div class="checkbox"><input type="hidden" value="${message.id }" />
										<button class="deleteBtn btn btn-danger btn-md">Delete</button></div>
				<div class="reply"><a href='newMessage.htm?toUser=${message.fromUser.username }'><img src="<c:url value="/resources/img/reply.png"/>"></a></div>
				<div class="messageID"><span>${message.title }</span></div>
			</div>
		</c:forEach>
	</div>


	<div class="sect sectTwo"><div class="lookupByNum">Look Up By Member Number &#8681</div></div>
	<div id="looknumSec" class="subSection">
		<div class="info">Please enter the member number of the person you want to look up</div>
		<form class="form-inline" name='lookupByNumberForm' method='post' action='lookupByNumber1.htm'>
		<div class="seeProfile">
		<input class="form-control input-lg" type='text' name='LookupMemberID' placeholder="Enter a Number"required="required" />
		<input type='submit' value='See Profile' class="searchByIdBtn btn btn-info btn-lg" disabled="disabled" />
		</div>
		</form>
		<div id="errorMessageId" align="center"></div>
	</div>


	<div class="sect sectThree"><div class="lookupByName">Look Up By User Name &#8681</div></div>
	<div id="lookuserSec" class="subSection">
		<div class="info">Please enter the username of the person you want to look up</div>
		<form class="form-inline" name='lookupByNameForm' method='post' action='searchByName1.htm'>
		<div class="seeProfile form-inline">
			<input class="form-control input-lg" type='text' name='LookupMemberName' placeholder="Enter a Name" required="required" />
			<input type="submit" class="searchByNameBtn btn btn-info btn-lg" disabled="disabled" value="See Profile" />
		</div>
		</form>
		
				<div id="errorMessage" align="center"></div>
			
	</div>


	<div class="sect sectFour"><div class="quickSearch">Quick Search &#8681</div></div>
	<div id="searchSec" class="subSection">
	<form id="quickSearchForm" name='searchUserForm' method='post' action='quickSearch.htm'>
	
	<div class="form-inline"><b/>
		<lable>Show me: </lable> 
		<select name='SeekingGenderID' class="form-control" >
		<option value='Male' selected>Male</option>
		<option value='Female'>Female</option>
		</select>
	</div><br />
	
	<div><span>Search Location: </span></div><br />
	<div class="form-inline">
		<span>Country: </span>
		<select name="CountryRegionID" class="form-control">
	              <option value="China"               >China</option>
	              <option value="India"               >India</option>
	              <option value="USA"  selected       >USA</option>
	            </select>
	</div><br />

	<div class="form-inline">
		<span>State: </span>
		<input class="field form-control" type='text' name='stateName' value='' size='18' maxlength='40'>
	&nbsp&nbsp&nbsp&nbsp&nbsp
		<span>City: </span>
		<input class="field form-control" type='text' name='cityName' value='' size='18' maxlength='40'>
	</div><br />
	
	<div>
	<input id="quickSearchBtn" type='submit' name='cmdGo3' value='Search' class="btn btn-info btn-lg">
	</div>
	</form>
	
	 <div id="errormessage" align="center"></div>
	 <div id="resultList" align="center" style="display:none;" class="table"></div>
	</div>
	<div class="sect sectFive"><div class="enjoy">Enjoy your Day! &#8679</div></div>

<script type="text/javascript">
	function newMessageWindow() {
		window.location.href="newMessage.htm";
	}
	
	$(".deleteBtn").on("click", function() {
		var x = confirm("Are you sure you want to delete?");
		if (x) {
			var messageId = $(this).siblings().val();
			$.post("deleteMessage.htm",{
				messageToBeDeleteId: messageId
			});
		}
		$(this).parent().parent().hide();
	});

	$("#lookuserSec input[name=LookupMemberName]").keyup(function() {
		var name = $("#lookuserSec input[name=LookupMemberName]").val();
		/* if(name=="") alert("Please enter username"); */
		/* else { */
			$.post("searchByName.htm",{
				name: name
			}).done( function(responseText) {
				var obj = JSON.parse(responseText);
				if(obj.successmsg != null) {
					$("#errorMessage").html("User Found! See Profile?");
					$(".searchByNameBtn").prop('disabled', false);
				}
				else{
					$("#errorMessage").html(obj.errormsg);
					$(".searchByNameBtn").prop('disabled', true);
				}
			} );
		/* } */
	});
	
	$("#looknumSec input[name=LookupMemberID]").keyup(function() {
		var ID = $("#looknumSec input[name=LookupMemberID]").val();
			$.post("lookupByNumber.htm",{
				ID: ID
			}).done( function(responseText) {
				var obj = JSON.parse(responseText);
				if(obj.successmsg != null) {
					$("#errorMessageId").html("User Found! See Profile?");
					$(".searchByIdBtn").prop('disabled', false);
				}
				else{
					$("#errorMessageId").html(obj.errormsg);
					$(".searchByIdBtn").prop('disabled', true);
				}
			} );
	});
</script>

</body>
</html>