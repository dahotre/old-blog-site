function setPointer(cellX) {
	$('#headerNav .' + cellX).css('background-color', '#eee');
}

function remove_fields(link) {
	$(link).prev("input[type=hidden]").val("1");
	$(link).parent(".fields").hide();
}

function add_fields(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	$(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function(){
	var peepClosed = false;
	var hrf = $("#peepLink").attr("href");
	$(window).scroll(function() {
		var scrolled = $(window).scrollTop();
		if (scrolled >= 100 && peepClosed != true) {
			$("#peepWrap").show();
			$("#peepLink").attr("href", hrf + "?REC=true");
		}
		else {
			$("#peepWrap").hide();
		}
	});

	$('#peepClose').click(function() {
		peepClosed = true;
		$("#peepWrap").hide();
	});

	$('#headerNav>.headerCellFixedWidth').click(function() {
		var toGo = $(this).children("a").attr("href");
		if (toGo) {
			window.location.href = toGo;				
		}
	});

	//For adding facebox to blogImage images
	$(".blogImage").wrap(function() {
		return '<a href="' + $(this).attr('src') + '" class="facebox" rel="facebox nofollow" />';
	});
	$('a[rel*=facebox]').facebox();

	//For closing overstock extension deals page message
	$("#closeDeal").click(function() {
		$("#extnMessage").hide('slow');
	});
});