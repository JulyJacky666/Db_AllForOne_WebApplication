$(document).ready(function() {
	$("#loginBtn").click(function(event) {
		event.preventDefault();
		$.ajax({
			type: "POST",
			url: "loginUser1.htm",
			data: $("#loginForm").serializeArray(),
			success: function(data) {
				if(data=="error") {
					$("#errormessage").html("Please enter valid email and password! (valid email address and no special character)");					
				}
				else {
					$("#loginForm").submit();
					$("#errormessage").html("");
					$(".field").val("");
				}
			}
		});		
	});

	
	
	$("#signupBtn").click(function(event) {
		event.preventDefault();
		
			$.ajax({
				type: "POST",
				url: "addUser1.htm",
				data: $("#signupForm").serializeArray(),
				success: function(data) {
					if(data=="error") {
						$("#errormessage1").html("Please enter valid data (valid email address and no special character)!");					
					}
					else if(data=="warning1") {
						$("#errormessage1").html("Email Address has already exists, please try another one!");	
					}
					else if(data=="warning2") {
						$("#errormessage1").html("Username has already exists, please try another one!");	
					}
					else {
						$("#signupForm").submit();
						$("#errormessage1").html("");
						$(".field").val("");
					}
				}
			});	
	});
	
	
	
	$("#adminBtn").on("click",function() {
		window.location.href="adminModel.htm";
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}); 
		