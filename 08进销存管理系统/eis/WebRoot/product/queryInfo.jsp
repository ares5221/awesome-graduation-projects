<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 待销售商品查询 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
			
		<!-- <a href="javascript:;" onclick="sellGoods('商品销售','/eis/product/sellGoods.jsp','','510')" class="btn btn-primary radius">
		<i class="Hui-iconfont">&#xe600;</i> 商品销售</a></span> &nbsp; -->
		 
		&nbsp;<a href="javascript:;" onclick="querySalesRecord('销售记录查询','servlet/SPServlet?method=querySalesRecord','1000','550')" class="btn btn-primary radius">
			<!-- <i class="Hui-iconfont">&#xe600;</i> --> 销售记录查询</a>
	</div>
	
	<div class="mt-20">
 	<table class="table table-border table-bordered table-hover table-bg table-sort"> 
		<thead>
			<tr class="text-c">
				<th width="80px">ID</th>
				<th width="130px">商品名称</th>
				<th width="40px">简称</th>
				<th width="90px">产地</th>
				<th width="80">规格</th>
				<th width="80px">包装</th>
				<th width="">单位</th>
				<th width="70px">单价</th>
				<th width="70px">销售单价</th>
				<th width="100px">库存数量</th>
				<th width="100px">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${kcList }" var="kc">
				<tr class="text-c">
					<td>${kc.id }</td>
					<td>${kc.spName }</td>
					<td>${kc.jc }</td>
					<td>${kc.cd }</td>
					<td>${kc.gg }</td>
					<td>${kc.cd }</td>
					<td>${kc.dw }</td>
					<td>${kc.dj }</td>
					<td>${kc.xsjg }</td>
					<td>${kc.kcsl }</td>
					<td>
					<%-- <a href="product/sellGoods.jsp?id=${kc.id}">销售商品</a> --%>
					<a href="javascript:;" onclick="sellGoods('销售商品','product/sellGoods.jsp?id=${kc.id}','4','','510')" >销售商品</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
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
/*商品管理-商品销售*/
function sellGoods(title,url,id,w,h){
	layer_show(title,url,w,h);
	
}
/*商品管理-商品销售记录查询*/
function querySalesRecord(title,url,w,h){
	layer_show(title,url,w,h);
}

</script> 
</body>
</html>