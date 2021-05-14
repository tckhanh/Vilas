using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web;
using System.Drawing;




namespace LabManagement
{
    public partial class XacNhan : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A3, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btConfirm.Attributes.Add("onClick", "javascript:return confirm('Bạn có chắc chắn thực hiện việc phân công này?');");
            lbStaff.Text = Session["username"].ToString();
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

        

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue2 = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "TestStaff1ID").ToString();
            string masterKeyValue3 = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "TestStaff2ID").ToString();
            string masterKeyValue4 = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "AssignStaffID").ToString();
            DateTime masterKeyValue5 = Convert.ToDateTime(ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "AssignDate"));
            cbStaff1.Value = masterKeyValue2;
            cbStaff2.Value = masterKeyValue3;
            cbAssign.Value = masterKeyValue4;
            dtAssign.Value = masterKeyValue5;
            lblnotifiReAssign.Text = null;
            cbStaff1.ReadOnly = true;
            cbStaff2.ReadOnly = true;
            //SQL command
            //SQL command
            string sql = "Select Request.RequestNo, Request.ContractNo, Request.BillNo,Company.CompanyName, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode,Contact.FullName, Contact.ContactPhone,Request.EquTypeName AS AddingName,Request.Model, Request.Manufacturer, Request.Serial_Imei,Request.Accessories, Request.ReceiveDate,Request.AppointmentDate, Request.Note,EquipmentType.EquTypeName, EquipmentType.Standards, EquipmentType.TestMethod,EquipmentType.Price,EquipmentType.PriceInText, Country.CountryName, Staff.StaffFullName, Staff.Username,Request.RequestID,Request.HoldEquip,Request.StatusID,Assignment.AssignNote,Assignment.AssignmentID From  Company,Province,Request,Contact, EquipmentType,Country, Staff,Assignment Where Company.CompanyID = Contact.CompanyID and Company.ProvinceID = Province.ProvinceID and Company.CompanyID = Request.CompanyID and Contact.ContactID = Request.ContactID and Request.EquTypeID = EquipmentType.EquTypeID and Request.MadeInID = Country.CountryID and Request.ReceiveStaffID = Staff.StaffID and Assignment.AssignmentID=Request.RequestID and Request.RequestNo='" + masterKeyValue + "'";
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
            mmAssignNote.Text = dr.GetValue(29).ToString();
            dr.Close();
            conn.Close();
            lblnotifiReAssign.Text = null;
            btConfirm.Enabled = true;
            if (cbStaff1.Value.ToString() == Session["StaffID"].ToString())
            {
                btConfirm.Enabled = true;
                lblnotifiReAssign.Text = null;
            }
            else
            {
                btConfirm.Enabled = false;
                lblnotifiReAssign.Text = "Chỉ nhân viên đo 1 mới được xác nhận phân công";
            }
        }

        protected void btConfirm_Click(object sender, EventArgs e)
        {
            //Update Request Status
            string sql1 = "UPDATE Request SET StatusID=3,ConfirmDate=Getdate() WHERE RequestID=('" + cbRequestNo.Value + "')";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView1.DataBind();
            ASPxGridView2.DataBind();
            lblnotifiReAssign.Text = "Đã xác nhận đo kiểm thành công";
            btConfirm.Enabled = false;
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue2 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "TestStaff1ID").ToString();
            string masterKeyValue3 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "TestStaff2ID").ToString();
            string masterKeyValue4 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "AssignStaffID").ToString();
            DateTime masterKeyValue5 = Convert.ToDateTime(ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "AssignDate"));
            cbStaff1.Value = masterKeyValue2;
            cbStaff2.Value = masterKeyValue3;
            cbAssign.Value = masterKeyValue4;
            dtAssign.Value = masterKeyValue5;
            lblnotifiReAssign.Text = null;
            //SQL command
            //SQL command
            string sql = "Select Request.RequestNo, Request.ContractNo, Request.BillNo,Company.CompanyName, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode,Contact.FullName, Contact.ContactPhone,Request.EquTypeName AS AddingName,Request.Model, Request.Manufacturer, Request.Serial_Imei,Request.Accessories, Request.ReceiveDate,Request.AppointmentDate, Request.Note,EquipmentType.EquTypeName, EquipmentType.Standards, EquipmentType.TestMethod,EquipmentType.Price,EquipmentType.PriceInText, Country.CountryName, Staff.StaffFullName, Staff.Username,Request.RequestID,Request.HoldEquip,Request.StatusID,Assignment.AssignNote,Assignment.AssignmentID From  Company,Province,Request,Contact, EquipmentType,Country, Staff,Assignment Where Company.CompanyID = Contact.CompanyID and Company.ProvinceID = Province.ProvinceID and Company.CompanyID = Request.CompanyID and Contact.ContactID = Request.ContactID and Request.EquTypeID = EquipmentType.EquTypeID and Request.MadeInID = Country.CountryID and Request.ReceiveStaffID = Staff.StaffID and Assignment.AssignmentID=Request.RequestID and Request.RequestNo='" + masterKeyValue + "'";
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
            mmAssignNote.Text = dr.GetValue(29).ToString();
            dr.Close();
            conn.Close();
            lblnotifiReAssign.Text = "Yêu cầu đo kiểm đang được xử lý";
            btConfirm.Enabled = false;
        }

        protected void ASPxGridView2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            DateTime d = Convert.ToDateTime(e.GetValue("AppointmentDate"));
            DateTime n = DateTime.Now;
            TimeSpan diff = d - n;
            if (diff.Days <= 2 && diff.Days>=0)
                e.Row.BackColor = System.Drawing.Color.FromArgb(0xFF, 0xFF, 0x99);
            if (diff.Days<0)
                e.Row.BackColor = System.Drawing.Color.Tomato;
        }

        protected void ASPxGridView1_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
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

    }
}