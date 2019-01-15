<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="../static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>

  <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l"><a href="javascript:;" onclick="deletes()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a>
    <a href="javascript:" onclick="member_add('添加用户','/eis/client/client-add.jsp')" class="btn btn-primary radius"><i class="icon-plus"></i> 添加用户</a></span>
  </div>
    <form action="ClientServlet?method=deletes" method="post" id="form1">
  <table class="table table-border table-bordered table-hover table-bg table-sort">
    <thead>
      <tr class="text-c">
        <th width="25"><input type="checkbox" name="" value=""></th>
        <th width="25">ID</th>
        <th width="100">客户全称</th>
        <th width="90">客户简称</th>
        <th width="130">客户地址</th>
        <th width="70">邮政编码</th>
        <th width="100">电话</th>
        <th width="130">传真</th>
        <th width="70">联系人</th>
        <th width="100">E—Mail</th>
        <th width="50">开户银行</th>
        <th width="100">银行账号</th>
        <th width="">操作</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${khList }" var="kh">
      <tr class="text-c">
        <td><input type="checkbox" value="${kh.khid }" name="idarr"></td>
        <td>${kh.khid }</td>
        <td>${kh.khname }</td>
        <td>${kh.jian }</td>
        <td>${kh.address }</td>
        <td>${kh.bianma }</td>
        <td>${kh.tel }</td>
        <td>${kh.fax }</td>
        <td>${kh.lian }</td>
        <td>${kh.mail }</td>
        <td>${kh.yinhang }</td>
        <td>${kh.hao }</td>
        <td class="td-manage">
			<a title="编辑" href="javascript:;" onclick="member_edit('编辑','/eis/servlet/ClientServlet?method=toupdate&id=${kh.khid }','4','','510')" class="ml-5" style="text-decoration:none">
			<i class="Hui-iconfont">&#xe6df;</i></a> 
			<a title="删除" href="javascript:;" onclick="member_del(this,'${kh.khid }')" class="ml-5" style="text-decoration:none">
			<i class="Hui-iconfont">&#xe6e2;</i></a>
		</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
    </form>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="../lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
	
});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'ClientServlet?method=delete',
			dataType: 'json',
			data:{"id":id},
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
function deletes(){
	document.getElementById("form1").submit();
}
</script> 
</body>
</html>