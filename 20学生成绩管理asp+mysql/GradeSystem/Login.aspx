<%@ Page language="c#" Codebehind="Login.aspx.cs" AutoEventWireup="false" Inherits="GradeMis.Login" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Login</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<LINK href="css/style.css" type="text/css" rel="stylesheet">
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<FONT face="宋体">
				<br>
				<br>
				<br>
				<br>
				<br>
				<TABLE align="center" cellSpacing="0" cellPadding="0" width="526" border="0">
					<TR>
						<TD colSpan="3"><IMG height="41" alt="" src="images/login_1.jpg" width="526"></TD>
					</TR>
					<TR>
						<TD><IMG height="219" alt="" src="images/login_2.jpg" width="321"></TD>
						<TD width="187" height="219">
							<TABLE id="Table3" height="219" cellSpacing="0" cellPadding="0" width="187" border="0">
								<TR>
									<TD>&nbsp;
										<TABLE id="Table1" cellSpacing="1" cellPadding="1" border="0">
											<TR>
												<TD>用户名:</TD>
												<TD>
													<asp:TextBox id="txtUsername" runat="server" BorderStyle="Groove" Width="100px"></asp:TextBox></TD>
											</TR>
											<TR>
												<TD>密&nbsp; 码:</TD>
												<TD>
													<asp:TextBox id="txtPassword" runat="server" TextMode="Password" BorderStyle="Groove" Width="100px"></asp:TextBox></TD>
											</TR>
											<TR>
												<TD></TD>
												<TD>
													<asp:Button id="Button1" runat="server" Text="确 定"></asp:Button></TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
							</TABLE>
						</TD>
						<TD><IMG height="219" alt="" src="images/login_4.jpg" width="18"></TD>
					</TR>
					<TR>
						<TD colSpan="3"><IMG height="42" alt="" src="images/login_5.jpg" width="526"></TD>
					</TR>
				</TABLE>
			</FONT>
		</form>
	</body>
</HTML>
