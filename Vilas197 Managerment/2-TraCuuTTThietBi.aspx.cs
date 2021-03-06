using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Drawing;
using DevExpress.Web;


namespace LabManagement
{
    public partial class TraCuuTTThietBi : System.Web.UI.Page
    {
        public static Int32 tam;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.B6, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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

    
        protected void ASPxGridView3_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {

                               
        }


        protected void ASPxGridView3_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName == "STT")
            {
                if (Convert.ToInt32(e.Value) == 0)
                    e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
            }
            if (e.Column.FieldName == "CalibStatus")
            {
                if (e.Value.ToString() == "")
                    e.DisplayText = "Không có giấy hiệu chuẩn";
            }
        }

        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["TestSysID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ASPxGridView2_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
               if (Convert.ToInt32(e.Value) == 0)
                    e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void ASPxGridView3_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            string s = e.GetValue("CalibStatus").ToString();
            string r = e.GetValue("Register").ToString();
            if ((s == "0" && r=="1") || (s=="" && r=="1"))
                e.Row.BackColor = Color.Tomato;
            if (s == "1" && r=="1")
                e.Row.BackColor = Color.FromArgb(0xFF, 0xFF, 0x99);
        }

        protected void ASPxGridView2_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            string s2 = e.GetValue("StatusID").ToString();
            if (s2 == "2")
                e.Row.BackColor = Color.FromArgb(0xFF, 0xFF, 0x99);
        }

        protected void btSaveExcel_Click(object sender, EventArgs e)
        {
            exporter.WriteXlsToResponse();
        }

    }
}