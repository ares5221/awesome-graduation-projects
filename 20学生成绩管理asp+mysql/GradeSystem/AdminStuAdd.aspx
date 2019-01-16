<%@ Page language="c#" Codebehind="AdminStuAdd.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.AdminStuAdd" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>AdminStuAdd</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<TABLE id="Table1" cellSpacing="1" cellPadding="1" width="400" border="1">
				<TR>
					<TD style="WIDTH: 89px">学号</TD>
					<td>
						<asp:TextBox id="txtsid" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="txtsid"></asp:RequiredFieldValidator></td>
				</TR>
				<TR>
					<TD style="WIDTH: 89px">姓名</TD>
					<TD>
						<asp:TextBox id="txtname" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="必填" ControlToValidate="txtname"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 89px">性别</TD>
					<TD>
						<asp:RadioButton id="rbman" runat="server" Text="男" Checked="True" GroupName="sex"></asp:RadioButton>
						<asp:RadioButton id="rbwoman" runat="server" Text="女" GroupName="sex"></asp:RadioButton></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 89px">年龄</TD>
					<TD>
						<asp:TextBox id="txtage" runat="server"></asp:TextBox>
						<asp:RangeValidator id="RangeValidator1" runat="server" ErrorMessage="输入无效" ControlToValidate="txtage"
							Type="Integer" MaximumValue="150" MinimumValue="0"></asp:RangeValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 89px">所在院系</TD>
					<TD>
						<asp:TextBox id="txts" runat="server"></asp:TextBox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 89px">班级名</TD>
					<TD>
						<asp:TextBox id="txtclassname" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="txtclassname" ErrorMessage="必填"></asp:RequiredFieldValidator></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 89px">入学年份</TD>
					<TD>
						<asp:TextBox id="txtyear" runat="server">2001-09-01</asp:TextBox></TD>
				</TR>
				<TR>
					<TD style="WIDTH: 89px"></TD>
					<TD>
						<asp:Button id="Button1" runat="server" Text="添 加"></asp:Button><FONT face="宋体">&nbsp;&nbsp;
						</FONT>
						<asp:Button id="Button2" runat="server" Text="返 回"></asp:Button></TD>
				</TR>
			</TABLE>
		</form>
	</body>
</HTML>
