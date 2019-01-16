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
	/// AdminGradeAddNext 的摘要说明。
	/// </summary>
	public class AdminGradeAddNext : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox txtcid;
		protected System.Web.UI.WebControls.TextBox txtgrade;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator1;

		private SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["GradeSys"]);
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
		}

		#region
		private void Add()
		{
			string sql = string.Empty;
			sql = string.Format("insert into 成绩表(学号,课程号,成绩) values('{0}','{1}',{2})",Request.QueryString["学号"].ToString(),this.txtcid.Text.ToString(),this.txtgrade.Text.ToString());
			SqlCommand cmd = new SqlCommand(sql,conn);
			try
			{
				conn.Open();
				cmd.ExecuteNonQuery();
				Response.Write("<script>alert('成绩添加成功!')</script>");
			}
			catch//(Exception ex)
			{
				//Response.Write(ex);
				Response.Write("<script>alert('成绩添加失败!')</script>");
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
			Add();		
		}
	}
}
