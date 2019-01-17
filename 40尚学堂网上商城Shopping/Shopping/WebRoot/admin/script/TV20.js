//========================================
//Envrionment to hold Listeners
//========================================
tv_listeners = new Array() ;
function listener( type , handler )   {
	this.type = type ;
	this.handler = handler ;
	this.id = tv_listeners.length ;
	tv_listeners[ tv_listeners.length ] = this ;
}

function addListener( type , handler )  {
    new listener( type , handler ) ;  
 }
//=== END =====

//=========================================
// Hold the top item
//=========================================
tv_topnodeitem = null ;
//===== END =======

//=========================================
//Hold nodeitems , and supply a nodeitem Register
//=========================================
nodeitems = new Array() ;
function nodeitemRegister( obj )   {
    nodeitems[ nodeitems.length ] = obj ;
	return nodeitems.length - 1 ;
}
//=== END =======

//=================================
//Custom a stack
//Class         : stack
//metheds    :  get()
//                    put( obj )
//=================================
function stack() {
    this.value = new Array() ;
	this.cursor = 0 ;
}

function stack_get()  {
     this.cursor = this.cursor - 1 ;
	 return this.value[ this.cursor ] ;
}

function stack_put( obj )   {
      this.value[ this.cursor ] = obj ;
      this.cursor = this.cursor + 1 ;
}

stack.prototype.get = stack_get ;
stack.prototype.put = stack_put ;
//=======END ==========

//=========================================
// Define a public stack
//=========================================
userstack = new stack() ;
//====== END ===========

//=========================================
//Image List
//=========================================
treeview_box_0_none = "images/4_clos.gif"  ;
treeview_box_0_line = "images/4_none.gif" ;
treeview_box_2_open = "images/2_open.gif" ;
treeview_box_2_none = "images/2_none.gif" ;
treeview_box_2_close = "images/2_clos.gif" ;
treeview_box_1_open = "images/3_open.gif" ;
treeview_box_1_none = "images/3_none.gif" ;
treeview_box_1_close = "images/3_clos.gif" ;

//===============================================
//Class : nodeitem
//status------------------------1:two-direction       0:nobox       0: disactivite
//                              2:three-0direction     1:close-box   1: activite
//                                                    2:open-box                    
//===============================================
function nodeitem( parentkey , key , lable , img )  {
    this.lable = lable ;
	this.key = key ;
    this.parent = findNode( parentkey ) ;
	if( this.parent != null )  {
	    aa = this.parent.status ;
	    if( aa.substring( 1 , 2 ) == "0" )
	        this.parent.status = aa.substring( 0 , 1 ) + "1" + aa.substring( 2 , 3 ) ;
	    if( this.parent.maxsubitem != null ) 
	        this.parent.maxsubitem.status = "2" + this.parent.maxsubitem.status.substring( 1 , 3 ) ;
        this.parent.subitems[ this.parent.subitems.length ] = this ;
        this.parent.maxsubitem = this ; 
    }
    else  {
	    if( tv_topnodeitem != null )   {
		     alert( "不能有两个顶项!" ) ;
			 return ;
        }
        tv_topnodeitem = this ;
    }
		 
	this.img = img ;
	this.tag = null ;
    this.status = "100" ;
	this.subitems = new Array() ;
	this.maxsubitem = null ;
    this.id = nodeitemRegister( this ) ;

	//**********************
	this.questionId = 0;
	this.description = "";
	//this.url = null;
	//**********************
	
	//added by msb for the sort and move up/down
	/*if ( this == tv_topnodeitem )
	{
		this.nodeIndex = 0;
	} else {
		this.nodeIndex = this.parent.subitems.length;
	}*/
	//end added

}

//added by msb for the sort and move up/down
function nodeitem_moveUp() {
	if (this == tv_topnodeitem) return; //topitem 

	ssubitems = this.parent.subitems;
	for ( i=0; i<ssubitems.length; i++ ) {
		if( ssubitems[i] == this ) {
			break;
		}
	}
	if (i==0) return;
	ssubitems[i] = ssubitems[i-1];
	ssubitems[i-1] = this;
	if (i==ssubitems.length-1) {
		ssubitems[i-1].status = "2" + ssubitems[i-1].status.substring(1, 3);
		ssubitems[i].status = "1" + ssubitems[i].status.substring(1, 3);
	}
	/*
	itemTemp = this;
	ssubitems[this.nodeIndex-1] */
/*	for ( i=0; i<ssubitems.length; i++ ) {
		if( ssubitems[i] != null && ssubitems[i].nodeIndex == (this.nodeIndex-1) )
			previousitem = ssubitems[i]
	}
	previousitem.nodeIndex = this.nodeIndex;
	this.nodeIndex = this.nodeIndex -1;
	swap(this,previousitem);
*/
	//label_on_click(this.id);
	this.parent.refresh();

	lable_on_click(this.id);
}//moveUp()

function nodeitem_moveDown() {
	if (this == tv_topnodeitem) return; //topitem
	
	ssubitems = this.parent.subitems;
	for ( i=0; i<ssubitems.length; i++ ) {
		if( ssubitems[i] == this ) {
			break;
		}
	}
	if (i==ssubitems.length-1) return;
	ssubitems[i] = ssubitems[i+1];
	ssubitems[i+1] = this;
	if (i==ssubitems.length-2) {
		ssubitems[i+1].status = "1" + ssubitems[i+1].status.substring(1, 3);
		ssubitems[i].status = "2" + ssubitems[i].status.substring(1, 3);
	}

	this.parent.refresh();
		
	lable_on_click(this.id);
}//moveDown()

/*function swap (item1, item2) {
	nodeitems[item1.id] = item2;
	nodeitems[item2.id] = item1;
	idTemp = item1.id;
	item1.id = item2.id;
	item2.id = idTemp;
}*/

//end added

function nodeitem_setTag( obj ) {
    this.tag = obj ;
}

function nodeitem_getTag() {
    return this.tag ;
}

function nodeitem_show()  {
	str = "<span id = 'preface" + this.id + "'><table border='0' cellspacing='0' cellpadding='0'><tr><td>" ;
    str_f = "" ;
    for( j = this.parent ; j != null ; j = j.parent )  {
	    if( j.status.substring( 0 , 1 ) == 1 )
		    str_f = "<img src = '" + treeview_box_0_none + "' align='absmiddle'>" + str_f ;
        else
		    str_f = "<img src = '" + treeview_box_0_line + "' align='absmiddle'>" + str_f ;
    }
    str = str + str_f ;
    str += "<img id = 'box" + this.id + "' nodeid = '" + this.id + "' src = '" ;
    switch( this.status.substring( 0 , 2 ) )   {
        case "10" : str += treeview_box_1_none ; break ;
        case "11" : str += treeview_box_1_close ; break ;
        case "12" : str += treeview_box_1_open ; break ;
        case "20" : str += treeview_box_2_none ; break ;
        case "21" : str += treeview_box_2_close ; break ;
        case "22" : str += treeview_box_2_open ; break ;
    }
    str += "' align='absmiddle' onclick='box_on_click(this)'>" ;
    if( this.img == "" )
	    str += this.img ;
    else
	    str += "<img src = '" + this.img + "' align='absmiddle' width='16' height='16'>" ;
    str += "</td><td><table border='0' cellspacing='1' cellpadding='1' style='font-size:9pt; color:#333333' id='lablePanel" + this.id + "'><tr><td ondblclick = 'lable_on_dblclick(" + this.id + ")' onclick='lable_on_click(" + this.id + ")' style='cursor:hand' id='f_lablePanel" + this.id + "' nowrap>" + this.lable + "</td></tr></table></td></tr></table>" ;  
	str += "</span><span id = 'tv_panel_" + this.id + "' style='display:" ;
	if( this.status.substring( 1 , 2 ) == '2' )
	   str += "" ;
	else
	   str += "none" ;
	 
    str += "'></span>" ;
	if( this.parent == null )  
  	   for(var i in document.all){
          if (document.all[i].tagName == "BODY")
          {
		      document.all[i].insertAdjacentHTML( "AfterBegin" , str ) ;
              break
          }
       }
	else   
	document.all( "tv_panel_" + this.parent.id ).insertAdjacentHTML( "BeforeEnd" , str ) ;
    for( m = 0 ; m < this.subitems.length ; m ++ ) 
	   if( this.subitems[ m ] != null )  {
		   userstack.put( m ) ;
		   this.subitems[ m ].show() ;
		   m = userstack.get() ;
    }
}

function nodeitem_refresh()  {
	str = "<table border='0' cellspacing='0' cellpadding='0'><tr><td>" ;
    str_f = "" ;
    for( j = this.parent ; j != null ; j = j.parent )  {
	    if( j.status.substring( 0 , 1 ) == 1 )
		   str_f = "<img src = '" + treeview_box_0_none + "' align='absmiddle'>" + str_f ;
        else
		   str_f = "<img src = '" + treeview_box_0_line + "' align='absmiddle'>" + str_f ;
    }
	str = str + str_f ;
    str += "<img id = 'box" + this.id + "' nodeid = '" + this.id + "' src = '" ;
    switch( this.status.substring( 0 , 2 ) )   {
	        case "10" : str += treeview_box_1_none ; break ;
	        case "11" : str += treeview_box_1_close ; break ;
	        case "12" : str += treeview_box_1_open ; break ;
	        case "20" : str += treeview_box_2_none ; break ;
	        case "21" : str += treeview_box_2_close ; break ;
	        case "22" : str += treeview_box_2_open ; break ;
    }
    str += "' align='absmiddle' onclick='box_on_click(this)'>" ;
    if( this.img == "" )
	    str += this.img ;
    else
	    str += "<img src = '" + this.img + "' align='absmiddle' width='16' height='16'>" ;
    str += "</td><td><table border='0' cellspacing='1' cellpadding='1' style='font-size:9pt; color:#333333' id='lablePanel" + this.id + "'><tr><td ondblclick = 'lable_on_dblclick(" + this.id + ")' onclick='lable_on_click(" + this.id + ")' style='cursor:hand' id='f_lablePanel" + this.id + "' nowrap>" + this.lable + "</td></tr></table></td></tr></table>" ;  
	document.all( "preface" + this.id ).innerHTML = str ;
    document.all( "tv_panel_" + this.id ).innerHTML = "" ;
	for( m = 0 ; m < this.subitems.length ; m ++ )
	   if( this.subitems[ m ] != null )  {
		   userstack.put( m ) ;
		   this.subitems[ m ].show() ;
		   m = userstack.get() ;
       }
}
function nodeitem_remove()  {
    pparent = this.parent ;
	if( pparent == null )   {
        removenodeitem( this.id ) ;
   	    for(var i in document.all){
           if (document.all[i].tagName == "BODY")
             {
			   document.all[i].innerHTML = "" ;
               break
             }
          }
		return ;
	}
	lastsubitem = null ;
	for( i = 0 ; i < pparent.subitems.length ; i ++ )
	   if( pparent.subitems[ i ] != null )  
		   if ( pparent.subitems[ i ] == this ) 
		       pparent.subitems[ i ] = null ;
           else
		       lastsubitem = pparent.subitems[ i ] ;

    pparent.maxsubitem = lastsubitem ; 
	if( lastsubitem == null )   
        pparent.status = pparent.status.substring( 0 , 1 ) + "0" + pparent.status.substring( 2 , 3 ) ;
    else   
	    pparent.maxsubitem.status = "1" + pparent.maxsubitem.status.substring( 1 , 3 ) ;
     removenodeitem( this.id ) ;

	//added by msb for move up/down
	arrTemp = new Array();
	j = 0;
	for ( i=0; i<pparent.subitems.length; i++ ) {
		if ( pparent.subitems[i] != null ) {
			arrTemp[j] = pparent.subitems[i];
			j++;
		}
	}
	this.parent.subitems = arrTemp;
	//end added

	 pparent.refresh() ;
	 //tv_topnodeitem.refresh() ;
}

function removenodeitem( id )   {
    curitem = nodeitems[ id ] ;
	nodeitems[ id ] = null ;
	for( m = 0 ; m < curitem.subitems.length ; m ++ ) 
	     if( curitem.subitems[ m ] != null )   {
		   userstack.put( m ) ;
		   removenodeitem( curitem.subitems[ m ].id ) ;
		   m = userstack.get() ;
       }
}

function nodeitem_boxclick()  {
     if( this.status.substring( 1 ,2 ) == "0" )
       return ; 
	 if( this.status.substring( 1 ,2 ) == "1" )   
        this.open() ;
	 else  
        this.close() ;
}

function nodeitem_close()  {
     this.status = this.status.substring( 0 , 1 ) + "1" + this.status.substring( 2 , 3 ) ;
   	 document.all( "tv_panel_" + this.id ).style.display = "none" ;
   	 eval( "document.all( 'box' + this.id ).src = treeview_box_" + this.status.substring( 0 , 1 ) +"_close" ) ;
}

function nodeitem_open()  {
     this.status = this.status.substring( 0 , 1 ) + "2" + this.status.substring( 2 , 3 ) ;
   	 document.all( "tv_panel_" + this.id ).style.display = "" ;
   	 eval( "document.all( 'box' + this.id ).src = treeview_box_" + this.status.substring( 0 , 1 ) +"_open" ) ;
}

//added by msb for the move up/down
nodeitem.prototype.moveUp = nodeitem_moveUp;
nodeitem.prototype.moveDown = nodeitem_moveDown;
//end added

nodeitem.prototype.show = nodeitem_show ;
nodeitem.prototype.refresh = nodeitem_refresh ;
nodeitem.prototype.boxclick = nodeitem_boxclick ;
nodeitem.prototype.close = nodeitem_close ;
nodeitem.prototype.open = nodeitem_open ;
nodeitem.prototype.remove = nodeitem_remove ;
nodeitem.prototype.setTag = nodeitem_setTag ;
nodeitem.prototype.getTag = nodeitem_getTag ;

//==========================================================
// Public Methods
//==========================================================
function showTV()  {
     tv_topnodeitem.show() ;
}

function findNode( key )   {
	pppp = null;
    for( i = 0 ; i < nodeitems.length ; i ++ ) {
	   if( nodeitems[ i ] != null ) {
	      if( nodeitems[ i ].key == key ) {
	         pppp = nodeitems[ i ] ;
		  }
	   }
	}
    return pppp ;
}

function addNode(  parentkey , key , lable , img  )   {
    return new nodeitem( parentkey , key , lable , img ) ;
}

function deleteNode(  key )   {
    curNode = findNode( key ) ;
	if( curNode == null )
	  return false ;
    curNode.remove() ; 
    return true ;
}
//====== END ================

//===========================================================
// Events
//===========================================================
function box_on_click( obj )  {
    nodeitems[ obj.nodeid ].boxclick() ;
}

tv_curlable = null ;
tv_curlable_f = null ;

function lable_on_click( id )  {
       key = nodeitems[ id ].key ;
       if( nodeitems[ id ].parent == null )
	      parentkey = "" ;
       else
	      parentkey = nodeitems[ id ].parent.key ;
	      	   
	   if( tv_curlable != null )  {
		   tv_curlable.bgColor = "transparent" ;
		   tv_curlable.style.color = "#333333" ;
		   tv_curlable_f.bgColor = "transparent" ;
       }
	       tv_curlable = document.all("lablePanel"+id) ;
		   tv_curlable.bgColor = "#000000" ;
		   tv_curlable.style.color = "#FFFFFF" ;
	       tv_curlable_f = document.all("f_lablePanel"+id) ;
		   tv_curlable_f.bgColor = "#888888" ;

	   for( i = 0 ; i < tv_listeners.length ; i ++ )  
	      if( tv_listeners[ i ].type == "click" )  {
			   h = tv_listeners[ i ].handler ;
			   eval( h + "( '" + key + "' , '" + parentkey + "' ) ; " ) ; 
           }

}

function lable_on_dblclick( id ) {
		key = nodeitems[ id ].key ;
       if( nodeitems[ id ].parent == null )
	      parentkey = "" ;
       else
	      parentkey = nodeitems[ id ].parent.key ;
          
	   if( tv_curlable != null )  {
		   tv_curlable.bgColor = "transparent" ;
		   tv_curlable.style.color = "#333333" ;
		   tv_curlable_f.bgColor = "transparent" ;
       }
	       tv_curlable = document.all("lablePanel"+id) ;
		   tv_curlable.bgColor = "#000000" ;
		   tv_curlable.style.color = "#FFFFFF" ;
	       tv_curlable_f = document.all("f_lablePanel"+id) ;
		   tv_curlable_f.bgColor = "#888888" ;
	   for( i = 0 ; i < tv_listeners.length ; i ++ )  
	      if( tv_listeners[ i ].type == "dblclick" )  {
			   h = tv_listeners[ i ].handler ;
			   eval( h + "( '" + key + "' , '" + parentkey + "' ) ; " ) ; 
           }
}