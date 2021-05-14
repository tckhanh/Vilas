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
    public partial class NhanMau : System.Web.UI.Page
    {
        public static string RQNo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A1, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            if (cbcompanyname.Value == null)
            {
                btPrint.Enabled = false;
                btPrintBill.Enabled = false;
                btNewBill.Enabled = false;
                txtContractNo.ReadOnly = true;
            }
            if (txtRequestNum.Text == "")
            {
                string sql = "select top 1 [RequestNo],[BillNo],[Year] from Number";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                txtRequestNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 1000000 + Convert.ToInt32(dr.GetValue(2))*10000).ToString();
                txtBillNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(1)) + 1).ToString().PadLeft(5, '0');
                dr.Close();
                conn.Close();
            }
                btsave.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn lưu yêu cầu đo kiểm này?');");
                btNewBill.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xuất phiếu thu cho yêu cầu đo kiểm này?');");
        }

        protected void cbcompanyname_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "select CompanyName,Address,Province,PhoneNo,FaxNo,Taxcode from Company, Province where CompanyID='" + cbcompanyname.Value.ToString() + "'and [Company].[ProvinceID]=[Province].[ProvinceID]";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtAddress.Text = dr.GetValue(1).ToString();
            txtphone.Text = dr.GetValue(3).ToString();
            txtfax.Text = dr.GetValue(4).ToString();
            txttaxid.Text = dr.GetValue(5).ToString();
            cbcompanyname2.Value = cbcompanyname.Value;
            ASPxGridView2.DataBind();
            dr.Close();
            dr.Dispose();
            conn.Close();
            conn.Dispose();
            //
            cbperson.SelectedIndex = 0;
            string sql2 = "select ContactPhone from Contact where ContactID='" + cbperson.Value + "'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            SqlDataReader dr2 = Cmd2.ExecuteReader();
            dr2.Read();
            if(dr2.HasRows)
            txtperphone.Text = dr2.GetValue(0).ToString();
            dr2.Close();
            dr2.Dispose();
            conn2.Close();
            conn2.Dispose();
        }

        protected void cbperson_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "select ContactPhone from Contact where ContactID='"+cbperson.Value.ToString()+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtperphone.Text = dr.GetValue(0).ToString();      
            dr.Close();
            dr.Dispose();
            conn.Close();
            conn.Dispose();
        }

        protected void cbtestname_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sql = "select EquTypeName,Standards,TestMethod,Price,PriceIntext,EquTypeDisplayName from EquipmentType where EquTypeID='" + cbtestname.Value.ToString() + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txttestmethod.Text = dr.GetValue(2).ToString();
            txtstandard.Text = dr.GetValue(1).ToString();
            txtprice.Text = dr.GetValue(3).ToString();
            txtpriceintext.Text = dr.GetValue(4).ToString();
            txtDisplayTestName.Text = dr.GetValue(5).ToString();
            dr.Close();
            dr.Dispose();
            conn.Close();
            conn.Dispose();
        }



        protected void btsave_Click(object sender, EventArgs e)
        {
            if (cbcompanyname.Value == null || cbperson.Value == null || cbtestname.Value == null || txtcompmaking.Text == null || cbCountry.Value == null || txtModel.Text == null || dtreceive.Value == null || dtrelease.Value == null ||  (Convert.ToInt32(cbcontract.Value) == 1 && txtContractNo.Text == ""))
            {
                lblnotification.Text = "Bạn phải điền đầy đủ thông tin ở các mục bắt buộc có dấu (*)";
            }
            else
            {
                string tam, tam1,tam2,b,b1,b2;
                //Enable Print Button
                btPrint.Enabled = true;
                btsave.Enabled = false;
                if (Convert.ToInt32(cbcontract.Value) == 0)
                    btPrintBill.Enabled = true;
                else
                    btPrintBill.Enabled = false;
                //Enable ReadOnly combobox and textbox
                cbcompanyname.ReadOnly = true;
                cbperson.ReadOnly = true;
                cbtestname.ReadOnly = true;
                cbcontract.ReadOnly = true;
                cbCountry.ReadOnly = true;
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
                txtRequestNum.ReadOnly = true;
                txtSN.ReadOnly = true;
                txtstandard.ReadOnly = true;
                txttaxid.ReadOnly = true;
                txttestmethod.ReadOnly = true;           
                
                string sql = "insert into Request (RequestNo, ContractNo,BillNo,CompanyID, ContactID,EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei,Accessories,ReceiveDate,AppointmentDate,Note,ReceiveStaffID,HoldEquip,StatusID) values (@RequestNo, @ContractNo,@BillNo, @CompanyID, @ContactID,@EquTypeID, @EquTypeName, @Model, @Manufacturer, @MadeInID, @Serial_Imei,@Accessories,@ReceiveDate,@AppointmentDate,@Note,@ReceiveStaffID,1,1)";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                //Insert ContractNo or BillNo depend have contract or not
                if (Convert.ToInt32(cbcontract.Value) == 0)
                {

                    Cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@ContractNo"].Value = System.DBNull.Value;
                }

                else
                {

                    Cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@ContractNo"].Value = txtContractNo.Text;
                }

                //Get Bill Number from SQl Server
                string sql1 = "select top 1 [RequestNo],[BillNo],[Year] from Number";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                SqlDataReader dr = Cmd1.ExecuteReader();
                dr.Read();
                tam = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1).ToString().PadLeft(4, '0');
                tam1 = dr.GetValue(0).ToString();
                if(Convert.ToInt32(cbHasBill.Value)==1)
                {
                  b = Convert.ToString(Convert.ToInt32(dr.GetValue(1)) + 1).ToString().PadLeft(4, '0');
                }
                else
                  b = Convert.ToString(Convert.ToInt32(dr.GetValue(1))).ToString().PadLeft(4, '0');
                if (Convert.ToInt32(cbcontract.Value) == 0)
                {
                    tam2 = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 1000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
                    RQNo = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 1000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
                }
                else
                {
                    tam2 = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 2000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
                    RQNo = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 2000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
                }
                dr.Close();
                conn1.Close();

                //Update Request Number and Bill No
                string sql2 = "UPDATE Number SET RequestNo= ('" + tam + "'),BillNo=('"+b+"') WHERE RequestNo=('" + tam1 + "')";
                SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                conn2.Open();
                Cmd2.ExecuteNonQuery();
                conn2.Close();
                //Insert RequestNo to Request Table
                Cmd.Parameters.Add("@RequestNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@RequestNo"].Value = tam2;
                //Insert BillNo
                if (Convert.ToInt32(cbHasBill.Value) == 1)
                {
                    Cmd.Parameters.Add("@BillNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@BillNo"].Value = b;
                }
                else
                {
                    Cmd.Parameters.Add("@BillNo", SqlDbType.NVarChar, 50);
                    Cmd.Parameters["@BillNo"].Value = System.DBNull.Value;
                }
                //Insert CompanyID
                Cmd.Parameters.Add("@CompanyID", SqlDbType.Int,32);
                Cmd.Parameters["@CompanyID"].Value = cbcompanyname.Value;
                //Insert ContactID
                Cmd.Parameters.Add("@ContactID", SqlDbType.Int, 32);
                Cmd.Parameters["@ContactID"].Value = cbperson.Value;
                //Insert EquTypeID
                Cmd.Parameters.Add("@EquTypeID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@EquTypeID"].Value = cbtestname.Value.ToString();
                //Insert EquTypeName
                if (txtEquName.Value != null)
                {
                    Cmd.Parameters.Add("@EquTypeName", SqlDbType.NText);
                    Cmd.Parameters["@EquTypeName"].Value = txtEquName.Value.ToString();
                }
                else
                {
                    Cmd.Parameters.Add("@EquTypeName", SqlDbType.NText);
                    Cmd.Parameters["@EquTypeName"].Value = System.DBNull.Value;
                }
                //Insert Model
                Cmd.Parameters.Add("@Model", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Model"].Value = txtModel.Value.ToString();
                //Insert Manufacturer
                Cmd.Parameters.Add("@Manufacturer", SqlDbType.NText);
                Cmd.Parameters["@Manufacturer"].Value = txtcompmaking.Value.ToString();
                //Insert MadeInID
                Cmd.Parameters.Add("@MadeInID", SqlDbType.Int);
                Cmd.Parameters["@MadeInID"].Value = cbCountry.Value.ToString();
                //Insert Serial_Imei
                Cmd.Parameters.Add("@Serial_Imei", SqlDbType.NVarChar, 50);
                if(txtSN.Value!=null)
                    Cmd.Parameters["@Serial_Imei"].Value = txtSN.Value.ToString();
                else
                    Cmd.Parameters["@Serial_Imei"].Value = System.DBNull.Value;
                //Insert Accessories
                if (mmAcce.Value != null)
                {
                    Cmd.Parameters.Add("@Accessories", SqlDbType.NText);
                    Cmd.Parameters["@Accessories"].Value = mmAcce.Value.ToString();
                }
                else
                {
                    Cmd.Parameters.Add("@Accessories", SqlDbType.NText);
                    Cmd.Parameters["@Accessories"].Value = System.DBNull.Value;
                }
                //Insert ReceiveDate
                Cmd.Parameters.Add("@ReceiveDate", SqlDbType.Date);
                Cmd.Parameters["@ReceiveDate"].Value = dtreceive.Value;
                //Insert AppointmentDate
                Cmd.Parameters.Add("@AppointmentDate", SqlDbType.Date);
                Cmd.Parameters["@AppointmentDate"].Value = dtrelease.Value;
                //Insert Note
                if (mmNote.Value != null)
                {
                    Cmd.Parameters.Add("@Note", SqlDbType.NText);
                    Cmd.Parameters["@Note"].Value = mmNote.Value.ToString();
                }
                else
                {
                    Cmd.Parameters.Add("@Note", SqlDbType.NText);
                    Cmd.Parameters["@Note"].Value = System.DBNull.Value;
                }
                //Insert ReceiveStaffID
                Cmd.Parameters.Add("@ReceiveStaffID", SqlDbType.NVarChar, 30);
                Cmd.Parameters["@ReceiveStaffID"].Value = Session["StaffID"];

                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                ASPxGridView2.DataBind();
                //Get new Request Number and Bill Number
                lblnotification.Text = null;
                lbexpect.Text = null;
                
            }
        }

        protected void btPrint_Click(object sender, EventArgs e)
        {
            
            ASPxGridView2.DataBind();
                  
        }


        protected void btnewrequest_Click(object sender, EventArgs e)
        {
            paComment.Visible = false;
            //Disable Print Button
            btPrint.Enabled = false;
            btPrintBill.Enabled = false;
            btsave.Enabled = true;
            //Diable ReadOnly combobox and textbox
            cbcompanyname.ReadOnly = false;
            cbperson.ReadOnly = false;
            cbtestname.ReadOnly = false;
            cbcontract.ReadOnly = false;
            cbCountry.ReadOnly = false;
            dtreceive.ReadOnly = false;
            dtrelease.ReadOnly = false;
            txtAddress.ReadOnly = false;
            txtBillNum.ReadOnly = false;
            txtcompmaking.ReadOnly = false;
            txtEquName.ReadOnly = false;
            txtfax.ReadOnly = false;
            txtModel.ReadOnly = false;
            txtperphone.ReadOnly = false;
            txtphone.ReadOnly = false;
            txtprice.ReadOnly = false;
            txtpriceintext.ReadOnly = false;
            txtRequestNum.ReadOnly = false;
            txtSN.ReadOnly = false;
            txtstandard.ReadOnly = false;
            txttaxid.ReadOnly = false;
            txttestmethod.ReadOnly = false;
            txtContractNo.ReadOnly = true;
            mmAcce.ReadOnly = false;
            mmNote.ReadOnly = false;
            //Clear Content
            lbexpect.Text = "(dự kiến)";
            lblnotification.Text = null;
            cbcompanyname.Value = null;
            txtAddress.Text = null;
            txtphone.Text = null;
            txtperphone.Text = null;
            txtfax.Text = null;
            txttaxid.Text = null;
            txtEquName.Text = null;
            cbperson.Value = null;
            cbtestname.Value = null;
            txtEquName.Text = null;
            txtcompmaking.Text = null;
            cbCountry.Value = null;
            txtModel.Text = null;
            txtSN.Text = null;
            txtprice.Text = null;
            txtpriceintext.Text = null;
            txttestmethod.Text = null;
            txtstandard.Text = null;
            txtContractNo.Text = null;
            dtreceive.Value = null;
            dtrelease.Value = null;
            cbHasBill.SelectedIndex=1;
            mmAcce.Text = null;
            mmNote.Text = null;
            cbcontract.Value = 0;
            lbBillNo.Text = "Số phiếu thu";
            string sql = "select top 1 [RequestNo],[BillNo],[Year] from Number";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtRequestNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 1000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
            txtBillNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(1)) + 1).ToString().PadLeft(4, '0');

        }

        protected void cbcontract_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cbcontract.Value) == 0)
            {
                lbBillNo.Text = "Số phiếu thu";
                string sql = "select top 1 [RequestNo],[BillNo],[Year] from Number";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                txtRequestNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 1000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
                if(Convert.ToInt32(cbHasBill.Value)==1)
                   txtBillNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(1)) + 1).ToString().PadLeft(4, '0');
                dr.Close();
                conn.Close();
                txtContractNo.ReadOnly = true;
            }
            else
            {
                string sql = "select top 1 [RequestNo],[BillNo],[Year] from Number";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                txtRequestNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 2000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
                if (Convert.ToInt32(cbHasBill.Value) == 1)
                    txtBillNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(1)) + 1).ToString().PadLeft(4, '0');
                btPrintBill.Enabled = false;
                dr.Close();
                conn.Close();
                txtContractNo.ReadOnly = false;
            }

        }
////
        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            paComment.Visible = false;
            //Enable Print Button, disable Save Button
            btPrint.Enabled = true;
            btsave.Enabled = false;
            btPrintBill.Enabled = true;
            lblnotification.Text = null;
            lbexpect.Text = null;
            //Enable ReadOnly combobox and textbox
            cbcompanyname.ReadOnly = true;
            cbperson.ReadOnly = true;
            cbtestname.ReadOnly = true;
            cbcontract.ReadOnly = true;
            cbCountry.ReadOnly = true;
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
            txtRequestNum.ReadOnly = true;
            txtSN.ReadOnly = true;
            txtstandard.ReadOnly = true;
            txttaxid.ReadOnly = true;
            txttestmethod.ReadOnly = true;
            mmAcce.ReadOnly = true;
            mmNote.ReadOnly = true;
            string masterKeyValue1 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "CompanyID").ToString();
            cbcompanyname.Value = Convert.ToInt32(masterKeyValue1);
            string masterKeyValue2 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "ContactID").ToString();
            string masterKeyValue3 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue4 = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "EquTypeID").ToString();

            //Load Comapany Information
            string sql = "select CompanyName,Address,Province,PhoneNo,FaxNo,Taxcode from Company, Province where CompanyID='" + cbcompanyname.Value.ToString() + "'and [Company].[ProvinceID]=[Province].[ProvinceID]";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtAddress.Text = dr.GetValue(1).ToString();
            txtphone.Text = dr.GetValue(3).ToString();
            txtfax.Text = dr.GetValue(4).ToString();
            txttaxid.Text = dr.GetValue(5).ToString();
            //cbcompanyname2.Value = cbcompanyname.Value.ToString();
            dr.Close();
            dr.Dispose();
            conn.Close();
            conn.Dispose();
            //Load Contact Information
            string sql2 = "select TOP 1 ContactID,ContactPhone from Contact where CompanyID='" + cbcompanyname.Value.ToString() + "' and ContactID='" + masterKeyValue2 + "'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            SqlDataReader dr2 = Cmd2.ExecuteReader();
            dr2.Read();
            cbperson.Value = Convert.ToInt32(dr2.GetValue(0));
            txtperphone.Text = dr2.GetValue(1).ToString();
            dr2.Close();
            dr2.Dispose();
            conn2.Close();
            conn2.Dispose();
            //Load Request Information
            string sql3 = "select RequestNo, EquTypeID, EquTypeName, Manufacturer, MadeInID, Model, Serial_Imei,ReceiveDate, AppointmentDate,Accessories,Note,BillNo,ContractNo from Request where RequestNo='" + masterKeyValue3 + "'";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            conn3.Open();
            SqlDataReader dr3 = Cmd3.ExecuteReader();
            dr3.Read();
            txtRequestNum.Text = dr3.GetValue(0).ToString();
            RQNo = txtRequestNum.Text.ToString();
            if (dr3.GetValue(11).ToString() == "")
            {
                btNewBill.Enabled = true;
                txtBillNum.Text = dr3.GetValue(11).ToString();
                btPrintBill.Enabled = false;
            }

            else
            {
                txtBillNum.Text = dr3.GetValue(11).ToString();
                btNewBill.Enabled = false;
                btPrintBill.Enabled = true;

            }
            txtContractNo.Text = dr3.GetValue(12).ToString();
            if (txtContractNo.Text == "")
                cbcontract.Value = 0;
            else
                cbcontract.Value = 1;
            cbtestname.Value = dr3.GetValue(1).ToString();
            txtEquName.Text = dr3.GetValue(2).ToString();
            txtcompmaking.Text = dr3.GetValue(3).ToString();
            cbCountry.Value = dr3.GetValue(4).ToString();
            txtModel.Text = dr3.GetValue(5).ToString();
            txtSN.Text = dr3.GetValue(6).ToString();
            dtreceive.Value = dr3.GetValue(7);
            dtrelease.Value = dr3.GetValue(8);
            mmAcce.Text = dr3.GetValue(9).ToString();
            mmNote.Text=dr3.GetValue(10).ToString();
            dr3.Close();
            dr3.Dispose();
            conn3.Close();
            conn3.Dispose();
            //Load Equipment Type Information
            string sql4 = "select TestMethod, Standards,Price, PriceInText,EquTypeDisplayName from EquipmentType where EquTypeID='" + masterKeyValue4 + "'";
            SqlConnection conn4 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd4 = new SqlCommand(sql4, conn4);
            conn4.Open();
            SqlDataReader dr4 = Cmd4.ExecuteReader();
            dr4.Read();
            txttestmethod.Text = dr4.GetValue(0).ToString();
            txtstandard.Text = dr4.GetValue(1).ToString();
            txtprice.Text = dr4.GetValue(2).ToString();
            txtpriceintext.Text = dr4.GetValue(3).ToString();
            txtDisplayTestName.Text = dr4.GetValue(4).ToString();
            dr4.Close();
            dr4.Dispose();
            conn4.Close();
            conn4.Dispose();        
        }


//        public string RequestPaPer { get; set; }

        protected void btPrintBill_Click(object sender, EventArgs e)
        {

        }

        protected void cbHasBill_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cbHasBill.Value) == 0)
            {
                txtBillNum.Enabled = false;
                txtBillNum.Text = null;
            }
            else
            {
                txtBillNum.Enabled = true;
                string sql = "select top 1 [RequestNo],[BillNo],[Year] from Number";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                txtBillNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(1)) + 1).ToString().PadLeft(5, '0');
                dr.Close();
                conn.Close();
            }

        }

        protected void btNewBill_Click(object sender, EventArgs e)
        {
            //Get Bill Number from SQl Server
            string b1,b;
            string sql = "select top 1 [BillNo] from Number";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            b1 = Convert.ToString(Convert.ToInt32(dr.GetValue(0))).ToString().PadLeft(4, '0');
            b = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1).ToString().PadLeft(4, '0');
            dr.Close();
            conn.Close();
            txtBillNum.Text = b;
            //Update Request Number and Bill No
            string sql2 = "UPDATE Number SET BillNo=('" + b + "') WHERE BillNo='"+b1+"'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            Cmd2.ExecuteNonQuery();
            conn2.Close();
            //Update BillNo to Request Table
            string sql3 = "UPDATE Request SET BillNo=('" + b + "') WHERE RequestNo='" + RQNo + "'";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            ASPxGridView2.DataBind();
            btPrintBill.Enabled = true;
            btNewBill.Enabled = false;
            //Get new Request Number and Bill Number
        }

        protected void ASPxGridView2_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Int32 masterkey = Convert.ToInt32(e.Keys[ASPxGridView2.KeyFieldName]);
            string ReceiveStaffID= e.NewValues["ReceiveStaffID"].ToString();
            if (ReceiveStaffID == Session["StaffID"].ToString())
            {
                string sql = "UPDATE Request SET RequestNo=@RequestNo, ContractNo=@ContractNo,BillNo=@BillNo,CompanyID=@CompanyID, ContactID=@ContactID,EquTypeID=@EquTypeID, EquTypeName=@EquTypeName, Model=@Model, Manufacturer=@Manufacturer, MadeInID=@MadeInID, Serial_Imei=@Serial_Imei,Accessories=@Accessories,ReceiveDate=@ReceiveDate,AppointmentDate=@AppointmentDate,Note=@Note WHERE RequestID='" + masterkey + "'";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@RequestNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@RequestNo"].Value = Convert.ToString(e.NewValues["RequestNo"]);
                Cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@ContractNo"].Value = Convert.ToString(e.NewValues["ContractNo"]);
                Cmd.Parameters.Add("@BillNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@BillNo"].Value = Convert.ToString(e.NewValues["BillNo"]);
                Cmd.Parameters.Add("@CompanyID", SqlDbType.Int);
                Cmd.Parameters["@CompanyID"].Value = Convert.ToInt32(e.NewValues["CompanyID"]);
                Cmd.Parameters.Add("@ContactID", SqlDbType.Int);
                Cmd.Parameters["@ContactID"].Value = Convert.ToInt32(e.NewValues["ContactID"]);
                Cmd.Parameters.Add("@EquTypeID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@EquTypeID"].Value = Convert.ToString(e.NewValues["EquTypeID"]);
                Cmd.Parameters.Add("@EquTypeName", SqlDbType.NText);
                Cmd.Parameters["@EquTypeName"].Value = Convert.ToString(e.NewValues["EquTypeName"]);
                Cmd.Parameters.Add("@Model", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Model"].Value = Convert.ToString(e.NewValues["Model"]);
                Cmd.Parameters.Add("@Manufacturer", SqlDbType.NText);
                Cmd.Parameters["@Manufacturer"].Value = Convert.ToString(e.NewValues["Manufacturer"]);
                Cmd.Parameters.Add("@MadeInID", SqlDbType.Int);
                Cmd.Parameters["@MadeInID"].Value = Convert.ToInt32(e.NewValues["MadeInID"]);
                Cmd.Parameters.Add("@Serial_Imei", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Serial_Imei"].Value = Convert.ToString(e.NewValues["Serial_Imei"]);
                Cmd.Parameters.Add("@Accessories", SqlDbType.NText);
                Cmd.Parameters["@Accessories"].Value = Convert.ToString(e.NewValues["Accessories"]);
                Cmd.Parameters.Add("@ReceiveDate", SqlDbType.Date);
                Cmd.Parameters["@ReceiveDate"].Value = Convert.ToDateTime(e.NewValues["ReceiveDate"]);
                Cmd.Parameters.Add("@AppointmentDate", SqlDbType.Date);
                Cmd.Parameters["@AppointmentDate"].Value = Convert.ToDateTime(e.NewValues["AppointmentDate"]);
                Cmd.Parameters.Add("@Note", SqlDbType.NText);
                Cmd.Parameters["@Note"].Value = Convert.ToString(e.NewValues["Note"]);
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                ASPxGridView2.DataBind();
                lblnotification.Text = "Bạn đã cập nhật thông tin phiếu yêu cầu đo kiểm thành công";
            }
            else
            {
                lblnotification.Text = "Bạn không thể cập nhật thông tin yêu cầu đo kiểm do nhân viên khác tiếp nhận";
            }
        }

        protected void ASPxGridView2_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Int32 masterkey = Convert.ToInt32(e.Keys[ASPxGridView2.KeyFieldName]);
            string sql = "SELECT ReceiveStaffID FROM Request WHERE RequestID='"+masterkey+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            string ReceiveStaffID = Convert.ToString(dr.GetValue(0));
            dr.Close();
            conn.Close();
            if (ReceiveStaffID == Session["StaffID"].ToString())
            {
                string sql1 = "DELETE FROM Request WHERE RequestID='" + masterkey + "'";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                conn1.Open();
                Cmd1.ExecuteNonQuery();
                conn1.Close();
                ASPxGridView2.DataBind();
                lblnotification.Text = "Bạn đã xóa thông tin phiếu yêu cầu đo kiểm thành công";
            }
            else
            {
                lblnotification.Text = "Bạn không thể xóa thông tin yêu cầu đo kiểm do nhân viên khác tiếp nhận";
            }
        }

        protected void ASPxGridView2_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Int32 masterkey = Convert.ToInt32(ASPxGridView2.GetRowValuesByKeyValue(e.EditingKeyValue, "CompanyID"));
            cbcompanyname2.Value = masterkey;
        }

        protected void btNext_Click(object sender, EventArgs e)
        {
            paComment.Visible = false;
            //Disable Print Button
            btPrint.Enabled = false;
            btPrintBill.Enabled = false;
            btsave.Enabled = true;
            //Diable ReadOnly combobox and textbox
            cbcompanyname.ReadOnly = false;
            cbperson.ReadOnly = false;
            cbtestname.ReadOnly = false;
            cbcontract.ReadOnly = false;
            cbCountry.ReadOnly = false;
            dtreceive.ReadOnly = false;
            dtrelease.ReadOnly = false;
            txtAddress.ReadOnly = false;
            txtBillNum.ReadOnly = false;
            txtcompmaking.ReadOnly = false;
            txtEquName.ReadOnly = false;
            txtfax.ReadOnly = false;
            txtModel.ReadOnly = false;
            txtperphone.ReadOnly = false;
            txtphone.ReadOnly = false;
            txtprice.ReadOnly = false;
            txtpriceintext.ReadOnly = false;
            txtRequestNum.ReadOnly = false;
            txtSN.ReadOnly = false;
            txtstandard.ReadOnly = false;
            txttaxid.ReadOnly = false;
            txttestmethod.ReadOnly = false;
            txtContractNo.ReadOnly = true;
            mmAcce.ReadOnly = false;
            mmNote.ReadOnly = false;
            //Clear Content
            lbexpect.Text = "(dự kiến)";
            lblnotification.Text = null;
            txtModel.Text = null;
            txtSN.Text = null;
            string sql = "select top 1 [RequestNo],[BillNo],[Year] from Number";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (cbcontract.Value.ToString() == "0")
            {
                txtRequestNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 1000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
                
            }
            if (cbcontract.Value.ToString() == "1")
            {
                txtRequestNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(0)) + 1 + 2000000 + Convert.ToInt32(dr.GetValue(2)) * 10000).ToString();
            }
            if (cbHasBill.Value.ToString() == "1")
            {
                txtBillNum.Text = Convert.ToString(Convert.ToInt32(dr.GetValue(1)) + 1).ToString().PadLeft(4, '0');
            }
        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            paComment.Visible = true;
            //Enable Print Button, disable Save Button
            btFinishReCheck.Enabled = true;
            btPrint.Enabled = true;
            btsave.Enabled = false;
            btPrintBill.Enabled = true;
            lblnotification.Text = "Phiếu yêu cầu đo kiểm được yêu cầu xử lý lại thông tin nhận mẫu";
            lbexpect.Text = null;
            //Enable ReadOnly combobox and textbox
            cbcompanyname.ReadOnly = true;
            cbperson.ReadOnly = true;
            cbtestname.ReadOnly = true;
            cbcontract.ReadOnly = true;
            cbCountry.ReadOnly = true;
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
            txtRequestNum.ReadOnly = true;
            txtSN.ReadOnly = true;
            txtstandard.ReadOnly = true;
            txttaxid.ReadOnly = true;
            txttestmethod.ReadOnly = true;
            mmAcce.ReadOnly = true;
            mmNote.ReadOnly = true;
            string masterKeyValue1 = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "CompanyID").ToString();
            cbcompanyname.Value = Convert.ToInt32(masterKeyValue1);
            string masterKeyValue2 = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "ContactID").ToString();
            string masterKeyValue3 = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string masterKeyValue4 = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "EquTypeID").ToString();
            //Load Comapany Information
            string sql = "select CompanyName,Address,Province,PhoneNo,FaxNo,Taxcode from Company, Province where CompanyID='" + cbcompanyname.Value.ToString() + "'and [Company].[ProvinceID]=[Province].[ProvinceID]";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtAddress.Text = dr.GetValue(1).ToString();
            txtphone.Text = dr.GetValue(3).ToString();
            txtfax.Text = dr.GetValue(4).ToString();
            txttaxid.Text = dr.GetValue(5).ToString();
            //cbcompanyname2.Value = cbcompanyname.Value.ToString();
            dr.Close();
            dr.Dispose();
            conn.Close();
            conn.Dispose();
            //Load Contact Information
            string sql2 = "select TOP 1 ContactID,ContactPhone from Contact where CompanyID='" + cbcompanyname.Value.ToString() + "' and ContactID='" + masterKeyValue2 + "'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            SqlDataReader dr2 = Cmd2.ExecuteReader();
            dr2.Read();
            cbperson.Value = Convert.ToInt32(dr2.GetValue(0));
            txtperphone.Text = dr2.GetValue(1).ToString();
            dr2.Close();
            dr2.Dispose();
            conn2.Close();
            conn2.Dispose();
            //Load Request Information
            string sql3 = "select RequestNo, EquTypeID, EquTypeName, Manufacturer, MadeInID, Model, Serial_Imei,ReceiveDate, AppointmentDate,Accessories,Note,BillNo,ContractNo,ApprStaffCom, TestStaffCom, ReceiveStaffCom, ApprComDate, TestStaffComDate, ReceiveStaffComDate,RecheckStatusID from Request where RequestNo='" + masterKeyValue3 + "'";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            conn3.Open();
            SqlDataReader dr3 = Cmd3.ExecuteReader();
            dr3.Read();
            txtRequestNum.Text = dr3.GetValue(0).ToString();
            RQNo = txtRequestNum.Text.ToString();
            if (dr3.GetValue(11).ToString() == "")
            {
                btNewBill.Enabled = true;
                txtBillNum.Text = dr3.GetValue(11).ToString();
                btPrintBill.Enabled = false;
            }

            else
            {
                txtBillNum.Text = dr3.GetValue(11).ToString();
                btNewBill.Enabled = false;
                btPrintBill.Enabled = true;

            }
            txtContractNo.Text = dr3.GetValue(12).ToString();
            cbtestname.Value = dr3.GetValue(1).ToString();
            txtEquName.Text = dr3.GetValue(2).ToString();
            txtcompmaking.Text = dr3.GetValue(3).ToString();
            cbCountry.Value = dr3.GetValue(4).ToString();
            txtModel.Text = dr3.GetValue(5).ToString();
            txtSN.Text = dr3.GetValue(6).ToString();
            dtreceive.Value = dr3.GetValue(7);
            dtrelease.Value = dr3.GetValue(8);
            mmAcce.Text = dr3.GetValue(9).ToString();
            mmNote.Text = dr3.GetValue(10).ToString();
            mmApproveStaff.Text = dr3.GetValue(13).ToString();
            mmTestingStaff.Text = dr3.GetValue(14).ToString();
            mmReceiveStaff.Text = dr3.GetValue(15).ToString();
            lbApprStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr3.GetValue(16));
            lbTestStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr3.GetValue(17));
            lbReceiveStaffComDate.Text = string.Format("{0:dd/MM/yyyy}", dr3.GetValue(18));
            dr3.Close();
            dr3.Dispose();
            conn3.Close();
            conn3.Dispose();
            //Load Equipment Type Information
            string sql4 = "select TestMethod, Standards,Price, PriceInText,EquTypeDisplayName from EquipmentType where EquTypeID='" + masterKeyValue4 + "'";
            SqlConnection conn4 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd4 = new SqlCommand(sql4, conn4);
            conn4.Open();
            SqlDataReader dr4 = Cmd4.ExecuteReader();
            dr4.Read();
            txttestmethod.Text = dr4.GetValue(0).ToString();
            txtstandard.Text = dr4.GetValue(1).ToString();
            txtprice.Text = dr4.GetValue(2).ToString();
            txtpriceintext.Text = dr4.GetValue(3).ToString();
            txtDisplayTestName.Text = dr4.GetValue(4).ToString();
            dr4.Close();
            dr4.Dispose();
            conn4.Close();
            conn4.Dispose();  
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Int32 masterkey = Convert.ToInt32(e.Keys[ASPxGridView1.KeyFieldName]);
            string ReceiveStaffID = Convert.ToString(e.NewValues["ReceiveStaffID"]);
            if (ReceiveStaffID == Convert.ToString(Session["StaffID"]))
            {
                string sql = "UPDATE Request SET RequestNo=@RequestNo, ContractNo=@ContractNo,BillNo=@BillNo,CompanyID=@CompanyID, ContactID=@ContactID,EquTypeID=@EquTypeID, EquTypeName=@EquTypeName, Model=@Model, Manufacturer=@Manufacturer, MadeInID=@MadeInID, Serial_Imei=@Serial_Imei,Accessories=@Accessories,ReceiveDate=@ReceiveDate,AppointmentDate=@AppointmentDate,Note=@Note WHERE RequestID='" + masterkey + "'";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@RequestNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@RequestNo"].Value = Convert.ToString(e.NewValues["RequestNo"]);
                Cmd.Parameters.Add("@ContractNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@ContractNo"].Value = Convert.ToString(e.NewValues["ContractNo"]);
                Cmd.Parameters.Add("@BillNo", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@BillNo"].Value = Convert.ToString(e.NewValues["BillNo"]);
                Cmd.Parameters.Add("@CompanyID", SqlDbType.Int);
                Cmd.Parameters["@CompanyID"].Value = Convert.ToInt32(e.NewValues["CompanyID"]);
                Cmd.Parameters.Add("@ContactID", SqlDbType.Int);
                Cmd.Parameters["@ContactID"].Value = Convert.ToInt32(e.NewValues["ContactID"]);
                Cmd.Parameters.Add("@EquTypeID", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@EquTypeID"].Value = Convert.ToString(e.NewValues["EquTypeID"]);
                Cmd.Parameters.Add("@EquTypeName", SqlDbType.NText);
                Cmd.Parameters["@EquTypeName"].Value = Convert.ToString(e.NewValues["EquTypeName"]);
                Cmd.Parameters.Add("@Model", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Model"].Value = Convert.ToString(e.NewValues["Model"]);
                Cmd.Parameters.Add("@Manufacturer", SqlDbType.NText);
                Cmd.Parameters["@Manufacturer"].Value = Convert.ToString(e.NewValues["Manufacturer"]);
                Cmd.Parameters.Add("@MadeInID", SqlDbType.Int);
                Cmd.Parameters["@MadeInID"].Value = Convert.ToInt32(e.NewValues["MadeInID"]);
                Cmd.Parameters.Add("@Serial_Imei", SqlDbType.NVarChar, 50);
                Cmd.Parameters["@Serial_Imei"].Value = Convert.ToString(e.NewValues["Serial_Imei"]);
                Cmd.Parameters.Add("@Accessories", SqlDbType.NText);
                Cmd.Parameters["@Accessories"].Value = Convert.ToString(e.NewValues["Accessories"]);
                Cmd.Parameters.Add("@ReceiveDate", SqlDbType.Date);
                Cmd.Parameters["@ReceiveDate"].Value = Convert.ToDateTime(e.NewValues["ReceiveDate"]);
                Cmd.Parameters.Add("@AppointmentDate", SqlDbType.Date);
                Cmd.Parameters["@AppointmentDate"].Value = Convert.ToDateTime(e.NewValues["AppointmentDate"]);
                Cmd.Parameters.Add("@Note", SqlDbType.NText);
                Cmd.Parameters["@Note"].Value = Convert.ToString(e.NewValues["Note"]);
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                ASPxGridView2.DataBind();
                lblnotification.Text = "Bạn đã cập nhật thông tin phiếu yêu cầu đo kiểm thành công";
            }
            else
            {
                lblnotification.Text = "Bạn không thể cập nhật thông tin yêu cầu đo kiểm do nhân viên khác tiếp nhận";
            }
        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Int32 masterkey = Convert.ToInt32(ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, "CompanyID"));
            cbcompanyname2.Value = masterkey;
        }

        protected void btFinishReCheck_Click(object sender, EventArgs e)
        {
            string sql3 = "UPDATE Request SET ReceiveStaffCom=@ReceiveStaffCom,ReceiveStaffComDate=@ReceiveStaffComDate,RecheckStatusID=3  WHERE RequestNo=('" + txtRequestNum.Text + "')";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            Cmd3.Parameters.Add("@ReceiveStaffCom", SqlDbType.NText);
            Cmd3.Parameters["@ReceiveStaffCom"].Value = mmReceiveStaff.Text;
            Cmd3.Parameters.Add("@ReceiveStaffComDate", SqlDbType.Date);
            Cmd3.Parameters["@ReceiveStaffComDate"].Value = System.DateTime.Now;
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            btFinishReCheck.Enabled = false;
            btPrint.Enabled = false;
            btsave.Enabled = false;
            btPrintBill.Enabled = false;
            btNewBill.Enabled = false;
            lblnotification.Text = "Đã hoàn tất xử lại thông tin nhân mẫu theo yêu cầu";
            ASPxGridView1.DataBind();
            ASPxGridView2.DataBind();
        }


    }
}