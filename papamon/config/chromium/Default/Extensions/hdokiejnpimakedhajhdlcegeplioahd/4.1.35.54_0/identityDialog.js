var IdentityDialog=function(c){ContainerSelectionDialog.call(this,c)};IdentityDialog.prototype=Object.create(ContainerSelectionDialog.prototype);IdentityDialog.prototype.constructor=IdentityDialog;
(function(){IdentityDialog.prototype.open=function(a){a=a||{};a.title=a.vaultItem?"Edit Identity":"Add Identity";ContainerSelectionDialog.prototype.open.call(this,a)};var c=function(a){var b=LPProxy.getSites(a).concat(LPProxy.getNotes(a)),b=LPProxy.assignItemsToGroups(b,!1);a=LPProxy.getFormFills(a);0<a.length&&b.push(new GroupDisplay(new DummyGroup(Strings.translateString("Form Fills")),a));return b};IdentityDialog.prototype.getAvailableItems=function(a){return c({identity:a.vaultItem,invertIdentity:!0})};
IdentityDialog.prototype.getSelectedItems=function(a){return a.vaultItem?c({identity:a.vaultItem}):[]};IdentityDialog.prototype.getData=function(a){var b=ContainerSelectionDialog.prototype.getData.apply(this,arguments);if(null!==this.containers.selected){for(var c=this.containers.selected.getItemModelChildren(),f=[],g=[],h=[],e=0,k=c.length;e<k;++e){var d=c[e];d instanceof FormFill?h.push(d.getID()):d instanceof Application?g.push(d.getID()):f.push(d.getID())}b.aids=f.join(",");b.appaids=g.join(",");
b.ffids=h.join(",")}return b};IdentityDialog.prototype.add=function(a){(new Identity).addFromDialog(a)};IdentityDialog.prototype.validate=function(a){var b=ContainerSelectionDialog.prototype.validate.apply(this,arguments);a.deciname||(this.addError("deciname","Name is required."),b=!1);return b}})();
