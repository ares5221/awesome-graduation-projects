<%@ page language="java" import="java.util.*,com.umt.lab.vo.*"
	pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<script>
    function update(studentno){
    document.form1.currentEmp.value = studentno;
    document.form1.domethod.value = "toupdate5";
    document.form1.action = "labAction.do";
    document.form1.submit(); 
   }
  
    function del(studentno){
    document.form1.currentEmp.value = studentno;
    document.form1.domethod.value = "delete5";
    document.form1.action = "labAction.do";
    document.form1.submit(); 
    }
    
    function search(){
    document.form1.domethod.value = "seach5";
   // alert(document.form1.domethod.value);
    document.form1.action = "labAction.do";
    document.form1.submit(); 
    }
 
    
    


</script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #D2E8F6;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE1 {
	font-size: large;
	font-weight: bold;
}
-->
</style>
    <script src="time/time.js">
</script>
    
	</head>

	<body onload="check();">
	<table width="1000" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="img/til1.jpg" width="1000" height="71" /></td>
  </tr>
  <tr>
    <td><img src="img/banner1.jpg" width="1000" height="5" /></td>
  </tr>
    <tr>
<td background="img/lm_bg.jpg" class ="txtil"><img src="img/lm_banner1.jpg" width="25" height="33" />
    <a href="labAction.do?domethod=labAllSeach"> 最新实验信息</a>| <a href="labAction.do?domethod=SeachAllLab">实验记录 </a>|<a href="labAction.do?domethod=SeachArticle"> 实验室资料管理 </a>|<a href="labAction.do?domethod=SeachAllDemo"> 实验演示信息 </a>|<a href="labAction.do?domethod=SeachAllPeople"> 用户信息管理与成绩查询 </a>
    <img src="img/lm_banner9.jpg" width="141" height="33" /></td>
  </tr>
  <tr>
    <td><table width="1000" border="0" cellpadding="0" cellspacing="0" background="img/2lm_bg1.jpg" class="txt1">
      <tr>
        <td width="25" height="29">&nbsp;</td>
        <td width="13"><img src="img/2lm_banner1.jpg" width="13" height="29" /></td>
        <td align="left" background="img/2lm_bg2.jpg"><br></td>
        <td align="right" background="img/2lm_bg2.jpg">&nbsp;&nbsp;  <a href="labMain.jsp" class="txt1">返回首页</a> | <a href="login.jsp" class="txt1">退出登录</a></td>
        <td width="15"><img src="img/2lm_banner2.jpg" width="15" height="29" /></td>
        <td width="17">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="6" bgcolor="#D2E8F6"></td>
  </tr>
</table>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="28">&nbsp;</td>
    <td width="208" valign="top"><table width="208" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="4"><img src="img/left_banner1.jpg" width="208" height="8" /></td>
        </tr>
      <tr>
        <td width="1" bgcolor="#AFCBD9"></td>
        <td width="205" valign="top" bgcolor="E3F4FE"><table width="205" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td height="64" background="img/left_til_bg.jpg"><table width="180" border="0" align="center" cellpadding="4" cellspacing="0" class="txt1">
              <tr>
                <td><img src="img/conner1.jpg" width="18" height="17" align="absmiddle" />　用户名：管理员</td>
              </tr>
              <tr>
                <td><img src="img/conner2.jpg" width="15" height="15" align="absmiddle" />　登录时间：&nbsp;&nbsp; <div id="time1"></div><br></td>
              </tr>
              
            </table></td>
          </tr>
          <tr>
            <td height="1" bgcolor="A8CDE8"></td>
          </tr>
          <tr>
            <td height="1" bgcolor="#FFFFFF"></td>
          </tr>
          <tr>
            <td><table width="201" border="0" align="center" cellpadding="0" cellspacing="0" class="txt1" height="174">
              <tr >
                <td height="27">&nbsp;&nbsp;<div align="left">&nbsp;&nbsp;<font size="5">&nbsp;&nbsp;&nbsp; <font size="4"><a href="labInsert5.jsp" class="txt1">&nbsp;&nbsp;&nbsp;添加用户信息</a></font></font>
						    	</div> </td> 
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="27">&nbsp;&nbsp;&nbsp;</td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="27">&nbsp;&nbsp;&nbsp; </td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="1" background="img/xulin.jpg"></td>
              </tr>
              <tr>
                <td height="27">&nbsp;</td>
              </tr>
              <tr>
                <td height="1"></td>
              </tr>
              <tr>
                <td height="50">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          
        </table></td>
        <td width="1" bgcolor="FBFFFF"></td>
        <td width="1" bgcolor="#AFCBD9"></td>
      </tr>
      <tr>
        <td colspan="4"><img src="img/left_banner2.jpg" width="208" height="7" /></td>
        </tr>
    </table></td>
    <td width="6">&nbsp;</td>
    <td width="737" valign="top"><table width="737" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="4"><img src="img/body_til.jpg" width="737" height="8" /></td>
      </tr>
      <tr>
        <td width="1" bgcolor="#AFCBD9"></td>
        <td width="734" height="285" valign="top" bgcolor="E3F4FE"><table width="717" border="0" align="center" cellpadding="0" cellspacing="0" class="txt1">
          <tr>
            <td height="47" valign="bottom" background="img/infor_til.jpg">　　　&nbsp; 实验分组记录<font size="2"><strong></strong></font></td>
          </tr>
          <tr>
            <td valign="top"><table width="717" border="0" cellspacing="0" cellpadding="0">
              
              <tr>
                <td valign="top" bgcolor="#FFFFFF">
		    <table width="717" border="0" cellspacing="0" cellpadding="0">
              
          <tr>
<td width="1" rowspan="2" bgcolor="#62A1C4"></td>
              <td height="150" valign="top" background="" bgcolor="#FFFFFF" class="bg1">&nbsp;    
              
		<form name="form1" method="post" action="" class="txt1">
		 <!--定义一个影藏域，将点击修改后的信息放到currentemp中-->
			<input type="hidden" name="currentEmp" value="">
			<input type="hidden" name="domethod" value="">
			<center>
				
		
				<table border=1  class="txt1">
					

					<tr>
						<td colspan="12">
							<div align="left">

								学生姓名:
								<input type="text" name="studentname" value="">
								学号:
								<input type="text" name="studentno" value="">
								<input type="button" name="b3" value="确定" onclick="search();">
								<input type="hidden" name="seach5" value="">


							</div>
						</td>
					</tr>

					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							学号

						</td>
						<td>
							学生姓名
						</td>
						<td>
							性别
						</td>
						<td>
							出生日期
						</td>
						<td>
							年龄
						</td>
						<td>
							班级
						</td>
						<td>
							用户名
						</td>
						<td>
							实验名称
						</td>
						<td>
							学生成绩
						</td>
						
						<td>
							&nbsp;
						</td>

					</tr>

					<%       //将allemp中的值给a1
						        List al = (ArrayList)session.getAttribute("allemp");
								
								if(al.size()>0){
								String page1=request.getParameter("page");
                                int currentPage = 1;  
                                if(page1!=null){
     
                                currentPage = Integer.parseInt(page1);
                              }
                                int pageSize = 5;
                                int count = al.size();
                                int maxPage = (count+pageSize-1)/pageSize;
                                if(currentPage < 1){
                                currentPage = 1;
                               }else
                                if(currentPage>maxPage){
                                currentPage = maxPage;
                               }
                                labVo vo=  null;
                                int currentCount = (currentPage-1)*pageSize;
                                
                                for(int j = 0 ; j < pageSize;){
                                vo = (labVo)al.get(currentCount+j); 
                                
                   %>
                                
                                
                  
					<tr>
						<td>
							<input type="checkbox" name="id" value=" ">
						</td>
						<td>
							<%=vo.getStudentno()%>
						</td>
						<td>
							<%=vo.getStudentname()%>
						</td>
						<td>
							<%=vo.getSax()%>
						</td>

						
						<td>
							<%=vo.getBorndate()%>
						</td>
						<td>
							<%=vo.getAge()%>
						</td>
						<td>
							<%=vo.getClassname()%>
						</td>
						<td>
							<%=vo.getUsername()%>
						</td>
						
						<td>
							<%=vo.getLabname()%>
						</td>
						<td>
							<%=vo.getFraction()%>
						</td>

						<td>
							&nbsp;&nbsp;
							<input type="button" name="b1" value="修改"
								onclick="update(<%=vo.getStudentno()%>);">
							&nbsp;&nbsp;
							<input type="button" name="b2" value="删除"
								onclick="del(<%=vo.getStudentno()%>);">

						</td>
					</tr>

					<%
						j++ ;
						if((currentCount+j)>count-1){
						   break;
						     }
						}
						%>
					<tr>
						<td colspan="11" align="right">
							当前位置 :
							<font color="red"><%=currentPage%>/<%=maxPage%></font>&nbsp;&nbsp;
							<%
                            if(currentPage>1){
                            %>
							<a href="labPeopleManager.jsp?page=1"> 首页 </a>&nbsp;&nbsp;
							<a href="labPeopleManager.jsp?page=<%=currentPage-1%>"> 上一页</a>&nbsp;&nbsp;
							<% 
                            }
                            if(currentPage<maxPage){
                             %>
							<a href="labPeopleManager.jsp?page=<%=currentPage+1%>">下一页 </a>
							&nbsp;&nbsp;
							<a href="labPeopleManager.jsp?page=<%=maxPage%>"> 尾页</a>
							<%}
							}else{
							   out.println("<script >alert('您查询的信息不存在 ');</script>");
							}%>

						</td>
					</tr>

				</table>
		</form>
	</body>
</html>
