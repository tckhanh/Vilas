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
    public partial class PhanCongDo : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A2, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            lbStaff.Text = Session["username"].ToString();
            btAssign.Attributes.Add("onClick", "javascript:return confirm('Bạn có chắc chắn thực hiện việc phân công này?');");
            btDeleteAssign.Attributes.Add("onClick", "javascript:return confirm('Bạn có chắc chắn muốn xóa phân công đo này?');");

        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            cbStaff1.Value = null;
            cbStaff2.Value = null;
            mmAssignNote.Enabled = true;
            mmAssignNote.Text = null;
            btDeleteAssign.Enabled = false;
            btAssign.Enabled = true;
            cbStaff1.ReadOnly = false;
            cbStaff2.ReadOnly = false;
            //SQL command
            string sql = "Select Request.RequestNo, Request.ContractNo, Request.BillNo,Company.CompanyName, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode,Contact.FullName, Contact.ContactPhone,Request.EquTypeName AS AddingName,Request.Model, Request.Manufacturer, Request.Serial_Imei,Request.Accessories, Request.ReceiveDate,Request.AppointmentDate, Request.Note,EquipmentType.EquTypeName, EquipmentType.Standards, EquipmentType.TestMethod,EquipmentType.Price,EquipmentType.PriceInText, Country.CountryName, Staff.StaffFullName, Staff.Username,Request.RequestID,Request.HoldEquip,Request.StatusID From  Company,Province,Request,Contact, EquipmentType,Country, Staff Where Company.CompanyID = Contact.CompanyID and Company.ProvinceID = Province.ProvinceID and Company.CompanyID = Request.CompanyID and Contact.ContactID = Request.ContactID and Request.EquTypeID = EquipmentType.EquTypeID and Request.MadeInID = Country.CountryID and Request.ReceiveStaffID = Staff.StaffID and Request.RequestNo='" + masterKeyValue + "'";
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
            dr.Close();
            conn.Close();
            lblnotifiReAssign.Text = null;
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Get RequestNo from ASPxGridView
            string masterKeyValue = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue2 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "TestStaff1ID").ToString();
            string masterKeyValue3 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "TestStaff2ID").ToString();
            string masterKeyValue4 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "AssignStaffID").ToString();
            if (masterKeyValue4 == Session["StaffID"].ToString())
            {
                btDeleteAssign.Enabled = true;
                btAssign.Enabled = true;
                cbStaff1.ReadOnly = false;
                cbStaff2.ReadOnly = false;
                mmAssignNote.ReadOnly = false;
            }
            else
            {
                btDeleteAssign.Enabled = false;
                btAssign.Enabled = false;
                cbStaff1.ReadOnly = true;
                cbStaff2.ReadOnly = true;
                mmAssignNote.ReadOnly = true;
            }
            cbStaff1.Value = masterKeyValue2;
            cbStaff2.Value = masterKeyValue3;
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
        }

        protected void btAssign_Click(object sender, EventArgs e)
        {
                //Check Record Exist
                string sql0 = "Select * From Assignment Where AssignmentID='" + cbRequestNo.Value + "'";
                SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
                conn0.Open();
                SqlDataReader dr0 = Cmd0.ExecuteReader();
                dr0.Read();
                if (dr0.HasRows)
                {
                    string sql1 = "UPDATE Assignment SET TestStaffID1='" + cbStaff1.Value + "',TestStaffID2='" + cbStaff2.Value + "',AssignNote=@AssignNote,ReAssign='1' WHERE AssignmentID=('" + cbRequestNo.Value + "')";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    Cmd1.Parameters.Add("@AssignNote", SqlDbType.NText);
                    Cmd1.Parameters["@AssignNote"].Value = mmAssignNote.Text;
                    conn1.Open();
                    Cmd1.ExecuteNonQuery();
                    conn1.Close();

                }
                else
                {
                    //Assign Test Request
                    string sql = "insert into Assignment (AssignmentID, AssignStaffID,TestStaffID1,TestStaffID2,AssignDate,AssignNote,ReAssign) values ('" + cbRequestNo.Value + "','" + Session["StaffID"] + "','" + cbStaff1.Value + "','" + cbStaff2.Value + "',Getdate(),@Assignnote,0)";
                    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    if (mmAssignNote.Text != null)
                    {
                        Cmd.Parameters.Add("@AssignNote", SqlDbType.NText);
                        Cmd.Parameters["@AssignNote"].Value = mmAssignNote.Text;
                    }
                    else
                    {
                        Cmd.Parameters.Add("@AssignNote", SqlDbType.NText);
                        Cmd.Parameters["@AssignNote"].Value = System.DBNull.Value;
                    }
                    conn.Open();
                    Cmd.ExecuteNonQuery();
                    conn.Close();
                    //Update Request Status
                    string sql3 = "UPDATE Request SET StatusID='2' WHERE RequestID=('" + cbRequestNo.Value + "')";
                    SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                    conn3.Open();
                    Cmd3.ExecuteNonQuery();
                    conn3.Close();
                }
                dr0.Close();
                conn0.Close();
                ASPxGridView1.DataBind();
                ASPxGridView2.DataBind();
                btAssign.Enabled = true;
                btDeleteAssign.Enabled = true;
                lblnotifiReAssign.Text = null;

        }

        protected void btReAssign_Click(object sender, EventArgs e)
        {
            lblnotifiReAssign.Text = "Đang thực hiện phân công đo kiểm lại";
            btAssign.Enabled = true;
            cbStaff1.ReadOnly = false;
            cbStaff2.ReadOnly = false;
        }

    

        protected void btDeleteAssign_Click(object sender, EventArgs e)
        {
            //Delete Assignment
            string sql = "DELETE FROM Assignment WHERE AssignmentID=('" + cbRequestNo.Value + "')";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();
            //Update Request Status
            string sql1 = "UPDATE Request SET StatusID=1 WHERE RequestID=('" + cbRequestNo.Value + "')";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView1.DataBind();
            ASPxGridView2.DataBind();
            //Clear All InfocbRequestNo.Value = Convert.ToInt32(dr.GetValue(26));
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
            cbStaff1.Value = null;
            cbStaff2.Value = null;
            cbRequestNo.Value = null;
            btDeleteAssign.Enabled = false;
            btAssign.Enabled = false;
        }

        protected void ASPxGridView2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            int ASID = Convert.ToInt32(e.GetValue("AssignStaffID"));
            if (ASID == Convert.ToInt32(Session["StaffID"]))
                e.Row.BackColor = System.Drawing.Color.MistyRose;

        }

        protected void ASPxGridView2_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Int32 AsID = Convert.ToInt32(e.Keys[ASPxGridView2.KeyFieldName]);
            //Check AssignStaff
            string sql2 = "SELECT AssignStaffID FROM Assignment WHERE AssignmentID='" + AsID+"'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            SqlDataReader dr2 = Cmd2.ExecuteReader();
            dr2.Read();
            string AS = dr2.GetValue(0).ToString();
            dr2.Close();
            if (AS == Session["StaffID"].ToString())
            {
                string S1 = e.NewValues["TestStaff1ID"].ToString();
                cbStaff1.Value = S1;
                string S2 = e.NewValues["TestStaff2ID"].ToString();
                cbStaff2.Value = S2;
                string n = e.NewValues["AssignNote"].ToString();
                mmAssignNote.Text = n;
                string sql1 = "UPDATE Assignment SET TestStaffID1='" + S1 + "',TestStaffID2='" + S2 + "',AssignNote=@AssignNote,ReAssign='1' WHERE AssignmentID='" + AsID + "'";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                if (mmAssignNote.Text != null)
                {
                    Cmd1.Parameters.Add("@AssignNote", SqlDbType.NText);
                    Cmd1.Parameters["@AssignNote"].Value = n;
                }
                else
                {
                    Cmd1.Parameters.Add("@AssignNote", SqlDbType.NText);
                    Cmd1.Parameters["@EquTypeName"].Value = System.DBNull.Value;
                }
                conn1.Open();
                Cmd1.ExecuteNonQuery();
                conn1.Close();
                lblnotifiReAssign.Text = null;
            }
            else
            {
                lblnotifiReAssign.Text = "Bạn chỉ có thể sửa đổi thông tin phân công do mình tạo ra";
            }
        }

        protected void ASPxGridView2_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Int32 AsID = Convert.ToInt32(e.Keys[ASPxGridView2.KeyFieldName]);
            //Check AssignStaff
            string sql2 = "SELECT AssignStaffID FROM Assignment WHERE AssignmentID=('" + AsID + "')";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            SqlDataReader dr2 = Cmd2.ExecuteReader();
            dr2.Read();
            string AS = dr2.GetValue(0).ToString();
            dr2.Close();
            conn2.Close();
            if (AS == Session["StaffID"].ToString())
            {
                //Delete
                string sql = "DELETE FROM Assignment WHERE AssignmentID=('" + AsID + "')";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                //Update Request Status
                string sql1 = "UPDATE Request SET StatusID=1 WHERE RequestID=('" + AsID + "')";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                Cmd1.ExecuteNonQuery();
                conn1.Close();
                ASPxGridView1.DataBind();
                ASPxGridView2.DataBind();
                lblnotifiReAssign.Text = null;
            }
            else
            {
                lblnotifiReAssign.Text = "Bạn chỉ có thể xóa thông tin phân công do mình tạo ra";
            }
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