using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data.SqlClient;

namespace LabManagement
{
    public partial class Danhmucgoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["username"] = "admin"; Session["StaffID"] = "001";

            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql = "SELECT C1 FROM AccessRight WHERE StaffID='" + Session["StaffID"] + "'";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader dr = Cmd.ExecuteReader();
                    dr.Read();
                    if (dr.GetValue(0).ToString() == "0")
                        Response.Redirect("FailAccess.aspx");
                    dr.Close();
                    conn.Close();
                    
                }
            }

            //  Ở đây sẽ mô tả xử lí chung trong tất cả event. 

        }

        protected void GridViewDetail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["DocID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        
    }
}