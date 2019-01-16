using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace GradeMis
{
	/// <summary>
	/// Login 的摘要说明。
	/// </summary>
	public class Login : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.TextBox txtPassword;
		protected System.Web.UI.WebControls.TextBox txtUsername;
		private SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["GradeSys"]);
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
		 
		}

		#region
		private void userLogin()
		{
			string sql = string.Empty;
			string user = this.txtUsername.Text;
			string pwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPassword.Text,"MD5");
			sql = string.Format("select username,password,[group] from admin where username='{0}' and password='{1}'",user,pwd);
			SqlDataReader dr;
			SqlCommand cmd = new SqlCommand(sql,conn);
			try
			{
				conn.Open();
				dr = cmd.ExecuteReader();
				if(dr.Read())
				{
					Session["username"] = dr["username"].ToString();
					Session["group"] = dr["group"].ToString();
					Response.Redirect("Main.aspx");
				}
				else
				{
					Response.Write("<script>alert('用户名或者密码错误,请重新输入!')</script>");
				}
			}
			catch(Exception ex)
			{
				Response.Write(ex);
			}
			finally
			{
				conn.Close();
			}
		}
		#endregion

		#region Web 窗体设计器生成的代码
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{    
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			userLogin();		
		}
	}
}
