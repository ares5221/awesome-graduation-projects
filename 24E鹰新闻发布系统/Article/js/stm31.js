// Ver: 4.1
var nOP=0,nOP5=0,nIE=0,nIE4=0,nIE5=0,nNN=0,nNN4=0,nNN6=0,nMAC=0,nIEM=0,nIEW=0,nDM=0,nVER=0.0,st_delb=0,st_addb=0,st_reg=1;stnav();var st_ttb=nIE||nOP&&(nVER>=6&&nVER<7);
var stT2P=["static","absolute","absolute"],stHAL=["left","center","right"],stVAL=["top","middle","bottom"],stREP=["no-repeat","repeat-x","repeat-y","repeat"],stBDS=["none","solid","double","dotted","dashed","groove","ridge"];
var st_max=10,st_ht="",st_gc=0,st_rl=null,st_cl,st_ct,st_cw,st_ch,st_cm=0,st_cp,st_ci,st_ri=/Stm([0-9]*)p([0-9]*)i([0-9]*)e/,st_rp=/Stm([0-9]*)p([0-9]*)i/,st_ims=[],st_ms=[],st_load=0,st_scr=null;
var st_rsp=new RegExp(" +");
if(nNN4){stitovn=stevfn('stitov',1);stitoun=stevfn('stitou',1);stitckn=stevfn('stitck',1);stppovn=stevfn('stppov',0);stppoun=stevfn('stppou',0);}
if(nIE4||nNN4)window.onerror=function(m,u,l){return !confirm("Java Script Error\n"+"\nDescription:"+m+"\nSource:"+u+"\nLine:"+l+"\n\nSee more details?");}
if(nDM)window.onload=st_onload;
if(nIEM||nOP5)window.onunload=function(){if(st_rl){clearInterval(st_rl);st_rl=null;}return true;}
if(typeof(st_js)=='undefined'){
if(nDM&&!nNN4)
{
	var s="<STYLE>\n.st_tbcss,.st_tdcss,.st_divcss,.st_ftcss{border:none;padding:0px;margin:0px;}\n</STYLE>";
	for(var i=0;i<st_max;i++)
		s+="<FONT ID=st_gl"+i+"></FONT>";
	if(nIEW&&nVER>=5.0&&document.body)
		document.body.insertAdjacentHTML("AfterBegin",s);
	else
		document.write(s);
}st_js=1;}
function stm_bm(a)
{
	st_ms[st_cm]=
	{
		ps:[],
		mei:st_cm,
		ids:"Stm"+st_cm+"p",
		hdid:null,
		cked:0,
		tfrm:window,
		sfrm:window,
		mcff:"",
		mcfd:0,
		mcfx:0,
		mcfy:0,
		mnam:a[0],
		mver:a[1],
		mweb:a[2],
		mbnk:stbuf(a[2]+a[3]),
		mtyp:a[4],
		mcox:a[5],
		mcoy:a[6],
		maln:stHAL[a[7]],
		mcks:a[8],
		msdv:a[9],
		msdh:a[10],
		mhdd:nNN4?Math.max(100,a[11]):a[11],
		mhds:a[12],
		mhdo:a[13],
		mhdi:a[14],
		args:a.slice(0)
	};
}
function stm_bp(l,a)
{
	var op=st_cp;var oi=st_ci;st_cp=st_ms[st_cm].ps.length;st_ci=0;
	var m=st_ms[st_cm];
	m.ps[st_cp]=
	{
	is:[],
	mei:st_cm,
	ppi:st_cp,
	ids:"Stm"+st_cm+"p"+st_cp+"i",
	par:(st_cp?[st_cm,op,oi]:null),
	tmid:null,
	citi:-1,
	issh:0,
	isst:!st_cp&&m.mtyp==0,
	isck:!st_cp&&m.mcks,
	exed:0,
	pver:a[0],
	pdir:a[1],
	poffx:a[2],
	poffy:a[3],
	pspc:a[4],
	ppad:a[5],
	plmw:a[6],
	prmw:a[7],
	popc:a[8],
	pesh:a[9]?a[9]:"Normal",
	pesi:a[10],
	pehd:a[11]?a[11]:"Normal",
	pehi:a[12],
	pesp:a[13],
	pstp:a[14],
	psds:nIEW?a[15]:0,
	pscl:a[16],
	pbgc:a[17],
	pbgi:stbuf(stgsrc(a[18],m,0)),
	pbgr:stREP[a[19]],
	pbds:stBDS[a[20]],
	ipbw:a[21],
	pbdc:(!nDM||nNN4)?a[22].split(st_rsp)[0]:a[22],
	args:a.slice(0)
	};
	var p=m.ps[st_cp];
	if(st_cp)	stgpar(p).sub=[st_cm,st_cp];
	p.zind=!st_cp?1000:stgpar(stgpar(p)).zind+10;
	p.pbgd=stgbg(p.pbgc,p.pbgi,p.pbgr);
	if(nIEW&&nVER>=5.5)
	{
		p.efsh=p.pesh=="Normal"?"stnm":"stft";
		p.efhd=p.pehd=="Normal"?"stnm":"stft";
	}
	else if(nIEW&&(nVER>=5.0||nVER>=4.0&&!p.isst))
	{
		p.efsh=p.pesi>=0?"stft":"stnm";
		p.efhd=p.pehi>=0?"stft":"stnm";
	}
	else
		p.efsh=p.efhd="stnm";
	eval(l+"=p;");
}
function stm_bpx(l,r,a)
{
	var p=eval(r);
	stm_bp(l,a.concat(p.args.slice(a.length)));
}
function stm_ai(l,a)
{
	st_ci=st_ms[st_cm].ps[st_cp].is.length;
	var m=st_ms[st_cm];
	var p=m.ps[st_cp];
	if(a[0]==6)
		p.is[st_ci]=
		{
		ssiz:a[1],
		ibgc:[a[2]],
		simg:stbuf(stgsrc(a[3],m,1)),
		simw:a[4],
		simh:a[5],
		simb:a[6],
		args:a.slice(0)
		};
	else
		p.is[st_ci]=
		{
		itex:a[0]?a[1]:a[1].replace(new RegExp(" ","g"),nMAC?"&#160;":"&nbsp;"),
		iimg:[stbuf(stgsrc(a[2],m,0)),stbuf(stgsrc(a[3],m,0))],
		iimw:a[4],
		iimh:a[5],
		iimb:a[6],
		iurl:a[7],
		itgt:a[8],
		istt:a[9],
		itip:a[10],
		iicn:[stbuf(stgsrc(a[11],m,1)),stbuf(stgsrc(a[12],m,1))],
		iicw:a[13],
		iich:a[14],
		iicb:a[15],
		iarr:[stbuf(stgsrc(a[16],m,1)),stbuf(stgsrc(a[17],m,1))],
		iarw:a[18],
		iarh:a[19],
		iarb:a[20],
		ihal:stHAL[a[21]],
		ival:stVAL[a[22]],
		ibgc:nOP5&&nVER<7.0&&a[24]&&a[26]?["transparent","transparent"]:[nOP5&&nVER<7.0||!a[24]?a[23]:"transparent",nOP5&&nVER<7.0||!a[26]?a[25]:"transparent"],
		ibgi:[stbuf(stgsrc(a[27],m,0)),stbuf(stgsrc(a[28],m,0))],
		ibgr:[stREP[a[29]],stREP[a[30]]],
		ibds:stBDS[a[31]],
		ipbw:a[32],
		ibdc:(!nDM||nNN4)?[a[33].split(st_rsp)[0],a[34].split(st_rsp)[0]]:[a[33],a[34]],
		itxc:[a[35],a[36]],
		itxf:[a[37],a[38]],
		itxd:[stgdec(a[39]),stgdec(a[40])],
		args:a.slice(0)
		};
	var it=st_ms[st_cm].ps[st_cp].is[st_ci];
	it.ityp=a[0];
	it.mei=st_cm;
	it.ppi=st_cp;
	it.iti=st_ci;
	it.ids=p.ids+st_ci+"e";
	it.sub=null;
	it.tmid=null;
	if(it.ityp!=6)
		it.ibgd=[stgbg(it.ibgc[0],it.ibgi[0],it.ibgr[0]),stgbg(it.ibgc[1],it.ibgi[1],it.ibgr[1])];
	eval(l+"=it;");
}
function stm_aix(l,r,a)
{
	var i=eval(r);
	stm_ai(l,a.concat(i.args.slice(a.length)));
}
function stm_ep()
{
	var m=st_ms[st_cm];
	var p=m.ps[st_cp];
	var i=stgpar(p);
	if(i)
	{
		st_cm=i.mei;
		st_cp=i.ppi;
		st_ci=i.iti;
	}
	if(p.is.length==0)
	{
		m.ps.length--;
		if(i)
			i.sub=null;
	}
}
function stm_em()
{
	var m=st_ms[st_cm];
	if(m.ps.length==0)
	{
		st_ms.length--;
		return;
	}
	var mh="";
	var mc="<STYLE TYPE='text/css'>\n";
	var l=nDM?m.ps.length:1;
	for(var ppi=0;ppi<l;ppi++)
	{
		var p=m.ps[ppi];
		var ph=stpbtx(p);
		if(p.isst&&m.maln!="left")
			ph="<TABLE STYLE='border:none;padding:0px;' CELLPADDING=0 CELLSPACING=0 ALIGN="+m.maln+"><TD class=st_tdcss>"+ph;
		for(var iti=0;iti<p.is.length;iti++)
		{
			var i=p.is[iti];
			var ih="";
			ih+=p.pver ? "<TR ID="+i.ids+"TR>" : "";
			ih+=stittx(i);
			ih+=(p.pver ? "</TR>" : "");
			ph+=ih;
			if(i.ityp!=6)
			{
				mc+="."+i.ids+"TX0{"+sttcss(i,0)+"}\n";
				mc+="."+i.ids+"TX1{"+sttcss(i,1)+"}\n";
			}
		}
		ph+=stpetx(p);
		if(p.isst&&m.maln!="left")
			ph+="</TD></TABLE>";
		if(p.isst||nNN4||!nDM)
			mh+=ph;
		else
			st_ht+=ph;
	}
	mc+="</STYLE>";
	if(!nDM||nNN4)
		document.write(mc);
	if(mh)
		document.write(mh);
	if(nDM&&!(nIEM||(nIEW&&nVER<5.0)))
	{
		if(st_ht)
		{
			var o=stgobj('st_gl'+st_gc,'font');
			if(nNN6)
				o.innerHTML=st_ht;
			else if(nIE&&nVER>=5.0)
				o.insertAdjacentHTML("BeforeEnd",st_ht);
			else
				o.document.write(st_ht);
			st_gc++;
			st_ht='';
		}
		if(!nOP&&!nNN)
			stpre(m);
	}
	st_cm++;st_cp=0;st_ci=0;
}
function stpbtx(p)
{
	var s="";
	if(nNN4||!nDM)
	{
		s+=p.isst?"<ILAYER":"<LAYER";
		s+=" VISIBILITY=hide";
		s+=" ID="+p.ids;
		s+=" Z-INDEX="+p.zind;
		s+="><LAYER>";
		s+="<TABLE BORDER=0 CELLSPACING=0 CELLPADDING="+p.pspc;
		s+=" BACKGROUND='"+p.pbgi+"'";
		s+=" BGCOLOR="+(p.pbgi||p.pbgc=="transparent"?"''":p.pbgc);
		s+=">";
	}
	else
	{
		var ds="position:"+stT2P[p.ppi?1:stgme(p).mtyp]+";";
		ds+="z-index:"+p.zind+";";
		ds+="visibility:hidden;";
		s+=st_ttb ? "<TABLE class=st_tbcss CELLPADDING=0 CELLSPACING=0" : "<DIV class=st_divcss";
		s+=stppev(p);
		s+=" ID="+p.ids;
		s+=" STYLE='";
		if(nIEM)
			s+="width:1px;";
		else if(nIE)
			s+="width:0px;";
		s+=stfcss(p);
		s+=ds;
		s+="'>";
		if(st_ttb)
			s+="<TD class=st_tdcss ID="+p.ids+"TTD>";
		s+="<TABLE class=st_tbcss CELLSPACING=0 CELLPADDING=0";
		s+=" ID="+p.ids+"TB";
		s+=" STYLE='";
		s+=stpcss(p);
		if(nIEW)
			s+="margin:"+p.psds+"px;";
		s+="'>";
	}
	return s;
}
function stpetx(p)
{
	var s="</TABLE>";
	if(nNN4||!nDM)
		s+="</LAYER></LAYER>";
	else if(st_ttb)
		s+="</TD></TABLE>";
	else
		s+="</DIV>";
	return s;
}
function stittx(i)
{
	var s="";
	var p=stgpar(i);
	if(nNN4||!nDM)
	{
		s+="<TD WIDTH=1 NOWRAP>";
		s+="<FONT STYLE='font-size:1pt;'>";
		s+="<ILAYER ID="+i.ids+"><LAYER";
		if(i.ipbw&&i.ityp!=6)
			s+=" BGCOLOR="+i.ibdc[0];
		s+=">";
		for(var l=0;l<(nNN4?2:1);l++)
		{
			if(i.ityp==6&&l)
				break;
			s+="<LAYER Z-INDEX=10 VISIBILITY="+(l?"HIDE":"SHOW");
			if(i.ityp!=6)
			{
				s+=" LEFT="+i.ipbw+" TOP="+i.ipbw;
			}
			s+=">";
			s+="<TABLE ALIGN=LEFT WIDTH=100% BORDER=0 CELLSPACING=0 CELLPADDING="+(i.ityp==6 ? 0 : p.ppad);
			s+=" BACKGROUND='"+(i.ityp!=6?i.ibgi[l]:"")+"'";
			s+=" BGCOLOR="+(i.ityp!=6&&i.ibgi[l]||i.ibgc[l]=="transparent"?"''":i.ibgc[l])
			s+=">";
			if(i.ityp==6)
			{
				s+="<TD NOWRAP VALIGN=TOP"+
					" HEIGHT="+(p.pver ? i.ssiz : "100%")+
					" WIDTH="+(p.pver ? "100%" : i.ssiz)+
					" STYLE='font-size:0pt;'"+
					">";
				s+=stgimg(i.simg,i.ids+"LINE",i.simw,i.simh,0);
				s+="</TD>";
			}
			else
			{
				if(p.pver&&p.plmw||!p.pver&&i.iicw)
				{
					s+="<TD ALIGN=CENTER VALIGN=MIDDLE";
					s+=stgiws(i);
					s+=">";
					s+=stgimg(i.iicn[l],"",i.iicw,i.iich,i.iicb);
					s+="</TD>";
				}
				s+="<TD WIDTH=100% NOWRAP ALIGN="+i.ihal+" VALIGN="+i.ival+">";
				s+="<A "+stgurl(i)+" CLASS='"+(i.ids+"TX"+l)+"'>";
				if(i.ityp==2)
					s+=stgimg(i.iimg[l],i.ids+"IMG",i.iimw,i.iimh,i.iimb);
				else
				{
					s+="<IMG SRC=\""+stgme(i).mbnk+"\" WIDTH=1 HEIGHT=1 BORDER=0 ALIGN=ABSMIDDLE>";
					s+=i.itex;
				}
				s+="</A>";
				s+="</TD>";
				if(p.pver&&p.prmw||!p.pver&&i.iarw)
				{
					s+="<TD ALIGN=CENTER VALIGN=MIDDLE";
					s+=stgaws(i);
					s+=">";
					s+=stgimg(i.iarr[l],"",i.iarw,i.iarh,i.iarb);
					s+="</TD>";
				}
			}
			s+="</TABLE>";
			if(i.ipbw&&i.ityp!=6)
				s+="<BR CLEAR=ALL><SPACER HEIGHT=1 WIDTH="+i.ipbw+"></SPACER><SPACER WIDTH=1 HEIGHT="+i.ipbw+"></SPACER>";
			s+="</LAYER>";
		}
		if(i.ityp!=6)
			s+="<LAYER Z-INDEX=20></LAYER>";
		s+="</LAYER></ILAYER>"
		s+="</FONT>";
		s+="</TD>";
	}
	else
	{
		s+="<TD class=st_tdcss NOWRAP VALIGN="+(nIE ? "MIDDLE" : "TOP");
		s+=" STYLE='"
			s+="padding:"+p.pspc+"px;";
		s+="'";
		s+=" ID="+p.ids+i.iti;
		if(nIEW)
			s+=" HEIGHT=100%";
		s+=">";
		if(!nOP&&!nIE)
		{
			s+="<DIV class=st_divcss ID="+i.ids;
			s+=stitev(i);
			s+=" STYLE=\""+sticss(i,0);
			s+="\"";
			s+=">";
		}
		s+="<TABLE class=st_tbcss CELLSPACING=0 CELLPADDING=0";
		if(!nOP)
			s+=" HEIGHT=100%";
		s+=" STYLE=\"";
		if(nOP||nIE)
			s+=sticss(i,0);
		s+="\"";
		if(nOP||nIE)
			s+=stitev(i);
		if(p.pver||nIEM)
			s+=" WIDTH=100%";
		s+=" ID="+(nOP||nIE ? i.ids : (i.ids+"TB"));
		if(!nOP)
			s+=" TITLE="+stquo(i.ityp!=6 ? i.itip : "");
		s+=">";
		if(i.ityp==6)
		{
			s+="<TD class=st_tdcss NOWRAP VALIGN=TOP"+
				" ID="+i.ids+"MTD"+
				" HEIGHT="+(p.pver ? i.ssiz : "100%")+
				" WIDTH="+(p.pver ? "100%" : i.ssiz)+
				">";
			s+=stgimg(i.simg,i.ids+"LINE",i.simw,i.simh,0);
			s+="</TD>";
		}
		else
		{
			if(p.pver&&p.plmw||!p.pver&&i.iicw)
			{
				s+="<TD class=st_tdcss NOWRAP ALIGN=CENTER VALIGN=MIDDLE HEIGHT=100%";
				s+=" STYLE=\"padding:"+p.ppad+"px\"";
				s+=" ID="+i.ids+"LTD";
				s+=stgiws(i);
				s+=">";
				s+=stgimg(i.iicn[0],i.ids+"ICON",i.iicw,i.iich,i.iicb);
				s+="</TD>";
			}
			s+="<TD class=st_tdcss NOWRAP HEIGHT=100% STYLE=\"";
			s+="color:"+i.itxc[0]+";";
			s+="padding:"+p.ppad+"px;";
			s+="\"";
			s+=" ID="+i.ids+"MTD";
			s+=" ALIGN="+i.ihal;
			s+=" VALIGN="+i.ival+">";
			s+="<FONT class=st_ftcss ID="+i.ids+"TX STYLE=\""+sttcss(i,0)+"\">";
			if(i.ityp==2)
				s+=stgimg(i.iimg[0],i.ids+"IMG",i.iimw,i.iimh,i.iimb);
			else
				s+=i.itex;
			s+="</FONT>";
			s+="</TD>";
			if(p.pver&&p.prmw||!p.pver&&i.iarw)
			{
				s+="<TD class=st_tdcss NOWRAP ALIGN=CENTER VALIGN=MIDDLE HEIGHT=100%";
				s+=" STYLE=\"padding:"+p.ppad+"px\"";
				s+=" ID="+i.ids+"RTD";
				s+=stgaws(i);
				s+=">";
				s+=stgimg(i.iarr[0],i.ids+"ARROW",i.iarw,i.iarh,i.iarb);
				s+="</TD>";
			}
		}
		s+="</TABLE>";
		if(!nOP&&!nIE)
			s+="</DIV>";
		s+="</TD>";
	}
	return s;
}
function stpcss(p)
{
	var s="";
	s+="border-style:"+p.pbds+";";
	s+="border-width:"+p.ipbw+"px;";
	s+="border-color:"+p.pbdc+";";
	if(nIE)
		s+="background:"+p.pbgd+";";
	else
	{
		s+="background-color:"+(p.pbgc)+";";
		if(p.pbgi)
		{
			s+="background-image:url("+p.pbgi+");";
			s+="background-repeat:"+p.pbgr+";";
		}
	}
	return s;
}
function stfcss(p)
{
	var s="";
	if(nIEW&&(nVER>=5.0||!p.isst))
	{
		var dx=nVER>=5.5?"progid:DXImageTransform.Microsoft." : "";
		s+="filter:";
		if(nVER>=5.5)
		{
			if(p.pesh!="Normal")
				s+=p.pesh+" ";
		}
		else
		{
			if(p.pesi<24&&p.pesi>=0)
				s+="revealTrans(Transition="+p.pesi+",Duration="+((110-p.pesp)/100)+") ";
		}
		s+=dx+"Alpha(opacity="+p.popc+") ";
		if(p.psds)
		{
			if(p.pstp==1)
				s+=dx+"dropshadow(color="+p.pscl+",offx="+p.psds+",offy="+p.psds+",positive=1) ";
			else
				s+=dx+"Shadow(color="+p.pscl+",direction=135,strength="+p.psds+") ";
		}
		if(nVER>=5.5)
		{
			if(p.pehd!="Normal")
				s+=p.pehd+" ";
		}
		else
		{
			if(p.pehi<24&&p.pehi>=0)
				s+="revealTrans(Transition="+p.pehi+",Duration="+((110-p.pesp)/100)+") ";
		}
		s+=";";
	}
	return s;
}
function sticss(i,n)
{
	var s="";
	if(i.ityp!=6)
	{
		s+="border-style:"+i.ibds+";";
		s+="border-width:"+i.ipbw+"px;";
		s+="border-color:"+i.ibdc[n]+";";
		if(!nIEM&&i.ibgi[n])
		{
			s+="background-image:url("+i.ibgi[n]+");";
			s+="background-repeat:"+i.ibgr[n]+";";
		}
	}
	if(nIEM&&i.ityp!=6)
		s+="background:"+i.ibgd[n]+";";
	else
		s+="background-color:"+i.ibgc[n]+";";
	s+="cursor:"+stgcur(i)+";";
	return s;
}
function sttcss(i,n)
{
	var s="";
	s+="cursor:"+stgcur(i)+";";
	s+="font:"+i.itxf[n]+";";
	s+="text-decoration:"+i.itxd[n]+";";
	if(!nDM||nNN4)
		s+="background-color:transparent;color:"+i.itxc[n];
	return s;
}
function stitov(e,o,i)
{
	if(nIEW)
	{
		if(!i.layer)
			i.layer=o;
		if(!stgpar(i).issh||(e.fromElement&&o.contains(e.fromElement)))
			return;
	}
	else
	{
		if(!stgpar(i).issh||(!nNN&&(e.fromElement&&e.fromElement.id&&e.fromElement.id.indexOf(i.ids)>=0)))
			return;
	}
	if(nNN4)
		stglay(i).document.layers[0].captureEvents(Event.CLICK);
	var m=stgme(i);
	if(!i.ppi&&m.mcff)
		stfrm(m);
	var w=m.sfrm;
	if(w!=window)
		m=w.stmenu(m.mnam);
	if(m.hdid)
	{
		w.clearTimeout(m.hdid);
		m.hdid=null;
	}
	var cii=stgpar(i).citi;
	var ci=null;
	if(cii>=0)
		ci=stgpar(i).is[cii];
	var p=stgpar(i);
	if(!p.isck||stgme(i).cked)
	{
		if(p.citi!=i.iti)
		{
			if(p.citi>=0)
			{
				sthdit(p.is[p.citi]);
				p.citi=-1;
			}
			stshit(i);
			p.citi=i.iti;
		}
		else
		{
			var p=stgtsub(i);
			if(p&&!p.issh)
				stshit(i);
		}
	}
	if(i.istt)
		window.status=i.istt;
}
function stitou(e,o,i)
{
	if(nIEW)
	{
		if(!stgpar(i).issh||e.toElement&&o.contains(e.toElement))
			return;
	}
	else
	{
		if(!stgpar(i).issh||(!nNN&&(e.toElement&&e.toElement.id&&e.toElement.id.indexOf(i.ids)>=0)))
			return;
	}
	if(nNN4)
		stglay(i).document.layers[0].releaseEvents(Event.CLICK);
	var p=stgtsub(i);
	if(!p||!p.issh)
	{
		stshst(i,0);
		stgpar(i).citi=-1;
	}
	else if(p&&p.issh&&!p.exed)
		sthdit(i);
	window.status="";
}
function stitck(e,o,i)
{
	if(e.button&&e.button>=2)
		return;
	var m=stgme(i);
	var p=stgpar(i);
	if(p.isck)
	{
		m.cked=!m.cked;
		if(m.cked)
		{
			stshit(i);
			p.citi=i.iti;
		}
		else
		{
			sthdit(i);
			p.citi=-1;
		}
	}
	if(!nNN4&&!(p.isck&&stgsub(i))&&i.iurl)
	{
		if(i.iurl.toLowerCase().indexOf("javascript:")==0)
			eval(i.iurl.substring(11,i.iurl.length));
		else if(i.itgt=="_self")
			window.location.href=i.iurl;
		else if(i.itgt=="_parent")
			window.parent.location.href=i.iurl;
		else if(i.itgt=="_top")
			window.top.location.href=i.iurl;
		else
		{
			for(var co=window;co!=co.parent;co=co.parent)
			{
				if(typeof(co.parent.frames[i.itgt])!="undefined")
				{
					co.parent.frames[i.itgt].location.href=i.iurl;
					return;
				}
			}
			window.open(i.iurl,i.itgt);
		}
	}
}
function stppov(e,o,p)
{
	if(nIEW)
	{
		if(!p.layer)
			p.layer=o;
		if(!p.issh||(e.fromElement&&o.contains(e.fromElement)))
			return;
	}
	else
	{
		if(!p.issh||(!nNN&&(e.fromElement&&e.fromElement.id&&e.fromElement.id.indexOf(p.ids)>=0)))
			return;
	}
	var m=stgme(p);
	var w=m.sfrm;
	if(w!=window)
		m=w.stmenu(m.mnam);
	if(m.hdid)
	{
		w.clearTimeout(m.hdid);
		m.hdid=null;
	}
}
function stppou(e,o,p)
{
	if(nIEW)
	{
		if(!p.issh||(e.toElement&&o.contains(e.toElement)))
			return;
	}
	else
	{
		if(!p.issh||(!nNN&&(e.toElement&&e.toElement.id&&e.toElement.id.indexOf(p.ids)>=0)))
			return;
	}
	var m=stgme(p);
	var w=m.sfrm;
	if(w!=window)
		m=w.stmenu(m.mnam);
	if(m.hdid)
		w.clearTimeout(m.hdid);
	m.hdid=w.setTimeout("sthdall(st_ms['"+m.mei+"'],0);",m.mhdd);
}
function stshst(i,n)
{
	if(nNN4)
	{
		var ls=stgstlay(i);
		ls[n].parentLayer.bgColor=i.ibdc[n];
		ls[n].visibility="show";
		ls[1-n].visibility="hide";
	}
	else
	{
		var os=stglay(i).style;
		if(nIEM)
		{
			if(i.ibgd[0]!=i.ibgd[1])	os.background=i.ibgd[n];
		}
		else
		{
			if(i.ibgc[0]!=i.ibgc[1])
			{
				if(nOP&&nVER<6)
					os.background=i.ibgc[n];
				else
					os.backgroundColor=i.ibgc[n];
			}
			if(i.ibgi[0]!=i.ibgi[1])	os.backgroundImage="url("+(i.ibgi[n]?i.ibgi[n]:stgme(i).mbnk)+")";
			if(i.ibgr[0]!=i.ibgr[1])	os.backgroundRepeat=i.ibgr[n];
		}
		if(i.ibdc[0]!=i.ibdc[1])	os.borderColor=i.ibdc[n];
		var t;
		if(i.iicn[0]!=i.iicn[1])
		{
			t=stgobj(i.ids+'ICON','IMG');
			if(t)	t.src=i.iicn[n];
		}
		if(i.iarr[0]!=i.iarr[1])
		{
			t=stgobj(i.ids+'ARROW','IMG');
			if(t)	t.src=i.iarr[n];
		}
		if(i.ityp==2&&i.iimg[0]!=i.iimg[1])
		{
			t=stgobj(i.ids+'IMG','IMG');
			if(t)	t.src=i.iimg[n];
		}
		if (!i.txstyle)	i.txstyle=stgobj(i.ids+"TX",'FONT').style;
		t=i.txstyle;
		if(i.itxf[0]!=i.itxf[1])
			t.font=i.itxf[n];
		if(i.itxd[0]!=i.itxd[1])
			t.textDecoration=i.itxd[n];
		if(nOP)	stgobj(i.ids+'MTD','td').style.color=i.itxc[n];
		else	t.color=i.itxc[n];
	}
}
function stshpp(p)
{
	stshow(p);
}
function sthdpp(p)
{
	if(p.citi>=0)
	{
		var t=stgsub(p.is[p.citi]);
		if(t&&t.issh)
			sthdpp(t);
		stshst(p.is[p.citi],0);
		p.citi=-1;
	}
	sthide(p);
}
function stshit(i)
{
	var w=stgme(i).tfrm;
	var p=stgtsub(i);
	if(p&&!p.issh)
		w.stshpp(p);
	stshst(i,1);
}
function sthdit(i)
{
	var w=stgme(i).tfrm;
	var p=stgtsub(i);
	if(p&&p.issh)
		w.sthdpp(p);
	stshst(i,0);
}
function stshow(p)
{
	var d=p.ppi&&stgpar(stgpar(p)).pver ? stgme(p).msdv : stgme(p).msdh;
	p.exed=0;
	if(!p.rc)
		stgxy(p);
	if(p.tmid)
	{
		clearTimeout(p.tmid);
		p.tmid=null;
		stwels(1,p)
	}
	if(d>0)
		p.tmid=setTimeout(stsdstr(p,1),d);
	p.issh=1;
	if(d<=0)
		eval(stsdstr(p,1));
}
function sthide(p)
{
	if(p.tmid)
	{
		clearTimeout(p.tmid);
		p.tmid=null;
	}
	if(p.issh&&!p.exed)
	{
		p.exed=0;
		p.issh=0;
	}
	else
	{
		p.exed=0;
		p.issh=0;
		eval(stsdstr(p,0));
	}
}
function stshx(p)
{
	var ly=stglay(p);
	if(nNN4)
	{
		ly.visibility='show';
		if(!p.fixed)
		{
			ly.resizeBy(p.ipbw*2,p.ipbw*2);
			ly=ly.document.layers[0];
			ly.moveTo(p.ipbw,p.ipbw);
			ly.onmouseover=stppovn;
			ly.onmouseout=stppoun;
			for(var l=p.is.length-1;l>=0;l--)
			{
				var i=p.is[l];
				if(i.ityp!=6)
				{
					var ls=stgstlay(i);
					ls[2].resizeTo(ls[0].parentLayer.clip.width,ls[0].parentLayer.clip.height);
					if(stgcur(i)=="hand")
					{
						with(ls[2].document)
						{
							open();
							write("<A "+stgurl(i)+"\"><IMG BORDER=0 SRC='"+stgme(i).mbnk+"' WIDTH="+ls[2].clip.width+" HEIGHT="+ls[2].clip.height+"></A>");
							close();
						}
					}
					ls[0].resizeBy(-i.ipbw,-i.ipbw);
					ls[1].resizeBy(-i.ipbw,-i.ipbw);
					ly=stglay(i).document.layers[0];
					ly.onmouseover=stitovn;
					ly.onmouseout=stitoun;
					ly.onclick=stitckn;
				}
			}
			if(p.ipbw)
				setTimeout("var pp=st_ms["+p.mei+"].ps["+p.ppi+"];stglay(pp).bgColor=pp.pbdc;",1);
			p.fixed=1;
		}
	}
	else
	{
		ly.style.visibility='visible';
		if(nIE5)
			ly.filters['Alpha'].opacity=p.popc;
	}
}
function sthdx(p)
{
	var ly=stglay(p);
	if(nNN4)
		ly.visibility='hide';
	else
	{
		if(nIE5)
			ly.filters['Alpha'].opacity=0;
		ly.style.visibility='hidden';
	}
}
function sthdall(m,f)
{
	var w=m.sfrm;
	var s=w==window?m:w.stmenu(m.mnam);
	s.cked=0;
	var p=s.ps[0];
	if(p.issh)
	{
		if(p.citi>=0)
		{
			w.sthdit(p.is[p.citi]);
			p.citi=-1;
		}
		if(s.mtyp==2&&f)
			w.sthide(p);
	}
	s.hdid=null;
}
function stnmsh(p)
{
	stmvto(stgxy(p),p);
	stwels(-1,p);
	stshx(p);
}
function stnmhd(p)
{
	sthdx(p);
	stwels(1,p);
}
function stftsh(p)
{
	if(nVER<5.5)
		stshfx(p);
	else if(st_reg)
		eval("try{stshfx(p);} catch(er){st_reg=0;stnmsh(p);}");
	else
		stnmsh(p);
}
function stfthd(p)
{
	if(nVER<5.5)
		sthdfx(p);
	else if(st_reg)
		eval("try{sthdfx(p);}catch(er){st_reg=0;stnmhd(p);}");
	else
		stnmhd(p);
}
function stshfx(p)
{
	var t=stglay(p).filters[0];
	if(nVER>=5.5)
		t.enabled=1;
	if(t.Status!=0)
		t.stop();
	stmvto(stgxy(p),p);
	stwels(-1,p);
	t.apply();
	stshx(p);
	t.play();
}
function sthdfx(p)
{
	var t=stglay(p).filters[stglay(p).filters.length-1];
	if(nVER>=5.5)
		t.enabled=1;
	if(t.Status!=0)
		t.stop();
	t.apply();
	sthdx(p);
	stwels(1,p);
	t.play();
}
function ststxy(m,xy)
{
	m.mcox=xy[0];
	m.mcoy=xy[1];
}
function stnav()
{
	var v=navigator.appVersion;
	var a=navigator.userAgent;
	nMAC=v.indexOf("Mac")>=0;
	nOP=a.indexOf("Opera")>=0;
	if(nOP)
	{
		nVER=parseFloat(a.substring(a.indexOf("Opera ")+6,a.length));
		nOP5=nVER>=5.12&&!nMAC&&a.indexOf("MSIE 5.0")>=0;
		if(nVER>=7)	nOP5=1;
	}
	else
	{
		nIE=document.all ? 1 : 0;
		if(nIE)
		{
			nIE4=(eval(v.substring(0,1)>=4));
			nVER=parseFloat(a.substring(a.indexOf("MSIE ")+5,a.length));
			nIE5=nVER>=5.0&&nVER<5.5&&!nMAC;
			nIEM=nIE4&&nMAC;
			nIEW=nIE4&&!nMAC;
		}
		else
		{
			nNN4=navigator.appName.toLowerCase()=="netscape"&&v.substring(0,1)=="4" ? 1 : 0;
			if(!nNN4)
			{
				nNN6=(document.getElementsByTagName("*") && a.indexOf("Gecko")!=-1);
				if(nNN6)
				{
					nVER=parseInt(navigator.productSub);
					if(a.indexOf("Netscape")>=0)
					{
						st_delb=nVER<20001108+1;
						st_addb=nVER>20020512-1;
					}
					else
					{
						st_delb=nVER<20010628+1;
						st_addb=nVER>20011221-1;
					}
				}
			}
			else
				nVER=parseFloat(v);
			nNN=nNN4||nNN6;
		}
	}
	nDM=nOP5||nIE4||nNN;
}
function stckpg()
{
	var w=st_cw;
	var h=st_ch;
	var l=st_cl;
	var t=st_ct;
	st_cw=stgcw();
	st_ch=stgch();
	st_cl=stgcl();
	st_ct=stgct();
	if(((nOP&&nVER<7.0)||nNN4)&&(st_cw-w||st_ch-h))
		document.location.reload();
	else if(st_cl-l||st_ct-t)
		stscr();
}
function st_onload()
{
	if(nIEM||nOP5||nNN||(nIEW&&nVER<5.0))
	{
		if(st_ht)
			document.body.insertAdjacentHTML('BeforeEnd',st_ht);
		for(i=0;i<st_ms.length;i++)
			stpre(st_ms[i]);
	}
	st_load=1;
	if(!nNN4)
	{
		for(var i=0;i<st_ms.length;i++)
		{
			var m=st_ms[i];
			for(var j=0;j<m.ps.length;j++)
			{
				var p=m.ps[j];
				if(p.issh&&p.exed)
					stwels(-1,p);
			}
		}
	}
}
function stpre(m)
{
	var p=m.ps[m.ps.length-1];
	var i=p.is[p.is.length-1];
	while(1)
		if(stglay(i)) break;
	if(!nNN4)
		stfix(m);
	if(m.mtyp!=2)
		stshow(m.ps[0]);
	if(nIE||nNN6)
		window.onscroll=new Function("if(st_scr)clearTimeout(st_scr);st_scr=setTimeout('stscr();',nIEM ?500:0);");
	else if(!st_rl)
	{
		st_cw=stgcw();
		st_ch=stgch();
		st_cl=stgcl();
		st_ct=stgct();
		st_rl=setInterval("stckpg();",500);
	}
	m.ready=1;
}
function stfix(m)
{
	for(var l=0;l<m.ps.length;l++)
	{
		var p=m.ps[l];
		if(nOP&&nVER<6.0)
			stglay(p).style.pixelWidth=parseInt(stgobj(p.ids+"TB",'table').style.pixelWidth);
		if(nIE5)
			stglay(p).style.width=stglay(p).offsetWidth;
		else if(nIEM||!nIE)
		{
			if(!p.pver)
			{
				var ii=0;
				var fi=stgobj(p.ids+ii);
				var h=parseInt(nOP ? fi.style.pixelHeight : fi.offsetHeight);
				if(h)
				{
					for(ii=0;ii<p.is.length;ii++)
					{
						var i=p.is[ii];
						var lys=stglay(i).style;
						var th=h-2*p.pspc;
						if(nOP)
							lys.pixelHeight=th;
						else if(i.ityp==6||nIE)
							lys.height=th+'px';
						else
							lys.height=th-2*i.ipbw+'px';
						if(nIEM)
						{
							var fh=h-2*p.pspc;
							var lt=stgobj(i.ids+"LTD");
							var rt=stgobj(i.ids+"RTD");
							if(lt)
								lt.style.height=fh+'px';
							stgobj(i.ids+"MTD").style.height=fh+'px';
							if(rt)
								rt.style.height=fh+'px';
						}
					}
				}
			}
			else if(nOP)
			{
				for(var ii=0;ii<p.is.length;ii++)
				{
					var i=p.is[ii];
					if(i.ityp!=6)
					{
						var fi=stgobj(p.ids+ii);
						var it=stglay(i);
						var w=parseInt(fi.style.pixelWidth);
						var h=parseInt(it.style.pixelHeight);
						if(w)
							it.style.pixelWidth=w-2*p.pspc;
						if(h)
							it.style.pixelHeight=h;
					}
				}
			}
		}
	}
}
function stscr()
{
	for(var l=0;l<st_ms.length;l++)
	{
		var m=st_ms[l];
		if(m)
		{
			sthdall(m,0);
			if(m.mtyp==1)
			{
				var p=m.ps[0];
				stwels(1,p);
				stmvto(stgxy(m.ps[0]),p);
				stwels(-1,p);
			}
		}
	}
}
function stwels(c,p)
{
	var m=stgme(p);
	if(!st_load||nNN4||nOP||p.isst)	return;
	if(m.mhds&&!nNN6)	stwtag("SELECT",c,p);
	if(m.mhdo)	stwtag("OBJECT",c,p);
	if(m.mhdi&&!nNN6&&!(nIEW&&nVER>=5.5))	stwtag("IFRAME",c,p);
}
function stwtag(tg,c,o)
{
	var es=nNN6 ? document.getElementsByTagName(tg) : document.all.tags(tg);
	var l;
	for(l=0;l<es.length;l++)
	{
		var e=es.item(l);
		var f=0;
		for(var t=e.offsetParent;t;t=t.offsetParent)
			if(t.id&&t.id.indexOf("Stm")>=0)
				f=1;
		if(f)
			continue;
		else if(stwover(e,o))
		{
			if(e.visLevel)
				e.visLevel+=c;
			else
				e.visLevel=c;
			if(e.visLevel==-1)
			{
				if(typeof(e.visSave)=='undefined')
					e.visSave=e.style.visibility;
				e.style.visibility="hidden";
			}
			else if(e.visLevel==0)
				e.style.visibility=e.visSave;
		}
	}
}
function stmvto(xy,p)
{
	if(xy&&(p.ppi||stgme(p).mtyp!=0))
	{
		var l=stglay(p);
		if(nNN4)
			l.moveToAbsolute(xy[0],xy[1]);
		else if(nOP)
		{
			var ls=l.style;
			ls.pixelLeft=xy[0];
			ls.pixelTop=xy[1];
		}
		else
		{
			var ls=l.style;
			ls.left=xy[0]+'px';
			ls.top=xy[1]+'px';
		}
		p.rc=[xy[0],xy[1],p.rc[2],p.rc[3]];
	}
}
function stsdstr(p,iss)
{
	return	"var pp=st_ms["+p.mei+"].ps["+p.ppi+"];pp.tmid=null;"+(iss? p.efsh+"sh(" : p.efhd+"hd(")+"pp);pp.exed=1;"
}
function stwover(e,o)
{
	var l=0;
	var t=0;
	var w=e.offsetWidth;
	var h=e.offsetHeight;
	if(w)
		e._wd=w;
	else
		w=e._wd;
	if(h)
		e._ht=h;
	else
		h=e._ht;
	while(e)
	{
		l+=e.offsetLeft;
		t+=e.offsetTop;
		e=e.offsetParent;
	}
	return ((l<o.rc[2]+o.rc[0]) && (l+w>o.rc[0]) && (t<o.rc[3]+o.rc[1]) && (t+h>o.rc[1]));
}
function stevfn(pr,isi)
{
	var s=isi ? 'st_ri' : 'st_rp';
	s+='.exec(this.parentLayer.id);mei=RegExp.$1;ppi=parseInt(RegExp.$2);';
	if(isi)	s+='iti=parseInt(RegExp.$3);return '+pr+'(e,this,st_ms[mei].ps[ppi].is[iti]);';
	else	s+='return '+pr+'(e,this,st_ms[mei].ps[ppi]);';
	return new Function('e',s);
}
function stppev(p)
{
	var s=" onMouseOver='stppov(event,this,st_ms["+p.mei+"].ps["+p.ppi+"]);'";
	s+=" onMouseOut='stppou(event,this,st_ms["+p.mei+"].ps["+p.ppi+"]);'";
	return s;
}
function stitev(i)
{
	if(i.ityp==6)	return '';
	var s=" onMouseOver='stitov(event,this,st_ms["+i.mei+"].ps["+i.ppi+"].is["+i.iti+"]);'";
	s+=" onMouseOut='stitou(event,this,st_ms["+i.mei+"].ps["+i.ppi+"].is["+i.iti+"]);'";
	s+=" onClick='stitck(event,this,st_ms["+i.mei+"].ps["+i.ppi+"].is["+i.iti+"]);'";
	return s;
}
function stquo(n)
{
	return "\""+n+"\"";
}
function stgurl(i)
{
	return " HREF=" + stquo(i.iurl=="" ? "#" : i.iurl.replace(new RegExp("\"","g"),"&quot;")) + " TARGET=" + stquo(i.iurl==""||i.iurl.toLowerCase().indexOf('javascript:')==0 ? "_self" : i.itgt);
}
function stgdec(v)
{
	if(v)
	{
		var s='';
		if(v&1)
			s+='underline ';
		if(v&2)
			s+='line-through ';
		if(v&4)
			s+='overline';
		return s;
	}
	else
		return 'none';
}
function stgimg(src,id,w,h,b)
{
	var s='<IMG SRC=';
	s+=stquo(src);
	if(id)
		s+=' ID='+id;
	if(w>0)
		s+=' WIDTH='+w;
	else if(nNN)
		s+=' WIDTH=0';
	if(h>0)
		s+=' HEIGHT='+h;
	else if(nNN)
		s+=' HEIGHT=0';
	s+=' BORDER='+b+'>';
	return s;
}
function stgbg(c,im,r)
{
	var s=c;
	if(im)
		s+=" url("+im+") "+r;
	return s;
}
function stgcur(i)
{
	if(nNN6)
		return "default";
	return i.ityp!=6&&((i.ppi==0&&stgme(i).mcks&&stgsub(i))||i.iurl) ? "hand" : "default";
}
function stgiws(o)
{
	if(stgpar(o).pver)
		return stgpar(o).plmw>0 ? " WIDTH="+(stgpar(o).plmw+2) : "";
	else
		return o.iicw>0 ? " WIDTH="+(o.iicw+2) : "";
}
function stgaws(o)
{
	if(stgpar(o).pver)
		return stgpar(o).prmw>0 ? " WIDTH="+(stgpar(o).prmw+2) : "";
	else
		return o.iarw>0 ? " WIDTH="+(o.iarw+2) : "";
}
function stgme(ip)
{
	return st_ms[ip.mei];
}
function stgpar(ip)
{
	if(typeof(ip.iti)!="undefined")
		return st_ms[ip.mei].ps[ip.ppi];
	else
		return !ip.par ? null : st_ms[ip.par[0]].ps[ip.par[1]].is[ip.par[2]];
}
function stgsub(i)
{
	return !i.sub ? null : st_ms[i.sub[0]].ps[i.sub[1]];
}
function stgcl()
{
	return parseInt(nNN||nOP ? window.pageXOffset : document.body.scrollLeft);
}
function stgct()
{
	return parseInt(nNN||nOP ? window.pageYOffset : document.body.scrollTop);
}
function stgcw()
{
	return parseInt(nNN||nOP ? window.innerWidth : (nIEW&&document.compatMode=="CSS1Compat" ? document.documentElement.clientWidth : document.body.clientWidth));
}
function stgch()
{
	return parseInt(nNN||nOP ? window.innerHeight : (nIEW&&document.compatMode=="CSS1Compat" ? document.documentElement.clientHeight : document.body.clientHeight));
}
function stgobj(id,t)
{
	if(nNN6)
		return document.getElementById(id);
	else if(nNN4)
		return document.layers[id];
	else
		return t ? document.all.tags(t)[id] : document.all[id];
}
function stglay(ip)
{
	if(!ip.layer)
	{
		if(typeof(ip.iti)=='undefined')
			ip.layer=stgobj(ip.ids,st_ttb ? 'table' : 'div');
		else
			ip.layer=nNN4 ? stglay(stgpar(ip)).document.layers[0].document.layers[ip.ids] : stgobj(ip.ids,nIEW ? 'table' : null);
	}
	return ip.layer;
}
function stgstlay(i)
{
	return stglay(i).document.layers[0].document.layers;
}
function stgrc(ip)
{
	if(nNN4)
	{
		var ly=stglay(ip);
		return [ly.pageX,ly.pageY,ly.clip.width,ly.clip.height];
	}
	else
	{
		var l=0,t=0;
		var ly=stglay(ip);
		var w=typeof(ip.rc)=="undefined"?parseInt(nOP&&nVER<7?ly.style.pixelWidth:ly.offsetWidth):ip.rc[2];
		var h=typeof(ip.rc)=="undefined"?parseInt(nOP&&nVER<7?ly.style.pixelHeight:ly.offsetHeight):ip.rc[3];
		while(ly)
		{
			l+=parseInt(ly.offsetLeft);
			t+=parseInt(ly.offsetTop);
			ly=ly.offsetParent;
		}
		if(nIEM)
		{
			l+=parseInt(document.body.leftMargin);
			l-=ip.ipbw;
			t-=ip.ipbw;
		}
		if(typeof(ip.iti)!='undefined')
		{
			if(st_delb)
			{
				l-=ip.ipbw;
				t-=ip.ipbw;
			}
			if(st_addb)
			{
				l+=stgpar(ip).ipbw;
				t+=stgpar(ip).ipbw;
			}
		}
		return [l,t,w,h];
	}
}
function stgxy(p)
{
	var x=p.poffx;
	var y=p.poffy;
	var sr=stgrc(p);
	p.rc=sr;
	if(p.ppi==0)
	{
		if(stgme(p).mtyp==2)
			return [stgme(p).mcox,stgme(p).mcoy];
		else if(stgme(p).mtyp==1)
			return [eval(stgme(p).mcox),eval(stgme(p).mcoy)];
		else
			return [sr[0],sr[1]];
	}
	var ir=stgirc(stgpar(p));
	var cl=stgcl();
	var ct=stgct();
	var cr=cl+stgcw();
	var cb=ct+stgch();
	if(p.pdir==1)
		x=p.poffx+ir[0]-sr[2]+p.psds;
	else if(p.pdir==2)
		x=p.poffx+ir[0]+ir[2]-p.psds;
	else
		x=p.poffx+ir[0]-p.psds;
	if(x+sr[2]>cr)
		x=cr-sr[2];
	if(x<cl)
		x=cl;
	if(p.pdir==3)
		y=p.poffy+ir[1]-sr[3]+p.psds;
	else if(p.pdir==4)
		y=p.poffy+ir[1]+ir[3]-p.psds;
	else
		y=p.poffy+ir[1]-p.psds;
	if(y+sr[3]>cb)
		y=cb-sr[3];
	if(y<ct)
		y=ct;
	return [x,y];
}
function stbuf(s)
{
	if(s)
	{
		var i=new Image();
		st_ims[st_ims.length]=i;
		i.src=s;
	}
	return s;
}
function stgsrc(s,m,f)
{
	if(s=='')
		return f ? m.mbnk : '';
	var sr=s.toLowerCase();
	if(sr.indexOf('http://')==0||(sr.indexOf(':')==1&&sr.charCodeAt(0)>96&&sr.charCodeAt(0)<123)||sr.indexOf('ftp://')==0||sr.indexOf('/')==0||sr.indexOf('gopher')==0)
		return s;
	else
		return m.mweb+s;
}
function showFloatMenuAt(n,x,y)
{
	if(nDM)
	{
		var m=stmenu(n);
		if(m&&typeof(m.ready)!="undefined"&&m.mtyp==2&&m.ps.length&&!m.ps[0].issh)
		{
			ststxy(m,[x,y]);
			stshow(m.ps[0]);
		}
	}
}
function hideMenu(n)
{
	var m=stmenu(n);
	var w=m.sfrm;
	if(w!=window)
		m=w.stmenu(n);
	if(m.hdid)
	{
		w.clearTimeout(m.hdid);
		m.hdid=null;
	}
	w.sthdall(m,1);
}
function stmenu(n)
{
	for(var l=st_ms.length-1;l>=0;l--)
		if(st_ms[l].mnam==n)
			return st_ms[l];
	return null;
}
function stgtsub(i)
{
	var m=stgme(i);
	var w=m.tfrm;
	if(i.ppi||w==window)
		return stgsub(i);
	m=w.stmenu(m.mnam);
	return w.stgsub(m.ps[i.ppi].is[i.iti]);
}
function stgirc(i)
{
	var m=stgme(i);
	var w=m.sfrm;
	if(i.ppi||w==window)
		return stgrc(i);
	m=w.stmenu(m.mnam);
	var rc=w.stgrc(m.ps[0].is[i.iti]);
	var x=rc[0]-w.stgcl();
	var y=rc[1]-w.stgct();
	switch(m.mcfd)
	{
		case 0:y-=w.stgch();break;
		case 1:y+=stgch();break;
		case 2:x-=w.stgcw();break;
		case 3:x+=stgcw();break;
	}
	x+=stgcl()+m.mcfx;
	y+=stgct()+m.mcfy;
	return [x,y,rc[2],rc[3]];
}
function stfrm(m)
{
	var a=m.mcff.split(".");
	var w="top";
	for(var l=0;l<a.length-1;l++)
		if(typeof(eval(w+"."+a[l]))=="undefined")
			return 0;
	w=eval("top."+m.mcff);
	if(typeof(w.st_load)!="undefined"&&w.st_load)
	{
		var t=w.stmenu(m.mnam);
		if(typeof(t)=="object")
		{
			if(w!=window)
			{
				if(t.mhdd<1000)
					m.mhdd=t.mhdd=1000;
				hideMenu(m.mnam);
				m.sfrm=t.sfrm=window;
				m.tfrm=t.tfrm=w;
			}
			m.mcff="";
			return 1;
		}
	}
	return 0;
}