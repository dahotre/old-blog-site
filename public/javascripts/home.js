$(document).ready(function() {
	$(".bubble").hover(
		function() {
			$(this).css('background', 'rgba(128, 128, 128, 0.7)');
		},
		function() {
			$(this).css('background', 'rgba(128, 128, 128, 0.3)');
		}
	);	

	$("div.hidingLis").hover(
		function() {
			$(".truncatedLi", this).hide();
			$(".fullLi", this).show();
			$(this).css('background', 'rgba(255, 255, 255, 0.5)');
			var len = $("li.fullLi>a", this).text().length / 2 + 1;
			$(this).css('width', len + 'em');
			$(this).css('border', '0px solid white');
			$(this).css('padding', '0.3em');
			$(this).css('position', 'relative');
			$(this).css('top', '-0.3em');
			$(this).css('left', '-0.3em');
		},
		function() {
			$(".truncatedLi", this).show();
			$(".fullLi", this).hide();
			$(this).css('background', '');
			$(this).css('width', '');
			$(this).css('border', '');
			$(this).css('padding', '');
			$(this).css('position', '');
			$(this).css('top', '');
			$(this).css('left', '');
		}
	);
	
	$("#artistControl").click(
		function (){
			if ($(this).text() == ("Show Less..")) {
				$(this).text("Show More..");
			}
			else {
				$(this).text("Show Less..");
			}
			$("#artistHide").toggle('fast');
		},
		function() {}
	);
});