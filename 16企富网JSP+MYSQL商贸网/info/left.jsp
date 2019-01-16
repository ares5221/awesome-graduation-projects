<SCRIPT language=javascript>
<!--

function menu_display(t_id,i_id){//显示隐藏程序
        var t_id;//表格ID
        var i_id;//图片ID
        var on_img="images/fold_2.gif";//打开时图片
        var off_img="images/fold_1.gif";//隐藏时图片
                if (t_id.style.display == "none") {//如果为隐藏状态
                t_id.style.display="";//切换为显示状态
                i_id.src=on_img;//换图
}
        else{//否则
                t_id.style.display="none";//切换为隐藏状态
                i_id.src=off_img;
                }//换图

}

function showhide(t_id,i_id){//显示隐藏程序
        var t_id;//表格ID
        var i_id;//图片ID
        var on_img="images/minus.gif";//打开时图片
        var off_img="images/plus.gif";//隐藏时图片
                if (t_id.style.display == "none") {//如果为隐藏状态
                t_id.style.display="";//切换为显示状态
                i_id.src=on_img;//换图
}
        else{//否则
                t_id.style.display="none";//切换为隐藏状态
                i_id.src=off_img;
                }//换图

}

-->

</SCRIPT>

      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TBODY>
        <TR>
          <TD width=150 background=images/leftmanu_topbg.gif><IMG 
            height=30 src="images/leftmanu_top.gif" 
        width=150></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TBODY>
        <TR>
          <TD class=leftmenu4 height=29><STRONG><A class=linkstyle2 
            href="indexinfo.jsp"><img src=images/home.jpg border=0></a></STRONG> <IMG height=9 
            src="images/now.gif" width=12 align=absMiddle></TD></TR>
        <TR>
          <TD class=leftmenu1 
            onclick=javascript:menu_display(table1,img1);><IMG id=img1 
            src="images/fold_2.gif" align=absMiddle> <font color=ffffff>商业机会工具</font></TD></TR>
        <TBODY id=table1><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="addsj.jsp">发布商业机会</A> 
          </TD></TR><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glsj.jsp">管理我的信息</A> 
          </TD></TR><!-- 正常情况下  --> 

        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="addshow.jsp">发布展示产品</A> 
          </TD></TR><!-- 正常情况下  --> <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glshow.jsp">管理展示产品</A> 
          </TD></TR><!-- 正常情况下  -->


        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="photo.jsp">管理我的图片</A>
          </TD></TR>



        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="Favorit.jsp">商机收藏夹</A>
          </TD></TR>


        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="dingzhisj.jsp">定制我的商机</A> <img src=images/tj.gif alt="推荐使用">
          </TD></TR>




</TBODY>
        <TBODY>
        <TR>
          <TD class=leftmenu1 onclick=menu_display(table2,img2)><IMG id=img2 
            src="images/fold_2.gif" align=absMiddle> <font color=ffffff>查看商业往来</font></TD></TR>
        <TBODY id=table2><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="mymessage.jsp">查看我的留言</A> 
          </TD></TR><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="friend.jsp">我的商业朋友</A> 
          </TD></TR><!-- 正常情况下  -->
       

        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="job.jsp">发布招骋信息</A> 
          </TD></TR><!-- 正常情况下  -->

        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="gljob.jsp">管理招骋信息</A> 
          </TD></TR><!-- 正常情况下  -->
  <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="../web/index.jsp?id=<%=(String) session.getAttribute("userid")%>" target="_blank">访问我的网站</A> 
          </TD></TR>

  <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glweb.jsp">管理我的网站</A> 
          </TD></TR>





</TBODY>
        <TBODY>
        <TR>
          <TD class=leftmenu1 onclick=menu_display(table3,img3)><IMG id=img3 
            src="images/fold_1.gif" align=absMiddle> <font color=ffffff>会员档案中心</font></TD></TR>
        <TBODY id=table3><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="modimem.jsp">修改联系信息</A> 
          </TD></TR><!-- 正常情况下  -->
       
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="modipass.jsp">修改密码</A> 
          </TD></TR><!-- 正常情况下  -->
 <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='http://china.alibaba.com/sms/turbine/template/sms%2CManagePage'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="../union">免费推广网站</A> 
          </TD></TR><!-- 正常情况下  -->

     

        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href=renzheng.jsp?id=<%=(String) session.getAttribute("loginname")%> target="_blank">我的企富档案</A> 
          </TD></TR>

</TBODY>
        <TBODY>
        <TR>
          <TD class=leftmenu1 onclick=menu_display(table4,img4)><IMG id=img4 
            src="images/fold_1.gif" align=absMiddle> <font color=ffffff>商人服务中心</font></TD></TR>
        <TBODY id=table4>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="../book/addbook.jsp" 
            >发布我的话题</A> </TD></TR>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glbook.jsp" 
            >查看我的话题</A> </TD></TR>
 <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="gongju.jsp" >我的日常工具箱</A> </TD></TR>
 
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="../qifotong.jsp" 
            target=_blank>升级高级会员</A> </TD></TR>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="../let" 
            target=_blank>加盟企富网赚大钱</A> </TD></TR>
        </TBODY>
        <TBODY>
        <TR>
          <TD class=leftmenu1 ><IMG 
            id=img5 src="images/leftmenu_help.gif" align=absMiddle> 
        疑问及建议</TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width="94%" border=0>
       
 <FORM name=adv action=../finaler/send.jsp  method=post>

<input name=sendmem value="<%=(String) session.getAttribute("loginname")%>" type=hidden>
        <TBODY>
        <TR align=middle>
          <TD class=index_content colSpan=2><TEXTAREA style="BORDER-RIGHT: #7e9eb7 1px solid; BORDER-TOP: #7e9eb7 1px solid; BORDER-LEFT: #7e9eb7 1px solid; COLOR: #000000; BORDER-BOTTOM: #7e9eb7 1px solid" name=content rows=4 cols=18></TEXTAREA></TD></TR>
        <TR align=middle>
          <TD class=index_content colSpan=2>



<INPUT type=image src="images/servicesend.gif"  align=middle border=0 name=I6></TD></TR></FORM></TBODY></TABLE>
     