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
    public partial class QuanLyTTThietBi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.B1, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btDelete.Enabled = false;
            btsave.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn lưu thông tin hệ thống đo kiểm này?');");
            btDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa thông tin về hệ thống đo kiểm này?');");
        }

        protected void btsave_Click(object sender, EventArgs e)
        {
            if (txtTestSysNo.Text == null || txtTestSysName.Text == null || txtTestSysModel.Text == null || txtManufacturer.Text == null || txtMadeYear.Text == null || cbCountry.Value == null || cbStatus.Value == null || cbTestField.Value == null || cbTestSysSource.Value == null)
            {
                lbNotification.Text="Bạn phải điền đầy đủ thông tin ở các mục bắt buộc có dấu (*)";
            }
            else
            {
                string sql = "INSERT INTO TestSystem (TestSysNo, TestSysName, Model, Manufacturer, CountryID, MadeYear, ReceiveDate, History, StatusID,FieldID,SourceID,TestSpec,Register) VALUES (@TestSysNo, @TestSysName,@Model,@Manufacturer,'" + cbCountry.Value + "',@MadeYear,@ReceiveDate, @History,'" + cbStatus.Value + "','" + cbTestField.Value + "','" + cbTestSysSource.Value + "',@TestSpec,'" + cbMangStatus.Value + "')";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@TestSysNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@TestSysNo"].Value = txtTestSysNo.Text;
                Cmd.Parameters.Add("@TestSysName", SqlDbType.NText);
                Cmd.Parameters["@TestSysName"].Value = txtTestSysName.Text;
                Cmd.Parameters.Add("@Model", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Model"].Value = txtTestSysModel.Text;
                if (txtMadeYear.Text == "")
                {
                    Cmd.Parameters.Add("@MadeYear", SqlDbType.Int);
                    Cmd.Parameters["@MadeYear"].Value = System.DBNull.Value;
                }
                else
                {
                    Cmd.Parameters.Add("@MadeYear", SqlDbType.Int);
                    Cmd.Parameters["@MadeYear"].Value = txtMadeYear.Text;
                }
                Cmd.Parameters.Add("@Manufacturer", SqlDbType.NText);
                Cmd.Parameters["@Manufacturer"].Value = txtManufacturer.Text;
                if (dtreceive.Value == null)
                {
                    Cmd.Parameters.Add("@ReceiveDate", SqlDbType.Date);
                    Cmd.Parameters["@ReceiveDate"].Value = System.DBNull.Value;
                }
                else
                {
                    Cmd.Parameters.Add("@ReceiveDate", SqlDbType.Date);
                    Cmd.Parameters["@ReceiveDate"].Value = dtreceive.Value;
                }
                if (mmInfo.Text != null)
                {
                    Cmd.Parameters.Add("@History", SqlDbType.NText);
                    Cmd.Parameters["@History"].Value = mmInfo.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@History", SqlDbType.NText);
                    Cmd.Parameters["@History"].Value = System.DBNull.Value;
                }
                if (mmSpec.Text != null)
                {
                    Cmd.Parameters.Add("@TestSpec", SqlDbType.NText);
                    Cmd.Parameters["@TestSpec"].Value = mmSpec.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@TestSpec", SqlDbType.NText);
                    Cmd.Parameters["@TestSpec"].Value = System.DBNull.Value;
                }
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                ASPxGridView2.DataBind();
                lbNotification.Text = null;
            }
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            btsave.Enabled = false;
            btDelete.Enabled = true;
            txtTestSysNo.ReadOnly = true;
            txtTestSysName.ReadOnly = true;
            txtTestSysModel.ReadOnly = true;
            txtManufacturer.ReadOnly = true;
            cbCountry.ReadOnly = true;
            txtMadeYear.ReadOnly = true;
            dtreceive.ReadOnly = true;
            mmInfo.ReadOnly = true;
            cbStatus.ReadOnly = true;
            cbTestSysSource.ReadOnly = true;
            cbTestField.ReadOnly = true;
            mmSpec.ReadOnly = true;
            //Load data to site
            Int32 masterKeyValue = Convert.ToInt32(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "TestSysID"));
            string sql = "SELECT TestSysID, TestSysNo, TestSysName, Model, Manufacturer, CountryID, MadeYear, ReceiveDate, History, StatusID, SourceID, FieldID, TestSpec,Register FROM TestSystem WHERE TestSysID='"+masterKeyValue+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtTestSysNo.Text = dr.GetValue(1).ToString();
            txtTestSysName.Text = dr.GetValue(2).ToString();
            txtTestSysModel.Text = dr.GetValue(3).ToString();
            txtManufacturer.Text = dr.GetValue(4).ToString();
            cbCountry.Value = Convert.ToInt32(dr.GetValue(5));
            txtMadeYear.Text = dr.GetValue(6).ToString();
            dtreceive.Value = dr.GetValue(7);
            mmInfo.Text = dr.GetValue(8).ToString();
            cbStatus.Value = Convert.ToInt32(dr.GetValue(9));
            cbTestSysSource.Value = Convert.ToInt32(dr.GetValue(10));
            cbTestField.Value = Convert.ToInt32(dr.GetValue(11));
            mmSpec.Text = dr.GetValue(12).ToString();
            cbMangStatus.Value = dr.GetValue(13).ToString();
            dr.Close();
            conn.Close();
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            //Check Test System has Accessory 
            string sql = "SELECT TestSystem.TestSysID, TestSystem.TestSysNo, TestAccessory.AccID FROM TestSystem INNER JOIN TestAccessory ON TestSystem.TestSysID = TestAccessory.TestSysID WHERE TestSystem.TestSysNo='"+txtTestSysNo.Text+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            if (dr.HasRows)
                lbNotification.Text = "Bạn phải xóa hết thông tin về các phụ kiện trước khi xóa dữ liệu hệ thống đo này";
            else
            {
                string sql1 = "DELETE FROM TestSystem WHERE TestSysNo='" + txtTestSysNo.Text + "'";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                Cmd1.ExecuteNonQuery();
                conn1.Close();
                lbNotification.Text = "Đã xóa thành công";
                //Enable to edit
                btsave.Enabled = true;
                lbNotification.Text = null;
                txtTestSysNo.ReadOnly = false;
                txtTestSysName.ReadOnly = false;
                txtTestSysModel.ReadOnly = false;
                txtManufacturer.ReadOnly = false;
                cbCountry.ReadOnly = false;
                txtMadeYear.ReadOnly = false;
                dtreceive.ReadOnly = false;
                mmInfo.ReadOnly = false;
                cbStatus.ReadOnly = false;
                cbTestSysSource.ReadOnly = false;
                cbTestField.ReadOnly = false;
                mmSpec.ReadOnly = false;
                //Clear data
                txtTestSysNo.Text = null;
                txtTestSysName.Text = null;
                txtTestSysModel.Text = null;
                txtManufacturer.Text = null;
                cbCountry.Value = null;
                txtMadeYear.Text = null;
                dtreceive.Value = null;
                mmInfo.Text = null;
                cbStatus.SelectedIndex = 0;
                cbTestSysSource.SelectedIndex = 0;
                cbTestField.SelectedIndex = 0;
                cbMangStatus.SelectedIndex = 0;
                mmSpec.Text = null;
                ASPxGridView2.DataBind();
            }
            
            conn.Close();
            dr.Close();
            
        }

        protected void btnew_Click(object sender, EventArgs e)
        {
            //Enable to edit
            btsave.Enabled = true;
            lbNotification.Text = null;
            txtTestSysNo.ReadOnly = false;
            txtTestSysName.ReadOnly = false;
            txtTestSysModel.ReadOnly = false;
            txtManufacturer.ReadOnly = false;
            cbCountry.ReadOnly = false;
            txtMadeYear.ReadOnly = false;
            dtreceive.ReadOnly = false;
            mmInfo.ReadOnly = false;
            cbStatus.ReadOnly = false;
            cbTestSysSource.ReadOnly = false;
            cbTestField.ReadOnly = false;
            mmSpec.ReadOnly = false;
            //Clear data
            txtTestSysNo.Text = null;
            txtTestSysName.Text = null;
            txtTestSysModel.Text = null;
            txtManufacturer.Text = null;
            cbCountry.Value = null;
            txtMadeYear.Text = null;
            dtreceive.Value = null;
            mmInfo.Text = null;
            cbStatus.SelectedIndex = 0;
            cbTestField.SelectedIndex = 0;
            cbMangStatus.SelectedIndex = 0;
            mmSpec.Text = null;
        }

        protected void ASPxGridView2_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

    
    }
}