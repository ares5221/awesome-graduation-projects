<!--#include file = "Startup.asp"-->

<%

' ======================
' 功能：增加新闻
' 描述：提供一个新增表单，包括新闻标题和新闻内容，新闻内容使用eWebEditor进行编辑；
'       同时接收上传文件，以便删除新闻时，同时删除上传文件；
'       并由编辑区中上传的文件，提供标题新闻的图片选择。
' ======================

Call Header("增加新闻")
Call Content()
Call Footer()


' 本页内容区
Sub Content()
	%>

	<Script Language=JavaScript>
	// 当上传图片等文件时，往下拉框中填入图片路径，可根据实际需要更改此函数
	function doChange(objText, objDrop){
		if (!objDrop) return;
		var str = objText.value;
		var arr = str.split("|");
		var nIndex = objDrop.selectedIndex;
		objDrop.length=1;
		for (var i=0; i<arr.length; i++){
			objDrop.options[objDrop.length] = new Option(arr[i], arr[i]);
		}
		objDrop.selectedIndex = nIndex;
	}

	// 表单提交客户端检测
	function doSubmit(){
		if (document.myform.d_title.value==""){
			alert("新闻标题不能为空！");
			return false;
		}
		// getHTML()为eWebEditor自带的接口函数，功能为取编辑区的内容
		if (eWebEditor1.getHTML()==""){
			alert("新闻内容不能为空！");
			return false;
		}
		document.myform.submit();
	}
	</Script>
	
	<form action="addsave.asp" method="post" name="myform">
	<% '取源文件名 %>
	<input type=hidden name=d_originalfilename>
	<% '取保存的方件名，如果不要带路径的填充下拉框，可以在下面的表单项加入onchange事件 %>
	<input type=hidden name=d_savefilename>
	<% '取保存的文件名（带路径），使用带路径的填充下拉框 %>
	<input type=hidden name=d_savepathfilename onchange="doChange(this,document.myform.d_picture)">

	<table cellspacing=3 align=center>
	<tr>
		<td>新闻标题：</td>
		<td><input type="text" name="d_title" value="" size="90"></td>
	</tr>
	<tr>
		<td>标题图片：</td>
		<td><select name="d_picture" size=1><option value=''>无</option></select> 当编辑区有插入图片时，将自动填充此下拉框</td>
	</tr>
	<tr>
		<td>新闻内容：</td>
		<td>
			<%
			' ewebeditor.asp文件调用的参数：
			'	id：下面表单项textarea的名称，在此表单中是d_content，注意大小写
			'	style：编辑器的样式名称，可在eWebEditor的后台设置
			'	originalfilename：用于获取源文件名的表单项名，在此表单中是d_originalfilename
			'	savefilename：用于获取保存文件名的表单项名，在此表单中是d_savefilename
			'	savepathfilename：用于获取保存带路径文件名的表单项名，在此表单中是d_savepathfilename
			%>
			<textarea name="d_content" style="display:none"></textarea>
			<iframe ID="eWebEditor1" src="../../ewebeditor.asp?id=d_content&style=s_newssystem&originalfilename=d_originalfilename&savefilename=d_savefilename&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="550" HEIGHT="350"></iframe>
		</td>
	</tr>
	</table>
	<p align=center><input type=button name=btnSubmit value=" 提 交 " onclick="doSubmit()"> <input type=reset name=btnReset value=" 重 填 "></p>
	</form>

	<%
End Sub

%>

