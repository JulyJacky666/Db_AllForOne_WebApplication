$(document).ready(function() {
	$("#quickSearchBtn").click(function(event) {
		event.preventDefault();
		var SeekingGenderID = $("#searchSec select[name=SeekingGenderID]").val();
		
		var CountryRegionID = $("#searchSec select[name=CountryRegionID]").val();
		
		var stateName = $("#searchSec input[name=stateName]").val();
		
		var cityName = $("#searchSec input[name=cityName]").val();
		
		
		$.ajax({
			type: "POST",
			url: "quickSearch1.htm",
			data: {
				SeekingGenderID:SeekingGenderID,
				CountryRegionID:CountryRegionID,
				stateName:stateName,
				cityName:cityName
			},
			success: function(responseText) {
				var obj = JSON.parse(responseText);
				
				if(obj.error!=null) {
					$("#errormessage").html("Can not find any user!");					
				}
				else {
					var size = obj.sizeList;
					$("#resultList").show();
					//create Table
					var table = document.createElement("table");
					table.setAttribute("class", "table");
					table.setAttribute("id", "createTable");
					table.setAttribute("align", "center");
					$("#resultList").append(table);
					
					var tr = document.createElement("tr");
					tr.setAttribute("id", "firstTr");
					document.getElementById("createTable").appendChild(tr);
					
					var th = document.createElement("th");
					tr.appendChild(th);
					th.appendChild(document.createTextNode("No."));
					var th = document.createElement("th");
					tr.appendChild(th);
					th.appendChild(document.createTextNode("Username"));
					var th = document.createElement("th");
					tr.appendChild(th);
					th.appendChild(document.createTextNode("Date Of Birth"));
					var th = document.createElement("th");
					tr.appendChild(th);
					th.appendChild(document.createTextNode("Member ID"));
					
					for (var count = 0; count < size; count++) {
						var y = document.createElement("TR");
						$("#createTable").append(y);
						
						var z = y.insertCell(0);
                        var t = document.createTextNode(count+1);
                        z.appendChild(t);
                        
                        var num = count.toString();
                        var index = ("user"+num+"name").toString();
                        var z = y.insertCell(1);
                        var t = document.createTextNode(obj[index]);
                        z.appendChild(t);
                        
                        var index = ("user"+num+"DOB").toString();
                        var z = y.insertCell(2);
                        var t = document.createTextNode(obj[index]);
                        z.appendChild(t);
                        
                        var index = ("user"+num+"ID").toString();
                        var z = y.insertCell(3);
                        var t = document.createTextNode(obj[index]);
                        z.appendChild(t);
                        
//                        var z = y.insertCell(4);
//                        var t = "<button class='btn btn-info' id='checkFromSearch'>Check Profile</button>";
//                        $(z).append(t);
					}
				}
			}
		});	
		
	});
	
	
	
	
	
	
//	$("#checkFromSearch").on("click",function(event) {
//		event.preventDefault();
//		alert("aaa");
//		return false;
//	});
	
});