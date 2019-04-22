$(document).ready(function() {
	setBindings();
	showFade();
}); 

function setBindings() {
	
	$("#search, #lookuser, #looknum, #messageBox").click(function(e) {
		e.preventDefault();
		var sectionID = e.currentTarget.id+"Sec";
		$("html body").animate({scrollTop: $("#"+sectionID).offset().top - 100}, 1000);

	// 	alert("button id " + sectionID);
	 });
}

function showFade() {
	$("div.sectOne").hover(function() {
		$("div.beginToContact").fadeIn("slow");
	}, function() {
		$("div.beginToContact").fadeOut("slow");
	});

	$("div.sectFive").hover(function() {
		$("div.enjoy").fadeIn("slow");
	}, function() {
		$("div.enjoy").fadeOut("slow");
	});

	$("div.sectTwo").hover(function() {
		$("div.lookupByNum").fadeIn("fast");
	}, function() {
		$("div.lookupByNum").fadeOut("fast");
	});

	$("div.sectThree").hover(function() {
		$("div.lookupByName").fadeIn("fast");
	}, function() {
		$("div.lookupByName").fadeOut("fast");
	});

	$("div.sectFour").hover(function() {
		$("div.quickSearch").fadeIn("fast");
	}, function() {
		$("div.quickSearch").fadeOut("fast");
	});
}
