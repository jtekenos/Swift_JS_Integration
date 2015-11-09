function callNativeApp() {
	try {
		webkit.messageHandlers.callbackHandler.postMessage("whatever");
	} catch(err) {
		console.log('doesnt exist');
	}
}

setTimeout(function() {
	callNativeApp();
}, 5000);

function redHeader() {
	document.querySelector('h1').style.color = "red";
}

function goPage() {
    window.location.href = "https://apple.com";
}

function goToApple() {
    window.location = "webbrowserlab://";
}
