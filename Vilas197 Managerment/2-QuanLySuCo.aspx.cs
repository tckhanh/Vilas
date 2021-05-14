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
    public partial class QuanLySuCo : System.Web.UI.Page
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
                    string sql1 = "SELECT AccessRight.B4, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa thông tin sự cố này?');");
        }


        protected void cbTestSys_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbTestSysName.Text = cbTestSys.Text;
        }

        protected void btSave_Click(object sender, EventArgs e)
        {

            if (cbTestSys.Value != null && cbTestAcc.Value != null && dtIncidentDate.Value!= null && txtIncidentName.Text != "")
            {
                string sql = "INSERT INTO Incident (AccID, IncidentName,SolveDate, Detail, Solve, StatusID, EffectToSysID, IncidentDate, InitDate) VALUES ('" + cbTestAcc.Value + "', @IncidentName,@SolveDate,@Detail,@Solve,'" + cbIncidentStatus.Value + "','" + cbEffectTestSys.Value + "',@IncidentDate,GETDATE())";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@IncidentName", SqlDbType.NText);
                Cmd.Parameters["@IncidentName"].Value = txtIncidentName.Text;
                Cmd.Parameters.Add("@IncidentDate", SqlDbType.Date);
                Cmd.Parameters["@IncidentDate"].Value = dtIncidentDate.Value;
                if (dtSolveDate.Value != null)
                {
                    Cmd.Parameters.Add("@SolveDate", SqlDbType.Date);
                    Cmd.Parameters["@SolveDate"].Value = dtSolveDate.Value;
                }
                else
                {
                    Cmd.Parameters.Add("@SolveDate", SqlDbType.Date);
                    Cmd.Parameters["@SolveDate"].Value = System.DBNull.Value;
                }
                if (mmDetail.Text != null)
                {
                    Cmd.Parameters.Add("@Detail", SqlDbType.NText);
                    Cmd.Parameters["@Detail"].Value = mmDetail.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@Detail", SqlDbType.NText);
                    Cmd.Parameters["@Detail"].Value = System.DBNull.Value;
                }

                if (mmSolve.Text != null)
                {
                    Cmd.Parameters.Add("@Solve", SqlDbType.NText);
                    Cmd.Parameters["@Solve"].Value = mmSolve.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@Solve", SqlDbType.NText);
                    Cmd.Parameters["@Solve"].Value = System.DBNull.Value;
                }
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                int AccSt;
                if (cbIncidentStatus.Value.ToString() == "1")
                    AccSt = 2;
                else
                    AccSt = 1;
                string sql2 = "UPDATE TestAccessory SET StatusID = '"+AccSt+"' WHERE AccID='"+cbTestAcc.Value+"'";
                SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                conn2.Open();
                Cmd2.ExecuteNonQuery();
                conn2.Close();
                lbNotification.Text = null;
                ASPxGridView2.DataBind();
                ASPxGridView3.DataBind();
            }
            else
                lbNotification.Text = "Bạn phải nhập đây đủ thông tin ở các mục bắt buộc có dấu (*)";
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            Int32 masterKeyValue = Convert.ToInt32(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "IncidentID"));
            //Bin data to Interface
            string sql = "SELECT Incident.IncidentID, TestSystem.TestSysID, Incident.AccID, Incident.IncidentName, Incident.Detail, Incident.Solve, Incident.StatusID, Incident.EffectToSysID,Incident.SolveDate, Incident.IncidentDate, Incident.InitDate FROM Incident INNER JOIN TestAccessory ON Incident.AccID = TestAccessory.AccID INNER JOIN TestSystem ON TestAccessory.TestSysID = TestSystem.TestSysID WHERE Incident.IncidentID='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            tam = Convert.ToInt32(dr.GetValue(0));
            cbTestSys.Value = Convert.ToInt32(dr.GetValue(1));
            cbTestAcc.Value = Convert.ToInt32(dr.GetValue(2));
            txtIncidentName.Text = dr.GetValue(3).ToString();
            dtIncidentDate.Value = dr.GetValue(9);
            dtSolveDate.Value = dr.GetValue(8);
            cbIncidentStatus.Value = Convert.ToInt32(dr.GetValue(6));
            cbEffectTestSys.Value = Convert.ToInt32(dr.GetValue(7));
            mmDetail.Text = dr.GetValue(4).ToString();
            mmSolve.Text = dr.GetValue(5).ToString();
            dr.Close();
            conn.Close();
            ASPxGridView2.DataBind();
            btUpdate.Enabled = true;
            btDelete.Enabled = true;
            btSave.Enabled = false;
        }

        protected void ASPxGridView2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            int s1 = Convert.ToInt32(e.GetValue("EffectToSysID"));
            int s2 = Convert.ToInt32(e.GetValue("StatusID"));
            if (s1 == 1 && s2==1)
                e.Row.BackColor = Color.FromArgb(0xFF, 0xFF, 0x99);
            if ((s1 == 2 && s2==1) || (s1 == 3 && s2 == 1))
                e.Row.BackColor = Color.Tomato;
        }

        protected void ASPxGridView3_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {

            Int32 masterKeyValue = Convert.ToInt32(ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "IncidentID"));
            //Bin data to Interface
            string sql = "SELECT Incident.IncidentID, TestSystem.TestSysID, Incident.AccID, Incident.IncidentName, Incident.Detail, Incident.Solve, Incident.StatusID, Incident.EffectToSysID,Incident.SolveDate, Incident.IncidentDate, Incident.InitDate FROM Incident INNER JOIN TestAccessory ON Incident.AccID = TestAccessory.AccID INNER JOIN TestSystem ON TestAccessory.TestSysID = TestSystem.TestSysID WHERE Incident.IncidentID='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            tam = Convert.ToInt32(dr.GetValue(0));
            cbTestSys.Value = Convert.ToInt32(dr.GetValue(1));
            cbTestAcc.Value = Convert.ToInt32(dr.GetValue(2));
            txtIncidentName.Text = dr.GetValue(3).ToString();
            dtIncidentDate.Value = dr.GetValue(9);
            dtSolveDate.Value = dr.GetValue(8);
            cbIncidentStatus.Value = Convert.ToInt32(dr.GetValue(6));
            cbEffectTestSys.Value = Convert.ToInt32(dr.GetValue(7));
            mmDetail.Text = dr.GetValue(4).ToString();
            mmSolve.Text = dr.GetValue(5).ToString();
            dr.Close();
            conn.Close();
            ASPxGridView2.DataBind();
            btUpdate.Enabled = true;
            btDelete.Enabled = true;
            btSave.Enabled = false;
            lbTestSysName.Text = cbTestSys.Text;
        }


        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (cbTestSys.Value != null && cbTestAcc.Value != null && dtIncidentDate.Value != null && txtIncidentName.Text != "")
            {
                string sql = "UPDATE Incident SET AccID =@AccID, IncidentName =@IncidentName, Detail =@Detail, Solve =@Solve, StatusID =@StatusID, EffectToSysID =@EffectToSysID, SolveDate =@SolveDate, IncidentDate =@IncidentDate  WHERE IncidentID='" + tam + "'";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@AccID", SqlDbType.Int,32);
                Cmd.Parameters["@AccID"].Value = cbTestAcc.Value;
                Cmd.Parameters.Add("@StatusID", SqlDbType.Int, 32);
                Cmd.Parameters["@StatusID"].Value = cbIncidentStatus.Value;
                Cmd.Parameters.Add("@EffectToSysID", SqlDbType.Int, 32);
                Cmd.Parameters["@EffectToSysID"].Value = cbEffectTestSys.Value;
                
                Cmd.Parameters.Add("@IncidentName", SqlDbType.NText);
                Cmd.Parameters["@IncidentName"].Value = txtIncidentName.Text;
                Cmd.Parameters.Add("@IncidentDate", SqlDbType.Date);
                Cmd.Parameters["@IncidentDate"].Value = dtIncidentDate.Value;
                if (dtSolveDate.Value != null)
                {
                    Cmd.Parameters.Add("@SolveDate", SqlDbType.Date);
                    Cmd.Parameters["@SolveDate"].Value = dtSolveDate.Value;
                }
                else
                {
                    Cmd.Parameters.Add("@SolveDate", SqlDbType.Date);
                    Cmd.Parameters["@SolveDate"].Value = System.DBNull.Value;
                }
                if (mmDetail.Text != null)
                {
                    Cmd.Parameters.Add("@Detail", SqlDbType.NText);
                    Cmd.Parameters["@Detail"].Value = mmDetail.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@Detail", SqlDbType.NText);
                    Cmd.Parameters["@Detail"].Value = System.DBNull.Value;
                }

                if (mmSolve.Text != null)
                {
                    Cmd.Parameters.Add("@Solve", SqlDbType.NText);
                    Cmd.Parameters["@Solve"].Value = mmSolve.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@Solve", SqlDbType.NText);
                    Cmd.Parameters["@Solve"].Value = System.DBNull.Value;
                }
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                int AccSt;
                if (cbIncidentStatus.Value.ToString() == "1")
                    AccSt = 2;
                else
                    AccSt = 1;
                string sql2 = "UPDATE TestAccessory SET StatusID = '" + AccSt + "' WHERE AccID='" + cbTestAcc.Value + "'";
                SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                conn2.Open();
                Cmd2.ExecuteNonQuery();
                conn2.Close();
                lbNotification.Text = null;
                ASPxGridView2.DataBind();
                ASPxGridView3.DataBind();
            }
            else
                lbNotification.Text = "Bạn phải nhập đây đủ thông tin ở các mục bắt buộc có dấu (*)";
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            string sql = "DELETE FROM Incident WHERE IncidentID='" + tam + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();
            lbNotification.Text = "Bạn đã xóa thông tin sự cố thành công";
            ASPxGridView2.DataBind();
            ASPxGridView3.DataBind();
            //Clear Interface Info
            cbTestAcc.Value = null;
            txtIncidentName.Text = null;
            dtIncidentDate.Value = null;
            dtSolveDate.Value = null;
            cbIncidentStatus.Value = 1;
            cbEffectTestSys.Value = 1;
            mmDetail.Text = null;
            mmSolve.Text = null;
            btUpdate.Enabled = false;
            btDelete.Enabled = false;
            btSave.Enabled = true;
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            cbTestSys.Value = null;
            cbTestAcc.Value = null;
            txtIncidentName.Text = null;
            dtIncidentDate.Value = null;
            dtSolveDate.Value = null;
            cbIncidentStatus.Value = 1;
            cbEffectTestSys.Value = 1;
            mmDetail.Text = null;
            mmSolve.Text = null;
            btUpdate.Enabled = false;
            btDelete.Enabled = false;
            btSave.Enabled = true;
        }

        protected void ASPxGridView3_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            int s1 = Convert.ToInt32(e.GetValue("EffectToSysID"));
            int s2 = Convert.ToInt32(e.GetValue("StatusID"));
            if (s1 == 1 && s2 == 1)
                e.Row.BackColor = Color.FromArgb(0xFF, 0xFF, 0x99);
            if ((s1 == 2 && s2 == 1) || (s1 == 3 && s2 == 1))
                e.Row.BackColor = Color.Tomato;
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