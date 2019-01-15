<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookMaintain.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table{
			text-align: center;
			font-size: 12px;
		}
	</style>

  </head>
  
  <body>
    <form action="servlet/LibraryServlet?method=bookShowBy" method="post">
    	<table  align="center" style="margin-top: 30px">
    		<tr>
    			
    			<td>
    				<input type="hidden" name="index" id="index" value="${pageBean.index }">
    				<input type="hidden" name="size" id="size" value="${pageBean.size }">
    				书号：<input type="text" name="bookId" value="${bookId }">
    			</td>
    			<td>
    				书名：<input type="text" name="bookName" value="${bookName }">
    			</td>
    			<td>
    				出版社：<input type="text" name="press" value="${press }">
    			</td>
    			<td><input type="submit" value="提交"></td>
    		</tr>
    	</table>
    </form>
   	<table align="center" width="80%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
		<tr>
			<td width="20%" height="20" align="center" bgcolor="#EEEEEE">书号</td>
			<td width="20%" align="center" bgcolor="#EEEEEE">书名</td>
			<td width="20%" align="center" bgcolor="#EEEEEE">出版社</td>
			<td width="10%" align="center" bgcolor="#EEEEEE">单价</td>
			<td width="10%" align="center" bgcolor="#EEEEEE">库存数量</td>
			<td width="10%" align="center" bgcolor="#EEEEEE">维护</td>
			
		</tr>
		<c:forEach items="${pageBean.list }" var="book">
			<tr bgcolor="#FFFFFF">
			<td height="20" >${book.bookId }</td>
			<td >${book.bookName }</td>
			<td >${book.press }</td>
			<td >${book.price }</td>
			<td >${book.count }</td>
			<td >
				<input type="button" value="更改" onclick="updateBook('${book.bookId }')">
				<input type="button" value="删除" onclick="deleteBook('${book.bookId }')">
			</td>
		</tr>
		</c:forEach>
		<tr>
			
			<td colspan="11" bgcolor="#FFFFFF">
				<c:if test="${pageBean.index==1 }">首页</c:if>
				<c:if test="${pageBean.index!=1 }">
					<a href="javascript:change(1,${pageBean.size })">首页</a>
				</c:if>
				
				<c:if test="${pageBean.index==1 }">
					上一页
				</c:if>
				<c:if test="${pageBean.index!=1 }">
					<a href="javascript:change(${pageBean.index-1 },${pageBean.size })">上一页</a>
				</c:if>
				<c:forEach items="${pageBean.numbers }" var="number">
					<c:if test="${number==pageBean.index }">
						<a href="javascript:change(${number },${pageBean.size })">[${number }]</a>
					</c:if>
					<c:if test="${number!=pageBean.index }">
						<a href="javascript:change(${number },${pageBean.size })">${number }</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageBean.index==pageBean.totalPageCount }">
					下一页
				</c:if>
				<c:if test="${pageBean.index!=pageBean.totalPageCount }">
					<a href="javascript:change(${pageBean.index+1 },${pageBean.size })">下一页</a>
				</c:if> 
				<c:if test="${pageBean.index==pageBean.totalPageCount }">末页</c:if>
				<c:if test="${pageBean.index!=pageBean.totalPageCount }">
					<a href="javascript:change(${pageBean.totalPageCount },${pageBean.size })">末页</a>
				</c:if>
				
				每页
				<select onchange="change(1,this.value)">
					<c:forEach begin="5" step="5" end="25" var="i">
						<c:if test="${pageBean.size==i }">
							<option value="${i }" selected="selected">${i }</option>
						</c:if>
						<c:if test="${pageBean.size!=i }">
							<option value="${i }">${i }</option>
						</c:if>
						
					</c:forEach>
				</select>
				条记录直接跳到第
				<input type="text" id="index1" size="5">页 
				<input type="button" value="go" onclick="changIndex(${pageBean.size})">
				共${pageBean.totalCount }条记录
			</td>
			
			
		</tr>
	</table>
    <script type="text/javascript">
    	function change(index,size){
			document.getElementById("index").value=index;
			document.getElementById("size").value=size;
			document.forms[0].submit();
		}
		function changIndex(size){
			var index=document.getElementById("index1").value;
			change(index,size);
		}
		function updateBook(bookId){
			location.href="servlet/LibraryServlet?method=toUpdateBook&bookId="+bookId;
		}
		function deleteBook(bookId){
			var flag=window.confirm("确认要删除该图书么？");
			if(flag){
				location.href="servlet/LibraryServlet?method=deleteBook&bookId="+bookId;
				
			}
			
		}
    </script>
  </body>
</html>
