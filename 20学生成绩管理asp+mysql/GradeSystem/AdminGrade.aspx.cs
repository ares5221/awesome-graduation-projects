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
//该源码下载自www.51aspx.com(５１ａsｐｘ．ｃｏｍ)

namespace GradeMis
{
	/// <summary>
	/// AdminGrade 的摘要说明。
	/// </summary>
	public class AdminGrade : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Button Button1;
		private SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["GradeSys"]);
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			if(!Page.IsPostBack)
			{
				GetData();
			}
		}

		#region 取得数据
		private void GetData()
		{
			string sql = string.Empty;
			sql = string.Format("select 成绩表.学号,姓名,课程号,成绩,性别,班级名  from 成绩表 join 学生信息表 on 成绩表.学号 = 学生信息表.学号");
			SqlDataAdapter da = new SqlDataAdapter(sql,conn);
			DataSet ds = new DataSet();
			try
			{
				da.Fill(ds,"t");
				this.DataGrid1.DataSource = ds.Tables["t"];
				this.DataGrid1.DataBind();
			}
			catch(Exception ex)
			{
				Response.Write(ex);
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
			Response.Redirect("AdminGradeAdd.aspx");
		}
	}
}
