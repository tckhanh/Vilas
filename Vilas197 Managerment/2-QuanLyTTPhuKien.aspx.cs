using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;


namespace LabManagement
{
    public partial class QuanLyTTPhuKien : System.Web.UI.Page
    {
        public static Int32 AccessID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.B2, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btsave.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn lưu thông tin phụ kiện đo này?');");
            btDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có chắc chắn xóa thông tin phụ kiện đo này?');");
        }

        protected void btsave_Click(object sender, EventArgs e)
        {
            if (txtAccNo.Text == null || txtAccName.Text == null || txtAccModel.Text == null || txtManufacturer.Text == null || txtMadeYear.Text == null || cbCountry.Value == null || cbStatus.Value == null)
            {
                lbNotification.Text = "Bạn phải điền đầy đủ thông tin ở các mục bắt buộc có dấu (*)";
            }
            else
            {
                string sql = "INSERT INTO TestAccessory (TestSysID,AccNo, AccName, Model, Manufacturer, CountryID, AccTypeID, MadeYear, ReceiveDate, History, StatusID,SN, Hold, Valid,Body,MainAcc) VALUES ('" + cbTestSys.Value + "', @AccNo,@AccName,@Model,@Manufacturer,'" + cbCountry.Value + "','" + cbAccType.Value + "',@MadeYear,@ReceiveDate,@History,'" + cbStatus.Value + "','" + txtSN.Text + "',1,1,'" + cbBody.Value + "','" + cbMas.Value + "')";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@AccNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@AccNo"].Value = txtAccNo.Text;
                Cmd.Parameters.Add("@AccName", SqlDbType.NText);
                Cmd.Parameters["@AccName"].Value = txtAccName.Text;
                Cmd.Parameters.Add("@Model", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Model"].Value = txtAccModel.Text;
                Cmd.Parameters.Add("@Manufacturer", SqlDbType.NText);
                Cmd.Parameters["@Manufacturer"].Value = txtManufacturer.Text;
                if (txtMadeYear.Text == "")
                {
                    Cmd.Parameters.Add("@MadeYear", SqlDbType.Int);
                    Cmd.Parameters["@MadeYear"].Value = System.DBNull.Value;
                }
                else
                {
                    Cmd.Parameters.Add("@MadeYear", SqlDbType.Int);
                    Cmd.Parameters["@MadeYear"].Value =txtMadeYear.Text;
                }
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

                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                ASPxGridView2.DataBind();
                lbNotification.Text = null;
                btDelete.Enabled = true;
                btsave.Enabled = false;
            }

        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            lbNotification.Text = null;
            btsave.Enabled = false;
            btDelete.Enabled = true;
            //Lock Editting
            cbTestSys.ReadOnly = false;
            txtAccNo.ReadOnly = false;
            txtAccName.ReadOnly = false;
            txtAccModel.ReadOnly = false;
            txtSN.ReadOnly = false;
            txtManufacturer.ReadOnly = false;
            cbCountry.ReadOnly = false;
            txtMadeYear.ReadOnly = false;
            cbAccType.ReadOnly = false;
            cbStatus.ReadOnly = false;
            dtreceive.ReadOnly = false;
            mmInfo.ReadOnly = false;
         //Load data to site
            Int32 masterKeyValue = Convert.ToInt32(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "AccID"));
            string sql = "SELECT TestSysID, AccID, AccNo, AccName, Model, SN, Manufacturer, CountryID, AccTypeID, MadeYear, ReceiveDate, History, StatusID, Hold, Valid,Body,MainAcc FROM TestAccessory WHERE AccID='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            cbTestSys.Value = dr.GetValue(0);
            txtAccNo.Text = dr.GetValue(2).ToString();
            txtAccName.Text = dr.GetValue(3).ToString();
            txtAccModel.Text = dr.GetValue(4).ToString();
            txtSN.Text = dr.GetValue(5).ToString();
            txtManufacturer.Text = dr.GetValue(6).ToString();
            cbCountry.Value = dr.GetValue(7);
            txtMadeYear.Text = dr.GetValue(9).ToString();
            cbAccType.Value = dr.GetValue(8);
            cbStatus.Value = dr.GetValue(12);
            dtreceive.Value = dr.GetValue(10);
            cbBody.Value = dr.GetValue(15);
            cbMas.Value = dr.GetValue(16);
            mmInfo.Text = dr.GetValue(11).ToString();
            AccessID=Convert.ToInt32(dr.GetValue(1));
        }

        protected void cbTestSys_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "select ReceiveDate from TestSystem Where TestSysID='"+cbTestSys.Value+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            dtreceive.Value = dr.GetValue(0);
            dr.Close();
            conn.Close();
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            lbNotification.Text = null;
            //Check Hanover paper
            string sql = "SELECT AccID FROM HandoverAcc WHERE AccID='"+AccessID+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            Boolean checkHandover=dr.HasRows;
            dr.Close();
            conn.Close();
            if(checkHandover)
                goto End1;
            //Check Incident
             string sql0 = "SELECT AccID FROM Incident WHERE AccID='"+AccessID+"'";
            SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
            conn0.Open();
            SqlDataReader dr0 = Cmd0.ExecuteReader();
            dr0.Read();
            Boolean checkIncident=dr0.HasRows;
            dr0.Close();
            conn0.Close();
            if(checkIncident)
                goto End1;
            //Delete
            string sql1 = "DELETE FROM TestAccessory WHERE AccNo='" + txtAccNo.Text + "'";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            lbNotification.Text = "Đã xóa thành công";
            //Empty Value
            btDelete.Enabled = false;
            btsave.Enabled = true;
            cbTestSys.Value = null;
            txtAccNo.Text = null;
            txtAccName.Text = null;
            txtAccModel.Text = null;
            txtSN.Text = null;
            txtManufacturer.Text = null;
            cbCountry.Value = null;
            txtMadeYear.Text = null;
            cbAccType.Value = null;
            cbStatus.SelectedIndex = 0;
            cbBody.SelectedIndex = 0;
            cbMas.SelectedIndex = 0;
            dtreceive.Value = null;
            mmInfo.Text = null;
            //Enable Editting
            cbTestSys.ReadOnly = false;
            txtAccNo.ReadOnly = false;
            txtAccName.ReadOnly = false;
            txtAccModel.ReadOnly = false;
            txtSN.ReadOnly = false;
            txtManufacturer.ReadOnly = false;
            cbCountry.ReadOnly = false;
            txtMadeYear.ReadOnly = false;
            cbAccType.ReadOnly = false;
            cbStatus.ReadOnly = false;
            dtreceive.ReadOnly = false;
            cbBody.ReadOnly = false;
            cbMas.ReadOnly = false;
            mmInfo.ReadOnly = false;
            ASPxGridView2.DataBind();
            goto End2;
        End1:;
            lbNotification.Text = "Thiết bị này có thông tin nằm trong phiếu bàn giao và sự cố thiết bị nên không xóa được";
        End2: ;
        }

        protected void btnewrequest_Click(object sender, EventArgs e)
        {
            lbNotification.Text = null;
         //Empty Value
            btDelete.Enabled = false;
            btsave.Enabled = true;
            cbTestSys.Value = null;
            txtAccNo.Text = null;
            txtAccName.Text = null;
            txtAccModel.Text = null;
            txtSN.Text = null;
            txtManufacturer.Text = null;
            cbCountry.Value = null;
            txtMadeYear.Text = null;
            cbAccType.Value = null;
            cbStatus.SelectedIndex = 0;
            dtreceive.Value = null;
            cbBody.SelectedIndex = 0;
            cbMas.SelectedIndex = 0;
            mmInfo.Text = null;
         //Enable Editting
            cbTestSys.ReadOnly = false;
            txtAccNo.ReadOnly = false;
            txtAccName.ReadOnly = false;
            txtAccModel.ReadOnly = false;
            txtSN.ReadOnly = false;
            txtManufacturer.ReadOnly = false;
            cbCountry.ReadOnly = false;
            txtMadeYear.ReadOnly = false;
            cbAccType.ReadOnly = false;
            cbStatus.ReadOnly = false;
            dtreceive.ReadOnly = false;
            mmInfo.ReadOnly = false;
        }
        private List<int> groupIndexes = new List<int>();
        int rowInGroupNumber = 1;
        bool isFirstDisplayedRow = true;
        private bool IsGridUngrouped { get { return groupIndexes.Count == 0; } }

        private void CollectGroupIndexes()
        {
            groupIndexes.Clear();
            for (int i = 0; i < ASPxGridView2.VisibleRowCount; i++)
            {
                if (ASPxGridView2.IsGroupRow(i))
                    groupIndexes.Add(i);
            }
        }
        private int GetParentGroupIndex(int index)
        {
            return groupIndexes.FindLast(i => i < index);
        }

        private bool IsRowIsFirstGroup(int index)
        {
            return ASPxGridView2.IsGroupRow(index - 1);
        }

        protected void ASPxGridView2_BeforeGetCallbackResult(object sender, EventArgs e)
        {
            CollectGroupIndexes();
        }

        protected void ASPxGridView2_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            ASPxGridView g = sender as ASPxGridView;

            if (!IsGridUngrouped)
                rowInGroupNumber = e.VisibleRowIndex + 1;
            else
            {
                if (isFirstDisplayedRow)
                {
                    rowInGroupNumber = e.VisibleRowIndex - GetParentGroupIndex(e.VisibleRowIndex);
                    isFirstDisplayedRow = false;
                }
                else
                {
                    if (IsRowIsFirstGroup(e.VisibleRowIndex))
                        rowInGroupNumber = 1;
                    else
                        rowInGroupNumber++;
                }
            }
            e.Value = rowInGroupNumber;
            e.DisplayText = rowInGroupNumber.ToString();
        }

        protected void btnewrequestNext_Click(object sender, EventArgs e)
        {
            lbNotification.Text = null;
            //Empty Value
            btDelete.Enabled = false;
            btsave.Enabled = true;
            txtAccNo.Text = null;
            txtAccModel.Text = null;
            txtAccName.Text = null;
            txtSN.Text = null;
            cbCountry.Value = null;
            txtMadeYear.Text = null;
            cbAccType.Value = null;
            cbStatus.SelectedIndex = 0;
            cbBody.SelectedIndex = 0;
            cbMas.SelectedIndex = 0;
            mmInfo.Text = null;
            //Enable Editting
            cbTestSys.ReadOnly = false;
            txtAccNo.ReadOnly = false;
            txtAccName.ReadOnly = false;
            txtAccModel.ReadOnly = false;
            txtSN.ReadOnly = false;
            txtManufacturer.ReadOnly = false;
            cbCountry.ReadOnly = false;
            txtMadeYear.ReadOnly = false;
            cbAccType.ReadOnly = false;
            cbStatus.ReadOnly = false;
            dtreceive.ReadOnly = false;
            mmInfo.ReadOnly = false;
        }
    
    }
}