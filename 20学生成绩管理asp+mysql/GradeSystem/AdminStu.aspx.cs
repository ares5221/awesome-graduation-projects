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
	/// AdminStu 的摘要说明。
	/// </summary>
	public class AdminStu : System.Web.UI.Page
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
			sql = string.Format("select * from 学生信息表");
			SqlDataAdapter da = new SqlDataAdapter(sql,conn);
			DataSet ds = new DataSet();
			try
			{
				da.Fill(ds,"t");
				this.DataGrid1.DataSource = ds.Tables["t"];
				this.DataGrid1.DataBind();
			}
			catch
			{}
		}
		#endregion

		#region ExeSql
		private void ExeSql(string sql)
		{
			SqlCommand cmd = new SqlCommand(sql,conn);
			try
			{
				conn.Open();
				cmd.ExecuteNonQuery();
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
			this.DataGrid1.ItemCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_ItemCommand_1);
			this.DataGrid1.PageIndexChanged += new System.Web.UI.WebControls.DataGridPageChangedEventHandler(this.DataGrid1_PageIndexChanged);
			this.DataGrid1.CancelCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_CancelCommand);
			this.DataGrid1.EditCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_EditCommand);
			this.DataGrid1.UpdateCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_UpdateCommand);
			this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
			this.DataGrid1.ItemDataBound += new System.Web.UI.WebControls.DataGridItemEventHandler(this.DataGrid1_ItemDataBound);
			this.DataGrid1.SelectedIndexChanged += new System.EventHandler(this.DataGrid1_SelectedIndexChanged);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("AdminStuAdd.aspx");
		}

		private void DataGrid1_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
		{
			this.DataGrid1.CurrentPageIndex = e.NewPageIndex;
			GetData();
		
		}

		private void DataGrid1_EditCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			this.DataGrid1.EditItemIndex=e.Item.ItemIndex;
			GetData();
		}

		private void DataGrid1_CancelCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			this.DataGrid1.EditItemIndex=-1;
			GetData();
		}

		private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			string sid = e.Item.Cells[0].Text;
			string sql = string.Format("delete 学生信息表 where 学号 = '{0}'",sid);
			ExeSql(sql);
			this.DataGrid1.EditItemIndex=-1;
			GetData();
		}

		private void DataGrid1_UpdateCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			string sid = e.Item.Cells[0].Text;

			TextBox txtName = new TextBox();
			txtName = (TextBox)e.Item.Cells[1].Controls[0];
			string name = txtName.Text.ToString();

			TextBox txtAge = new TextBox();
			txtAge = (TextBox)e.Item.Cells[3].Controls[0];
			string age = txtAge.Text.ToString();			

			TextBox txtS = new TextBox();
			txtS = (TextBox)e.Item.Cells[3].Controls[0];
			string s = txtS.Text.ToString();

			TextBox txtClass = new TextBox();
			txtClass = (TextBox)e.Item.Cells[4].Controls[0];
			string classname= txtClass.Text.ToString();

			string sql = string.Empty;
			sql= string.Format("update 学生信息表 set 姓名='{0}',年龄='{1}',所在院系='{2}',班级名='{3}' where 学号='{4}'",name,age,s,classname,sid);
			ExeSql(sql);
			this.DataGrid1.EditItemIndex=-1;
			GetData();
		}


		private void DataGrid1_ItemDataBound(object sender, System.Web.UI.WebControls.DataGridItemEventArgs e)
		{
			if(e.Item.ItemType == ListItemType.EditItem)
			{
				TextBox t1 = (TextBox)e.Item.Cells[1].Controls[0];
				TextBox t2 = (TextBox)e.Item.Cells[2].Controls[0];
				TextBox t3 = (TextBox)e.Item.Cells[3].Controls[0];
				TextBox t4 = (TextBox)e.Item.Cells[4].Controls[0];
				
				t1.Width = 1000;
				t2.Width = 10; 
				t3.Width = 10; 
				t4.Width = 10; 
			}
		
		}

		private void DataGrid1_ItemCommand_1(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			if(e.Item.ItemType == ListItemType.EditItem)
			{
				TextBox t1 = (TextBox)e.Item.Cells[1].Controls[0];
				//TextBox t2 = (TextBox)e.Item.Cells[2].Controls[0];
				TextBox t3 = (TextBox)e.Item.Cells[3].Controls[0];
				TextBox t4 = (TextBox)e.Item.Cells[4].Controls[0];
				
				t1.Width = 1000;
				//t2.Width = 10; 
				t3.Width = 10; 
				t4.Width = 10; 
			}
		
		}

		private void DataGrid1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}
	}
}
