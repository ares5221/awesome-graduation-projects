<%@ Page language="c#" Codebehind="AdminTeacher.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminTeacher" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminTeacher</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<asp:Button id="Button1" runat="server" Text="添加授课信息"></asp:Button><br>
				<br>
				<asp:DataGrid id="DataGrid1" runat="server" AllowPaging="True" Width="400px" AutoGenerateColumns="False">
					<HeaderStyle BackColor="#CCCC66"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="教师名" ReadOnly="True" HeaderText="教师名"></asp:BoundColumn>
						<asp:BoundColumn DataField="课程号" HeaderText="课程号"></asp:BoundColumn>
						<asp:BoundColumn DataField="学时数" HeaderText="学时数"></asp:BoundColumn>
						<asp:BoundColumn DataField="班级名" HeaderText="班级名"></asp:BoundColumn>
						<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="更新" CancelText="取消" EditText="编辑"></asp:EditCommandColumn>
						<asp:ButtonColumn Text="删除" CommandName="Delete"></asp:ButtonColumn>
					</Columns>
					<PagerStyle NextPageText="下一页" PrevPageText="上一页"></PagerStyle>
				</asp:DataGrid>
			</FONT>
		</form>
	</body>
</HTML>
