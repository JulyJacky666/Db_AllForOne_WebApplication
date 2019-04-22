$(document).ready(function() {
	$("#logout").on("click",function() {
			window.location.href="logout.htm";
	});
	
	$("#addStaff").on("click",function() {
//		window.location.href="flow/addStaff.htm";
//		window.location.href="addStaffNew.htm";
		$("#myModal2").modal();
});
	$("#myBtn").click(function(){
		$("#myModal").modal();
	});
	
	
	$("#signupBtn").click(function(event) {
		event.preventDefault();
		
			$.ajax({
				type: "POST",
				url: "addStaffNew1.htm",
				data: $("#signupForm").serializeArray(),
				success: function(data) {
					if(data=="error") {
						$("#errormessage1").html("Please enter valid data!");					
					}
					else if(data=="warning1") {
						$("#errormessage1").html("Email Address has already exists, please try another one!");	
					}
					else if(data=="warning2") {
						$("#errormessage1").html("Username has already exists, please try another one!");	
					}
					else if(data=="notsame") {
						$("#errormessage1").html("Please enter same password!");		
					}
					else {
						$("#signupForm").submit();
						$("#errormessage1").html("");
						$(".field").val("");
					}
				}
			});	
	});
	
	$("#loginBtn").click(function(event) {
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "loginAdmin1.htm",
			data: $("#loginForm").serializeArray(),
			success: function(data) {
				if(data=="error") {
					$("#errormessage").html("Please enter valid username and password!");					
				}
				else {
					$("#loginForm").submit();
					$("#errormessage").html("");
					$(".field").val("");
				}
			}
		});		
	});
	
	
	
	
});