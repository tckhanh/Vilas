using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using DevExpress.Web;




namespace LabManagement
{
    public partial class KetQuaDo : System.Web.UI.Page       
    {
        public static string RQNo;
        public static string RequestStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A4, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            txtStaff.Text = Session["username"].ToString();
            mmAcce.ReadOnly = true;
            mmNote.ReadOnly = true;
            cbAssign.ReadOnly = true;
            cbStaff1.ReadOnly = true;
            cbStaff2.ReadOnly = true;
            btSave.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn ban hành kết quả đo kiểm này?');");
            btDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa kết quả đo kiểm này?');");
            btUpdate.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn sửa thông tin kết quả đo kiểm này?');");
            //Load Test Number
            if (txtTestReportNo.Text == "")
            {
                string sql = "select top 1 [TestNo],[YearFull] from Number";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                string tam = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1).ToString().PadLeft(4,'0');
                string year = dr.GetValue(1).ToString();
                txtTestReportNo.Text = string.Concat(tam,"/",year,"/PTN-SP");
                dtIssueReportDate.Value = System.DateTime.Now;
                btDelete.Enabled = false;
                btUpdate.Enabled = false;
                btPrint.Enabled = false;
                btUpload.Enabled = false;
                UpTestReport.Enabled = false;
                lbExpect.Text = "(dự kiến)";
                dr.Close();
                conn.Close();
            }       
        }
    
        
        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue2 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "RequestID").ToString();
            string masterKeyValue3 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "RecheckStatusID").ToString();
            string masterKeyValue4 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "ReceiveStaffID").ToString();
            cbReceiveStaff.Value = masterKeyValue4;
            cbIssueStaff.Value = Session["StaffID"].ToString();
            chIssue.ReadOnly = false;
            chNonIssue.ReadOnly = false;
            chIssue.Enabled = true;
            chNonIssue.Enabled = true;
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
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                cbTestSession.Enabled = false;
                lbIssueDate.Text = "Ngày đề xuất";
                txtTemp.Enabled = false;
                txtHum.Enabled = false;
                cbKind.Enabled = false;
                UpTestReport.Enabled = false;
                btUpload.Enabled = false;
                hlFileName.Text = null;
                hlFileName.NavigateUrl = null;
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Red;
                dtIssueReportDate.Value = dr.GetValue(33);
                mmTestHistory.Text = dr.GetValue(31).ToString();
                cbApproveStaff.Value = dr.GetValue(32);
                cbIssueStaff.Value = dr.GetValue(34);
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueDate.Text = "Ngày đề xuất";
                //Update button Status
                btSave.Enabled = false;
                btDelete.Enabled = true;
                btUpdate.Enabled = true;
                btPrint.Enabled = true;
                btUpload.Enabled = false;
                UpTestReport.Enabled = false;
                btNew.Enabled = true;
                lbIssueRP.Text = "Phiếu yêu cầu đo kiểm được yêu cầu xử lý lại. Bạn hãy hoàn tất quá trình xử lý và nhấn 'Hoàn tất xử lý lại' để kết thúc.";
                btFinishReCheck.Enabled = true;
                btReCheck.Enabled = true;
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
                UpTestReport.Enabled = true;
                btUpload.Enabled = true;
                hlFileName.Text = dr1.GetValue(11).ToString();
                hlFileName.NavigateUrl = dr1.GetValue(12).ToString();
                lbExpect.Text = null;
                dr1.Close();
                conn1.Close();
                lbIssueDate.Text = "Ngày ban hành";
                //Update button Status
                chIssue.Checked = true;
                chNonIssue.Checked = false;
                txtTestReportNo.Enabled = true;
                dtTestDate.Enabled = true;
                cbTestSession.Enabled = true;
                lbIssueDate.Text = "Ngày ban hành";
                txtTemp.Enabled = true;
                txtHum.Enabled = true;
                cbKind.Enabled = true;
                UpTestReport.Enabled = true;
                btUpload.Enabled = true;
                lbIssueOrNon.Text = "Lịch sử đo kiểm";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
                btSave.Enabled = false;
                btDelete.Enabled = true;
                btUpdate.Enabled = true;
                btPrint.Enabled = true;
                btNew.Enabled = true;
                lbIssueRP.Text = "Phiếu yêu cầu đo kiểm được yêu cầu xử lý lại. Bạn hãy hoàn tất quá trình xử lý và nhấn 'Hoàn tất xử lý lại' để kết thúc.";
                btFinishReCheck.Enabled = true;
                btReCheck.Enabled = true;
            }
            if (RQSt == 3)
            {
                lbExpect.Text = "(dự kiến)";
                lbIssueRP.Text = null;
                lblnotification.Text = null;
                //Update button Status
                chIssue.Checked = true;
                chNonIssue.Checked = false;
                txtTestReportNo.Enabled = true;
                dtTestDate.Enabled = true;
                cbTestSession.Enabled = true;
                lbIssueDate.Text = "Ngày ban hành";
                txtTemp.Enabled = true;
                txtHum.Enabled = true;
                cbKind.Enabled = true;
                UpTestReport.Enabled = true;
                btUpload.Enabled = true;
                hlFileName.Text = null;
                hlFileName.NavigateUrl = null;
                lbIssueOrNon.Text = "Lịch sử đo kiểm";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
                dtTestDate.Value = null;
                cbApproveStaff.Value = null;
                cbTestSession.Value = 0;
                cbKind.Value = 1;
                txtTemp.Text = null;
                txtHum.Text = null;
                mmTestHistory.Text = null;
                dtIssueReportDate.Value = System.DateTime.Now;
                //Load new TestReportNo
                string sql4 = "select top 1 [TestNo],[YearFull] from Number";
                SqlConnection conn4 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd4 = new SqlCommand(sql4, conn4);
                conn4.Open();
                SqlDataReader dr4 = Cmd4.ExecuteReader();
                dr4.Read();
                string tam = Convert.ToString(Convert.ToInt32(dr4.GetValue(0)) + 1).ToString().PadLeft(4, '0');
                string year = dr4.GetValue(1).ToString();
                txtTestReportNo.Text = string.Concat(tam, "/", year, "/PTN-SP");
                dr.Close();
                conn.Close();
                //Update button Status
                btSave.Enabled = true;
                btDelete.Enabled = false;
                btUpdate.Enabled = false;
                btPrint.Enabled = false;
                btUpload.Enabled = false;
                UpTestReport.Enabled = false;
                btNew.Enabled = true;
                if (masterKeyValue3 == "")
                {
                    btFinishReCheck.Enabled = false;
                    btReCheck.Enabled = true;
                    lbIssueRP.Text = "Phiếu yêu cầu đo kiểm được xử lý lần đầu. Bạn hãy tạo kết quả đo kiểm trước sau đó Upload file kết quả";
                }
                if (masterKeyValue3 == "1" || masterKeyValue3 == "3")
                {
                    btFinishReCheck.Enabled = true;
                    btReCheck.Enabled = true;
                    lbIssueRP.Text = "Phiếu yêu cầu đo kiểm được yêu cầu xử lý lại. Bạn hãy tạo kết quả đo kiểm trước sau đó Upload file kết quả và nhấn 'Hoàn tất xử lý lại' để kết thúc.";
                }
                if (masterKeyValue3 == "4")
                {
                    btFinishReCheck.Enabled = false;
                    btReCheck.Enabled = true;
                    lbIssueRP.Text = "Phiếu yêu cầu đo kiểm được xử lý lại. Bạn hãy tạo kết quả đo kiểm trước sau đó Upload file kết quả";
                }
            }
            RequestStatus = RQSt.ToString();
            RQNo = cbRequestNo.Text;
            if (cbIssueStaff.Value.ToString() != "" && cbIssueStaff.Value.ToString() != Session["StaffID"].ToString())
            {
                btSave.Enabled = false;
                btDelete.Enabled = false;
                btUpdate.Enabled = false;
                btPrint.Enabled = true;
                btUpload.Enabled = false;
                UpTestReport.Enabled = false;
                btReCheck.Enabled = false;
                btFinishReCheck.Enabled = false;
                btNew.Enabled = true;
                lbIssueRP.Text = "Nội dung xử lý phiếu yêu cầu đo kiểm này do chuyên viên khác đề xuất. Bạn chỉ có thể xem được thông tin xử lý nhưng không cập nhật được nội dung xử lý";
            }

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
                    if (cbTestSession.Value.ToString() == "0")
                    {
                        txtTemp.Text = dr.GetValue(1).ToString();
                        txtHum.Text = dr.GetValue(2).ToString();
                    }
                    if (cbTestSession.Value.ToString() == "1")
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
               if (cbTestSession.Value.ToString()=="0")
               {
                txtTemp.Text = dr.GetValue(1).ToString();
                txtHum.Text = dr.GetValue(2).ToString();
               }
              if (cbTestSession.Value.ToString() == "1")
               {
                txtTemp.Text = dr.GetValue(3).ToString();
                txtHum.Text = dr.GetValue(4).ToString();
               }
            }
            dr.Close();
            conn.Close();

        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            lbExpect.Text="(dự kiến)";
            lbIssueRP.Text = null;
            lblnotification.Text = null;
            cbRequestNo.Value = null;
            txtContractNo.Text = null;
            txtCompanyName.Text = null;
            txtAddress.Text = null;
            txtphone.Text = null;
            txtfax.Text = null;
            txttaxid.Text = null;
            txtContact.Text = null;
            txtperphone.Text = null;
            txtBillNum.Text = null;
            txtEquipName.Text = null;
            txtEquipName2.Text = null;
            txtEquName.Text = null;
            txtcompmaking.Text = null;
            txtMadeIn.Text = null;
            txtModel.Text = null;
            txtSN.Text = null;
            txttestmethod.Text = null;
            txtstandard.Text = null;
            txtprice.Text = null;
            txtpriceintext.Text = null;
            dtreceive.Value = null;
            dtrelease.Value = null;
            mmAcce.Text = null;
            mmNote.Text = null;
            mmAssignNote.Text = null;
            cbStaff1.Value = null;
            cbStaff2.Value = null;
            cbAssign.Value = null;
            dtAssign.Value = null;
            dtTestDate.Value = null;
            cbApproveStaff.Value = null;
            cbTestSession.Value = 0;
            cbKind.Value = 1;
            cbIssueStaff.Value = Session["StaffID"].ToString();
            txtTemp.Text = null;
            txtHum.Text = null;
            mmTestHistory.Text = null;
            dtIssueReportDate.Value = System.DateTime.Now;
            chIssue.Checked = true;
            chNonIssue.Checked = false;
            txtTestReportNo.Enabled = true;
            dtTestDate.Enabled = true;
            cbTestSession.Enabled = true;
            lbIssueDate.Text = "Ngày ban hành";
            txtTemp.Enabled = true;
            txtHum.Enabled = true;
            cbKind.Enabled = true;
            UpTestReport.Enabled = true;
            btUpload.Enabled = true;
            lbIssueOrNon.Text = "Lịch sử đo kiểm";
            lbIssueOrNon.ForeColor = System.Drawing.Color.Black;         
            btDelete.Enabled = false;
            btSave.Enabled = true;
            btUpdate.Enabled = false;
            btPrint.Enabled = false;
            btUpload.Enabled = false;
            UpTestReport.Enabled = false;
            hlFileName.Text = null;
            hlFileName.NavigateUrl = null;
            //Load new TestReportNo
            string sql = "select top 1 [TestNo],[YearFull] from Number";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            string tam = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1).ToString().PadLeft(4,'0');
            string year = dr.GetValue(1).ToString();
            txtTestReportNo.Text = string.Concat(tam,"/",year,"/PTN-SP");
            dr.Close();
            conn.Close();
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            if (cbApproveStaff.Value != "" && cbRequestNo.Value != null)
            {
                if (chIssue.Checked == true)
                {
                    //Get new TestReportNo
                    string sql0 = "select top 1 [TestNo],[YearFull] from Number";
                    SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
                    conn0.Open();
                    SqlDataReader dr0 = Cmd0.ExecuteReader();
                    dr0.Read();
                    string tam = Convert.ToString(Convert.ToInt32(dr0.GetValue(0)) + 1).ToString().PadLeft(4, '0');
                    string tam0 = Convert.ToString(Convert.ToInt32(dr0.GetValue(0))).ToString().PadLeft(4, '0');
                    string year = dr0.GetValue(1).ToString();
                    txtTestReportNo.Text = string.Concat(tam, "/", year, "/PTN-SP");
                    dr0.Close();
                    conn0.Close();
                    //Create TestReport *****************************************************
                    lbExpect.Enabled = false;
                    //Update new TestReportNo to DataBase
                    string sql1 = "UPDATE Number SET TestNo= ('" + tam + "') WHERE TestNo=('" + tam0 + "')";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    conn1.Open();
                    Cmd1.ExecuteNonQuery();
                    conn1.Close();
                    //Insert new Test Report Record
                    string sql = "insert into TestReport (AssignmentID,RequestNo,TestReportNo,TestReportIssueDate,TestDate,TestDateSession,Temperature,Humidity,TestHistory,HoldTest,Kind,CreateRPStaff,ApproveStaff) values (@AssignmentID,@RequestNo,@TestReportNo,@TestReportIssueDate,@TestDate,@TestDateSession,@Temperature,@Humidity,@TestHistory,1,@Kind,'" + Session["StaffID"] + "','" + cbApproveStaff.Value + "')";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    Cmd.Parameters.Add("@AssignmentID", SqlDbType.Int, 32);
                    Cmd.Parameters["@AssignmentID"].Value = cbRequestNo.Value;
                    Cmd.Parameters.Add("@RequestNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@RequestNo"].Value = cbRequestNo.Text;
                    Cmd.Parameters.Add("@TestReportNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@TestReportNo"].Value = txtTestReportNo.Text;
                    Cmd.Parameters.Add("@TestReportIssueDate", SqlDbType.Date);
                    Cmd.Parameters["@TestReportIssueDate"].Value = dtIssueReportDate.Value;
                    Cmd.Parameters.Add("@TestDate", SqlDbType.Date);
                    Cmd.Parameters["@TestDate"].Value = dtTestDate.Value;
                    Cmd.Parameters.Add("@TestDateSession", SqlDbType.Int, 32);
                    Cmd.Parameters["@TestDateSession"].Value = cbTestSession.Value;
                    Cmd.Parameters.Add("@Temperature", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@Temperature"].Value = txtTemp.Text;
                    Cmd.Parameters.Add("@Humidity", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@Humidity"].Value = txtHum.Text;
                    Cmd.Parameters.Add("@TestHistory", SqlDbType.NText);
                    Cmd.Parameters["@TestHistory"].Value = mmTestHistory.Text;
                    Cmd.Parameters.Add("@Kind", SqlDbType.Int, 32);
                    Cmd.Parameters["@Kind"].Value = cbKind.Value;
                    conn.Open();
                    Cmd.ExecuteNonQuery();
                    conn.Close();
                    string sql2 = "UPDATE Request SET StatusID=4,StaffIDApprove='" + cbApproveStaff.Value + "' WHERE RequestNo=('" + cbRequestNo.Text + "')";
                    SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                    conn2.Open();
                    Cmd2.ExecuteNonQuery();
                    conn2.Close();
                    btSave.Enabled = false;
                    btUpdate.Enabled = true;
                    btNew.Enabled = true;
                    btDelete.Enabled = true;
                    btPrint.Enabled = true;
                    btUpload.Enabled = true;
                    UpTestReport.Enabled = true;
                    lbExpect.Text = null;
                    lbIssueRP.Text = "Kết quả đã được ban hành thành công";
                    RQNo = cbRequestNo.Text;
                    ASPxGridView2.DataBind();
                    ASPxGridView3.DataBind();
                }
                else
                {
                    string sql3 = "UPDATE Request SET StatusID=6,StaffIDNonIssue='" + Session["StaffID"] + "',InternalNote=@InternalNote,StaffIDApprove='" + cbApproveStaff.Value + "',NonIssueDate=@NonIssueDate WHERE RequestNo=('" + cbRequestNo.Text + "')";
                    SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                    Cmd3.Parameters.Add("@InternalNote", SqlDbType.NText);
                    Cmd3.Parameters["@InternalNote"].Value = mmTestHistory.Text;
                    Cmd3.Parameters.Add("@NonIssueDate", SqlDbType.Date);
                    Cmd3.Parameters["@NonIssueDate"].Value = dtIssueReportDate.Value;
                    conn3.Open();
                    Cmd3.ExecuteNonQuery();
                    conn3.Close();
                    btSave.Enabled = false;
                    btUpdate.Enabled = true;
                    btNew.Enabled = true;
                    btDelete.Enabled = true;
                    lbExpect.Text = null;
                    lbIssueRP.Text = "Đã đề nghị không ban hành kết quả";
                    ASPxGridView2.DataBind();
                    ASPxGridView3.DataBind();
                }
            }
            else
                lbIssueRP.Text = "Bạn phải chọn người phê duyệt khi ban hành kết quả";

        }


        protected void ASPxGridView3_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
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
            btReCheck.Enabled = false;
            btFinishReCheck.Enabled = false;
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
            btSave.Enabled = false;
            btDelete.Enabled = false;
            btUpdate.Enabled = false;
            btPrint.Enabled = true;
            btUpload.Enabled = false;
            UpTestReport.Enabled = false;
            btNew.Enabled = true;
            if (hlFileName.Text == "" && chIssue.Checked==true)
            {
                UpTestReport.Enabled = true;
                btUpload.Enabled = true;
            }
            lbIssueRP.Text = "Kết quả xử lý đang chờ được phê duyệt";
            RQNo = cbRequestNo.Text;
            if (cbIssueStaff.Value.ToString() != "" && cbIssueStaff.Value.ToString() != Session["StaffID"].ToString())
            {
                btSave.Enabled = false;
                btDelete.Enabled = false;
                btUpdate.Enabled = false;
                btPrint.Enabled = true;
                btUpload.Enabled = false;
                UpTestReport.Enabled = false;
                btReCheck.Enabled = false;
                btFinishReCheck.Enabled = false;
                btNew.Enabled = true;
                lbIssueRP.Text = "Nội dung xử lý phiếu yêu cầu đo kiểm này do chuyên viên khác đề xuất. Bạn chỉ có thể xem được thông tin xử lý";
            }
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            if (chIssue.Checked == true)
            {
                if (RequestStatus == "4")
                {
                    //Insert new Test Report Record
                    string sql = "Update TestReport Set TestReportNo=@TestReportNo,TestReportIssueDate=@TestReportIssueDate,TestDate=@TestDate,TestDateSession=@TestDateSession,Temperature=@Temperature,Humidity=@Humidity,TestHistory=@TestHistory,Kind=@Kind,ApproveStaff='" + cbApproveStaff.Value + "' Where AssignmentID='" + cbRequestNo.Value + "'";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    Cmd.Parameters.Add("@TestReportNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@TestReportNo"].Value = txtTestReportNo.Text;
                    Cmd.Parameters.Add("@TestReportIssueDate", SqlDbType.Date);
                    Cmd.Parameters["@TestReportIssueDate"].Value = dtIssueReportDate.Value;
                    Cmd.Parameters.Add("@TestDate", SqlDbType.Date);
                    Cmd.Parameters["@TestDate"].Value = dtTestDate.Value;
                    Cmd.Parameters.Add("@TestDateSession", SqlDbType.Int, 32);
                    Cmd.Parameters["@TestDateSession"].Value = cbTestSession.Value;
                    Cmd.Parameters.Add("@Temperature", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@Temperature"].Value = txtTemp.Text;
                    Cmd.Parameters.Add("@Humidity", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@Humidity"].Value = txtHum.Text;
                    Cmd.Parameters.Add("@TestHistory", SqlDbType.NText);
                    Cmd.Parameters["@TestHistory"].Value = mmTestHistory.Text;
                    Cmd.Parameters.Add("@Kind", SqlDbType.Int, 32);
                    Cmd.Parameters["@Kind"].Value = cbKind.Value;
                    conn.Open();
                    Cmd.ExecuteNonQuery();
                    conn.Close();
                    string sql1 = "UPDATE Request SET StaffIDApprove='" + cbApproveStaff.Value + "'WHERE RequestNo=('" + cbRequestNo.Text + "')";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    conn1.Open();
                    Cmd1.ExecuteNonQuery();
                    conn1.Close();
                }
                if (RequestStatus == "6")
                {
                    //Get new TestReportNo
                    string sql0 = "select top 1 [TestNo],[YearFull] from Number";
                    SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
                    conn0.Open();
                    SqlDataReader dr0 = Cmd0.ExecuteReader();
                    dr0.Read();
                    string tam = Convert.ToString(Convert.ToInt32(dr0.GetValue(0)) + 1).ToString().PadLeft(4, '0');
                    string tam0 = Convert.ToString(Convert.ToInt32(dr0.GetValue(0))).ToString().PadLeft(4, '0');
                    string year = dr0.GetValue(1).ToString();
                    txtTestReportNo.Text = string.Concat(tam, "/", year, "/PTN-SP");
                    dr0.Close();
                    conn0.Close();
                    //Create TestReport *****************************************************
                    lbExpect.Enabled = false;
                    //Update new TestReportNo to DataBase
                    string sql1 = "UPDATE Number SET TestNo= ('" + tam + "') WHERE TestNo=('" + tam0 + "')";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    conn1.Open();
                    Cmd1.ExecuteNonQuery();
                    conn1.Close();
                    //Insert new Test Report Record
                    string sql = "insert into TestReport (AssignmentID,RequestNo,TestReportNo,TestReportIssueDate,TestDate,TestDateSession,Temperature,Humidity,TestHistory,HoldTest,Kind,CreateRPStaff,ApproveStaff) values (@AssignmentID,@RequestNo,@TestReportNo,@TestReportIssueDate,@TestDate,@TestDateSession,@Temperature,@Humidity,@TestHistory,1,@Kind,'" + Session["StaffID"] + "','" + cbApproveStaff.Value + "')";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    Cmd.Parameters.Add("@AssignmentID", SqlDbType.Int, 32);
                    Cmd.Parameters["@AssignmentID"].Value = cbRequestNo.Value;
                    Cmd.Parameters.Add("@RequestNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@RequestNo"].Value = cbRequestNo.Text;
                    Cmd.Parameters.Add("@TestReportNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@TestReportNo"].Value = txtTestReportNo.Text;
                    Cmd.Parameters.Add("@TestReportIssueDate", SqlDbType.Date);
                    Cmd.Parameters["@TestReportIssueDate"].Value = dtIssueReportDate.Value;
                    Cmd.Parameters.Add("@TestDate", SqlDbType.Date);
                    Cmd.Parameters["@TestDate"].Value = dtTestDate.Value;
                    Cmd.Parameters.Add("@TestDateSession", SqlDbType.Int, 32);
                    Cmd.Parameters["@TestDateSession"].Value = cbTestSession.Value;
                    Cmd.Parameters.Add("@Temperature", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@Temperature"].Value = txtTemp.Text;
                    Cmd.Parameters.Add("@Humidity", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@Humidity"].Value = txtHum.Text;
                    Cmd.Parameters.Add("@TestHistory", SqlDbType.NText);
                    Cmd.Parameters["@TestHistory"].Value = mmTestHistory.Text;
                    Cmd.Parameters.Add("@Kind", SqlDbType.Int, 32);
                    Cmd.Parameters["@Kind"].Value = cbKind.Value;
                    conn.Open();
                    Cmd.ExecuteNonQuery();
                    conn.Close();
                    string sql2 = "UPDATE Request SET StatusID=4,StaffIDApprove='" + cbApproveStaff.Value + "' WHERE RequestNo=('" + cbRequestNo.Text + "')";
                    SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                    conn2.Open();
                    Cmd2.ExecuteNonQuery();
                    conn2.Close();
                    btSave.Enabled = false;
                    btNew.Enabled = true;
                    btDelete.Enabled = true;
                    btPrint.Enabled = true;
                    btUpload.Enabled = true;
                    UpTestReport.Enabled = true;
                    lbExpect.Text = null;
                    lbIssueRP.Text = "Kết quả đã được ban hành thành công";
                    RQNo = cbRequestNo.Text;
                    RequestStatus = "4";
                    ASPxGridView2.DataBind();
                    ASPxGridView3.DataBind(); 
                }
                ASPxGridView2.DataBind();
                ASPxGridView3.DataBind();
                ASPxGridView4.DataBind();
                lbIssueRP.Text = "Đã sửa nội dung đề nghị ban hành kết quả";
            }
            else
            {
                if (RequestStatus == "4")
                {
                    string sql = "Delete from TestReport Where AssignmentID='" + cbRequestNo.Value + "'";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    Cmd.ExecuteNonQuery();
                }
                string sql3 = "UPDATE Request SET InternalNote=@InternalNote,StaffIDApprove='" + cbApproveStaff.Value + "',NonIssueDate=@NonIssueDate,StatusID=6,StaffIDNonIssue='"+Session["StaffID"]+"' WHERE RequestNo=('" + cbRequestNo.Text + "')";
                SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                Cmd3.Parameters.Add("@InternalNote", SqlDbType.NText);
                Cmd3.Parameters["@InternalNote"].Value = mmTestHistory.Text;
                Cmd3.Parameters.Add("@NonIssueDate", SqlDbType.Date);
                Cmd3.Parameters["@NonIssueDate"].Value = dtIssueReportDate.Value;
                conn3.Open();
                Cmd3.ExecuteNonQuery();
                conn3.Close();
                btSave.Enabled = false;
                btNew.Enabled = true;
                btDelete.Enabled = true;
                lbExpect.Text = null;
                RequestStatus = "6";
                lbIssueRP.Text = "Đã sửa nội dung đề nghị không ban hành kết quả";
                ASPxGridView2.DataBind();
                ASPxGridView3.DataBind();
                ASPxGridView4.DataBind();
            }  
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
                if (chIssue.Checked == true)
                {
                    string sql = "Delete from TestReport Where AssignmentID='" + cbRequestNo.Value + "'";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    Cmd.ExecuteNonQuery();
                    //Update Request Status
                    string sql2 = "UPDATE Request SET StatusID=3 WHERE RequestNo=('" + cbRequestNo.Text + "')";
                    SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                    conn2.Open();
                    Cmd2.ExecuteNonQuery();
                    conn2.Close();
                    ASPxGridView2.DataBind();
                    ASPxGridView3.DataBind();
                    lbIssueRP.Text = "Bạn đã xóa kết quả đo thành công";
                    btDelete.Enabled = false;
                    btUpdate.Enabled = false;
                    btPrint.Enabled = false;
                    btUpload.Enabled = false;
                    UpTestReport.Enabled = false;
                }
                else
                {
                    string sql3 = "UPDATE Request SET StatusID=3,StaffIDNonIssue=@StaffIDNonIssue,InternalNote=@InternalNote,StaffIDApprove=@StaffIDApprove,NonIssueDate=@NonIssueDate WHERE RequestNo=('" + cbRequestNo.Text + "')";
                    SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                    Cmd3.Parameters.Add("@StaffIDNonIssue", SqlDbType.NVarChar, 30);
                    Cmd3.Parameters["@StaffIDNonIssue"].Value = System.DBNull.Value;
                    Cmd3.Parameters.Add("@StaffIDApprove", SqlDbType.NVarChar, 30);
                    Cmd3.Parameters["@StaffIDApprove"].Value = System.DBNull.Value;
                    Cmd3.Parameters.Add("@InternalNote", SqlDbType.NText);
                    Cmd3.Parameters["@InternalNote"].Value = System.DBNull.Value;
                    Cmd3.Parameters.Add("@NonIssueDate", SqlDbType.Date);
                    Cmd3.Parameters["@NonIssueDate"].Value = System.DBNull.Value;
                    conn3.Open();
                    Cmd3.ExecuteNonQuery();
                    conn3.Close();
                    btSave.Enabled = false;
                    btNew.Enabled = true;
                    btDelete.Enabled = true;
                    lbExpect.Text = null;
                    btUpload.Enabled = false;
                    UpTestReport.Enabled = false;
                    lbIssueRP.Text = "Đã xóa đề nghị không ban hành kết quả";
                    ASPxGridView2.DataBind();
                    ASPxGridView3.DataBind();
                }
        }

        protected void chIssue_CheckedChanged(object sender, EventArgs e)
        {
            if (chIssue.Checked == true)
            {
                chIssue.Checked = true;
                chNonIssue.Checked = false;
                txtTestReportNo.Enabled = true;
                dtTestDate.Enabled = true;
                cbTestSession.Enabled = true;
                if (cbTestSession.Value == null)
                    cbTestSession.Value = 0;
                if (cbKind.Value == null)
                    cbKind.Value = 1;
                lbIssueDate.Text = "Ngày ban hành";
                txtTemp.Enabled = true;
                txtHum.Enabled = true;
                cbKind.Enabled = true;
                if (RequestStatus == "6" || RequestStatus == "3")
                {
                    UpTestReport.Enabled = false;
                    btUpload.Enabled = false;
                    //Prepare Data
                    string sql = "select top 1 [TestNo],[YearFull] from Number";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader dr = Cmd.ExecuteReader();
                    dr.Read();
                    string tam = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1).ToString().PadLeft(4, '0');
                    string year = dr.GetValue(1).ToString();
                    txtTestReportNo.Text = string.Concat(tam, "/", year, "/PTN-SP");
                    dtIssueReportDate.Value = System.DateTime.Now;
                    lbExpect.Text = "(dự kiến)";
                    dr.Close();
                    conn.Close();
                }
                else
                {
                    UpTestReport.Enabled = true;
                    btUpload.Enabled = true;
                }
                lbIssueOrNon.Text = "Lịch sử đo kiểm";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            }
            else
            {
                chIssue.Checked = false;
                chNonIssue.Checked = true;
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                cbTestSession.Enabled = false;
                lbIssueDate.Text = "Ngày đề xuất";
                txtTemp.Enabled = false;
                txtHum.Enabled = false;
                cbKind.Enabled = false;
                UpTestReport.Enabled = false;
                btUpload.Enabled = false;
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Red;
            }

        }

        protected void chNonIssue_CheckedChanged(object sender, EventArgs e)
        {
            if (chNonIssue.Checked == true)
            {
                chIssue.Checked = false;
                chNonIssue.Checked = true;
                txtTestReportNo.Enabled = false;
                dtTestDate.Enabled = false;
                cbTestSession.Enabled = false;
                lbIssueDate.Text = "Ngày đề xuất";
                txtTemp.Enabled = false;
                txtHum.Enabled = false;
                cbKind.Enabled = false;
                UpTestReport.Enabled = false;
                btUpload.Enabled = false;
                lbIssueOrNon.Text = "Lý do không ban hành KQ";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                chIssue.Checked = true;
                chNonIssue.Checked = false;
                txtTestReportNo.Enabled = true;
                dtTestDate.Enabled = true;
                cbTestSession.Enabled = true;
                if (cbTestSession.Value == null)
                    cbTestSession.Value = 0;
                if (cbKind.Value == null)
                    cbKind.Value = 1;
                lbIssueDate.Text = "Ngày ban hành";
                txtTemp.Enabled = true;
                txtHum.Enabled = true;
                cbKind.Enabled = true;
                if (RequestStatus == "6" || RequestStatus == "3")
                {
                    UpTestReport.Enabled = false;
                    btUpload.Enabled = false;
                    //Prepare Data
                    string sql = "select top 1 [TestNo],[YearFull] from Number";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader dr = Cmd.ExecuteReader();
                    dr.Read();
                    string tam = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1).ToString().PadLeft(4, '0');
                    string year = dr.GetValue(1).ToString();
                    txtTestReportNo.Text = string.Concat(tam, "/", year, "/PTN-SP");
                    dtIssueReportDate.Value = System.DateTime.Now;
                    lbExpect.Text = "(dự kiến)";
                    dr.Close();
                    conn.Close();
                }
                else
                {
                    UpTestReport.Enabled = true;
                    btUpload.Enabled = true;
                }
                lbIssueOrNon.Text = "Lịch sử đo kiểm";
                lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
            }
        }

         protected void btUpload_Click(object sender, EventArgs e)
        {
                string tam = txtTestReportNo.Text.Substring(0, 4);
                string year = txtTestReportNo.Text.Substring(5, 4);
                //Upload File TestReport *******************    
                Boolean fileOK = false;
                string fileName = "NoName";
                string virtpath = "~/DATA/TestReport/";
                string filePath = "";
                if (UpTestReport.HasFile)
                {
                    fileName = UpTestReport.FileName;
                    fileOK = true;
                }
                if (fileOK)
                {
                    try
                    {
                        //Delete Old File
                        string oldfilepath = Server.MapPath(hlFileName.NavigateUrl);
                        if (System.IO.File.Exists(oldfilepath))
                        {
                            System.IO.File.Delete(oldfilepath);
                        }
                        virtpath = virtpath + year+ "/";
                        filePath = Page.MapPath(virtpath);
                        // Kiem tra Folder tao Folder neu chua co
                        if (!Directory.Exists(filePath)) // TODO: needs to be created ONLY from setup phase with Security Permissions
                            Directory.CreateDirectory(filePath);
                        // Luu File
                        UpTestReport.PostedFile.SaveAs(filePath + "/"+ year + "_" + tam + "_" + fileName); // makes unique filename
                        hlFileName.Text = year + "_" + tam + "_" + fileName;
                        hlFileName.NavigateUrl = virtpath + "/"+ year + "_" + tam + "_" + fileName;
                        //Update TestReport table
                        string sql = "Update TestReport Set TestRPFileName='" + hlFileName.Text + "' ,TestRPURL='" + hlFileName.NavigateUrl + "'  Where AssignmentID='" + cbRequestNo.Value + "'";
                        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                        SqlCommand Cmd = new SqlCommand(sql, conn);
                        conn.Open();
                        Cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        lblnotification.Text = ex.ToString(); // "Không thể Upload File";
                    }
                }
        }

         protected void ASPxGridView3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
         {
             if (e.RowType != GridViewRowType.Data) return;
             DateTime d = Convert.ToDateTime(e.GetValue("AppointmentDate"));
             DateTime n = DateTime.Now;
             TimeSpan diff = d - n;
             if (diff.Days <= 2 && diff.Days >= 0)
                 e.Row.BackColor = System.Drawing.Color.FromArgb(0xFF, 0xFF, 0x99);
             if (diff.Days < 0)
                 e.Row.BackColor = System.Drawing.Color.Tomato;
         }

         protected void ASPxGridView2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
         {
             if (e.RowType != GridViewRowType.Data) return;
             DateTime d = Convert.ToDateTime(e.GetValue("AppointmentDate"));
             string RC = e.GetValue("RecheckStatusID").ToString();
             DateTime n = DateTime.Now;
             TimeSpan diff = d - n;
             if (diff.Days <= 2 && diff.Days >= 0)
                 e.Row.BackColor = System.Drawing.Color.FromArgb(0xFF, 0xFF, 0x99);
             if (diff.Days < 0)
                 e.Row.BackColor = System.Drawing.Color.Tomato;
             if(RC=="1")
                 e.Row.BackColor = System.Drawing.Color.Tomato;
         }

         protected void btFinishReCheck_Click(object sender, EventArgs e)
         {
                 string sql3 = "UPDATE Request SET TestStaffCom=@TestStaffCom,TestStaffComDate=@TestStaffComDate,RecheckStatusID=4  WHERE RequestNo=('" + cbRequestNo.Text + "')";
                 SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                 SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                 Cmd3.Parameters.Add("@TestStaffCom", SqlDbType.NText);
                 Cmd3.Parameters["@TestStaffCom"].Value = mmTestingStaff.Text;
                 Cmd3.Parameters.Add("@TestStaffComDate", SqlDbType.Date);
                 Cmd3.Parameters["@TestStaffComDate"].Value = System.DateTime.Now;
                 conn3.Open();
                 Cmd3.ExecuteNonQuery();
                 conn3.Close();
                 if (RequestStatus == "3")
                 {
                     btReCheck.Enabled = true;
                     btFinishReCheck.Enabled = false;
                 }
                 if (RequestStatus == "4" || RequestStatus == "6")
                 {
                     btReCheck.Enabled = false;
                     btFinishReCheck.Enabled = false;
                     btSave.Enabled = false;
                     btDelete.Enabled = false;
                     btUpdate.Enabled = false;
                     btPrint.Enabled = true;
                     btUpload.Enabled = false;
                     UpTestReport.Enabled = false;
                     btNew.Enabled = true;
                 }
                 lbIssueRP.Text = "Chuyên viên đo đã hoàn tất quá trình xử lý lại yêu cầu đo kiểm";
                 ASPxGridView3.DataBind();
                 ASPxGridView2.DataBind();
         }

         protected void ASPxGridView4_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
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
             btReCheck.Enabled = false;
             btFinishReCheck.Enabled = false;
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
                 UpTestReport.Enabled = false;
                 btUpload.Enabled = false;
                 hlFileName.Text = null;
                 hlFileName.NavigateUrl = null;
                 dtIssueReportDate.Value = null;
                 cbIssueStaff.Value = null;
                 cbApproveStaff.Value = null;
                 lbIssueOrNon.Text = "Lịch sử đo kiểm";
                 lbIssueOrNon.ForeColor = System.Drawing.Color.Black;
             }
             btSave.Enabled = false;
             btDelete.Enabled = false;
             btUpdate.Enabled = false;
             btPrint.Enabled = true;
             btUpload.Enabled = false;
             UpTestReport.Enabled = false;
             btNew.Enabled = true;
             lbIssueRP.Text = "Phiếu yêu cầu đo kiểm đang được chuyển cho nhân viên nhận mẫu xử lý lại";
             RQNo = cbRequestNo.Text;
         }

         protected void ASPxGridView4_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
         {
             if (e.RowType != GridViewRowType.Data) return;
             DateTime d = Convert.ToDateTime(e.GetValue("AppointmentDate"));
             string RC = e.GetValue("RecheckStatusID").ToString();
             DateTime n = DateTime.Now;
             TimeSpan diff = d - n;
             if (diff.Days <= 2 && diff.Days >= 0)
                 e.Row.BackColor = System.Drawing.Color.FromArgb(0xFF, 0xFF, 0x99);
             if (diff.Days < 0)
                 e.Row.BackColor = System.Drawing.Color.Tomato;
         }

         protected void btReCheck_Click(object sender, EventArgs e)
         {
             string sql3 = "UPDATE Request SET TestStaffCom=@TestStaffCom,TestStaffComDate=@TestStaffComDate,RecheckStatusID=2  WHERE RequestNo=('" + cbRequestNo.Text + "')";
             SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
             SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
             Cmd3.Parameters.Add("@TestStaffCom", SqlDbType.NText);
             Cmd3.Parameters["@TestStaffCom"].Value = mmTestingStaff.Text;
             Cmd3.Parameters.Add("@TestStaffComDate", SqlDbType.Date);
             Cmd3.Parameters["@TestStaffComDate"].Value = System.DateTime.Now;
             conn3.Open();
             Cmd3.ExecuteNonQuery();
             conn3.Close();
             btReCheck.Enabled = false;
             btFinishReCheck.Enabled = false;
             btSave.Enabled = false;
             btDelete.Enabled = false;
             btUpdate.Enabled = false;
             btPrint.Enabled = true;
             btUpload.Enabled = false;
             UpTestReport.Enabled = false;
             btNew.Enabled = true;
             lbIssueRP.Text = "Đã chuyển chuyên viên đo xử lý lại thông tin nhận mẫu";
             ASPxGridView3.DataBind();
             ASPxGridView2.DataBind();
             ASPxGridView4.DataBind();
         }

    }
}