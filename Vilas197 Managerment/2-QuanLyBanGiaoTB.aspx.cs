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
    public partial class QuanLyBanGiaoTB : System.Web.UI.Page
    {
        public static Int32 handID,handSt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.B5, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btsave.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn lưu thông tin phụ kiện đo này?');");
            btDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có chắc chắn xóa toàn bộ thông tin phiếu bàn giao này?');");
            cbStaffIssue.Value = Session["StaffID"];
            cbStaffIssue.ReadOnly = true;
            if (txtPaperNo.Text == "")
            {
                string sql = "select top 1 HandoverNo,YearFull from Number";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                txtPaperNo.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1).PadLeft(4, '0')+"/"+dr.GetValue(1).ToString()+"/BB-PTN";
                dr.Close();
                conn.Close();
                chInternal.Checked = true;
                chExternal.Checked = false;
                txtCompName.Enabled = false;
                txtAddress.Enabled = false;
                txtPhone.Enabled = false;
                txtFax.Enabled = false;
                txtPersonName.Enabled = false;
                txtPosition.Enabled = false;
                txtID.Enabled = false;
                txtMobileNo.Enabled = false;
                cbStaff.Enabled = true;
                dtReceiveRe.Value = null;
                btUpdate.Enabled = false;
                cbHandStatus.Value = 1;
                cbHandStatus.ReadOnly = true;
                dtReceiveRe.ReadOnly = true;
                btClearList.Enabled = false;
                btDelete.Enabled = false;
            }
        }

        protected void btsave_Click(object sender, EventArgs e)
        {

            string sql = "INSERT INTO Handover (HandoverNo, HandoverDate, HandoverReceiveEx, ReceiveStaffID, CompanyName,Address, PerName, PerID, PerPhoneNo, HandoverStatusID,HandoverStaffID,Note,Position,Phone,Fax) VALUES (@HandoverNo, @HandoverDate, @HandoverReceiveEx,@ReceiveStaffID, @CompanyName, @Address, @PerName, @PerID, @PerPhoneNo, @HandoverStatusID,@HandoverStaffID,@Note,@Position,@Phone,@Fax)";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            //Get HandoverNo
            string sql1 = "select top 1 HandoverNo,YearFull from Number";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            SqlDataReader dr1 = Cmd1.ExecuteReader();
            dr1.Read();
            string handNumNow = Convert.ToString(Convert.ToInt32(dr1.GetValue(0))).PadLeft(4, '0');
            string handNumNext = Convert.ToString(Convert.ToInt32(dr1.GetValue(0)) + 1).PadLeft(4, '0');
            string year = dr1.GetValue(1).ToString();
            dr1.Close();
            conn1.Close();
            lbHandoverNo.Text = handNumNext+"/"+year+"/BB-PTN";
            txtPaperNo.Text = handNumNext + "/" + year + "/BB-PTN";
            //Update New HandoverNo
            string sql2 = "UPDATE Number SET HandoverNo= '" + handNumNext + "' WHERE HandoverNo='" + handNumNow + "'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            Cmd2.ExecuteNonQuery();
            conn2.Close();
            //Add data
            Cmd.Parameters.Add("@HandoverNo", SqlDbType.NVarChar, 50);
            Cmd.Parameters["@HandoverNo"].Value = txtPaperNo.Text;
            Cmd.Parameters.Add("@HandoverDate", SqlDbType.Date);
            Cmd.Parameters["@HandoverDate"].Value = dthandover.Value;
            Cmd.Parameters.Add("@HandoverReceiveEx", SqlDbType.Date);
            Cmd.Parameters["@HandoverReceiveEx"].Value = dtReceive.Value;
            if (chInternal.Checked == true)
            {
                Cmd.Parameters.Add("@ReceiveStaffID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@ReceiveStaffID"].Value = cbStaff.Value;
                Cmd.Parameters.Add("@CompanyName", SqlDbType.NText);
                Cmd.Parameters["@CompanyName"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@Address", SqlDbType.NText);
                Cmd.Parameters["@Address"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Phone"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@Fax", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Fax"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@PerName", SqlDbType.NText);
                Cmd.Parameters["@PerName"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@Position", SqlDbType.NText);
                Cmd.Parameters["@Position"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@PerID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@PerID"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@PerPhoneNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@PerPhoneNo"].Value = System.DBNull.Value;
            }
            else
            {
                Cmd.Parameters.Add("@ReceiveStaffID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@ReceiveStaffID"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@CompanyName", SqlDbType.NText);
                Cmd.Parameters["@CompanyName"].Value = txtCompName.Text;
                Cmd.Parameters.Add("@Address", SqlDbType.NText);
                Cmd.Parameters["@Address"].Value = txtAddress.Text;
                Cmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Phone"].Value = txtPhone.Text;
                Cmd.Parameters.Add("@Fax", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Fax"].Value = txtFax.Text;
                Cmd.Parameters.Add("@PerName", SqlDbType.NText);
                Cmd.Parameters["@PerName"].Value = txtPersonName.Text;
                Cmd.Parameters.Add("@Position", SqlDbType.NText);
                Cmd.Parameters["@Position"].Value = txtPosition.Text;
                if (txtID.Text != null)
                {
                    Cmd.Parameters.Add("@PerID", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@PerID"].Value = txtID.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@PerID", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@PerID"].Value = System.DBNull.Value;
                }
                Cmd.Parameters.Add("@PerPhoneNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@PerPhoneNo"].Value = txtMobileNo.Text;
            }
            Cmd.Parameters.Add("@HandoverStatusID", SqlDbType.Int);
            Cmd.Parameters["@HandoverStatusID"].Value = 1;
            Cmd.Parameters.Add("@HandoverStaffID", SqlDbType.NVarChar, 50);
            Cmd.Parameters["@HandoverStaffID"].Value = Session["StaffID"];
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
            ASPxGridView4.DataBind();
            //Get handoverID
            string sql3 = "SELECT HandoverID FROM Handover WHERE HandoverNo='"+txtPaperNo.Text+"'";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            conn3.Open();
            SqlDataReader dr3 = Cmd3.ExecuteReader();
            dr3.Read();
            handID =Convert.ToInt32(dr3.GetValue(0));
            handSt = 1;
            dr3.Close();
            conn3.Close();
            lbNotification.Text = "Phiếu bàn giao đã được tạo thành công, bạn cần thêm danh sách các phụ kiện vào phiếu bàn giao";
            cbHandStatus.ReadOnly = false;
            dtReceiveRe.ReadOnly = false;
            btUpdate.Enabled = true;
            btsave.Enabled = false;
            btDelete.Enabled = true;
            btClearList.Enabled = true;
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            if (handID != 0)
            {
                if (handSt == 1)
                {
                    //Load data
                    Int32 Acc = Convert.ToInt32(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "AccID"));
                    Int32 s = Convert.ToInt32(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "StatusID"));
                    Int32 h = Convert.ToInt32(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "Hold"));
                    //Check has record in handover list
                    string sql3 = "SELECT HandoverID FROM HandoverAcc WHERE HandoverID='" + handID + "' and AccID='"+Acc+"'";
                    SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                    conn3.Open();
                    SqlDataReader dr3 = Cmd3.ExecuteReader();
                    dr3.Read();
                    if (dr3.HasRows)
                    {
                        lbNotification.Text = "Thiết bị này đã có trong danh sách bàn giao, bạn không thêm vào được nữa";
                    }
                    else
                    {

                        if (h == 1)
                        {
                            //Insert to HandoverAcc
                            string sql = "INSERT INTO HandoverAcc (HandoverID, AccID, Status, Invalid) VALUES ('" + handID + "','" + Acc + "','" + s + "',0)";
                            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                            SqlCommand Cmd = new SqlCommand(sql, conn);
                            conn.Open();
                            Cmd.ExecuteNonQuery();
                            conn.Close();
                            ASPxGridView3.DataBind();
                            
                            //Check kind of handover (Internal or External)                           
                            string sql4 = "SELECT ReceiveStaffID FROM Handover WHERE HandoverID='" + handID + "'";
                            SqlConnection conn4 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                            SqlCommand Cmd4 = new SqlCommand(sql4, conn4);
                            conn4.Open();
                            SqlDataReader dr4 = Cmd4.ExecuteReader();
                            dr4.Read();
                            string sID = dr4.GetValue(0).ToString();
                            int htam;
                            if (sID!="")
                                htam = 3;
                            else
                                htam = 2;
                            dr4.Close();
                            conn4.Close();
                            //Update Accessory Status in TestAcc
                            string sql1 = "UPDATE TestAccessory SET Hold ='"+htam+"' WHERE AccID='" + Acc + "'";
                            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                            conn1.Open();
                            Cmd1.ExecuteNonQuery();
                            conn1.Close();
                            ASPxGridView2.DataBind();
                            lbNotification.Text = null;
                        }
                        else
                            lbNotification.Text = "Thiết bị hiện không có tại phòng đo,không bàn giao thiết bị này được";
                    }
                    dr3.Close();
                    conn3.Close();
                }
                else
                    lbNotification.Text = "Phiếu bàn giao này đã hết hiệu lực, bạn không thể sửa đổi";
            }
            else
                lbNotification.Text = "Bạn phải chọn phiếu bàn giao muốn cập nhật thì mới cập nhật được thông tin phụ kiện bàn giao";

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


        protected void btDelete_Click(object sender, EventArgs e)
        {
            //Update Accessory Status in TestAcc
            string sql1 = "UPDATE TestAccessory SET Hold =1 FROM TestAccessory INNER JOIN HandoverAcc ON TestAccessory.AccID = HandoverAcc.AccID INNER JOIN Handover ON HandoverAcc.HandoverID = Handover.HandoverID WHERE (Handover.HandoverID = '"+handID+"')";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView2.DataBind();
            //Delete From HandoverAcc
            string sql2 = "DELETE FROM HandoverAcc WHERE HandoverID='" + handID + "'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            Cmd2.ExecuteNonQuery();
            conn2.Close();
            ASPxGridView3.DataBind();
            //Delete From Handover
            string sql3 = "DELETE FROM Handover WHERE HandoverID='" + handID + "'";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            ASPxGridView4.DataBind();
            //Clear interface Data
            string sql = "select top 1 HandoverNo from Number";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtPaperNo.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1).PadLeft(4, '0');
            dr.Close();
            conn.Close();
            chInternal.Checked = true;
            chExternal.Checked = false;
            txtCompName.Enabled = false;
            txtCompName.Text = null;
            txtAddress.Enabled = false;
            txtAddress.Text = null;
            txtPhone.Enabled = false;
            txtPhone.Text = null;
            txtFax.Enabled = false;
            txtFax.Text = null;
            txtPersonName.Enabled = false;
            txtPersonName.Text = null;
            txtPosition.Enabled = false;
            txtPosition.Text = null;
            txtID.Enabled = false;
            txtID.Text = null;
            txtMobileNo.Enabled = false;
            txtMobileNo.Text = null;
            cbStaff.Enabled = true;
            cbStaff.Value = null;
            dtReceiveRe.Value = null;
            btUpdate.Enabled = false;
            dthandover.Value = null;
            dtReceive.Value = null; ;
            mmNote.Text = null;
            cbHandStatus.Value = 1;
            lbNotification.Text = null;
            lbHandoverNo.Text = null;
            btsave.Enabled = true;
            btClearList.Enabled = false;
            btDelete.Enabled = false;
        }

        protected void chInternal_CheckedChanged(object sender, EventArgs e)
        {
            if (chInternal.Checked == true)
            {
                chExternal.Checked = false;
                txtCompName.Enabled = false;
                txtAddress.Enabled = false;
                txtPhone.Enabled = false;
                txtFax.Enabled = false;
                txtPersonName.Enabled = false;
                txtPosition.Enabled = false;
                txtID.Enabled = false;
                txtMobileNo.Enabled = false;
                cbStaff.Enabled = true;
            }
            else
            {
                chExternal.Checked = true;
                txtCompName.Enabled = true;
                txtAddress.Enabled = true;
                txtPhone.Enabled = true;
                txtFax.Enabled = true;
                txtPersonName.Enabled = true;
                txtPosition.Enabled = true;
                txtID.Enabled = true;
                txtMobileNo.Enabled = true;
                cbStaff.Enabled = false;
            }
        }

        protected void chExternal_CheckedChanged(object sender, EventArgs e)
        {
            if (chExternal.Checked == true)
            {
                chInternal.Checked = false;
                txtCompName.Enabled = true;
                txtAddress.Enabled = true;
                txtPhone.Enabled = true;
                txtFax.Enabled = true;
                txtPersonName.Enabled = true;
                txtPosition.Enabled = true;
                txtID.Enabled = true;
                txtMobileNo.Enabled = true;
                cbStaff.Enabled = false;
            }
            else
            {
                chInternal.Checked = true;
                txtCompName.Enabled = false;
                txtAddress.Enabled = false;
                txtPhone.Enabled = false;
                txtFax.Enabled = false;
                txtPersonName.Enabled = false;
                txtPosition.Enabled = false;
                txtID.Enabled = false;
                txtMobileNo.Enabled = false;
                cbStaff.Enabled = true;
            }
        }

        protected void btnew_Click(object sender, EventArgs e)
        {
            string sql1 = "select top 1 HandoverNo,YearFull from Number";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            SqlDataReader dr1 = Cmd1.ExecuteReader();
            dr1.Read();
            txtPaperNo.Text = Convert.ToString(Convert.ToInt32(dr1.GetValue(0)) + 1).PadLeft(4, '0')+"/"+dr1.GetValue(1).ToString()+"/BB-PTN";
            dr1.Close();
            conn1.Close();
            chInternal.Checked = true;
            chExternal.Checked = false;
            txtCompName.Enabled = false;
            txtCompName.Text=null;
            txtAddress.Enabled = false;
            txtAddress.Text=null;
            txtPhone.Enabled = false;
            txtPhone.Text = null;
            txtFax.Enabled = false;
            txtFax.Text = null;
            txtPersonName.Enabled = false;
            txtPersonName.Text=null;
            txtPosition.Enabled = false;
            txtPosition.Text = null;
            txtID.Enabled = false;
            txtID.Text=null;
            txtMobileNo.Enabled = false;
            txtMobileNo.Text=null;
            cbStaff.Enabled = true;
            cbStaff.Value=null;
            dtReceiveRe.Value = null;
            btUpdate.Enabled = false;
            dthandover.Value = null;
            dtReceive.Value = null; ;
            mmNote.Text = null;
            cbHandStatus.Value = 1;
            lbNotification.Text = null;
            lbHandoverNo.Text = null;
            btsave.Enabled = true;
            btClearList.Enabled = false;
            btDelete.Enabled = false;

        }

        protected void btClearList_Click(object sender, EventArgs e)
        {
            if (handSt == 1)
            {
                //Update Accessory Status in TestAcc
                string sql1 = "UPDATE TestAccessory SET Hold =1 FROM TestAccessory INNER JOIN HandoverAcc ON TestAccessory.AccID = HandoverAcc.AccID INNER JOIN Handover ON HandoverAcc.HandoverID = Handover.HandoverID WHERE (Handover.HandoverID = '" + handID + "')";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                Cmd1.ExecuteNonQuery();
                conn1.Close();
                ASPxGridView2.DataBind();
                //Delete From HandoverAcc
                string sql2 = "DELETE FROM HandoverAcc WHERE HandoverID='" + handID + "'";
                SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                conn2.Open();
                Cmd2.ExecuteNonQuery();
                conn2.Close();
                ASPxGridView3.DataBind();
            }
            else
                lbNotification.Text = "Phiếu bàn giao này đã hết hiệu lực, bạn không thể sửa đổi";
        }

        protected void btSearch_Click(object sender, EventArgs e)
        {
            ASPxGridView3.DataBind();
            string sql = "SELECT HandoverID, HandoverNo, HandoverDate, HandoverReceiveEx, HandoverReceiveRe, ReceiveStaffID, CompanyName, PerName, Address, PerID, PerPhoneNo,HandoverStatusID, HandoverStaffID, Note,HandoverReceiveRe,HandoverStatusID,Position,Phone,Fax FROM Handover WHERE HandoverNo='" + txtPaperNo.Text + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                handID = Convert.ToInt32(dr.GetValue(0));
                handSt = Convert.ToInt32(dr.GetValue(11));
                lbHandoverNo.Text = txtPaperNo.Text;
                cbStaffIssue.Value = dr.GetValue(12);
                cbStaff.Value = dr.GetValue(5);
                if (cbStaff.Value == null)
                {
                    chInternal.Checked = false;
                    chExternal.Checked = true;
                    txtCompName.Enabled = true;
                    txtAddress.Enabled = true;
                    txtPhone.Enabled = true;
                    txtFax.Enabled = true;
                    txtPersonName.Enabled = true;
                    txtPosition.Enabled = true;
                    txtID.Enabled = true;
                    txtMobileNo.Enabled = true;
                    cbStaff.Enabled = false;
                }
                else
                {
                    chInternal.Checked = true;
                    chExternal.Checked = false;
                    txtCompName.Enabled = false;
                    txtAddress.Enabled = false;
                    txtPhone.Enabled = false;
                    txtFax.Enabled = false;
                    txtPersonName.Enabled = false;
                    txtPosition.Enabled = false;
                    txtID.Enabled = false;
                    txtMobileNo.Enabled = false;
                    cbStaff.Enabled = true;
                }
                if (handSt == 1)
                {
                    cbHandStatus.ReadOnly = false;
                    btClearList.Enabled = true;
                    lbNotification.Text = "Phiếu bàn giao vẫn còn hiệu lực";
                }
                else
                {
                    cbHandStatus.ReadOnly = true;
                    btClearList.Enabled = false;
                    lbNotification.Text = "Phiếu bàn giao đã hết hiệu lực";
                }
                txtCompName.Text = dr.GetValue(6).ToString();
                txtPhone.Text = dr.GetValue(17).ToString();
                txtFax.Text = dr.GetValue(18).ToString();
                txtPersonName.Text = dr.GetValue(7).ToString();
                txtPosition.Text = dr.GetValue(16).ToString();
                txtAddress.Text = dr.GetValue(8).ToString();
                txtID.Text = dr.GetValue(9).ToString();
                txtMobileNo.Text = dr.GetValue(10).ToString();
                dthandover.Value = dr.GetValue(2);
                dtReceive.Value = dr.GetValue(3);
                mmNote.Text = dr.GetValue(13).ToString();
                btUpdate.Enabled = true;
                cbHandStatus.Value = dr.GetValue(15);
                dtReceiveRe.Value = dr.GetValue(14);
                dtReceiveRe.ReadOnly = false;
            }
            else
                lbNotification.Text = "Không có dữ liệu về phiếu bàn giao này";
            dr.Close();
            conn.Close();

        }



        protected void ASPxGridView3_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            Int32 masterkey =Convert.ToInt32(e.Keys[ASPxGridView3.KeyFieldName]);
            //Get AccID
            string sql3 = "SELECT AccID FROM HandoverAcc WHERE HandAccID='" + masterkey + "'";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            conn3.Open();
            SqlDataReader dr3 = Cmd3.ExecuteReader();
            dr3.Read();
            int Acc = Convert.ToInt32(dr3.GetValue(0));
            dr3.Close();
            conn3.Close();
            //Update Accessory Status in TestAcc
            string sql1 = "UPDATE TestAccessory SET Hold =1 WHERE AccID='" + Acc + "'";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView2.DataBind();
            //Delete From HandoverAcc
            string sql2 = "DELETE FROM HandoverAcc WHERE HandAccID='" + masterkey + "'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            Cmd2.ExecuteNonQuery();
            conn2.Close();
            ASPxGridView3.DataBind();
            
        }

        protected void ASPxGridView3_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

        }


        protected void ASPxGridView3_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Int32 masterkey = Convert.ToInt32(e.Keys[ASPxGridView3.KeyFieldName]);
            Int32 i = Convert.ToInt32(e.NewValues["TestSysStatusID"]);
            string sql2 = "UPDATE HandoverAcc SET Status='"+i+"' WHERE HandAccID='" + masterkey + "' ";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            Cmd2.ExecuteNonQuery();
            conn2.Close();
            ASPxGridView3.DataBind();

        }

        protected void ASPxGridView4_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            int s = Convert.ToInt32(e.GetValue("HandoverStatusID"));
            if (s == 2)
                e.Row.BackColor = System.Drawing.Color.LightSkyBlue;
        }

        protected void ASPxGridView4_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            Int32 masterKeyValue = Convert.ToInt32(ASPxGridView4.GetRowValues(Convert.ToInt32(e.Parameters), "HandoverID"));
            string sql = "SELECT HandoverID, HandoverNo, HandoverDate, HandoverReceiveEx, HandoverReceiveRe, ReceiveStaffID, CompanyName, PerName, Address, PerID, PerPhoneNo,HandoverStatusID, HandoverStaffID, Note,Position,Phone,Fax FROM Handover WHERE HandoverID='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            handID = Convert.ToInt32(dr.GetValue(0));
            handSt = Convert.ToInt32(dr.GetValue(11));
            cbHandStatus.Value = handSt;
            if (handSt == 1)
            {
                cbHandStatus.ReadOnly = false;
                btClearList.Enabled = true;
                lbNotification.Text = "Phiếu bàn giao vẫn còn hiệu lực";
            }
            else
            {
                cbHandStatus.ReadOnly = true;
                btClearList.Enabled = false;
                lbNotification.Text = "Phiếu bàn giao đã hết hiệu lực";  
            }
            lbHandoverNo.Text = txtPaperNo.Text;
            cbStaffIssue.Value = dr.GetValue(12);
            cbStaff.Value = dr.GetValue(5);
            txtPaperNo.Text = dr.GetValue(1).ToString();
            if (cbStaff.Value == null)
            {
                chInternal.Checked = false;
                chExternal.Checked = true;
                txtCompName.Enabled = true;
                txtPosition.Enabled = true;
                txtAddress.Enabled = true;
                txtPhone.Enabled = true;
                txtFax.Enabled = true;
                txtPersonName.Enabled = true;
                txtID.Enabled = true;
                txtMobileNo.Enabled = true;
                cbStaff.Enabled = false;
            }
            else
            {
                chInternal.Checked = true;
                chExternal.Checked = false;
                txtCompName.Enabled = false;
                txtAddress.Enabled = false;
                txtPhone.Enabled = false;
                txtFax.Enabled = false;
                txtPersonName.Enabled = false;
                txtPosition.Enabled = false;
                txtID.Enabled = false;
                txtMobileNo.Enabled = false;
                cbStaff.Enabled = true;
            }
            txtCompName.Text = dr.GetValue(6).ToString();
            txtPhone.Text = dr.GetValue(15).ToString();
            txtFax.Text = dr.GetValue(16).ToString();
            txtPersonName.Text = dr.GetValue(7).ToString();
            txtPosition.Text = dr.GetValue(14).ToString();
            txtAddress.Text = dr.GetValue(8).ToString();
            txtID.Text = dr.GetValue(9).ToString();
            txtMobileNo.Text = dr.GetValue(10).ToString();
            dthandover.Value = dr.GetValue(2);
            dtReceive.Value = dr.GetValue(3);
            mmNote.Text = dr.GetValue(13).ToString();
            dtReceiveRe.Value = dr.GetValue(4);
            btUpdate.Enabled = true;
            dtReceiveRe.ReadOnly = false;
            btsave.Enabled = false;
            btDelete.Enabled = true;
            dr.Close();
            conn.Close();
            ASPxGridView3.DataBind();
        }


        protected void btUpdate_Click(object sender, EventArgs e)
        {
            string sql = "UPDATE Handover SET HandoverNo=@HandoverNo, HandoverDate=@HandoverDate, HandoverReceiveEx=@HandoverReceiveEx, ReceiveStaffID=@ReceiveStaffID, CompanyName=@CompanyName,Address=@Address, PerName=@PerName, PerID=@PerID, PerPhoneNo=@PerPhoneNo, HandoverStatusID=@HandoverStatusID,Note=@Note,HandoverReceiveRe=@HandoverReceiveRe,Position=@Position,Phone=@Phone,Fax=@Fax WHERE HandoverID='" + handID + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            //Add data
            Cmd.Parameters.Add("@HandoverNo", SqlDbType.NVarChar, 50);
            Cmd.Parameters["@HandoverNo"].Value = txtPaperNo.Text;
            Cmd.Parameters.Add("@HandoverDate", SqlDbType.Date);
            Cmd.Parameters["@HandoverDate"].Value = dthandover.Value;
            Cmd.Parameters.Add("@HandoverReceiveEx", SqlDbType.Date);
            Cmd.Parameters["@HandoverReceiveEx"].Value = dtReceive.Value;
            if (chInternal.Checked == true)
            {
                Cmd.Parameters.Add("@ReceiveStaffID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@ReceiveStaffID"].Value = cbStaff.Value;
                Cmd.Parameters.Add("@CompanyName", SqlDbType.NText);
                Cmd.Parameters["@CompanyName"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@Address", SqlDbType.NText);
                Cmd.Parameters["@Address"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Phone"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@Fax", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Fax"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@PerName", SqlDbType.NText);
                Cmd.Parameters["@PerName"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@Position", SqlDbType.NText);
                Cmd.Parameters["@Position"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@PerID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@PerID"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@PerPhoneNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@PerPhoneNo"].Value = System.DBNull.Value;
            }
            else
            {
                Cmd.Parameters.Add("@ReceiveStaffID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@ReceiveStaffID"].Value = System.DBNull.Value;
                Cmd.Parameters.Add("@CompanyName", SqlDbType.NText);
                Cmd.Parameters["@CompanyName"].Value = txtCompName.Text;
                Cmd.Parameters.Add("@Address", SqlDbType.NText);
                Cmd.Parameters["@Address"].Value = txtAddress.Text;
                Cmd.Parameters.Add("@Phone", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Phone"].Value = txtPhone.Text;
                Cmd.Parameters.Add("@Fax", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Fax"].Value = txtFax.Text;
                Cmd.Parameters.Add("@PerName", SqlDbType.NText);
                Cmd.Parameters["@PerName"].Value = txtPersonName.Text;
                Cmd.Parameters.Add("@Position", SqlDbType.NText);
                Cmd.Parameters["@Position"].Value = txtPosition.Text;
                if (txtID.Text != null)
                {
                    Cmd.Parameters.Add("@PerID", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@PerID"].Value = txtID.Text;
                }
                else
                {
                    Cmd.Parameters.Add("@PerID", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@PerID"].Value = System.DBNull.Value;
                }
                Cmd.Parameters.Add("@PerPhoneNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@PerPhoneNo"].Value = txtMobileNo.Text;
            }
            if (Convert.ToInt32(cbHandStatus.Value) == 1)
            {
                Cmd.Parameters.Add("@HandoverStatusID", SqlDbType.Int);
                Cmd.Parameters["@HandoverStatusID"].Value = 1;
                Cmd.Parameters.Add("@HandoverReceiveRe", SqlDbType.Date);
                Cmd.Parameters["@HandoverReceiveRe"].Value = System.DBNull.Value;
            }
            else
            {
                Cmd.Parameters.Add("@HandoverStatusID", SqlDbType.Int);
                Cmd.Parameters["@HandoverStatusID"].Value = 2;
                Cmd.Parameters.Add("@HandoverReceiveRe", SqlDbType.Date);
                Cmd.Parameters["@HandoverReceiveRe"].Value = dtReceiveRe.Value;
            }
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
            ASPxGridView4.DataBind();
            //Update Accessory Status
            string sql1 = "UPDATE TestAccessory SET Hold = 1 FROM HandoverAcc INNER JOIN TestAccessory ON HandoverAcc.AccID = TestAccessory.AccID WHERE HandoverAcc.HandoverID='" + handID + "'";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView2.DataBind();
            lbNotification.Text = "Phiếu bàn giao đã được cập nhật thông tin thành công";
            cbHandStatus.ReadOnly = false;
            dtReceiveRe.ReadOnly = false;
            btUpdate.Enabled = true;
            btsave.Enabled = false;
            btDelete.Enabled = true;
            btClearList.Enabled = true;
        }

        protected void cbHandStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cbHandStatus.Value) == 1)
                dtReceiveRe.Value = null;
            else
                dtReceiveRe.Value = System.DateTime.Now;
        }

        protected void dtReceiveRe_DateChanged(object sender, EventArgs e)
        {
            if (handSt == 1)
            {
                if (dtReceiveRe.Value != null)
                    cbHandStatus.Value = 2;
                else
                    cbHandStatus.Value = 1;
            }
        }

        protected void ASPxGridView3_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }


   
    }
}