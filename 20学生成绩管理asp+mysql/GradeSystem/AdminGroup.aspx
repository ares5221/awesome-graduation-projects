<%@ Page language="c#" Codebehind="AdminGroup.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminGroup" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminGroup</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="500" border="1">
					<TR>
						<TD>请选择组:
							<asp:DropDownList id="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;
							<asp:Label id="Label1" runat="server"></asp:Label>&nbsp;
							<asp:Button id="Button2" runat="server" Text="删除所选组"></asp:Button>&nbsp;
							<asp:Button id="Button1" runat="server" Text="添加新组"></asp:Button></TD>
					</TR>
					<TR>
						<TD>
							<asp:DataGrid id="DataGrid1" runat="server" AutoGenerateColumns="False" Width="440px" AllowPaging="True">
								<HeaderStyle BackColor="#CCCC66"></HeaderStyle>
								<Columns>
									<asp:TemplateColumn HeaderText="选择">
										<ItemTemplate>
											<asp:CheckBox ID="chkExPort" Checked Runat="server"></asp:CheckBox>
										</ItemTemplate>
										<EditItemTemplate>
											<asp:CheckBox ID="chkExPortON" Runat="server"></asp:CheckBox>
										</EditItemTemplate>
									</asp:TemplateColumn>
									<asp:BoundColumn DataField="id" HeaderText="序号"></asp:BoundColumn>
									<asp:BoundColumn DataField="UrlName" HeaderText="功能模块"></asp:BoundColumn>
									<asp:BoundColumn DataField="Url" HeaderText="Url地址"></asp:BoundColumn>
								</Columns>
								<PagerStyle NextPageText="下一页" PrevPageText="上一页"></PagerStyle>
							</asp:DataGrid></TD>
					</TR>
					<TR>
						<TD>
							<asp:Button id="cmdSelectAll" runat="server" Text="全选"></asp:Button>
							<asp:Button id="cmdSP" runat="server" Text="设置权限"></asp:Button><FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								(注:超级管理组不可删除!)</FONT></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
