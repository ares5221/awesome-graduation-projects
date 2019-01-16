function turnit(area)
{
    if (document.all[area].style.display == "")
        document.all[area].style.display = "none";
    else if (document.all[area].style.display == "none")
        document.all[area].style.display = "";
}



    function MM_preloadImages() { //v3.0
      var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
        var i,j=d.MM_p.length,bb=MM_preloadImages.arguments; for(i=0; i<bb.length; i++)
        if (bb[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=bb[i];}}
    }
    
    function MM_swapImgRestore() { //v3.0
      var i,x,bb=document.MM_sr; for(i=0;bb&&i<bb.length&&(x=bb[i])&&x.oSrc;i++) x.src=x.oSrc;
    }
    
    function MM_swapImage() { //v3.0
      var i,j=0,x,bb=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(bb.length-2);i+=3)
       if ((x=MM_findObj(bb[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=bb[i+2];}
    }
    function turnon(obj1,id){
    obj1.style.background=bgc_on[id];
    }
    function turnoff(obj1,id){
    obj1.style.background=bgc_off[id];
    }
    
    function MM_findObj(n, d) { //v4.01
      var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
        d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
      if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
      for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
      if(!x && d.getElementById) x=d.getElementById(n); return x;
    }
    
    function MM_showHideLayers() { //v6.0
      var i,p,v,obj,args=MM_showHideLayers.arguments;
      for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
        if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
        obj.visibility=v; }
    }