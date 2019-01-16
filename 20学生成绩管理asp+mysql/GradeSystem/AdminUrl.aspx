<%@ Page language="c#" Codebehind="AdminUrl.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminUrl" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminUrl</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体"><a href="AdminUrlAdd.aspx">功能模块添加</a>
				<asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False" AllowPaging="True">
					<HeaderStyle BackColor="#CCCC66"></HeaderStyle>
					<Columns>
						<asp:BoundColumn DataField="Id" HeaderText="序号">
							<ItemStyle Width="30px"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="url" HeaderText="模块URL">
							<ItemStyle Width="150px"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="UrlName" HeaderText="模块名称">
							<ItemStyle Width="150px"></ItemStyle>
						</asp:BoundColumn>
						<asp:BoundColumn DataField="Comment" HeaderText="说明">
							<ItemStyle Width="250px"></ItemStyle>
						</asp:BoundColumn>
						<asp:HyperLinkColumn Text="删除" DataNavigateUrlField="id" ItemStyle-Width="30" DataNavigateUrlFormatString="AdminUrlDel.aspx?id={0}"
							HeaderText="删除" NavigateUrl="AdminUrlDel.aspx"></asp:HyperLinkColumn>
					</Columns>
					<PagerStyle NextPageText="下一页" PrevPageText="上一页"></PagerStyle>
				</asp:DataGrid></FONT>
		</form>
	</body>
</HTML>
