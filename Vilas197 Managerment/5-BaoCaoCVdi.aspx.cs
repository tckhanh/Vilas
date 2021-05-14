using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data.SqlClient;
using System.Data;

namespace LabManagement
{
    public partial class BaoCaoCVdi : System.Web.UI.Page
    {
        public static double SumofRequest,SumofRequestNonIssue,SumofRequesHasReport,SumofPrice;
        public static double SumofTestReportInTime, SumofTestReportOverTime, SumofRequestInProcess, SumofRequestInProcessOverTime;
        public static DateTime BD, ED;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["username"] = "admin"; Session["StaffID"] = "001";
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A12, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    conn1.Open();
                    SqlDataReader dr1 = Cmd1.ExecuteReader();
                    dr1.Read();
                    if (dr1.GetValue(1).ToString() == "1")
                    {
                        if (dr1.GetValue(0).ToString() == "0")
                            Response.Redirect("FailAccess.aspx");
                    }
                    else
                    {
                        Response.Redirect("FailAccess.aspx");
                    }
                    dr1.Close();
                    conn1.Close();
                }
            }
        }
        protected void d2_DateChanged(object sender, EventArgs e)
        {
            BD = Convert.ToDateTime(d1.Value);
            ED = Convert.ToDateTime(d2.Value);
        }

        protected void d1_DateChanged(object sender, EventArgs e)
        {
            BD = Convert.ToDateTime(d1.Value);
            ED = Convert.ToDateTime(d2.Value);
        }

        


    }
}