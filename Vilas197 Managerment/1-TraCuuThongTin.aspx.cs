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
    public partial class TraCuuThongTin : System.Web.UI.Page
    {
        public static Int32 RQNo;
        public static Int32 RBID;
        public static string RQNo2;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A8, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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

        protected void ASPxGridView3_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue2 = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "RequestID").ToString();
            string masterKeyValue3 = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "ReceiveStaffID").ToString();
            cbReceiveStaff.Value = masterKeyValue3;
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
            lbIssueRP.Text = null;
            lbIssueOrNon.Text = "Lịch sử đo kiểm";
            lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            //Load EUT Information
            string sql = "Select Request.RequestNo, Request.ContractNo, Request.BillNo,Company.CompanyName, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode,Contact.FullName, Contact.ContactPhone,Request.EquTypeName AS AddingName,Request.Model, Request.Manufacturer, Request.Serial_Imei,Request.Accessories, Request.ReceiveDate,Request.AppointmentDate, Request.Note,EquipmentType.EquTypeName, EquipmentType.Standards, EquipmentType.TestMethod,EquipmentType.Price,EquipmentType.PriceInText, Country.CountryName, Staff.StaffFullName, Staff.Username,Request.RequestID,Request.HoldEquip,Request.StatusID,Request.StatusID AS S2,Request.StatusID AS S3,Request.InternalNote,Request.StaffIDApprove,Request.NonIssueDate,Request.StaffIDNonIssue, Request.ApprStaffCom, Request.TestStaffCom, Request.ReceiveStaffCom, Request.ApprComDate, Request.TestStaffComDate, Request.ReceiveStaffComDate,Request.RecheckStatusID,Request.ApproveNonIssueDate From  Company,Province,Request,Contact, EquipmentType,Country, Staff Where Company.CompanyID = Contact.CompanyID and Company.ProvinceID = Province.ProvinceID and Company.CompanyID = Request.CompanyID and Contact.ContactID = Request.ContactID and Request.EquTypeID = EquipmentType.EquTypeID and Request.MadeInID = Country.CountryID and Request.ReceiveStaffID = Staff.StaffID and Request.RequestNo='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            //Bind to Interface
            if (dr.HasRows)
            {
                lblnotification.Text = null;
                cbRequestNo.Value = Convert.ToInt32(dr.GetValue(26));
                txtRequestNo.Text = dr.GetValue(0).ToString();
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
                String Recheck = dr.GetValue(41).ToString();
                if (Recheck == "")
                    paComment.Visible = false;
                else
                    paComment.Visible = true;
                Int32 RQSt = Convert.ToInt32(dr.GetValue(28));
                //Update Status Bar Notification
                string sql3 = "Select StatusID,StatusName From  RequestStatus Where RequestStatus.StatusID='" + RQSt + "'";
                SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                conn3.Open();
                SqlDataReader dr3 = Cmd3.ExecuteReader();
                dr3.Read();
                txtNotifi.Text = dr3.GetValue(1).ToString();
                dr3.Close();
                conn3.Close();
                //EUT Status
                //Get EUT Status
                if (Convert.ToInt32(dr.GetValue(27)) == 1)
                {
                    txtEquip.Text = "Đang lưu mẫu";
                    txtEquip.BackColor = System.Drawing.Color.Green;
                }
                else
                {
                    txtEquip.Text = "Đã trả mẫu";
                    txtEquip.BackColor = System.Drawing.Color.Blue;
                }
                if (RQSt == 6 || RQSt==7)
                {
                    chIssue.Checked = false;
                    chNonIssue.Checked = true;
                    chIssue.ReadOnly = true;
                    chNonIssue.ReadOnly = true;
                    txtTestReportNo.Enabled = false;
                    txtTestReportNo.Text = null;
                    dtTestDate.Enabled = false;
                    dtTestDate.Value = null;
                    cbTestSession.Enabled = false;
                    cbTestSession.Value = null;
                    txtTemp.Enabled = false;
                    txtTemp.Text = null;
                    txtHum.Enabled = false;
                    txtHum.Text = null;
                    cbKind.Enabled = false;
                    cbKind.Value = null;
                    dtIssueReportDate.Value = dr.GetValue(33);
                    mmTestHistory.Text = dr.GetValue(31).ToString();
                    cbApproveStaff.Value = dr.GetValue(32);
                    dtApproveDate.Value = dr.GetValue(42);
                    cbIssueStaff.Value = dr.GetValue(34);
                    lbIssueOrNon.Text = "Lý do không ban hành KQ";
                    lbIssueDate.Text = "Ngày đề xuất";
                    //Update Status Bar
                    txtTestRP.Text = "Chưa có KQ";
                    lbReportNo.Text = null;
                    txtTestRP.BackColor = System.Drawing.Color.Red;
                    txtRedBill.Text = "Chưa có Hóa đơn";
                    lbRedBillNo.Text = null;
                    txtRedBill.BackColor = System.Drawing.Color.Red;
                }
                if (RQSt == 4 || RQSt==5)
                {
                    //Load TestReport Information
                    string sql1 = "Select RequestNo, TestReportNo, TestReportIssueDate,TestDate,Temperature, Humidity,TestHistory,Kind,TestDateSession,CreateRPStaff,ApproveStaff,HoldTest,HoldRedBill,RedBillID,TestRPFileName,TestRPURL,ApproveDate From TestReport Where RequestNo='" + masterKeyValue + "'";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    conn1.Open();
                    SqlDataReader dr1 = Cmd1.ExecuteReader();
                    dr1.Read();
                    //Update Data to TestReport
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
                    dtApproveDate.Value = dr1.GetValue(16);
                    hlFileName.Text = dr1.GetValue(14).ToString();
                    hlFileName.NavigateUrl = dr1.GetValue(15).ToString();
                    lbExpect.Text = null;
                    //Get Test Report Status
                    if (Convert.ToInt32(dr1.GetValue(11)) == 1)
                    {
                        if (RQSt == 5)
                        {
                            txtTestRP.Text = "Đang giữ KQ";
                            lbReportNo.Text = dr1.GetValue(1).ToString();
                            txtTestRP.BackColor = System.Drawing.Color.Green;
                        }
                        if (RQSt == 4)
                        {
                            txtTestRP.Text = "Đang giữ KQ";
                            lbReportNo.Text = dr1.GetValue(1).ToString();
                            txtTestRP.BackColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        txtTestRP.Text = "Đã trả KQ";
                        lbReportNo.Text = dr1.GetValue(1).ToString();
                        txtTestRP.BackColor = System.Drawing.Color.Blue;
                    }
                    //Get RedBill Status
                    if (dr1.GetValue(13).ToString() == "")
                        RBID = 0;
                    else
                        RBID = Convert.ToInt32(dr1.GetValue(13));
                    string sql2 = "SELECT RedBillNo, RedBillDate, CompanyID, PriceNonTax, PriceIncludeTax, Note,PriceInText, Finish,Tax FROM RedBill WHERE RedBillID='" +RBID+ "'";
                    SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                    conn2.Open();
                    SqlDataReader dr2 = Cmd2.ExecuteReader();
                    dr2.Read();
                    if (dr1.GetValue(12).ToString() == "")
                    {
                        if (dr1.GetValue(13).ToString() == "")
                        {
                            txtRedBill.Text = "Chưa có Hóa đơn";
                            lbRedBillNo.Text = null;
                            txtRedBill.BackColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            txtRedBill.Text = "Chờ ký Hóa đơn";
                            lbRedBillNo.Text = dr2.GetValue(0).ToString();
                            txtRedBill.BackColor = System.Drawing.Color.Red;
                        }
                    }
                    else if (Convert.ToInt32(dr1.GetValue(12)) == 0)
                    {
                        txtRedBill.Text = "Đã trả Hóa đơn";
                        lbRedBillNo.Text = dr2.GetValue(0).ToString();
                        txtRedBill.BackColor = System.Drawing.Color.Blue;
                    }
                    else if (Convert.ToInt32(dr1.GetValue(12)) == 1)
                    {
                        txtRedBill.Text = "Đang giữ Hóa đơn";
                        lbRedBillNo.Text = dr2.GetValue(0).ToString();
                        txtRedBill.BackColor = System.Drawing.Color.Green;
                    }
                    dr2.Close();
                    conn2.Close();
                    dr1.Close();
                    conn1.Close();
                    lbIssueDate.Text = "Ngày ban hành";
                }
                if(RQSt== 1 || RQSt==2 || RQSt==3)
                {
                    txtTestReportNo.Text = null;
                    dtIssueReportDate.Value = null;
                    dtTestDate.Value = null;
                    txtTemp.Text = null;
                    txtHum.Text = null;
                    mmTestHistory.Text = null;
                    cbKind.Value = null;
                    cbTestSession.Value = null;
                    cbIssueStaff.Value = null;
                    cbApproveStaff.Value = null;
                    lbExpect.Text = null;
                    //Update Status Bar
                    txtTestRP.Text = "Chưa có KQ";
                    lbReportNo.Text = null;
                    txtTestRP.BackColor = System.Drawing.Color.Red;
                    txtRedBill.Text = "Chưa có Hóa đơn";
                    lbRedBillNo.Text = null;
                    txtRedBill.BackColor = System.Drawing.Color.Red;
                }
            }
            dr.Close();
            conn.Close();
            RQNo = Convert.ToInt32(cbRequestNo.Value);
            RQNo2 = cbRequestNo.Text;
            //Get Assignment Info
            string sql0 = "Select AssignStaffID, TestStaffID1, TestStaffID2, AssignDate, AssignNote From Assignment Where AssignmentID='" + cbRequestNo.Value + "'";
            SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
            conn0.Open();
            SqlDataReader dr0 = Cmd0.ExecuteReader();
            dr0.Read();
            if (dr0.HasRows)
            {
                cbStaff1.Value = dr0.GetValue(1).ToString();
                cbStaff2.Value = dr0.GetValue(2).ToString();
                cbAssign.Value = dr0.GetValue(0).ToString();
                dtAssign.Value = dr0.GetValue(3);
                mmAssignNote.Text = dr0.GetValue(4).ToString();
            }
            else
            {
                cbStaff1.Value = null;
                cbStaff2.Value = null;
                cbAssign.Value = null;
                dtAssign.Value = null;
                txtEquipName2.Text = null;
                mmAssignNote.Text = null;
            }
            dr0.Close();
            conn0.Close();
            
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

             protected void ASPxGridView3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            DateTime d = Convert.ToDateTime(e.GetValue("AppointmentDate"));
            Int32 s = Convert.ToInt32(e.GetValue("StatusID"));
            DateTime n = DateTime.Now;
            TimeSpan diff = d - n;
            if (diff.Days <= 2 && diff.Days >= 0 && (s!=5 && s!=7))
                e.Row.BackColor = System.Drawing.Color.FromArgb(0xFF, 0xFF, 0x99);
            if (diff.Days < 0 && (s != 5 && s != 7))
                e.Row.BackColor = System.Drawing.Color.Tomato;

        }

             protected void btSearch_Click(object sender, EventArgs e)
             {

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
                 lbIssueRP.Text = null;
                 lbIssueOrNon.Text = "Lịch sử đo kiểm";
                 lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
                 //Load EUT Information
                 string sql = "Select Request.RequestNo, Request.ContractNo, Request.BillNo,Company.CompanyName, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode,Contact.FullName, Contact.ContactPhone,Request.EquTypeName AS AddingName,Request.Model, Request.Manufacturer, Request.Serial_Imei,Request.Accessories, Request.ReceiveDate,Request.AppointmentDate, Request.Note,EquipmentType.EquTypeName, EquipmentType.Standards, EquipmentType.TestMethod,EquipmentType.Price,EquipmentType.PriceInText, Country.CountryName, Staff.StaffFullName, Staff.Username,Request.RequestID,Request.HoldEquip,Request.StatusID,Request.StatusID AS S2,Request.StatusID AS S3,Request.InternalNote,Request.StaffIDApprove,Request.NonIssueDate,Request.StaffIDNonIssue,Request.ReceiveStaffID, Request.ApprStaffCom, Request.TestStaffCom, Request.ReceiveStaffCom, Request.ApprComDate, Request.TestStaffComDate, Request.ReceiveStaffComDate,Request.RecheckStatusID,Request.ApproveNonIssueDate From  Company,Province,Request,Contact, EquipmentType,Country, Staff Where Company.CompanyID = Contact.CompanyID and Company.ProvinceID = Province.ProvinceID and Company.CompanyID = Request.CompanyID and Contact.ContactID = Request.ContactID and Request.EquTypeID = EquipmentType.EquTypeID and Request.MadeInID = Country.CountryID and Request.ReceiveStaffID = Staff.StaffID and Request.RequestNo='" + txtRequestNo.Text + "'";
                 SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                 SqlCommand Cmd = new SqlCommand(sql, conn);
                 conn.Open();
                 SqlDataReader dr = Cmd.ExecuteReader();
                 dr.Read();
                 //Bind to Interface
                 if (dr.HasRows)
                 {
                     //Get RequestNo from ASPxGridView
                     string masterKeyValue = dr.GetValue(0).ToString();
                     lblnotification.Text = null;
                     cbRequestNo.Value = Convert.ToInt32(dr.GetValue(26));
                     txtRequestNo.Text = dr.GetValue(0).ToString();
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
                     cbReceiveStaff.Value = dr.GetValue(35).ToString();
                     mmApproveStaff.Text = dr.GetValue(36).ToString();
                     mmTestingStaff.Text = dr.GetValue(37).ToString();
                     mmReceiveStaff.Text = dr.GetValue(38).ToString();
                     lbApprStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(39));
                     lbTestStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(40));
                     lbReceiveStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr.GetValue(41));
                     Int32 RQSt = Convert.ToInt32(dr.GetValue(28));
                     string Recheck = dr.GetValue(42).ToString();
                     if (Recheck == "")
                         paComment.Visible = false;
                     else
                         paComment.Visible = true;
                     //Update Status Bar Notification
                     string sql3 = "Select StatusID,StatusName From  RequestStatus Where RequestStatus.StatusID='" + RQSt + "'";
                     SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                     SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                     conn3.Open();
                     SqlDataReader dr3 = Cmd3.ExecuteReader();
                     dr3.Read();
                     txtNotifi.Text = dr3.GetValue(1).ToString();
                     dr3.Close();
                     conn3.Close();
                         //EUT Status
                     //Get EUT Status
                     if (Convert.ToInt32(dr.GetValue(27)) == 1)
                     {
                         txtEquip.Text = "Đang lưu mẫu";
                         txtEquip.BackColor = System.Drawing.Color.Green;
                     }
                     else
                     {
                         txtEquip.Text = "Đã trả mẫu";
                         txtEquip.BackColor = System.Drawing.Color.Blue;
                     }
                     if (RQSt == 6 || RQSt == 7)
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
                         dtIssueReportDate.Value = dr.GetValue(33);
                         mmTestHistory.Text = dr.GetValue(31).ToString();
                         cbApproveStaff.Value = dr.GetValue(32);
                         dtApproveDate.Value = dr.GetValue(43);
                         cbIssueStaff.Value = dr.GetValue(34);
                         lbIssueOrNon.Text = "Lý do không ban hành KQ";
                         lbIssueDate.Text = "Ngày đề xuất";
                         //Update Status Bar
                         txtTestRP.Text = "Chưa có KQ";
                         lbReportNo.Text = null;
                         txtTestRP.BackColor = System.Drawing.Color.Red;
                         txtRedBill.Text = "Chưa có Hóa đơn";
                         lbRedBillNo.Text = null;
                         txtRedBill.BackColor = System.Drawing.Color.Red;
                     }
                     if (RQSt == 4 || RQSt == 5)
                     {
                         //Load TestReport Information
                         string sql1 = "Select RequestNo, TestReportNo, TestReportIssueDate,TestDate,Temperature, Humidity,TestHistory,Kind,TestDateSession,CreateRPStaff,ApproveStaff,HoldTest,HoldRedBill,RedBillID,TestRPFileName,TestRPURL,ApproveDate From TestReport Where RequestNo='" + masterKeyValue + "'";
                         SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                         SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                         conn1.Open();
                         SqlDataReader dr1 = Cmd1.ExecuteReader();
                         dr1.Read();
                         //Update Data to TestReport
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
                         dtApproveDate.Value = dr1.GetValue(16);
                         hlFileName.Text = dr1.GetValue(14).ToString();
                         hlFileName.NavigateUrl = dr1.GetValue(15).ToString();
                         lbExpect.Text = null;
                         //Get Test Report Status
                         if (Convert.ToInt32(dr1.GetValue(11)) == 1)
                         {
                             if (RQSt == 5)
                             {
                                 txtTestRP.Text = "Đang giữ KQ";
                                 lbReportNo.Text = dr1.GetValue(1).ToString();
                                 txtTestRP.BackColor = System.Drawing.Color.Green;
                             }
                             if (RQSt == 4)
                             {
                                 txtTestRP.Text = "Đang giữ KQ";
                                 lbReportNo.Text = dr1.GetValue(1).ToString();
                                 txtTestRP.BackColor = System.Drawing.Color.Red;
                             }
                         }
                         else
                         {
                             txtTestRP.Text = "Đã trả KQ";
                             lbReportNo.Text = dr1.GetValue(1).ToString();
                             txtTestRP.BackColor = System.Drawing.Color.Blue;
                         }
                         //Get RedBill Status
                         if (dr1.GetValue(13).ToString() == "")
                             RBID = 0;
                         else
                             RBID = Convert.ToInt32(dr1.GetValue(13));
                         string sql2 = "SELECT RedBillNo, RedBillDate, CompanyID, PriceNonTax, PriceIncludeTax, Note,PriceInText, Finish,Tax FROM RedBill WHERE RedBillID='" + RBID + "'";
                         SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                         SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                         conn2.Open();
                         SqlDataReader dr2 = Cmd2.ExecuteReader();
                         dr2.Read();
                         if (dr1.GetValue(12).ToString() == "")
                         {
                             if (dr1.GetValue(13).ToString() == "")
                             {
                                 txtRedBill.Text = "Chưa có Hóa đơn";
                                 lbRedBillNo.Text = null;
                                 txtRedBill.BackColor = System.Drawing.Color.Red;
                             }
                             else
                             {
                                 txtRedBill.Text = "Chờ ký Hóa đơn";
                                 lbRedBillNo.Text = dr2.GetValue(0).ToString();
                                 txtRedBill.BackColor = System.Drawing.Color.Red;
                             }
                         }
                         else if (Convert.ToInt32(dr1.GetValue(12)) == 0)
                         {
                             txtRedBill.Text = "Đã trả Hóa đơn";
                             lbRedBillNo.Text = dr2.GetValue(0).ToString();
                             txtRedBill.BackColor = System.Drawing.Color.Blue;
                         }
                         else if (Convert.ToInt32(dr1.GetValue(12)) == 1)
                         {
                             txtRedBill.Text = "Đang giữ Hóa đơn";
                             lbRedBillNo.Text = dr2.GetValue(0).ToString();
                             txtRedBill.BackColor = System.Drawing.Color.Green;
                         }
                         dr2.Close();
                         conn2.Close();
                         dr1.Close();
                         conn1.Close();
                         lbIssueDate.Text = "Ngày ban hành";
                     }
                     if (RQSt == 1 || RQSt == 2 || RQSt == 3)
                     {
                         txtTestReportNo.Text = null;
                         dtIssueReportDate.Value = null;
                         dtTestDate.Value = null;
                         txtTemp.Text = null;
                         txtHum.Text = null;
                         mmTestHistory.Text = null;
                         cbKind.Value = null;
                         cbTestSession.Value = null;
                         cbIssueStaff.Value = null;
                         cbApproveStaff.Value = null;
                         lbExpect.Text = null;
                         //Update Status Bar
                         txtTestRP.Text = "Chưa có KQ";
                         lbReportNo.Text = null;
                         txtTestRP.BackColor = System.Drawing.Color.Red;
                         txtRedBill.Text = "Chưa có Hóa đơn";
                         lbRedBillNo.Text = null;
                         txtRedBill.BackColor = System.Drawing.Color.Red;
                     }
                 }
                 dr.Close();
                 conn.Close();
                 RQNo = Convert.ToInt32(cbRequestNo.Value);
                 RQNo2 = cbRequestNo.Text;
                 //Get Assignment Info
                 string sql0 = "Select AssignStaffID, TestStaffID1, TestStaffID2, AssignDate, AssignNote From Assignment Where AssignmentID='" + cbRequestNo.Value + "'";
                 SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                 SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
                 conn0.Open();
                 SqlDataReader dr0 = Cmd0.ExecuteReader();
                 dr0.Read();
                 if (dr0.HasRows)
                 {
                     cbStaff1.Value = dr0.GetValue(1).ToString();
                     cbStaff2.Value = dr0.GetValue(2).ToString();
                     cbAssign.Value = dr0.GetValue(0).ToString();
                     dtAssign.Value = dr0.GetValue(3);
                     mmAssignNote.Text = dr0.GetValue(4).ToString();
                 }
                 else
                 {
                     cbStaff1.Value = null;
                     cbStaff2.Value = null;
                     cbAssign.Value = null;
                     dtAssign.Value = null;
                     txtEquipName2.Text = null;
                     mmAssignNote.Text = null;
                 }
                 dr0.Close();
                 conn0.Close();
             }

             protected void ASPxGridView3_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
             {

             }

    }
}