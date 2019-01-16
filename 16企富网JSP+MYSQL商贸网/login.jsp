<%@ page contentType="text/html;charset=gb2312" %>
<link href="../conn/laba.css" rel="stylesheet" type="text/css">
<BODY leftMargin=0 marginwidth="0"  topMargin=0 background=../images/c_cnco_bj.gif>
<TABLE class=main cellSpacing=0 cellPadding=0 width="99%" 
            align=center border=0>
              <TBODY>
              <TR>
                <TD vAlign=center width=100% height=30>


<%if ((String) session.getAttribute("login")==null){%>


<table class=border2 cellspacing=0 cellpadding=0 width=385 align=left border=0 height=30>
              <form name=form action="../check.jsp" method=post >
                <tbody>
                <tr>
                  <td width=230  height=20 class=s>会员:
                      <input class=input
                  onMouseOver=this.focus() maxlength=15 size=11 name=user
                 style="BORDER-RIGHT: #333333 1px solid; &#10;  BORDER-TOP: #333333 1px solid; BORDER-LEFT: #333333 1px solid; COLOR: #333333; &#10;BORDER-BOTTOM: #333333 1px solid; fontsize: 9 BACKGROUND-COLOR: #ffffff">
                      密码:
                      <input class=input
                  onMouseOver=this.focus()
                  style="BORDER-RIGHT: #333333 1px solid; BORDER-TOP: #333333 1px solid; BORDER-LEFT: #333333 1px solid; COLOR: #333333; BORDER-BOTTOM: #333333 1px solid; fontsize: 9 BACKGROUND-COLOR: #ffffff"
                  type=password maxlength=15 size=11 name=pass>
                  </td>



                  <td  width=30 align=right>
                    <input class=input onClick="if((user.value=='')||(pass.value==''))&#10; &#9;&#9;  {&#10;   &#9;&#9;    alert('请输入用户名和密码!');&#10;   &#9;&#9;   return false;&#10; &#9;&#9;  }else&#10;  &#9;&#9;    this.form.submit();" type=submit value="登 录" name=imageField style="FONT-WEIGHT: bold; BACKGROUND: #cccccc; COLOR: rgb(255,255,255); FONT-STYLE: normal; FONT-VARIANT: normal"></td>
                  <td  width=90 height=20 classs=s>&nbsp;&nbsp;


<script language="javascript">
function doBlink() {
    // Blink, Blink, Blink...
    var blink = document.all.tags("BLINK")
    for (var i=0; i < blink.length; i++)
    blink[i].style.visibility = blink[i].style.visibility == "" ? "hidden" : ""
}

function startBlink() {
    // Make sure it is IE4
    if (document.all) {
        setInterval("doBlink()",300)
    }

}
window.onload = startBlink;
</script>


<%if ((String) session.getAttribute("flash")==null){%>
<a href=../info/forget.jsp target="_parent" classs=s  style="cursor:help">忘记密码?</a>
<%}else{%>
<a href=../info/forget.jsp  target="_parent" classs=s  style="cursor:help"><font color=red><blink>忘记密码?</blink></font></a>
<%}%>

</td>
</tr>
</tbody>
</table>

<%}else{%>


<table class=border2 cellspacing=0 cellpadding=0 width=380 align=left border=0 height=30>
<tbody>
<tr>
<td  height=20 class=s>
<img src=images/gb.gif>&nbsp;<b><%=(String) session.getAttribute("loginname")%></b>
诚信指数<%@ include file="info/grade.jsp"%><A href=info/mysj.jsp target="_blank">共有<iframe frameborder=0 leftmargin=0 marginheight=0 marginwidth=0 scrolling=no src=info/how.jsp topmargin=0 width=35 height=12></iframe>条符合我的商机</a>&nbsp;<A href=quit.jsp ><font color=666666>退出</font></a>
</td>
</tr>
</tbody>
</table>

<%}%>

</TD></TR>
  <TR>
<TD background=images/1x3.gif height=1></TD></TR>
</TBODY></TABLE>



<%if ((String) session.getAttribute("login")==null){%>



<TABLE class=main cellSpacing=0 cellPadding=0 width="99%" align=center border=0>
<TR><TD height=15><td></tr>
  <TR><TD width=15><TD><img src=../images/aer1.gif>&nbsp;发布供求信息</td><TD><img src=../images/aer1.gif>&nbsp;发布产品展览 </TD><td><img src=../images/aer1.gif>&nbsp;发布招骋信息</td></TR>
<TR><TD height=10>
</TD></TR>
<TR><TD width=15><TD><img src=../images/aer1.gif>&nbsp;定制我的商机 </TD><td><img src=../images/aer1.gif>&nbsp;查看我的留言 </TD><td><img src=../images/aer1.gif>&nbsp;我的精选文集</TD></TR>
</TBODY></TABLE>

<%}else{%>

<TABLE class=main cellSpacing=0 cellPadding=0 width="99%" align=center border=0>
<TR><TD height=15><td></tr>
  <TR><TD width=15><TD><img src=../images/aer1.gif>&nbsp;<a href=../info/addsj.jsp target="_blank">发布供求信息</a></td><TD><img src=../images/aer1.gif>&nbsp;<a href=../info/addshow.jsp  target="_blank">发布产品展览</a> </TD><td><img src=../images/aer1.gif>&nbsp;<a href=../info/job.jsp  target="_blank">发布招骋信息</a></td></TR>
<TR><TD height=10>
</TD></TR>
<TR><TD width=15><TD><img src=../images/aer1.gif>&nbsp;<a href=../info/dingzhisj.jsp  target="_blank">定制我的商机</a> </TD><td><img src=../images/aer1.gif>&nbsp;<a href=../info/mymessage.jsp  target="_blank">查看我的留言</a> </TD><td><img src=../images/aer1.gif>&nbsp;<a href=../info/glbook.jsp  target="_blank">我的精选文集</a></TD></TR>
</TBODY></TABLE>

<%}%>
