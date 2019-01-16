<%@ Page language="c#" Codebehind="AdminCourseAdd.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminCourseAdd" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminCourseAdd</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="300" border="1">
					<TR>
						<TD>课程号</TD>
						<TD>
							<asp:TextBox id="txtid" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="txtid"></asp:RequiredFieldValidator></TD>
					</TR>
					<TR>
						<TD>课程名
						</TD>
						<TD>
							<asp:TextBox id="txtname" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="必填" ControlToValidate="txtname"></asp:RequiredFieldValidator></TD>
					</TR>
					<TR>
						<TD>先修课
						</TD>
						<TD>
							<asp:TextBox id="txtpre" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>
						</TD>
						<TD>
							<asp:Button id="Button1" runat="server" Text="添  加"></asp:Button>&nbsp;
							<asp:Button id="Button2" runat="server" Text="返 回"></asp:Button>
						</TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
