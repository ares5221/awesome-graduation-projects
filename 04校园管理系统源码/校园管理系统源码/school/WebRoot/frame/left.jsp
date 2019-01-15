<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>"></base>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active");
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
});	
</script>


</head>

<body style="background:#f0f9fd;">
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>档案管理
    </div>
    	<ul class="menuson">
	        <li><cite></cite><a href="file/studentInfo.jsp" target="rightFrame">学生基本信息</a><i></i></li>
	        <li><cite></cite><a href="file/studentRegister.jsp" target="rightFrame">学生入校登记</a><i></i></li>
	        <li><cite></cite><a href="servlet/StudentServlet?method=show" target="rightFrame">学生信息维护</a><i></i></li>
	        <li><cite></cite><a href="servlet/StudentServlet?method=showCheckedIn" target="rightFrame">学生登记查询</a><i></i></li>
	        <li><cite></cite><a href="servlet/TeacherServlet?method=toRegister" target="rightFrame">教师基本信息</a><i></i></li>
	        <li><cite></cite><a href="servlet/TeacherServlet?method=show" target="rightFrame">教师信息维护</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>成绩管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="score/scoreRegister.jsp" target="rightFrame">成绩录入</a><i></i></li>
        <li><cite></cite><a href="score/scoreList.jsp" target="rightFrame">成绩查询</a><i></i></li>
        </ul>     
    </dd> 
    
    
    <dd><div class="title"><span><img src="images/leftico03.png" /></span>教职工管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="servlet/CourseServlet?method=selectAllCourse" target="rightFrame">教职任课</a><i></i></li>
        <li><cite></cite><a href="teacher/teacherSelectCourse.jsp" target="rightFrame">任班主任</a><i></i></li>
        <li><cite></cite><a href="teacher/teacherInCharge.jsp" target="rightFrame">任课教师查询</a><i></i></li>
        <li><cite></cite><a href="teacher/teacherPosition.jsp" target="rightFrame">班主任查询</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="images/leftico04.png" /></span>图书馆管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="library/bookRegister.jsp" target="rightFrame">图书登记</a><i></i></li>
        <li><cite></cite><a href="servlet/LibraryServlet?method=bookShowBy" target="rightFrame">图书维护</a><i></i></li>
        <li><cite></cite><a href="library/bookBorrow.jsp" target="rightFrame">图书借阅</a><i></i></li>
        <li><cite></cite><a href="library/bookReturn.jsp" target="rightFrame">图书归还</a><i></i></li>
        <li><cite></cite><a href="library/borrowSelect.jsp" target="rightFrame">借阅查询</a><i></i></li>
    </ul>
    </dd>   
    
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>代码维护
    </div>
    	<ul class="menuson">
	        <li ><cite></cite><a href="servlet/MajorServlet?method=showMajor" target="rightFrame">专业代码维护</a><i></i></li>
	        <li><cite></cite><a href="servlet/MajorServlet?method=showGrade" target="rightFrame">年级代码维护</a><i></i></li>
	        <li><cite></cite><a href="servlet/MajorServlet?method=showClass" target="rightFrame">班级代码维护</a><i></i></li>
	        <li><cite></cite><a href="servlet/MajorServlet?method=showCourse" target="rightFrame">学科代码维护</a><i></i></li>
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>用户维护
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="User/UserRegister.jsp" target="rightFrame">用户添加</a><i></i></li>
        <li><cite></cite><a href="servlet/UserServlet?method=findAll" target="rightFrame">用户查询</a><i></i></li>
        </ul>     
    </dd> 
    
    </dl>
    
</body>
</html>

