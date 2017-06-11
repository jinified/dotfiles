LPServer.sharing=LPServer.sharing||{};
LPServer.sharing.folder=function(){var e=function(a,b){b.success(a,{sharedFolder:b.params.sharedFolder,shareInfo:b.params.shareInfo})},q=function(a,b,c){if(0<b.length){a.adminuidcnt=b.length;for(var d=0,f=b.length;d<f;++d){var p=b[d],g=new LPServer.ext.RSAKey;LPServer.ext.parsePublicKey(g,p.key);a["adminsharekey"+d]=g.encrypt(LPServer.ext.bin2hex(c));a["adminuid"+d]=p.uid}}},n=function(){var a=function(c,b){if(c.success){for(var d={},a=0;void 0!==c["pubkey"+a];)d[c["username"+a]]={uid:c["uid"+a],
cgid:c["cgid"+a],pubkey:c["pubkey"+a]},++a;a=[];if(c.groupname)for(var g=c.groupname.split(","),l=0,m=g.length;l<m;++l)a.push(g[l]);0<a.length&&LPServer.callback(b,"emptyGroups",a);b.success(d)}else b.error()},b={nouser:function(b,a){a.error&&a.error("");LPServer.callback(a,"invite",{emails:b.unknownusers.split(",")})},"default":a,emptygroup:a,noshareerr:function(b,a){a.error(LPServer.ext.translate("Sorry, company policy prohibits use of this feature."))}};return function(c){LPServer.jsonRequest({url:"share.php",
data:{getpubkey:1,uid:"string"===typeof c.params.userInfo?c.params.userInfo:JSON.stringify(c.params.userInfo),jsonr:1},callbacks:b,userSupplied:c})}}(),t=function(){var a=function(b,c){var a=new LPServer.ext.RSAKey;LPServer.ext.parsePublicKey(a,c);return a.encrypt(LPServer.ext.bin2hex(b))},b=function(b,c){for(var a in c){var d=c[a];if("group"===d.type&&b.cgid===d.uid)return a}return null},c=function(c,f){var d={id:f.params.shareInfo.id,update:1,add:1,sharename:f.params.shareInfo.sharename,name:f.params.shareInfo.name,
readonly:f.params.readonly?1:0,give:f.params.hidePasswords?0:1,notify:f.params.notify?1:0,canadminister:f.params.can_administer?1:0,xmlr:1},g=0,l=0,m=[],h={},k;for(k in c){var e=c[k];e.pubkey?(d["sharekey"+g]=a(f.params.shareInfo.key,e.pubkey),d["uid"+g]=e.uid,d["cgid"+g]=e.cgid,++g):(d["msfuser"+l]=e.uid,d["msfcgid"+l]=e.cgid,m.push(k),++l);h[b(e,f.params.newMembers)||k]=!0}0<g+l?LPServer.xmlRequest({url:"share.php",data:d,callbacks:{useradded:function(b,c){0<m.length&&LPServer.callback(c,"noSharingKeyUsers",
m);c.success(LPServer.ext.translate("%1 users/groups were invited.",Object.keys(h).length),h)}},userSupplied:f}):f.error()};return function(b){n(LPServer.extend({},b,{params:{userInfo:b.params.newMembers},success:function(a){c(a,b)}}))}}(),u=function(){var a={ok:function(b,a){var c=LPServer.getAttr(b,"id");a.params.sharedFolder.aid=c;a.params.shareInfo.id=c;a.params.shareInfo.shareid=c;a.params.shareInfo.uid=LPServer.getAttr(b,"uid");e(LPServer.ext.translate("Shared Folder %1 created.",a.params.sharedFolder.group),
a)},exceededlimit:function(b,a){a.error(LPServer.ext.translate("Sorry, as a LastPass Premium user, you are limited to one Shared Folder. Please consider using LastPass Enterprise if you would like more."))},premiumrequired:function(b,a){a.error(LPServer.ext.translate("Sorry, LastPass Premium is required to create a Shared Family Folder"))},alreadyexists:function(b,a){a.error(LPServer.ext.translate("That group already exists."))}},b=function(b,d){var c={};c[d.params.username]={uid:d.params.uid,type:"companyuser"};
d.params.superusers=b;n(LPServer.extend({},d,{params:{userInfo:c},success:function(b){if(b=b[d.params.username].pubkey){var c=d.params.sharedFolder,e=d.params.shareInfo=d.params.shareInfo||{},f={id:0,update:1,newusername:d.params.username+"-"+c.group,name:0===c.group.indexOf("Shared-")?c.group.substring(7):c.group,xmlr:1},h=LPServer.ext.makeRandomPassword(),k=e.key=LPServer.ext.makeKey(f.newusername,h,5E3);f.newhash=LPServer.ext.makeHash(k,h,5E3);h=new LPServer.ext.RSAKey;LPServer.ext.parsePublicKey(h,
b);f.sharekey=e.sharekey=h.encrypt(LPServer.ext.bin2hex(k));f.sharename=e.sharename=LPServer.ext.encryptCBC(c.group,k);q(f,d.params.superusers,k);LPServer.xmlRequest({url:"share.php",data:f,callbacks:a,userSupplied:d})}else LPServer.callback(d,"sharingkeyrequired"),d.error&&d.error("")}}))};return function(a){LPServer.jsonRequest({url:"getSuperUserInfo.php",success:b,userSupplied:a})}}(),v=function(){var a={ok:function(b,a){e(LPServer.ext.translate("Shared Folder %1 was renamed.",a.params.shareInfo.name),
a)}};return function(b){b.params.shareInfo.name=b.params.sharedFolder.group.substring(7);b.params.shareInfo.sharename=LPServer.ext.encryptCBC(b.params.sharedFolder.group,b.params.shareInfo.key);LPServer.xmlRequest({url:"share.php",data:{update:1,rename:1,id:b.params.shareInfo.id,name:b.params.shareInfo.name,sharename:b.params.shareInfo.sharename,xmlr:1},callbacks:a,userSupplied:b})}}(),w=function(){var a=function(b,a){a.params.shareInfo.deleted="1";e(LPServer.ext.translate("Shared Folder deleted."),
a)};return function(b){LPServer.xmlRequest({url:"share.php",data:{id:b.params.shareInfo.id,"delete":1,xmlr:1},callbacks:{deleted:a},userSupplied:b})}}(),x=function(){var a=function(b,a){a.success(LPServer.ext.translate("Member removed."))};return function(b){var c={id:b.params.shareid,xmlr:1};b.params.msfuser?(c.msfdelete=1,c.msfuser=b.params.uid):(c.update=1,c["delete"]=1,c.uid=b.params.uid);LPServer.xmlRequest({url:"share.php",data:c,callbacks:{ok:a},userSupplied:b})}}(),y=function(){var a=function(b,
a){a.success(LPServer.ext.translate("Permissions saved."))};return function(b){LPServer.xmlRequest({url:"editSharedFolderUsers.php",data:{cmd:"edit",xml:1,shareid:b.params.shareInfo.id,request:JSON.stringify(b.params.updatedPermissions)},callbacks:{ok:a},userSupplied:b})}}(),r=function(a,b,c){var d={id:b.params.shareInfo.id,xmlr:1};d[a]=1;LPServer.xmlRequest({url:"share.php",data:d,callbacks:c,userSupplied:b})},z=function(){var a=function(a,c){c.params.shareInfo.download="1";e(LPServer.ext.translate("Shared Folder will now be downloaded."),
c)};return function(b){r("startdownloading",b,{ok:a})}}(),A=function(){var a=function(a,c){c.params.shareInfo.download="0";e(LPServer.ext.translate("Shared Folder will no longer be downloaded."),c)};return function(b){r("stopdownloading",b,{ok:a})}}(),B=function(){var a={undeleted:function(a,c){c.params.shareInfo.deleted="0";e(LPServer.ext.translate("Shared Folder restored."),c)}};return function(b){LPServer.xmlRequest({url:"share.php",data:{id:b.params.shareInfo.id,undelete:1,xmlr:1},callbacks:a,
userSupplied:b})}}(),C=function(){var a={purged:function(a,c){c.success(LPServer.ext.translate("Shared Folder purged."))}};return function(b){LPServer.xmlRequest({url:"share.php",data:{id:b.params.shareInfo.id,purge:1,xmlr:1},callbacks:a,userSupplied:b})}}(),D=function(){var a=function(a,c){c.success(a.folders)};return function(b){LPServer.jsonRequest({url:"getSharedFolderInfo.php",success:a,userSupplied:b})}}(),E=function(){var a={success:function(a,c){c.params.shareInfo.accepted="1";e(LPServer.ext.translate("Shared Folder accepted."),
c)}};return function(b){LPServer.jsonRequest({url:"share.php",data:{folder:b.params.shareInfo.id,acceptfolder:1,jsonr:1},callbacks:a,userSupplied:b})}}(),F=function(){var a={success:function(a,c){c.success(LPServer.ext.translate("Shared Folder rejected."))}};return function(b){LPServer.jsonRequest({url:"share.php",data:{id:b.params.shareInfo.id,rejectfolder:1,jsonr:1},callbacks:a,userSupplied:b})}}(),G=function(){var a={success:function(a,c){c.success(LPServer.ext.translate("Shared Folder member reinvited."))}};
return function(b){var c={reinvite:1,invitee:b.params.uid,folder:b.params.shareid,jsonr:1};"1"===b.params.ent&&(c.ent="on");LPServer.jsonRequest({url:"share.php",data:c,callbacks:a,userSupplied:b})}}(),H=function(){var a={success:function(a,b){b.params.shareInfo.cid=LPServer.getAttr(a,"cid");b.params.shareInfo.outside_enterprise=LPServer.getAttr(a,"outside_enterprise");e(LPServer.ext.translate("Personal Shared Folder moved into Enterprise. You can now adminster the folder."),b)}},b=function(b,d){var c=
{id:d.params.shareInfo.id,moveintoenterprise:1,xmlr:1};q(c,b,d.params.shareInfo.key);LPServer.xmlRequest({url:"share.php",data:c,callbacks:a,userSupplied:d})};return function(a){LPServer.jsonRequest({url:"getSuperUserInfo.php",success:b,userSupplied:a})}}();return{SHARED_FOLDER_NAME_PREFIX:"Shared-",getFolders:D,getPublicKeys:n,create:u,rename:v,remove:w,accept:E,reject:F,addMembers:t,getMembers:function(a){LPServer.jsonRequest({url:"getSharedFolderMembers.php",data:{shareid:a.params.shareid},userSupplied:a})},
removeMember:x,reinviteMember:G,updateMemberPermissions:y,getRestrictions:function(a){LPServer.jsonRequest({url:"getSharedFolderRestrictions.php",data:a.params,userSupplied:a})},updateRestrictions:function(a){LPServer.textRequest({url:"share.php",data:{id:a.params.shareid,edit:1,limit:1,aids:a.params.aids,numaids:0<a.params.aids.length?a.params.aids.split(",").length:0,additionaluids:a.params.additionaluids,hidebydefault:a.params.hidebydefault?1:0,uid:a.params.uid,xmlr:1},success:function(){a.success(LPServer.ext.translate("Access restrictions updated."))},
userSupplied:a})},startDownloading:z,stopDownloading:A,restoreDeleted:B,purgeDeleted:C,convertToEnterprise:H}}();