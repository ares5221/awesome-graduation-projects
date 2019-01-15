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
    

    <title>添加房屋信息</title>
    
    
    <style type="text/css">
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-size:14px;}
		#allmap {width:100%;height:500px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=8s5TidpmHI6e6B8cSSg3XpUNMNtzWxKm"></script>
    
    
    
    
    
    
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="resource/js/CheckForm.js"></script>
	
<LINK href="resource/css/admin.css" type=text/css
			rel=stylesheet>
	

<script type="text/javascript"
			src="resource/js/CheckForm.js"></script>
		<script type="text/javascript"
			src="resource/js/My97DatePicker/WdatePicker.js"></script>		
	 </head>
  
  <body>


<form action="servlet/HouseServlet?method=modify&house_ID=${house.house_ID }" method="post" name="form2" >
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
<tr class=editHeaderTr>
<td class=editHeaderTd colSpan=7>  请修改房屋的详细信息
</td>
</tr>  
  <tr>
    <td width="19%" bgcolor="#FFFDF0"><div align="center" >房屋地址：</div></td>
    <td colspan="3" bgcolor="#FFFFFF" >
    <input type="text"  style=" width: 100%"  maxlength="20"  name="house_address"  id="houseAddress"
    value="${house.house_address }" onblur="send()" required="required">
      </td>
   <td width="19%" bgcolor="#FFFDF0"><div align="center">房屋业主：</div></td>
    			<td width="*">
   							
   										
   										
   										
   										
   										
   										<select  style="width: 100%" id="houseType" name="customer_ID">
												<c:forEach items="${cusList }" var="cus">
														<c:if test="${cus.customer_ID==house.customer.customer_ID}"  >
																<option value="${cus.customer_ID}" selected="selected">${cus.customer_name }</option>
														
														</c:if>
														<c:if test="${cus.customer_ID!=house.customer.customer_ID}">
																<option value="${cus.customer_ID}" >${cus.customer_name }</option>
														
														</c:if>
												
												</c:forEach>
												
										</select>
   							
   				</td>   
      
      
    </tr> 
   
   <tr>
   				<td width="19%" bgcolor="#FFFDF0"><div align="center">房屋管理员：</div></td>
    			<td>
   							
   										<select  style="width: 200px" id="houseType" name="user_ID">
												<c:forEach items="${userList }" var="userl" >
														<c:if test="${userl.user_ID==house.user.user_ID }">
																<option value="${userl.user_ID }" selected="selected">${userl.user_name }</option>
														
														</c:if>
														<c:if test="${userl.user_ID!=house.user.user_ID }">
																<option value="${userl.user_ID }" >${userl.user_name }</option>
														
														</c:if>
												
												</c:forEach>
												
										</select>
   							
   							
   				</td>
   				<td width="19%" bgcolor="#FFFDF0"><div align="center">房屋类型：</div></td>
    			<td>
   							<select  style="width: 200px" id="houseType" name="type_ID">
												<c:forEach items="${hTypeList }" var="hType" >
														<c:if test="${hType.type_ID==house.house_type.type_ID }">
																<option value="${hType.type_ID }" selected="selected">${hType.type_name }</option>
														
														</c:if>
														<c:if test="${hType.type_ID!=house.house_type.type_ID }">
																<option value="${hType.type_ID }" >${hType.type_name }</option>
														
														</c:if>
												
												</c:forEach>
												
										</select>
   										
   							
   							
   				</td>
   				<td width="19%" bgcolor="#FFFDF0"><div align="center">房屋价格：</div></td>
    			<td width="*">
   							
   										<input  type="text" width="100%" value="${house.house_price }" name="house_price" required="required">
   							
   							
   				</td>
   				
   </tr>
    
   <tr>
   							
   
   </tr>
   
  <tr>
    <td bgcolor="#FFFDF0" align="center"><div align="center">房屋描述：
    		
    	<c:if test="${sessionScope.user.user_ID!= house.user.user_ID }">
    					<c:if test="${house.is_used =='1'}">
    							(房屋有人使用)
    		
			    		</c:if>
			    		<c:if test="${house.is_used!='1' }">
			    				(房屋无人使用)
			    		
			    		</c:if>
			    	
    	
    	</c:if>
    		</div>
   				<c:if test="${sessionScope.user.user_ID== house.user.user_ID }">
				    		<select  style="width: 100px" id="" name="is_used">
				    				<option value="1" >房屋有人使用</option>
				    				<option value="0" >房屋无人使用</option>
				    		</select>
   				</c:if>
    		
    		</td>
    <td colspan="5" bgcolor="#FFFFFF"><textarea  rows="10" name="house_ambient"   style="width:100%; resize:none; " >${house.house_ambient }</textarea>
      &nbsp;</td>
    </tr>
 
</table>
<table class=editTable cellSpacing=1 cellPadding=0 width="100%" align=center border=0>
  <tr bgcolor="#ECF3FD">
    		<td width="25%"></td>
    				<c:if test="${sessionScope.user.user_ID== house.user.user_ID }">
							<td width="17%"><input type="submit" name="Submit"  value="修改提交" class="button"></td>
					</c:if>
					<td width="4%"><input type="button" name="button"  onClick="history.back() "  value="返回"></td>
					<td width="43%"></td>
  </tr>
</table>
${mess }
</form>
				<div style="background: #fff;overflow: auto;width:1000px ;position:relative;left:30px">
						<p>双击地图展示详细地址</p>
	 					<div id="allmap"></div>
				</div>
</body>
 <script type="text/javascript">
 var houseAddress;

  
  
	// 百度地图API功能
	//地址解析功能
	
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);
	// 创建地址解析器实例
	// 将地址解析结果显示在地图上,并调整地图视野
	 window.onload=function(){ 
  houseAddress=document.getElementById("houseAddress").value;
	  //alert(houseAddress);
		var myGeo = new BMap.Geocoder();
		myGeo.getPoint(houseAddress, function(point){
			if (point) {
				map.centerAndZoom(point, 16);
				map.addOverlay(new BMap.Marker(point));
			}else{
				alert("您选择地址没有解析到结果!");
			}
		}, "北京市");
  }

	// 百度地图API功能
	//缩放功能
	
	map.centerAndZoom(new BMap.Point(116.4035,39.915),8); 
	setTimeout(function(){
		map.setZoom(14);   
	}, 2000);  //2秒后放大到14级
	map.enableScrollWheelZoom(true);

	// 百度地图API功能
	//地址你解析
	
	
	var geoc = new BMap.Geocoder();    

	map.addEventListener("dblclick", function(e){        
		var pt = e.point;
		geoc.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
			//alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
			var flag=confirm("点击地址为："+addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber+
					"\n需要把此地址值放入房屋地址栏当中吗");
			if(flag){
					document.getElementById("houseAddress").value=addComp.province +" "+addComp.city+" "+addComp.district+" "+addComp.street+" "+addComp.streetNumber;
				
			}
			
		});        
	});
</script>
	
</html>


