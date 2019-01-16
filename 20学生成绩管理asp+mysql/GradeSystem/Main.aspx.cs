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
	/// Main 的摘要说明。
	/// </summary>
	public class Main : System.Web.UI.Page
	{
		private SqlConnection  conn = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["GradeSys"]);
		public string promiseUrl;
		private string promise;
		private string username;
		private void Page_Load(object sender, System.EventArgs e)
		{
			// 在此处放置用户代码以初始化页面
			try
			{
				username = Session["username"].ToString();
			}
			catch
			{
				Response.Redirect("Login.aspx");
			}
			
			if(!Page.IsPostBack)
			{
				GetPromise();
				GetUrlByPromise();
			}
		}

		#region 取得权限ID
		private void GetPromise()
		{
			string sql = string.Empty;
			sql = string.Format ("select promise from Admin inner join AdminGroup on Admin.[Group] = AdminGroup.[Group] where username = '{0}'",username);
			//Response.Write(sql);
			SqlDataReader dr;
			SqlCommand cmd = new SqlCommand(sql,conn);
			try
			{
				conn.Open();
				dr = cmd.ExecuteReader();
				if(dr.Read())
				{
					//promiseUrl = dr["promise"].ToString();
					//sb.Append(dr["url"].ToString());
					this.promise = dr["promise"].ToString();
				}
				//promiseUrl = sb.ToString();
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


		#region 取得权限ID
		private void GetUrlByPromise()
		{
			string sql = string.Empty;
			System.Text.StringBuilder sb = new System.Text.StringBuilder();
			try
			{
				sql = string.Format ("select url,urlname from AdminUrl where id in ({0})",promise.Substring(0,promise.Length-1));
			}
			catch
			{
				//Response.Write("你输入的用户名不存在任何组,请与管理员联系!");
			}
			//Response.Write(sql);
			SqlDataReader dr;
			SqlCommand cmd = new SqlCommand(sql,conn);
			try
			{
				conn.Open();
				try
				{
					dr = cmd.ExecuteReader();
					if(dr.Read())
					{
						sb.Append("<table width=\"207\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");  
						do
						{
							sb.Append("<tr><td width=\"207\" height=\"33\" background=\"images/Sys_menu.jpg\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target=\"main\" href=\""+dr["url"].ToString()+"\">"+dr["urlname"].ToString()+"</a></td></tr>\n");
						}while(dr.Read());
						sb.Append("</table>");												
					}
				}
				catch
				{
					Response.Write("你输入的用户名尚未分组,或者分组信息丢失,请与管理员联系!");
				}
				promiseUrl = sb.ToString();
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
