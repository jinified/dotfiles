var NotificationDialog=function(a){Dialog.call(this,a,{additionalHeaderClasses:["icon","leftIcon"],dynamicHeight:!0,responsive:!1,closeButtonEnabled:!0,buttonsInsideContent:!0})};NotificationDialog.prototype=Object.create(Dialog.prototype);NotificationDialog.prototype.constructor=NotificationDialog;
NotificationDialog.prototype.setupButtons=function(){(function(a){$("#notificationDialogFeedback").bind("click",function(){bg.openURL(bg.get("base_url")+"feedback.php");a.close()});$("#notificationDialogTryAgain").bind("click",function(){ExtensionDropdown.open();a.close()});$("#notificationDialogClose").bind("click",function(){a.close()});$("#notificationDialogDisableMulti").bind("click",function(){bg.openURL(bg.get("base_url")+a.notification.multifactor_disable_url);a.close()});$("#notificationDialogCreateAccount").bind("click",
function(){bg.LPPlatform.openTabDialog("createAccountSimple");a.close(!0)});$("#notificationDialogStartTrial").bind("click",function(){bg.start_trial();a.close()})})(this)};
NotificationDialog.prototype.setup=function(a,c){LPFeatures.updateFeatures({multifactor_disable:!0});if(c.notification){LPTools.setContent($("#notificationDialogMessage"),c.notification.msg);var b=[];c.notification.showFeedback&&b.push("feedback");c.notification.showLogin&&b.push("tryAgain");c.notification.showCreateAccount&&b.push("createAccount");c.notification.multifactor_disable_url&&b.push("multifactor");c.notification.showStartTrial&&b.push("trial");0===b.length&&b.push("default");this.dialogContent.children().first().attr("class",
b.join(" "))}Dialog.prototype.setup.apply(this,arguments)};NotificationDialog.prototype.handleSubmit=function(){this.close()};
