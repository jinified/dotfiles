(function(){var d=function(c){bg.IntroTutorial.getState(function(b){b.enabled&&document.location.host.toLowerCase().includes(b.domain)&&c(b)})};Topics.get(Topics.SITE_NOTIFICATION_STATE).subscribe(function(c){d(function(b){var d=function(){var a=null;switch(b.domain){case "google.com":a=document.getElementById("Email");if(!a||a.className.includes("hidden"))a=document.getElementById("Passwd");break;case "amazon.com":a=document.getElementById("ap_email");break;case "facebook.com":(a=document.getElementById("email"))||
(a=document.getElementById("pass"));break;case "netflix.com":a=document.getElementsByName("email")[0],a.type.includes("hidden")&&(a=document.getElementsByName("password")[0])}return a},e=function(){switch(b.domain){case "facebook.com":LPFrame.openDialog("introTutorialHelp",{addHide:!1,modal:!0,textChoice:"loggingout"}).css({top:0,right:0,bottom:0,left:0,margin:"auto"});document.getElementById("userNavigationLabel").click();setTimeout(function(){document.getElementById("show_me_how_logout_1").submit()},
3E3);break;case "netflix.com":var a=document.URL;if(a.includes("logout")||a.includes("SignOut"))document.location="https://www.netflix.com/Login"}};(function(){var a=document.URL.toLowerCase();return(a.includes("login")||a.includes("facebook.com/?stype=lo")||a.includes("accounts.google.com/addsession")||a.includes("signin"))&&null!==d()})()?(bg.IntroTutorial.setState({firstLogin:!1}),(c.formSubmitted&&!c.formSucceeded?LPFrame.openDialog("introTutorialHelp",{addHide:!0,textChoice:"tryAgain",arrow:{orientation:"right",
position:"middle"}}):LPFrame.openDialog("introTutorialHelp",{addHide:!0,textChoice:"siteLanding",arrow:{orientation:"right",position:"middle"}})).trackElement({element:d(),frameTranslation:{x:"-100%",y:"-50%"},targetTranslation:{x:-10,y:"50%"}})):b.firstLogin&&e()});Topics.get(Topics.SITE_NOTIFICATION).subscribe(function(b){d(function(){setTimeout(function(){b.getInterface().LPDialog.openDialog("introTutorialHelp",{addHide:!0,modal:!0,siteName:c.defaultData.name,textChoice:"saveSite",parentDialog:"contentScriptSite",
css:{position:"absolute",top:"100%","margin-top":"10px","margin-right":0,right:0},arrow:{orientation:"top",positionTarget:"#submit"}})},1E3)})})})})();