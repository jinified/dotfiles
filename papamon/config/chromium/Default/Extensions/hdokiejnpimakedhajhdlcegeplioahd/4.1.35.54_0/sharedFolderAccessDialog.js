var SharedFolderAccessDialog=function(g){ContainerSelectionDialog.call(this,g);this.rightHeaderText=this.rightHeader=this.leftHeaderText=this.leftHeader=this.selectedAids=this.member=null};SharedFolderAccessDialog.prototype=Object.create(ContainerSelectionDialog.prototype);SharedFolderAccessDialog.prototype.constructor=SharedFolderAccessDialog;
(function(){SharedFolderAccessDialog.prototype.initialize=function(b){ContainerSelectionDialog.prototype.initialize.apply(this,arguments);this.leftHeader=b.find(".identityLeft .header");this.leftHeaderText=this.leftHeader.text();this.leftPlaceHolder=b.find(".availableSearch");this.leftPlaceHolderText=this.leftPlaceHolder.attr("placeholder");this.rightHeader=b.find(".identityRight .header");this.rightHeaderText=this.rightHeader.text();this.rightPlaceHolder=b.find(".selectedSearch");this.rightPlaceHolderText=
this.rightPlaceHolder.attr("placeholder");this.otherMembersElement=$("#sharedFolderAccessOtherUsers");(function(a){a.inputFields.hidebydefault.onChange(function(b){b?(a.leftHeader.text(a.rightHeaderText),a.leftPlaceHolder.attr("placeholder",a.rightPlaceHolderText),a.rightHeader.text(a.leftHeaderText),a.rightPlaceHolder.attr("placeholder",a.leftPlaceHolderText)):(a.leftHeader.text(a.leftHeaderText),a.leftPlaceHolder.attr("placeholder",a.leftPlaceHolderText),a.rightHeader.text(a.rightHeaderText),a.rightPlaceHolder.attr("placeholder",
a.rightPlaceHolderText))});a.inputFields.applyToOthers.onChange(function(b){b?a.otherMembersElement.show():a.otherMembersElement.hide()})})(this)};SharedFolderAccessDialog.prototype.setup=function(){ContainerSelectionDialog.prototype.setup.apply(this,arguments);for(var b=[],a=dialogs.sharedFolder.getDialog().containers.existingMembers.getItemChildren(),c=0,f=a.length;c<f;++c){var e=a[c];e!==this.member&&b.push(new SharedFolderAccessCheckbox(e))}0<b.length&&(this.containers.otherMembers=new Container(b,
{allowDrag:!1,searchInput:"sharedFolderAccessOtherUsersSearch",publishSelect:!1}),this.containers.otherMembers.initialize(document.getElementById("sharedFolderAccessOtherUsersContainer")))};var g=function(b){for(var a={},c=0,f=b.length;c<f;++c)a[b[c]]=!0;return a};SharedFolderAccessDialog.prototype.open=function(b,a){if(void 0===a){var c={shareid:b.getShareID()};b instanceof SharedFolderUser?c.uid=b.getID():c.cgid=b.getID();LPRequest.makeDataRequest(LPProxy.getSharedFolderRestrictions,{params:c,success:this.createDynamicHandler(function(a){this.open(b,
a)})})}else if(c=a.aids,this.member=b,this.selectedAids=g(c),this.member._sharedGroup.isDownloaded()){c=LPProxy.getItemsByShareID(this.member._sharedGroup.getID());this.restrictedItems=[];for(var f=[],e=0,h=a.restrictedItems.length;e<h;++e){var d=a.restrictedItems[e];d.aid=d.id;d=-1!==d.url.indexOf("http://sn")?new Note(d,this.member._sharedGroup,[]):new Account(d,this.member._sharedGroup);d._data.name=LPProxy.decryptMobile(d._data.name,!1,d.getKey());c.push(d);d=d instanceof Note?new NoteDisplay(d):
new AccountDisplay(d);f.push(d)}e=new GroupDisplay(this.member._sharedGroup,f);this.restrictedItems.push(e);LPProxy.assignItemsToGroups(this.restrictedItems);this.availableAids={};if(0===c.length)dialogs.alert.open({title:Strings.translateString("Edit Access"),text:Strings.translateString("Please add items to this folder before editing a member's access.")});else{e=0;for(h=c.length;e<h;++e)f=c[e].getID(),void 0===this.selectedAids[f]&&(this.availableAids[f]=!0);ContainerSelectionDialog.prototype.open.apply(this,
[{title:"Edit Access: "+b.toString(),defaultData:{hidebydefault:"1"===a.hidebydefault}}])}}else(function(a){dialogs.confirmation.open({title:Strings.translateString("Error"),text:Strings.translateString("Folder must be downloaded in order to edit a member's access. Would you like to download now?"),handler:function(){a._sharedFolderItem.startDownloading();Dialog.prototype.closeAllDialogs()}})})(this.member._sharedGroup)};SharedFolderAccessDialog.prototype.getAvailableItems=function(b){b={filter:this.availableAids};
b=LPProxy.getSites(b).concat(LPProxy.getNotes(b));return LPProxy.assignItemsToGroups(b,!1)};SharedFolderAccessDialog.prototype.getSelectedItems=function(b){return this.restrictedItems};var k=function(b){for(var a=[],c=0,f=b.length;c<f;++c)a.push(b[c].getID());return a.join(",")};SharedFolderAccessDialog.prototype.getData=function(b){var a=ContainerSelectionDialog.prototype.getData.apply(this,arguments);a.aids="";this.containers.selected&&(a.aids=k(this.containers.selected.getItemModelChildren()));
a.additionaluids="";a.applyToOthers&&this.containers.otherMembers&&(a.additionaluids=k(this.containers.otherMembers.getSelectedModelItems()));return a};SharedFolderAccessDialog.prototype.handleSubmit=function(b){LPRequest.makeRequest(LPProxy.updateSharedFolderRestrictions,{params:$.extend(b,{uid:this.member.getID(!0),shareid:this.member._sharedGroup.getID()})})}})();
