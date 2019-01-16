function openwin(htmurl) {
var newwin=window.open(htmurl,"Win","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=350");
newwin.focus();
return false;
}