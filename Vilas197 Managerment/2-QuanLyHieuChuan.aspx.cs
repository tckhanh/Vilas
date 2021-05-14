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
    public partial class QuanLyHieuChuan : System.Web.UI.Page
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
                    string sql1 = "SELECT AccessRight.B3, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            if (cbTestSys.Value == null)
            {
                btDelete.Enabled = false;
                btUpdate.Enabled = false;
                lbNotification.Text = null;
            }
            btDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa thông tin giấy hiệu chuẩn này?');");
        }


        protected void cbTestSys_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbTestSysName.Text = cbTestSys.Text;
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            if (cbTestSys.Value != null && txtCalibFrom.Text != "" && dtEndValidDate.Value != null && dtCalibDate != null)
            {
                string sql = "INSERT INTO Calibration (TestSysID,CalibNo,CalibFrom,CalibDate,EndValidDate,Note) VALUES ('" + cbTestSys.Value + "','" + txtCalibNo.Text + "',@CalibFrom,@CalibDate,@EndValidDate,@Note)";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@CalibFrom", SqlDbType.NText);
                Cmd.Parameters["@CalibFrom"].Value = txtCalibFrom.Text;
                Cmd.Parameters.Add("@CalibDate", SqlDbType.Date);
                Cmd.Parameters["@CalibDate"].Value = dtCalibDate.Value;
                Cmd.Parameters.Add("@EndValidDate", SqlDbType.Date);
                Cmd.Parameters["@EndValidDate"].Value = dtEndValidDate.Value;
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
                ASPxGridView2.DataBind();
            }
            else
                lbNotification.Text="Bạn phải nhập đây đủ thông tin ở các mục bắt buộc có dấu (*)";
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            Int32 masterKeyValue = Convert.ToInt32(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "CalibID"));
            string masterKeyValue2 = Convert.ToString(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "DayLeft"));
            Int32 masterKeyValue3 = Convert.ToInt32(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "Status"));
            txtDateLeft.Text = masterKeyValue2;
            cbCalibStatus.Value = masterKeyValue3;
            //Bin data to Interface
            string sql = "SELECT CalibID, TestSysID, CalibNo, CalibFrom, CalibDate, EndValidDate, Note FROM Calibration WHERE CalibID='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            tam = Convert.ToInt32(dr.GetValue(0));
            cbTestSys.Value = Convert.ToInt32(dr.GetValue(1));
            txtCalibNo.Text = dr.GetValue(2).ToString();
            txtCalibFrom.Text = dr.GetValue(3).ToString();
            dtCalibDate.Value = dr.GetValue(4);
            dtEndValidDate.Value = dr.GetValue(5);
            mmNote.Text = dr.GetValue(6).ToString();
            dr.Close();
            conn.Close();
            btSave.Enabled = false;
            btDelete.Enabled = true;
            btUpdate.Enabled = true;
        }

        protected void ASPxGridView2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            int s = Convert.ToInt32(e.GetValue("Status"));
            if (s == 0)
                e.Row.BackColor = Color.Tomato;
            if (s == 1 )
                e.Row.BackColor = Color.FromArgb(0xFF, 0xFF, 0x99);
        }

        protected void ASPxGridView3_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            Int32 masterKeyValue = Convert.ToInt32(ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "CalibID"));
            string masterKeyValue2 = Convert.ToString(ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "DayLeft"));
            Int32 masterKeyValue3 = Convert.ToInt32(ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "Status"));
            txtDateLeft.Text = masterKeyValue2;
            cbCalibStatus.Value = masterKeyValue3;
            //Bin data to Interface
            string sql = "SELECT CalibID, TestSysID, CalibNo, CalibFrom, CalibDate, EndValidDate, Note FROM Calibration WHERE CalibID='"+masterKeyValue+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            tam = Convert.ToInt32(dr.GetValue(0));
            cbTestSys.Value = Convert.ToInt32(dr.GetValue(1));
            txtCalibNo.Text= dr.GetValue(2).ToString();
            txtCalibFrom.Text= dr.GetValue(3).ToString();
            dtCalibDate.Value=dr.GetValue(4);
            dtEndValidDate.Value=dr.GetValue(5);
            mmNote.Text=dr.GetValue(6).ToString();
            dr.Close();
            conn.Close();
            ASPxGridView2.DataBind();
            btSave.Enabled = false;
            btDelete.Enabled = true;
            btUpdate.Enabled = true;
                     
        }


        protected void btUpdate_Click(object sender, EventArgs e)
        {
            string sql = "UPDATE Calibration SET TestSysID=@TestSysID,CalibNo=@CalibNo,CalibFrom=@CalibFrom,CalibDate=@CalibDate,EndValidDate=@EndValidDate,Note=@Note WHERE CalibID='"+tam+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            Cmd.Parameters.Add("@TestSysID", SqlDbType.Int,32);
            Cmd.Parameters["@TestSysID"].Value = cbTestSys.Value;
            Cmd.Parameters.Add("@CalibNo", SqlDbType.NVarChar,50);
            Cmd.Parameters["@CalibNo"].Value = txtCalibNo.Text;
            Cmd.Parameters.Add("@CalibFrom", SqlDbType.NText);
            Cmd.Parameters["@CalibFrom"].Value = txtCalibFrom.Text;
            Cmd.Parameters.Add("@CalibDate", SqlDbType.Date);
            Cmd.Parameters["@CalibDate"].Value = dtCalibDate.Value;
            Cmd.Parameters.Add("@EndValidDate", SqlDbType.Date);
            Cmd.Parameters["@EndValidDate"].Value = dtEndValidDate.Value;
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
            ASPxGridView2.DataBind();
            ASPxGridView3.DataBind();
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            string sql = "DELETE FROM Calibration WHERE CalibID='"+tam+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();
            lbNotification.Text = "Bạn đã xóa thông tin giấy hiệu chuẩn thành công";
            ASPxGridView2.DataBind();
            ASPxGridView3.DataBind();
            //Clear Interface Info
            txtCalibNo.Text = null;
            txtCalibFrom.Text = null;
            txtDateLeft.Text = null;
            dtCalibDate.Value = null;
            dtEndValidDate.Value = null;
            mmNote.Text = null;
            btDelete.Enabled = false;
            btUpdate.Enabled = false;
            cbCalibStatus.Value = null;
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            cbTestSys.Value=null;
            txtCalibNo.Text = null;
            txtCalibFrom.Text = null;
            txtDateLeft.Text = null;
            dtCalibDate.Value = null;
            dtEndValidDate.Value = null;
            mmNote.Text = null;
            btDelete.Enabled = false;
            btUpdate.Enabled = false;
            cbCalibStatus.Value = null;
            btSave.Enabled = true;
        }

        protected void ASPxGridView3_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void ASPxGridView2_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

    }
}