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
	/// AdminTeacherAdd 的摘要说明。
	/// </summary>
	public class AdminTeacherAdd : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox txtTname;
		protected System.Web.UI.WebControls.TextBox txtCid;
		protected System.Web.UI.WebControls.TextBox txtTime;
		protected System.Web.UI.WebControls.TextBox txtClass;
		protected System.Web.UI.WebControls.Button Button1;
		private SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["GradeSys"]);
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
		}

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
			string sql = string.Empty;
			sql = string.Format("insert into 授课表(教师名,课程号,学时数,班级名) values('{0}','{1}','{2}','{3}')",this.txtTname.Text,this.txtCid.Text,this.txtTime.Text,this.txtClass.Text);
			SqlCommand cmd = new SqlCommand(sql,conn);
			try
			{
				conn.Open();
				cmd.ExecuteNonQuery();
				Response.Redirect("AdminTeacher.aspx");
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
	}
}
