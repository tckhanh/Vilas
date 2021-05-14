using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace LabManagement
{
    public partial class _0_PhanQuyen : System.Web.UI.Page
    {
        public static string SID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.O2, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btUpdate.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn cập nhật lại phân quyền này?');");
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            string masterKeyValue = Convert.ToString(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "StaffID"));
            string sql = "SELECT AccessRight.StaffID, AccessRight.A1, AccessRight.A2, AccessRight.A3, AccessRight.A4, AccessRight.A5, AccessRight.A6, AccessRight.A7, AccessRight.A8, AccessRight.A9, AccessRight.A10, AccessRight.A11, AccessRight.A12, AccessRight.B1, AccessRight.B2, AccessRight.B3, AccessRight.B4, AccessRight.B5,AccessRight.C1, AccessRight.C2, AccessRight.C3, AccessRight.C4, AccessRight.C5, AccessRight.C6,AccessRight.C7,AccessRight.C8,AccessRight.O1,AccessRight.O2,AccessRight.O3,AccessRight.C7b, Staff.StaffFullName,AccessRight.B6 FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE AccessRight.StaffID='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            lbStaffFullName.Text = dr.GetValue(30).ToString();
            SID = dr.GetValue(0).ToString();
            chA1.Checked = Convert.ToBoolean(dr.GetValue(1)); chA2.Checked = Convert.ToBoolean(dr.GetValue(2)); chA3.Checked = Convert.ToBoolean(dr.GetValue(3)); chA4.Checked = Convert.ToBoolean(dr.GetValue(4)); chA5.Checked = Convert.ToBoolean(dr.GetValue(5)); chA6.Checked = Convert.ToBoolean(dr.GetValue(6)); chA7.Checked = Convert.ToBoolean(dr.GetValue(7)); chA8.Checked = Convert.ToBoolean(dr.GetValue(8)); chA9.Checked =  Convert.ToBoolean(dr.GetValue(9)); chA10.Checked =  Convert.ToBoolean(dr.GetValue(10)); chA11.Checked =  Convert.ToBoolean(dr.GetValue(11)); chA12.Checked =  Convert.ToBoolean(dr.GetValue(12));
            chB1.Checked = Convert.ToBoolean(dr.GetValue(13)); chB2.Checked = Convert.ToBoolean(dr.GetValue(14)); chB3.Checked = Convert.ToBoolean(dr.GetValue(15)); chB4.Checked = Convert.ToBoolean(dr.GetValue(16)); chB5.Checked = Convert.ToBoolean(dr.GetValue(17)); chB6.Checked = Convert.ToBoolean(dr.GetValue(31));
            chC1.Checked = Convert.ToBoolean(dr.GetValue(18)); chC2.Checked = Convert.ToBoolean(dr.GetValue(19)); chC3.Checked = Convert.ToBoolean(dr.GetValue(20)); chC4.Checked = Convert.ToBoolean(dr.GetValue(21)); chC5.Checked = Convert.ToBoolean(dr.GetValue(22)); chC6.Checked = Convert.ToBoolean(dr.GetValue(23)); chC7.Checked = Convert.ToBoolean(dr.GetValue(24)); chC8.Checked = Convert.ToBoolean(dr.GetValue(25)); chC7b.Checked = Convert.ToBoolean(dr.GetValue(29));
            chO1.Checked = Convert.ToBoolean(dr.GetValue(26)); chO2.Checked = Convert.ToBoolean(dr.GetValue(27)); chO3.Checked = Convert.ToBoolean(dr.GetValue(28));
            dr.Close();
            conn.Close();
            lbNotification.Text = null;
        
        }

        protected void ASPxGridView2_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            string sql = "UPDATE AccessRight SET A1 ='" + Convert.ToInt32(chA1.Checked) + "', A2 ='" + Convert.ToInt32(chA2.Checked) + "', A3 ='" + Convert.ToInt32(chA3.Checked) + "', A4 ='" + Convert.ToInt32(chA4.Checked) + "', A5 ='" + Convert.ToInt32(chA5.Checked) + "', A6 ='" + Convert.ToInt32(chA6.Checked) + "', A7 ='" + Convert.ToInt32(chA7.Checked) + "', A8 ='" + Convert.ToInt32(chA8.Checked) + "', A9 ='" + Convert.ToInt32(chA9.Checked) + "', A10 ='" + Convert.ToInt32(chA10.Checked) + "', A11 ='" + Convert.ToInt32(chA11.Checked) + "', A12 ='" + Convert.ToInt32(chA12.Checked) + "', B1 ='" + Convert.ToInt32(chB1.Checked) + "', B2 ='" + Convert.ToInt32(chB2.Checked) + "', B3 ='" + Convert.ToInt32(chB3.Checked) + "', B4 ='" + Convert.ToInt32(chB4.Checked) + "', B5 ='" + Convert.ToInt32(chB5.Checked) + "',B6 ='" + Convert.ToInt32(chB6.Checked) + "', C1 ='" + Convert.ToInt32(chC1.Checked) + "', C2 ='" + Convert.ToInt32(chC2.Checked) + "', C3 ='" + Convert.ToInt32(chC3.Checked) + "', C4 ='" + Convert.ToInt32(chC4.Checked) + "',C5 ='" + Convert.ToInt32(chC5.Checked) + "',C6 ='" + Convert.ToInt32(chC6.Checked) + "', C7 ='" + Convert.ToInt32(chC7.Checked) + "',C7b ='" + Convert.ToInt32(chC7b.Checked) + "',C8 ='" + Convert.ToInt32(chC8.Checked) + "',O1 ='" + Convert.ToInt32(chO1.Checked) + "', O2 = '" + Convert.ToInt32(chO2.Checked) + "',O3 = '" + Convert.ToInt32(chO3.Checked) + "' WHERE StaffID='" + SID + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();
            lbNotification.Text = "Bạn đã cập nhật phân quyền thành công";
        }
    }
}