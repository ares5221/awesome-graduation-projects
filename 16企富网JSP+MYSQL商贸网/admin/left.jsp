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
            href="finaler.jsp"><img src=images/home.jpg border=0></a></STRONG> <IMG height=9 
            src="images/now.gif" width=12 align=absMiddle></TD></TR>
        <TR>
          <TD class=leftmenu1 
            onclick=javascript:menu_display(table1,img1);><IMG id=img1 
            src="images/fold_2.gif" align=absMiddle> <font color=ffffff>会员管理区</font></TD></TR>
        <TBODY id=table1><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="newmem.jsp">最新注册会员</A> 
          </TD></TR><!-- 正常情况下  -->  

        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="ptmem.jsp">普通使用会员</A> 
          </TD></TR><!-- 正常情况下  -->
       
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="comeon.jsp">企富通申请会员</A> 
          </TD></TR><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="qftmem.jsp">企富通会员</A> 
          </TD></TR><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="fmem.jsp">被冻结会员</A> 
          </TD></TR><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="allmem.jsp">所有注册会员</A> 
          </TD></TR><!-- 正常情况下  -->

</TBODY>






        <TBODY>
        <TR>
          <TD class=leftmenu1 onclick=menu_display(table2,img2)><IMG id=img2 
            src="images/fold_2.gif" align=absMiddle> <font color=ffffff>代理管理区</font></TD></TR>
        <TBODY id=table2><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="newdl.jsp">最新申请加盟</A> 
          </TD></TR><!-- 正常情况下  -->
        
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="yesdl.jsp">正常营业分站</A> 
          </TD></TR><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="nodl.jsp">无权营业分站</A> 
          </TD></TR><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="alldomain.jsp">所有分配域名</A> 
          </TD></TR><!-- 正常情况下  -->
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="china.jsp">全国代理情况</A> 
          </TD></TR><!-- 正常情况下  -->

        <TBODY>
        <TR>
          <TD class=leftmenu1 onclick=menu_display(table4,img4)><IMG id=img4 
            src="images/fold_1.gif" align=absMiddle> <font color=ffffff>网站信息管理区</font></TD></TR>
        <TBODY id=table4>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glsj.jsp" 
            >商机信息管理</A> </TD></TR>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glshow.jsp" 
            >产品展会操作</A> </TD></TR>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="photo.jsp" 
            >所有图片管理</A> </TD></TR>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glzixun.jsp" 
            >行业资讯操作</A> </TD></TR>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glbook.jsp" 
            >商人话题操作</A> </TD></TR>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="gljob.jsp" 
            >招骋信息操作</A> </TD></TR>
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="window.open('#')" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="glunion.jsp" 
            >网站登录操作</A> </TD></TR>

        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="allmessage.jsp">查看所有留言</A> 
          </TD></TR><!-- 正常情况下  -->

        </TBODY>



      


        <TBODY>
        <TR>
          <TD class=leftmenu1 onclick=menu_display(table3,img3)><IMG id=img3 
            src="images/fold_1.gif" align=absMiddle> <font color=ffffff>留言交流操作</font></TD></TR>
        <TBODY id=table3><!-- 正常情况下  -->
               
          </TD></TR><!-- 正常情况下  -->
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
            href="sendalldl.jsp">给所有办事处留言</A> 
</TBODY>




  <TBODY>
        <TR>
          <TD class=leftmenu1 onclick=menu_display(table3,img3)><IMG id=img3 
            src="images/fold_1.gif" align=absMiddle> <font color=ffffff>管理员档案中心</font></TD></TR>
        <TBODY id=table3><!-- 正常情况下  -->
               
        <TR>
          <TD class=leftmenu2><IMG onmouseover="this.style.cursor='hand'" 
            onclick="location.href='#'" 
            src="images/plus.gif"> <A class=linkstyle2 
            href="modipass.jsp">修改密码</A> 
          </TD></TR><!-- 正常情况下  -->

       

</TBODY>
       </TABLE>


     