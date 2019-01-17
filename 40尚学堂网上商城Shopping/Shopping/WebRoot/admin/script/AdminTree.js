var isIE = true;
var imgUp = "images/arrowUp.gif" ;
var imgDn = "images/arrowDn.gif" ;
function expandIt( head, fExpandOnly )
{
//alert(!fExpandOnly);
	var bulletImg ;
	var allCol = "document." + ( isIE ? "all." : "" ) + head ;
	var parentDiv = eval( allCol + "Parent" );
	var childDiv  = eval( allCol + "Child" );
	if ( isIE )
	{
		if ( parentDiv )
			bulletImg = parentDiv.children( 0 ).children( 'imEx' );
		if ( childDiv )
		{
			if ( childDiv.style.display == "block" && (!fExpandOnly) )
			{
				childDiv.style.display	= "none" ;
				if ( bulletImg )
					bulletImg.src = imgUp ;
			}
			else
			{
				childDiv.style.display	= "block" ;
				if ( bulletImg )
					bulletImg.src = imgDn ;
			}
		}
	}
	else
	{
		if ( parentDiv )
			bulletImg = parentDiv.document.images[ 'imEx' ];
		if ( childDiv )
		{
			if ( childDiv.visibility == "hide" )
			{
				childDiv.visibility = "show" ;
				if ( bulletImg )
					bulletImg.src = imgDn ;
			}
			else if ( ! fExpandOnly ) 
			{
				childDiv.visibility = "hide";
				if ( bulletImg )
					bulletImg.src = imgUp ;
			}
		}
	}
	return false ;	// cancels event
}

function doClick ( )
{
	el = event.srcElement;
	while ( el && el.tagName != "A" ) 
	{
		el = el.parentElement ;
	}
	if ( ! el ) return ;
	if ( el.target != "main" ) return ;
	hiliteSel( el );	
}
var prevSel = null ;
function hiliteSel ( selLink )
{
	var selColor = "red" ;
	if ( prevSel )
	{
		prevSel.style.color = prevSel.prevColor ;
	}
	prevSel = selLink ;
	prevSel.prevColor = selLink.style.color ;
	selLink.style.color = selColor ;
}

function init() {
  document.onclick = doClick ;
  expandIt("head2");
  //hiliteSel(ttt);
//  parent.frames("Main").location.href = "/gtc/programMgr.html";
}

if ( screen.colorDepth > 8 )
{
//	document.write( "<STYLE>BODY{background-image:url(/images/ai/tile_nav.jpg);}</STYLE>" );
}
var licenseID ='01-0006-0038-69648' ;
var pendingChanges =false ;


