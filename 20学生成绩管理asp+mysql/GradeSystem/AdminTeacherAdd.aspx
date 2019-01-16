<%@ Page language="c#" Codebehind="AdminTeacherAdd.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminTeacherAdd" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminTeacherAdd</title>
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
						<TD>教师名</TD>
						<TD>
							<asp:TextBox id="txtTname" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>课程号
						</TD>
						<TD>
							<asp:TextBox id="txtCid" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>学时数</TD>
						<TD>
							<asp:TextBox id="txtTime" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD>班级名</TD>
						<TD>
							<asp:TextBox id="txtClass" runat="server"></asp:TextBox></TD>
					</TR>
					<TR>
						<TD style="HEIGHT: 27px"></TD>
						<TD style="HEIGHT: 27px">
							<asp:Button id="Button1" runat="server" Text="添  加"></asp:Button></TD>
					</TR>
					<TR>
						<TD></TD>
						<TD></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
