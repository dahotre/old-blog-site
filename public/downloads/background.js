chrome.cookies.get({url:"http://www.dahotre.com", name:"userid"}, function(cookie){
	if (cookie.value == 1) {
		chrome.browserAction.setBadgeBackgroundColor({color:[34,139,34, 255]});
		chrome.browserAction.setBadgeText({text:String(' # ')});
	}
});
