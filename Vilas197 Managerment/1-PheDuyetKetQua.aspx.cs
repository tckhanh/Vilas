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
    public partial class PheDuyetKetQua : System.Web.UI.Page
    {
        public static string RC;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A5, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            //Set ReadOnly All Textbox
            cbRequestNo.ReadOnly = true;
            txtCompanyName.ReadOnly = true;
            txtContact.ReadOnly = true;
            txtEquipName.ReadOnly = true;
            txtContact.ReadOnly = true;
            txtMadeIn.ReadOnly = true;
            dtreceive.ReadOnly = true;
            dtrelease.ReadOnly = true;
            txtAddress.ReadOnly = true;
            txtBillNum.ReadOnly = true;
            txtcompmaking.ReadOnly = true;
            txtEquName.ReadOnly = true;
            txtfax.ReadOnly = true;
            txtModel.ReadOnly = true;
            txtperphone.ReadOnly = true;
            txtphone.ReadOnly = true;
            txtprice.ReadOnly = true;
            txtpriceintext.ReadOnly = true;
            txtstandard.ReadOnly = true;
            txttaxid.ReadOnly = true;
            txttestmethod.ReadOnly = true;
            mmAcce.ReadOnly = true;
            mmNote.ReadOnly = true;
            cbAssign.ReadOnly = true;
            cbStaff1.ReadOnly = true;
            cbStaff2.ReadOnly = true;
            btApprove.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn phê duyệt kết quả đo kiểm này?');");  
        }
          
     
        protected void cbTestSession_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dtTestDate.Value != null)
            {
                string sql = "SELECT date, tMor, hMor,tAft,hAft FROM Environment WHERE date=@date";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@date", SqlDbType.Date);
                Cmd.Parameters["@date"].Value = dtTestDate.Value;
                conn.Open();
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {
                    if (cbTestSession.Value == "0")
                    {
                        txtTemp.Text = dr.GetValue(1).ToString();
                        txtHum.Text = dr.GetValue(2).ToString();
                    }
                    if (cbTestSession.Value == "1")
                    {
                        txtTemp.Text = dr.GetValue(3).ToString();
                        txtHum.Text = dr.GetValue(4).ToString();
                    }
                }
                dr.Close();
                conn.Close();
            }
        }

        protected void dtTestDate_DateChanged(object sender, EventArgs e)
        {
            string sql = "SELECT date, tMor, hMor,tAft,hAft FROM Environment WHERE date=@date";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            Cmd.Parameters.Add("@date", SqlDbType.Date);
            Cmd.Parameters["@date"].Value = dtTestDate.Value;
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if(dr.HasRows)
            {
               if (cbTestSession.Value=="0")
               {
                txtTemp.Text = dr.GetValue(1).ToString();
                txtHum.Text = dr.GetValue(2).ToString();
               }
              if (cbTestSession.Value == "1")
               {
                txtTemp.Text = dr.GetValue(3).ToString();
                txtHum.Text = dr.GetValue(4).ToString();
               }
            }
            dr.Close();
            conn.Close();

        }

        protected void btApprove_Click(object sender, EventArgs e)
        {
            if (chIssue.Checked == true)
            {
                string sql = "Update TestReport Set ApproveDate=@ApproveDate Where AssignmentID='" + cbRequestNo.Value + "'";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@ApproveDate", SqlDbType.Date);
                Cmd.Parameters["@ApproveDate"].Value = System.DateTime.Now;
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                string sql2 = "UPDATE Request SET StatusID=5,RecheckStatusID=@RecheckStatusID WHERE RequestNo=('" + cbRequestNo.Text + "')";
                SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                if (RC == "")
                {
                    Cmd2.Parameters.Add("@RecheckStatusID", SqlDbType.Int);
                    Cmd2.Parameters["@RecheckStatusID"].Value = System.DBNull.Value;
                }
                else
                {
                    Cmd2.Parameters.Add("@RecheckStatusID", SqlDbType.Int);
                    Cmd2.Parameters["@RecheckStatusID"].Value = 5;
                }
                conn2.Open();
                Cmd2.ExecuteNonQuery();
                conn2.Close();
                btApprove.Enabled = false;
                lbExpect.Text = null;
                lbIssueRP.Text = "Kết quả đã được phê duyệt thành công";
                ASPxGridView3.DataBind();
                ASPxGridView4.DataBind();
            }
            else
            {
                string sql3 = "UPDATE Request SET StatusID=7,ApproveNonIssueDate=@ApproveNonIssueDate WHERE RequestNo=('" + cbRequestNo.Text + "')";
                SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                Cmd3.Parameters.Add("@ApproveNonIssueDate", SqlDbType.Date);
                Cmd3.Parameters["@ApproveNonIssueDate"].Value = System.DateTime.Now;
                conn3.Open();
                Cmd3.ExecuteNonQuery();
                conn3.Close();
                lbExpect.Text = null;
                lbIssueRP.Text = "Đã phê duyệt đề nghị không ban hành kết quả";
                ASPxGridView3.DataBind();
                ASPxGridView4.DataBind();
            }
        }

        protected void ASPxGridView3_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue2 = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "RequestID").ToString();
            string masterKeyValue3 = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "ReceiveStaffID").ToString();
            cbReceiveStaff.Value = masterKeyValue3;
            //Get Assignment Info
            string sql0 = "Select AssignStaffID, TestStaffID1, TestStaffID2, AssignDate, AssignNote From Assignment Where AssignmentID='" + masterKeyValue2 + "'";
            SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
            conn0.Open();
            SqlDataReader dr0 = Cmd0.ExecuteReader();
            dr0.Read();
            cbStaff1.Value = dr0.GetValue(1).ToString();
            cbStaff2.Value = dr0.GetValue(2).ToString();
            cbAssign.Value = dr0.GetValue(0).ToString();
            dtAssign.Value = dr0.GetValue(3);
            mmAssignNote.Text = dr0.GetValue(4).ToString();
            dr0.Close();
            conn0.Close();
            //Interface Prepare
            chIssue.Checked = true;
            chNonIssue.Checked = false;
            chIssue.ReadOnly = true;
            chNonIssue.ReadOnly = true;
            txtTestReportNo.Enabled = true;
            dtIssueReportDate.Enabled = true;
            dtTestDate.Enabled = true;
            cbTestSession.Enabled = true;
            txtTemp.Enabled = true;
            txtHum.Enabled = true;
            cbKind.Enabled = true;
            btApprove.Enabled = true;
            btReCheck.Enabled = true;
            lbIssueRP.Text = null;
            lbIssueOrNon.Text = "Lịch sử đo kiểm";
            lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            //Load EUT Information and Assignment Information
            string sql = "Select Request.RequestNo, Request.ContractNo, Request.BillNo,Company.CompanyName, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode,Contact.FullName, Contact.ContactPhone,Request.EquTypeName AS AddingName,Request.Model, Request.Manufacturer, Request.Serial_Imei,Request.Accessories, Request.ReceiveDate,Request.AppointmentDate, Request.Note,EquipmentType.EquTypeName, EquipmentType.Standards, EquipmentType.TestMethod,EquipmentType.Price,EquipmentType.PriceInText, Country.CountryName, Staff.StaffFullName, Staff.Username,Request.RequestID,Request.HoldEquip,Request.StatusID,Assignment.AssignNote,Assignment.AssignmentID,Request.InternalNote,Request.StaffIDApprove,Request.NonIssueDate,Request.StaffIDNonIssue, Request.ApprStaffCom, Request.TestStaffCom, Request.ReceiveStaffCom, Request.ApprComDate, Request.TestStaffComDate, Request.ReceiveStaffComDate,Request.RecheckStatusID From  Company,Province,Request,Contact, EquipmentType,Country, Staff,Assignment Where Company.CompanyID = Contact.CompanyID and Company.ProvinceID = Province.ProvinceID and Company.CompanyID = Request.CompanyID and Contact.ContactID = Request.ContactID and Request.EquTypeID = EquipmentType.EquTypeID and Request.MadeInID = Country.CountryID and Request.ReceiveStaffID = Staff.StaffID and Assignment.AssignmentID=Request.RequestID and Request.RequestNo='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            //Bind to Interface
            lblnotification.Text = null;
            cbRequestNo.Value = Convert.ToInt32(dr.GetValue(26));
            txtContractNo.Text = dr.GetValue(1).ToString();
            txtCompanyName.Text = dr.GetValue(3).ToString();
            txtAddress.Text = dr.GetValue(4).ToString();
            txtphone.Text = dr.GetValue(5).ToString();
            txtfax.Text = dr.GetValue(6).ToString();
            txttaxid.Text = dr.GetValue(7).ToString();
            txtContact.Text = dr.GetValue(8).ToString();
            txtperphone.Text = dr.GetValue(9).ToString();
            txtBillNum.Text = dr.GetValue(2).ToString();
            txtEquipName.Text = dr.GetValue(18).ToString();
            txtEquipName2.Text = dr.GetValue(18).ToString();
            txtEquName.Text = dr.GetValue(10).ToString();
            txtcompmaking.Text = dr.GetValue(12).ToString();
            txtMadeIn.Text = dr.GetValue(23).ToString();
            txtModel.Text = dr.GetValue(11).ToString();
            txtSN.Text = dr.GetValue(13).ToString();
            txttestmethod.Text = dr.GetValue(20).ToString();
            txtstandard.Text = dr.GetValue(19).ToString();
            txtprice.Text = dr.GetValue(21).ToString();
            txtpriceintext.Text = dr.GetValue(22).ToString();
            dtreceive.Value = Convert.ToDateTime(dr.GetValue(15));
            dtrelease.Value = Convert.ToDateTime(dr.GetValue(16));
            mmAcce.Text = dr.GetValue(14).ToString();
            mmNote.Text = dr.GetValue(17).ToString();
            mmApproveStaff.Text = dr.GetValue(35).ToString();
            mmTestingStaff.Text = dr.GetValue(36).ToString();
            mmReceiveStaff.Text = dr.GetValue(37).ToString();
            lbApprStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(38));
            lbTestStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(39));
            lbReceiveStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(40));
            RC = dr.GetValue(41).ToString();
            Int32 RQSt = Convert.ToInt32(dr.GetValue(28));
            if (RQSt == 6)
            {
                chIssue.Checked = false;
                chNonIssue.Checked = true;
                chIssue.ReadOnly = true;
                chNonIssue.ReadOnly = true;
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                cbTestSession.Enabled = false;
                txtTemp.Enabled = false;
                txtHum.Enabled = false;
                cbKind.Enabled = false;
                hlFileName.Text = null;
                hlFileName.NavigateUrl = null;
                dtIssueReportDate.Value = dr.GetValue(33);
                mmTestHistory.Text = dr.GetValue(31).ToString();
                cbApproveStaff.Value = dr.GetValue(32);
                cbIssueStaff.Value = dr.GetValue(34);
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueDate.Text = "Ngày đề xuất";
            }
            dr.Close();
            conn.Close();
            if (RQSt == 4)
            {
                //Load TestReport Information
                string sql1 = "Select RequestNo, TestReportNo, TestReportIssueDate,TestDate,Temperature, Humidity,TestHistory,Kind,TestDateSession,CreateRPStaff,ApproveStaff,TestRPFileName,TestRPURL From TestReport Where RequestNo='" + masterKeyValue + "'";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                SqlDataReader dr1 = Cmd1.ExecuteReader();
                dr1.Read();
                txtTestReportNo.Text = dr1.GetValue(1).ToString();
                dtIssueReportDate.Value = dr1.GetValue(2);
                dtTestDate.Value = dr1.GetValue(3);
                txtTemp.Text = dr1.GetValue(4).ToString();
                txtHum.Text = dr1.GetValue(5).ToString();
                mmTestHistory.Text = dr1.GetValue(6).ToString();
                cbKind.Value = dr1.GetValue(7);
                cbTestSession.Value = dr1.GetValue(8);
                cbIssueStaff.Value = dr1.GetValue(9);
                cbApproveStaff.Value = dr1.GetValue(10);
                hlFileName.Text = dr1.GetValue(11).ToString();
                hlFileName.NavigateUrl = dr1.GetValue(12).ToString();
                lbExpect.Text = null;
                dr1.Close();
                conn1.Close();
                lbIssueDate.Text = "Ngày ban hành";
            }
            if (cbApproveStaff.Value != null)
            {
                if (cbApproveStaff.Value.ToString() != Session["StaffID"].ToString())
                {
                    btApprove.Enabled = false;
                    btReCheck.Enabled = false;
                    lbIssueRP.Text = "Kết quả xử lý này được đề xuất người khác phê duyệt bạn chỉ có thể xem thông tin về kết quả xử lý này";
                }
            }

        }

        protected void chIssue_CheckedChanged(object sender, EventArgs e)
        {
            if (chIssue.Checked == true)
            {
                chNonIssue.Checked = false;
                txtTestReportNo.Enabled = true;
                dtTestDate.Enabled = true;
                cbTestSession.Enabled = true;
                lbIssueDate.Text = "Ngày ban hành";
                txtTemp.Enabled = true;
                txtHum.Enabled = true;
                cbKind.Enabled = true;
                lbIssueOrNon.Text = "Lịch sử đo kiểm";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                chNonIssue.Checked = true;
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                cbTestSession.Enabled = false;
                lbIssueDate.Text = "Ngày đề xuất";
                txtTemp.Enabled = false;
                txtHum.Enabled = false;
                cbKind.Enabled = false;
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void chNonIssue_CheckedChanged(object sender, EventArgs e)
        {
            if (chNonIssue.Checked == true)
            {
                chIssue.Checked = false;
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                cbTestSession.Enabled = false;
                lbIssueDate.Text = "Ngày đề xuất";
                txtTemp.Enabled = false;
                txtHum.Enabled = false;
                cbKind.Enabled = false;
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                chIssue.Checked = true;
                txtTestReportNo.Enabled = true;
                dtTestDate.Enabled = true;
                cbTestSession.Enabled = true;
                lbIssueDate.Text = "Ngày ban hành";
                txtTemp.Enabled = true;
                txtHum.Enabled = true;
                cbKind.Enabled = true;
                lbIssueOrNon.Text = "Lịch sử đo kiểm";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            }
        }

        protected void ASPxGridView4_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView4.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue2 = ASPxGridView4.GetRowValues(Convert.ToInt32(e.Parameters), "RequestID").ToString();
            string masterKeyValue3 = ASPxGridView4.GetRowValues(Convert.ToInt32(e.Parameters), "ReceiveStaffID").ToString();
            cbReceiveStaff.Value = masterKeyValue3;
            //Get Assignment Info
            string sql0 = "Select AssignStaffID, TestStaffID1, TestStaffID2, AssignDate, AssignNote From Assignment Where AssignmentID='" + masterKeyValue2 + "'";
            SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
            conn0.Open();
            SqlDataReader dr0 = Cmd0.ExecuteReader();
            dr0.Read();
            cbStaff1.Value = dr0.GetValue(1).ToString();
            cbStaff2.Value = dr0.GetValue(2).ToString();
            cbAssign.Value = dr0.GetValue(0).ToString();
            dtAssign.Value = dr0.GetValue(3);
            mmAssignNote.Text = dr0.GetValue(4).ToString();
            dr0.Close();
            conn0.Close();
            //Interface Prepare
            chIssue.Checked = true;
            chNonIssue.Checked = false;
            chIssue.ReadOnly = true;
            chNonIssue.ReadOnly = true;
            txtTestReportNo.Enabled = true;
            dtIssueReportDate.Enabled = true;
            dtTestDate.Enabled = true;
            cbTestSession.Enabled = true;
            txtTemp.Enabled = true;
            txtHum.Enabled = true;
            cbKind.Enabled = true;
            btApprove.Enabled = false;
            btReCheck.Enabled = false;
            lbIssueRP.Text = "Kết quả đo kiểm này đã được phê duyệt";
            lbIssueOrNon.Text = "Lịch sử đo kiểm";
            lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            //Load EUT Information and Assignment Information
            string sql = "Select Request.RequestNo, Request.ContractNo, Request.BillNo,Company.CompanyName, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode,Contact.FullName, Contact.ContactPhone,Request.EquTypeName AS AddingName,Request.Model, Request.Manufacturer, Request.Serial_Imei,Request.Accessories, Request.ReceiveDate,Request.AppointmentDate, Request.Note,EquipmentType.EquTypeName, EquipmentType.Standards, EquipmentType.TestMethod,EquipmentType.Price,EquipmentType.PriceInText, Country.CountryName, Staff.StaffFullName, Staff.Username,Request.RequestID,Request.HoldEquip,Request.StatusID,Assignment.AssignNote,Assignment.AssignmentID,Request.InternalNote,Request.StaffIDApprove,Request.NonIssueDate,Request.StaffIDNonIssue, Request.ApprStaffCom, Request.TestStaffCom, Request.ReceiveStaffCom, Request.ApprComDate, Request.TestStaffComDate, Request.ReceiveStaffComDate,Request.RecheckStatusID From  Company,Province,Request,Contact, EquipmentType,Country, Staff,Assignment Where Company.CompanyID = Contact.CompanyID and Company.ProvinceID = Province.ProvinceID and Company.CompanyID = Request.CompanyID and Contact.ContactID = Request.ContactID and Request.EquTypeID = EquipmentType.EquTypeID and Request.MadeInID = Country.CountryID and Request.ReceiveStaffID = Staff.StaffID and Assignment.AssignmentID=Request.RequestID and Request.RequestNo='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            //Bind to Interface
            lblnotification.Text = null;
            cbRequestNo.Value = Convert.ToInt32(dr.GetValue(26));
            txtContractNo.Text = dr.GetValue(1).ToString();
            txtCompanyName.Text = dr.GetValue(3).ToString();
            txtAddress.Text = dr.GetValue(4).ToString();
            txtphone.Text = dr.GetValue(5).ToString();
            txtfax.Text = dr.GetValue(6).ToString();
            txttaxid.Text = dr.GetValue(7).ToString();
            txtContact.Text = dr.GetValue(8).ToString();
            txtperphone.Text = dr.GetValue(9).ToString();
            txtBillNum.Text = dr.GetValue(2).ToString();
            txtEquipName.Text = dr.GetValue(18).ToString();
            txtEquipName2.Text = dr.GetValue(18).ToString();
            txtEquName.Text = dr.GetValue(10).ToString();
            txtcompmaking.Text = dr.GetValue(12).ToString();
            txtMadeIn.Text = dr.GetValue(23).ToString();
            txtModel.Text = dr.GetValue(11).ToString();
            txtSN.Text = dr.GetValue(13).ToString();
            txttestmethod.Text = dr.GetValue(20).ToString();
            txtstandard.Text = dr.GetValue(19).ToString();
            txtprice.Text = dr.GetValue(21).ToString();
            txtpriceintext.Text = dr.GetValue(22).ToString();
            dtreceive.Value = Convert.ToDateTime(dr.GetValue(15));
            dtrelease.Value = Convert.ToDateTime(dr.GetValue(16));
            mmAcce.Text = dr.GetValue(14).ToString();
            mmNote.Text = dr.GetValue(17).ToString();
            mmApproveStaff.Text = dr.GetValue(35).ToString();
            mmTestingStaff.Text = dr.GetValue(36).ToString();
            mmReceiveStaff.Text = dr.GetValue(37).ToString();
            lbApprStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(38));
            lbTestStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(39));
            lbReceiveStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(40));
            Int32 RQSt = Convert.ToInt32(dr.GetValue(28));
            if (RQSt == 7)
            {
                chIssue.Checked = false;
                chNonIssue.Checked = true;
                chIssue.ReadOnly = true;
                chNonIssue.ReadOnly = true;
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                cbTestSession.Enabled = false;
                txtTemp.Enabled = false;
                txtHum.Enabled = false;
                cbKind.Enabled = false;
                hlFileName.Text = null;
                hlFileName.NavigateUrl = null;
                dtIssueReportDate.Value = dr.GetValue(33);
                mmTestHistory.Text = dr.GetValue(31).ToString();
                cbApproveStaff.Value = dr.GetValue(32);
                cbIssueStaff.Value = dr.GetValue(34);
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueDate.Text = "Ngày đề xuất";
            }
            dr.Close();
            conn.Close();
            if (RQSt == 5)
            {
                //Load TestReport Information
                string sql1 = "Select RequestNo, TestReportNo, TestReportIssueDate,TestDate,Temperature, Humidity,TestHistory,Kind,TestDateSession,CreateRPStaff,ApproveStaff,TestRPFileName,TestRPURL From TestReport Where RequestNo='" + masterKeyValue + "'";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                SqlDataReader dr1 = Cmd1.ExecuteReader();
                dr1.Read();
                txtTestReportNo.Text = dr1.GetValue(1).ToString();
                dtIssueReportDate.Value = dr1.GetValue(2);
                dtTestDate.Value = dr1.GetValue(3);
                txtTemp.Text = dr1.GetValue(4).ToString();
                txtHum.Text = dr1.GetValue(5).ToString();
                mmTestHistory.Text = dr1.GetValue(6).ToString();
                cbKind.Value = dr1.GetValue(7);
                cbTestSession.Value = dr1.GetValue(8);
                cbIssueStaff.Value = dr1.GetValue(9);
                cbApproveStaff.Value = dr1.GetValue(10);
                hlFileName.Text = dr1.GetValue(11).ToString();
                hlFileName.NavigateUrl = dr1.GetValue(12).ToString();
                lbExpect.Text = null;
                dr1.Close();
                conn1.Close();
                lbIssueDate.Text = "Ngày ban hành";
            }
        }

        protected void ASPxGridView3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            string k = e.GetValue("TestReportKind").ToString();
            if (k == "0")
                e.Row.BackColor = System.Drawing.Color.NavajoWhite;

        }

        protected void ASPxGridView4_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            string k = e.GetValue("TestReportKind").ToString();
            if (k == "0")
                e.Row.BackColor = System.Drawing.Color.NavajoWhite;
        }

        protected void btReCheck_Click(object sender, EventArgs e)
        {
            string sql3 = "UPDATE Request SET ApprStaffCom=@ApprStaffCom,ApprComDate=@ApprComDate,RecheckStatusID=1  WHERE RequestNo=('" + cbRequestNo.Text + "')";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            Cmd3.Parameters.Add("@ApprStaffCom", SqlDbType.NText);
            Cmd3.Parameters["@ApprStaffCom"].Value = mmApproveStaff.Text;
            Cmd3.Parameters.Add("@ApprComDate", SqlDbType.Date);
            Cmd3.Parameters["@ApprComDate"].Value = System.DateTime.Now;
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            btReCheck.Enabled = false;
            btApprove.Enabled = false;
            lbIssueRP.Text = "Đã yêu cầu chuyên viên đo xử lý lại kết quả";
            ASPxGridView3.DataBind();
            ASPxGridView4.DataBind();
            ASPxGridView5.DataBind();
        }

        protected void ASPxGridView5_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            chIssue.Checked = true;
            chNonIssue.Checked = false;
            chIssue.ReadOnly = true;
            chNonIssue.ReadOnly = true;
            txtTestReportNo.Enabled = true;
            dtIssueReportDate.Enabled = true;
            dtTestDate.Enabled = true;
            cbTestSession.Enabled = true;
            lbIssueDate.Text = "Ngày ban hành";
            txtTemp.Enabled = true;
            txtHum.Enabled = true;
            cbKind.Enabled = true;
            lbIssueOrNon.Text = "Lịch sử đo kiểm";
            lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView5.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue2 = ASPxGridView5.GetRowValues(Convert.ToInt32(e.Parameters), "RequestID").ToString();
            string masterKeyValue3 = ASPxGridView5.GetRowValues(Convert.ToInt32(e.Parameters), "ReceiveStaffID").ToString();
            cbReceiveStaff.Value = masterKeyValue3;
            //Get Assignment Info
            string sql0 = "Select AssignStaffID, TestStaffID1, TestStaffID2, AssignDate, AssignNote From Assignment Where AssignmentID='" + masterKeyValue2 + "'";
            SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
            conn0.Open();
            SqlDataReader dr0 = Cmd0.ExecuteReader();
            dr0.Read();
            cbStaff1.Value = dr0.GetValue(1).ToString();
            cbStaff2.Value = dr0.GetValue(2).ToString();
            cbAssign.Value = dr0.GetValue(0).ToString();
            dtAssign.Value = dr0.GetValue(3);
            mmAssignNote.Text = dr0.GetValue(4).ToString();
            dr0.Close();
            conn0.Close();
            //Interface Prepare
            chIssue.Checked = true;
            chNonIssue.Checked = false;
            chIssue.ReadOnly = true;
            chNonIssue.ReadOnly = true;
            txtTestReportNo.Enabled = true;
            dtIssueReportDate.Enabled = true;
            dtTestDate.Enabled = true;
            cbTestSession.Enabled = true;
            txtTemp.Enabled = true;
            txtHum.Enabled = true;
            cbKind.Enabled = true;
            btReCheck.Enabled = false;
            btReCheck.Enabled = false;
            lbIssueOrNon.Text = "Lịch sử đo kiểm";
            lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            //Load EUT Information and Assignment Information
            string sql = "Select Request.RequestNo, Request.ContractNo, Request.BillNo,Company.CompanyName, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode,Contact.FullName, Contact.ContactPhone,Request.EquTypeName AS AddingName,Request.Model, Request.Manufacturer, Request.Serial_Imei,Request.Accessories, Request.ReceiveDate,Request.AppointmentDate, Request.Note,EquipmentType.EquTypeName, EquipmentType.Standards, EquipmentType.TestMethod,EquipmentType.Price,EquipmentType.PriceInText, Country.CountryName, Staff.StaffFullName, Staff.Username,Request.RequestID,Request.HoldEquip,Request.StatusID,Assignment.AssignNote,Assignment.AssignmentID,Request.InternalNote,Request.StaffIDApprove,Request.NonIssueDate,Request.StaffIDNonIssue, Request.ApprStaffCom, Request.TestStaffCom, Request.ReceiveStaffCom, Request.ApprComDate, Request.TestStaffComDate, Request.ReceiveStaffComDate,Request.RecheckStatusID From  Company,Province,Request,Contact, EquipmentType,Country, Staff,Assignment Where Company.CompanyID = Contact.CompanyID and Company.ProvinceID = Province.ProvinceID and Company.CompanyID = Request.CompanyID and Contact.ContactID = Request.ContactID and Request.EquTypeID = EquipmentType.EquTypeID and Request.MadeInID = Country.CountryID and Request.ReceiveStaffID = Staff.StaffID and Assignment.AssignmentID=Request.RequestID and Request.RequestNo='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            //Bind to Interface
            lblnotification.Text = null;
            cbRequestNo.Value = Convert.ToInt32(dr.GetValue(26));
            txtContractNo.Text = dr.GetValue(1).ToString();
            txtCompanyName.Text = dr.GetValue(3).ToString();
            txtAddress.Text = dr.GetValue(4).ToString();
            txtphone.Text = dr.GetValue(5).ToString();
            txtfax.Text = dr.GetValue(6).ToString();
            txttaxid.Text = dr.GetValue(7).ToString();
            txtContact.Text = dr.GetValue(8).ToString();
            txtperphone.Text = dr.GetValue(9).ToString();
            txtBillNum.Text = dr.GetValue(2).ToString();
            txtEquipName.Text = dr.GetValue(18).ToString();
            txtEquipName2.Text = dr.GetValue(18).ToString();
            txtEquName.Text = dr.GetValue(10).ToString();
            txtcompmaking.Text = dr.GetValue(12).ToString();
            txtMadeIn.Text = dr.GetValue(23).ToString();
            txtModel.Text = dr.GetValue(11).ToString();
            txtSN.Text = dr.GetValue(13).ToString();
            txttestmethod.Text = dr.GetValue(20).ToString();
            txtstandard.Text = dr.GetValue(19).ToString();
            txtprice.Text = dr.GetValue(21).ToString();
            txtpriceintext.Text = dr.GetValue(22).ToString();
            dtreceive.Value = Convert.ToDateTime(dr.GetValue(15));
            dtrelease.Value = Convert.ToDateTime(dr.GetValue(16));
            mmAcce.Text = dr.GetValue(14).ToString();
            mmNote.Text = dr.GetValue(17).ToString();
            mmApproveStaff.Text = dr.GetValue(35).ToString();
            mmTestingStaff.Text = dr.GetValue(36).ToString();
            mmReceiveStaff.Text = dr.GetValue(37).ToString();
            lbApprStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(38));
            lbTestStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(39));
            lbReceiveStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(40));
            Int32 RQSt = Convert.ToInt32(dr.GetValue(28));
            if (RQSt == 6)
            {
                chIssue.Checked = false;
                chNonIssue.Checked = true;
                chIssue.ReadOnly = true;
                chNonIssue.ReadOnly = true;
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                cbTestSession.Enabled = false;
                txtTemp.Enabled = false;
                txtHum.Enabled = false;
                cbKind.Enabled = false;
                hlFileName.Text = null;
                hlFileName.NavigateUrl = null;
                dtIssueReportDate.Value = dr.GetValue(33);
                mmTestHistory.Text = dr.GetValue(31).ToString();
                cbApproveStaff.Value = dr.GetValue(32);
                cbIssueStaff.Value = dr.GetValue(34);
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueDate.Text = "Ngày đề xuất";
            }
            dr.Close();
            conn.Close();
            if (RQSt == 4)
            {
                //Load TestReport Information
                string sql1 = "Select RequestNo, TestReportNo, TestReportIssueDate,TestDate,Temperature, Humidity,TestHistory,Kind,TestDateSession,CreateRPStaff,ApproveStaff,TestRPFileName,TestRPURL From TestReport Where RequestNo='" + masterKeyValue + "'";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                SqlDataReader dr1 = Cmd1.ExecuteReader();
                dr1.Read();
                txtTestReportNo.Text = dr1.GetValue(1).ToString();
                dtIssueReportDate.Value = dr1.GetValue(2);
                dtTestDate.Value = dr1.GetValue(3);
                txtTemp.Text = dr1.GetValue(4).ToString();
                txtHum.Text = dr1.GetValue(5).ToString();
                mmTestHistory.Text = dr1.GetValue(6).ToString();
                cbKind.Value = dr1.GetValue(7);
                cbTestSession.Value = dr1.GetValue(8);
                cbIssueStaff.Value = dr1.GetValue(9);
                cbApproveStaff.Value = dr1.GetValue(10);
                hlFileName.Text = dr1.GetValue(11).ToString();
                hlFileName.NavigateUrl = dr1.GetValue(12).ToString();
                lbExpect.Text = null;
                dr1.Close();
                conn1.Close();
                lbIssueDate.Text = "Ngày ban hành";
            }
            if (RQSt == 3)
            {
                chIssue.Checked = false;
                chNonIssue.Checked = false;
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                dtTestDate.Value = null;
                cbTestSession.Enabled = false;
                cbTestSession.Value = null;
                lbIssueDate.Text = "Ngày ban hành";
                txtTemp.Enabled = false;
                txtTemp.Text = null;
                txtHum.Enabled = false;
                txtHum.Text = null;
                cbKind.Enabled = false;
                cbKind.Value = null;
                mmTestHistory.Text = null;
                hlFileName.Text = null;
                hlFileName.NavigateUrl = null;
                dtIssueReportDate.Value = null;
                cbIssueStaff.Value = null;
                cbApproveStaff.Value = null;
                lbIssueOrNon.Text = "Lịch sử đo kiểm";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            }
            btApprove.Enabled = false;
            lbIssueRP.Text = "Phiếu yêu cầu đo kiểm đang được xử lý lại";
        }

        protected void ASPxGridView5_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {

        }

    }
}