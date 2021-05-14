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
    public partial class DatVPP : System.Web.UI.Page
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
                    string sql1 = "SELECT AccessRight.C7, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
                txtMonth.Text = DateTime.Now.ToString("MM/yyyy");
                month = Convert.ToInt32(txtMonth.Text.Substring(0, 2));
                year = Convert.ToInt32(txtMonth.Text.Substring(3, 4));
                cbMonth.Value = month;
                txtYear.Text = year.ToString();
                OrderSttam = 1;
                btUpdate.Enabled = false;
                btDelete.Enabled = false;
                lbUsername.Text = Session["username"].ToString();
            }
            cbOrderStatus.ReadOnly = true;
            btDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa thông đặt VPP này?');");
        }


        protected void listStationery_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbStationery.Value = listStationery.Value;
            Int32 st = Convert.ToInt32(listStationery.Value); 
            //Read From database
            string sql = "SELECT OrderID,StaffID, StID, Quantity, Month, Year, Note,OrderStID FROM OrderSt WHERE StID='" + st + "' and Month='" + month + "' and Year='" + year + "' and StaffID='"+Session["StaffID"]+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                if (Convert.ToInt32(dr.GetValue(7)) == 1)
                {
                    txtMonth.Text = DateTime.Now.ToString("MM/yyyy");
                    txtQuantity.Text = dr.GetValue(3).ToString();
                    mmNote.Text = dr.GetValue(6).ToString();
                    OrderIDtam = Convert.ToInt32(dr.GetValue(0));
                    cbOrderStatus.Value = dr.GetValue(7);
                    btRegister.Enabled = false;
                    btUpdate.Enabled = true;
                    btDelete.Enabled = true;
                    lbNotification.Text = "Bạn đã đặt VPP này, bạn có thể cập nhất lại số lượng hoặc xóa yêu cầu";
                }
                else
                {
                    txtMonth.Text = DateTime.Now.ToString("MM/yyyy");
                    lbNotification.Text = "Bạn không thể cập nhật được yêu cầu đặt VPP này";
                    btRegister.Enabled = false;
                    btUpdate.Enabled = false;
                    btDelete.Enabled = false;
                }

            }
            else
            {
                txtMonth.Text = DateTime.Now.ToString("MM/yyyy");
                lbNotification.Text = null;
                txtQuantity.Text = "1";
                btRegister.Enabled = true;
                btUpdate.Enabled = false;
                btDelete.Enabled = false;
                cbOrderStatus.Value = 1;
                mmNote.Text = null;
            }
            dr.Close();
            conn.Close();         
        }

        protected void ASPxGridView_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

            Int32 masterKeyValue = Convert.ToInt32(ASPxGridView.GetRowValues(Convert.ToInt32(e.Parameters), "OrderID"));
            OrderIDtam = masterKeyValue;
            Int32 masterKeyValue2 = Convert.ToInt32(ASPxGridView.GetRowValues(Convert.ToInt32(e.Parameters), "StID"));
            cbStationery.Value = masterKeyValue2;
            String masterKeyValue3 = Convert.ToString(ASPxGridView.GetRowValues(Convert.ToInt32(e.Parameters), "Quantity"));
            txtQuantity.Text = masterKeyValue3;
            String masterKeyValue4 = Convert.ToString(ASPxGridView.GetRowValues(Convert.ToInt32(e.Parameters), "Note"));
            mmNote.Text = masterKeyValue4;
            Int32 masterKeyValue5 = Convert.ToInt32(ASPxGridView.GetRowValues(Convert.ToInt32(e.Parameters), "OrderStID"));
            cbOrderStatus.Value = masterKeyValue5;
            String masterKeyValue6 = Convert.ToString(ASPxGridView.GetRowValues(Convert.ToInt32(e.Parameters), "Month"));
            String masterKeyValue7 = Convert.ToString(ASPxGridView.GetRowValues(Convert.ToInt32(e.Parameters), "Year"));
            if (Convert.ToInt32(masterKeyValue6) < 10)
                masterKeyValue6 = string.Concat("0", masterKeyValue6);
            txtMonth.Text = string.Concat(masterKeyValue6, "/", masterKeyValue7);
            btRegister.Enabled = false;
            btDelete.Enabled = true;
            btUpdate.Enabled = true;
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
                ASPxGridView.DataBind();
                lbNotification.Text = null;
                btUpdate.Enabled = true;
                btDelete.Enabled = true;
                btRegister.Enabled = false;
            }
        }

        protected void btView_Click(object sender, EventArgs e)
        {
            ASPxGridView.DataBind();
        }

        protected void ASPxGridView_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) ==0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (txtQuantity.Text != "0")
            {
                string sql = "UPDATE OrderSt SET Quantity='" + Convert.ToInt32(txtQuantity.Text) + "',Note=@Note WHERE OrderID='" + OrderIDtam + "' and Invalid=0 ";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
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
                ASPxGridView.DataBind();
                lbNotification.Text = "Bạn đã đặt VPP này, bạn có thể cập nhất lại số lượng hoặc xóa yêu cầu";
            }
            else
                lbNotification.Text = "Bạn không thể chọn số lượng bằng '0' được bạn có thể chọn xóa nếu muốn hủy đặt VPP này";
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            string sql = "DELETE FROM OrderSt WHERE OrderID='" + OrderIDtam + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();
            ASPxGridView.DataBind();
            lbNotification.Text = "Bạn đã xóa thông tin đặt VPP thành công";
            cbStationery.Value = null;
            txtQuantity.Text = null;
            OrderIDtam = 0;
            mmNote.Text = null;
        }

        protected void btConfirm_Click(object sender, EventArgs e)
        {
            string sql = "UPDATE OrderSt SET OrderStID=3 WHERE Month = '" + cbMonth.Value + "' and Year = '" + txtYear.Text + "' and OrderStID=2 and Invalid=0 and StaffID='" + Session["StaffID"] + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();
            ASPxGridView.DataBind();
            lbNotification.Text = string.Concat("Bạn đã xác nhận đã nhận văn phòng phẩm đặt trong tháng ", cbMonth.Value, " năm ", txtYear.Text);
        }

        protected void cbStationery_SelectedIndexChanged(object sender, EventArgs e)
        {
            Int32 st = Convert.ToInt32(cbStationery.Value);
            //Read From database
            string sql = "SELECT OrderID,StaffID, StID, Quantity, Month, Year, Note,OrderStID FROM OrderSt WHERE StID='" + st + "' and Month='" + month + "' and Year='" + year + "' and StaffID='" + Session["StaffID"] + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                if (Convert.ToInt32(dr.GetValue(7)) == 1)
                {
                    txtMonth.Text = DateTime.Now.ToString("MM/yyyy");
                    txtQuantity.Text = dr.GetValue(3).ToString();
                    mmNote.Text = dr.GetValue(6).ToString();
                    OrderIDtam = Convert.ToInt32(dr.GetValue(0));
                    cbOrderStatus.Value = dr.GetValue(7);
                    btRegister.Enabled = false;
                    btUpdate.Enabled = true;
                    btDelete.Enabled = true;
                    lbNotification.Text = "Bạn đã đặt VPP này, bạn có thể cập nhất lại số lượng hoặc xóa yêu cầu";
                }
                else
                {
                    txtMonth.Text = DateTime.Now.ToString("MM/yyyy");
                    lbNotification.Text = "Bạn không thể cập nhật được yêu cầu đặt VPP này";
                    btRegister.Enabled = false;
                    btUpdate.Enabled = false;
                    btDelete.Enabled = false;
                }

            }
            else
            {
                txtMonth.Text = DateTime.Now.ToString("MM/yyyy");
                lbNotification.Text = null;
                txtQuantity.Text = "1";
                btRegister.Enabled = true;
                btUpdate.Enabled = false;
                btDelete.Enabled = false;
                cbOrderStatus.Value = 1;
                mmNote.Text = null;
            }
            dr.Close();
            conn.Close();
        }


    }
}