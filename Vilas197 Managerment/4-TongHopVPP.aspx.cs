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
    public partial class TongHopVPP : System.Web.UI.Page
    {
        public static Int32 month, year,OrderIDtam,OrderSttam;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.C8, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            if (cbStationery.Value == null && cbMonth.Value==null && txtYear.Text=="")
            {
                string monthyear = DateTime.Now.ToString("MM/yyyy");
                cbMonth.Value = Convert.ToInt32(DateTime.Now.ToString("MM"));
                cbMonth2.Value = Convert.ToInt32(DateTime.Now.ToString("MM"));
                txtYear1.Text = DateTime.Now.ToString("yyyy");
                month =Convert.ToInt32(cbMonth.Value);
                year = Convert.ToInt32(txtYear1.Text);
                txtYear.Text = year.ToString();
                OrderSttam = 1;
                btUpdate.Enabled = false;
            }
            cbStationery.ReadOnly = true;
            txtQuantity.ReadOnly = true;
        }


        protected void listStationery_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            Int32 OrderID = Convert.ToInt32(listStationery.Value);
            month = Convert.ToInt32(cbMonth.Value);
            year = Convert.ToInt32(txtYear1.Text);
            //Read From database
            string sql = "SELECT OrderID,StaffID, StID, Quantity, Month, Year, Note,OrderStID FROM OrderSt WHERE OrderID='" + OrderID + "' and Month='" + month + "' and Year='" + year + "' and StaffID='"+cbStaff.Value+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {

                    txtQuantity.Text = dr.GetValue(3).ToString();
                    cbStationery.Value = Convert.ToInt32(dr.GetValue(2));
                    mmNote.Text = dr.GetValue(6).ToString();
                    OrderIDtam = Convert.ToInt32(dr.GetValue(0));
                    cbOrderStatus.Value = dr.GetValue(7);
                    btUpdate.Enabled = true;
                           
            }
            else
            {
                
                lbNotification.Text = null;
                txtQuantity.Text = "1";
                btUpdate.Enabled = false;
                cbOrderStatus.Value = 1;
                mmNote.Text = null;
            }
            dr.Close();
            conn.Close();
            lbNotification.Text = null;
        }



        protected void btRegister_Click(object sender, EventArgs e)
        {
            if (cbStationery.Value == null || txtQuantity.Text == null)
            {
                lbNotification.Text = "Bạn phải điền đầy đủ thông tin ở các mục bắt buộc có dấu (*)";
            }
            else
            {
                string sql = "INSERT INTO OrderSt (StaffID, StID, Quantity, Month, Year, Note, OrderStID,OrderDate) VALUES (@StaffID,'" + cbStationery.Value + "',@Quantity,'"+month+"','" +year+ "',@Note,1,GETDATE())";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@StaffID", SqlDbType.NVarChar,50);
                Cmd.Parameters["@StaffID"].Value = Session["StaffID"];
                Cmd.Parameters.Add("@Quantity", SqlDbType.Int, 32);
                Cmd.Parameters["@Quantity"].Value = Convert.ToInt32(txtQuantity.Text);
                if (mmNote.Text != null)
                {
                    Cmd.Parameters.Add("@Note", SqlDbType.NText);
                    Cmd.Parameters["@Note"].Value = mmNote.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@Note", SqlDbType.NText);
                    Cmd.Parameters["@Note"].Value = System.DBNull.Value;
                }
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                
                lbNotification.Text = null;
                btUpdate.Enabled = true;
            }
        }



        protected void ASPxGridView_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) ==0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cbOrderStatus.Value) != 3 && Convert.ToInt32(cbOrderStatus.Value) != 5)
            {
                string sql = "UPDATE OrderSt SET OrderStID='" + Convert.ToInt32(cbOrderStatus.Value) + "' WHERE OrderID='" + OrderIDtam + "'";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                lbNotification.Text = "Bạn đã cập nhật trạng thái đặt VPP thành công";
                listStationery.DataBind();
            }
            else
                lbNotification.Text = "Các trạng thái 'Đã nhận', 'Chưa nhận VPP' phải được cập nhật từ người đặt VPP, bạn không thể thay đổi được";
        }


        protected void btConfirm_Click(object sender, EventArgs e)
        {
            string sql = "UPDATE OrderSt SET OrderStID=2 WHERE Month = '" +Convert.ToInt32(cbMonth2.Value) + "' and Year = '" + Convert.ToInt32(txtYear.Text) + "' and OrderStID=1";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();      
            lbNotification.Text = string.Concat("Bạn đã xác nhận toàn bộ thông tin đặt văn phòng phẩm trong tháng ", cbMonth2.Text," năm ",txtYear.Text);
            ASPxPivotGrid1.DataBind();
        }

        protected void ASPxPivotGrid1_FieldValueDisplayText(object sender, DevExpress.Web.ASPxPivotGrid.PivotFieldDisplayTextEventArgs e)
        {
            if (e.ValueType == DevExpress.XtraPivotGrid.PivotGridValueType.GrandTotal)
            {
                e.DisplayText = "Tổng cộng";
            }
            if (e.ValueType == DevExpress.XtraPivotGrid.PivotGridValueType.Total)
            {
                e.DisplayText = "Tổng";
            }
        }

        protected void cbStaff_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbStationery.Value = null;
            txtQuantity.Text = null;
            OrderIDtam = 0;
            mmNote.Text = null;

        }

        protected void cbMonth_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btExportToExcel_Click(object sender, EventArgs e)
        {
            ASPxPivotGridExporter1.ExportXlsToResponse("SummaryStationary");
        }

    }
}