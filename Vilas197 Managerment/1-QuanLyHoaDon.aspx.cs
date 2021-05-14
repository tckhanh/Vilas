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
    public partial class QuanLyHoaDon : System.Web.UI.Page
    {
        public static String RBNo;
        public static Int32 RBID=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A7, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btInitialCreate.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn thông tin khách hàng này?');");
            if (txtRedBillNo.Text == "")
            {
                txtPriceNonTax.ReadOnly = true;
                txtPriceIncludeTax.ReadOnly = true;
                mmPriceInText.ReadOnly = true;
                btFinish.Enabled = false;
                btUpdate.Enabled = false;
                btDelete.Enabled = false;
            }
        }


        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            //Load CompanyID 
            string masterKeyValue = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "CompanyID").ToString();
            string sql = "SELECT  Company.CompanyID, Company.CompanyName, Company.FastCompanyName, Company.Address, Company.ProvinceID, Company.PhoneNo, Company.FaxNo, Company.TaxCode, Company.Invalid, Company.Contract, Province.ProvinceID AS Expr1, Province.Province FROM Company INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID WHERE Company.CompanyID='"+Convert.ToInt32(masterKeyValue)+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();          
            txtAddress.Text = dr.GetValue(3).ToString();
            txtphone.Text = dr.GetValue(5).ToString();
            txtfax.Text = dr.GetValue(6).ToString();
            txttaxid.Text = dr.GetValue(7).ToString();

        }

        protected void ASPxGridView3_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            if (cbcompanyname.Value!=null)
            {
                string masterKeyValue = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "RequestID").ToString();
                string masterKeyValue2 = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
                string CompID = ASPxGridView3.GetRowValues(Convert.ToInt32(e.Parameters), "CompanyID").ToString();
                if (cbcompanyname.Value.ToString() == CompID)
                {
                    string sql1 = "UPDATE TestReport SET RedBillID='" + RBID + "' WHERE AssignmentID=('" + masterKeyValue + "')";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    conn1.Open();
                    Cmd1.ExecuteNonQuery();
                    conn1.Close();
                    ASPxGridView1.DataBind();
                    ASPxGridView3.DataBind();
                    lblnotification.Text = string.Concat("Đã cập nhật thông tin hóa đơn cho phiếu yêu cầu đo kiểm số ", masterKeyValue2);
                    //Update RedBill Info
                    string sql2 = "SELECT SUM(EquipmentType.Price) AS SumIncludeTax FROM Request INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN TestReport ON Assignment.AssignmentID = TestReport.AssignmentID WHERE (TestReport.RedBillID = '" + RBID + "')";
                    SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                    conn2.Open();
                    double price = Convert.ToDouble(Cmd2.ExecuteScalar());
                    txtPriceIncludeTax.Text = price.ToString();
                    txtPriceNonTax.Text = Convert.ToString(price / 1.1);
                    txtTax.Text = Convert.ToString(price / 11);
                    mmPriceInText.Text = ChuyenSo(price.ToString());
                    conn2.Close();
                    //Update RedBill Info
                    string sql3 = "UPDATE RedBill SET PriceNonTax=@PriceNonTax, PriceIncludeTax=@PriceIncludeTax,Tax=@Tax, Note=@Note,PriceInText=@PriceInText WHERE RedBillNo=('" + RBNo + "')";
                    SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
                    Cmd3.Parameters.Add("@PriceNonTax", SqlDbType.Real);
                    Cmd3.Parameters["@PriceNonTax"].Value = price / 1.1;
                    Cmd3.Parameters.Add("@PriceIncludeTax", SqlDbType.Real);
                    Cmd3.Parameters["@PriceIncludeTax"].Value = price;
                    Cmd3.Parameters.Add("@Tax", SqlDbType.Real);
                    Cmd3.Parameters["@Tax"].Value = price / 11;
                    Cmd3.Parameters.Add("@PriceInText", SqlDbType.NText);
                    Cmd3.Parameters["@PriceInText"].Value = mmPriceInText.Text;
                    if (mmNote.Text == "")
                    {
                        Cmd3.Parameters.Add("@Note", SqlDbType.NText);
                        Cmd3.Parameters["@Note"].Value = System.DBNull.Value;
                    }
                    else
                    {
                        Cmd3.Parameters.Add("@Note", SqlDbType.NText);
                        Cmd3.Parameters["@Note"].Value = mmNote.Text;
                    }
                    conn3.Open();
                    Cmd3.ExecuteNonQuery();
                    conn3.Close();
                    ASPxGridView3.DataBind();
                    ASPxGridView4.DataBind();
                }
                else
                    lblnotification.Text = "Bạn đã cập nhật thông tin hóa đơn tài chính của khách hàng không tương ứng";
            }
            else
                lblnotification.Text = "Bạn chưa chọn đối tượng hóa đơn để cập nhật";

        }

        protected void ASPxGridView3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {

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
            dr.Close();
            dr.Dispose();
            conn.Close();
            conn.Dispose();
        }

        protected void btInitialCreate_Click(object sender, EventArgs e)
        {
            string sql = "insert into RedBill (RedBillNo, RedBillDate,CompanyID,Note,Finish) values ('" + txtRedBillNo.Text + "',@RedBillDate,'"+cbcompanyname.Value+"',@Note,0)";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            Cmd.Parameters.Add("@RedBillDate", SqlDbType.Date);
            Cmd.Parameters["@RedBillDate"].Value = dtRedBill.Value;
            if (mmNote.Text == "")
            {
                Cmd.Parameters.Add("@Note", SqlDbType.NText);
                Cmd.Parameters["@Note"].Value = System.DBNull.Value;
            }
            else
            {
                Cmd.Parameters.Add("@Note", SqlDbType.NText);
                Cmd.Parameters["@Note"].Value = mmNote.Text;
            }
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();
            ASPxGridView4.DataBind();
            lblnotification.Text = "Thông tin ban đầu của hóa đơn đã được tạo thành công";
            txtPriceNonTax.Enabled = true;
            txtPriceIncludeTax.Enabled = true;
            mmPriceInText.Enabled = true;
            mmNote.Enabled = true;
            btInitialCreate.Enabled = false;
            btFinish.Enabled = true;
            btUpdate.Enabled = true;
            RBNo = txtRedBillNo.Text;
            lbRedBillNo.Text = txtRedBillNo.Text;
            string sql2 = "SELECT RedBillID,RedBillNo, RedBillDate, CompanyID, PriceNonTax, PriceIncludeTax, Note,PriceInText, Finish,Tax FROM RedBill WHERE RedBillNo='" + RBNo + "'";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            SqlDataReader dr2 = Cmd2.ExecuteReader();
            dr2.Read();
            RBID =Convert.ToInt32(dr2.GetValue(0));
            dr2.Close();
            conn2.Close();

        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            double price;
            string masterKeyValue = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "RequestID").ToString();
            string masterKeyValue2 = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "RequestNo").ToString();
            string sql1 = "UPDATE TestReport SET RedBillID=@RedBillID WHERE AssignmentID=('" + masterKeyValue + "')";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            Cmd1.Parameters.Add("@RedBillID", SqlDbType.NVarChar, 50);
            Cmd1.Parameters["@RedBillID"].Value = System.DBNull.Value;
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView1.DataBind();
            ASPxGridView3.DataBind();
            lblnotification.Text = string.Concat("Đã cập nhật thông tin hóa đơn cho phiếu yêu cầu đo kiểm số ", masterKeyValue2);
            //Update RedBill Info
            string sql2 = "SELECT SUM(EquipmentType.Price) AS SumIncludeTax FROM Request INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN TestReport ON Assignment.AssignmentID = TestReport.AssignmentID WHERE (TestReport.RedBillID = '" + RBID + "')";
            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            string s = Cmd2.ExecuteScalar().ToString();
            if (s != "")
            {
                price = Convert.ToDouble(Cmd2.ExecuteScalar());
            }
            else
            {
                price = 0;
            }
            txtPriceIncludeTax.Text = price.ToString();
            txtPriceNonTax.Text = Convert.ToString(price / 1.1);
            txtTax.Text = Convert.ToString(price/11);
            mmPriceInText.Text = ChuyenSo(price.ToString());
            conn2.Close();
            //Update RedBill Info
            string sql3 = "UPDATE RedBill SET PriceNonTax=@PriceNonTax, PriceIncludeTax=@PriceIncludeTax,Tax=@Tax, Note=@Note,PriceInText=@PriceInText WHERE RedBillNo=('" + RBNo + "')";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            Cmd3.Parameters.Add("@PriceNonTax", SqlDbType.Real);
            Cmd3.Parameters["@PriceNonTax"].Value = price / 1.1;
            Cmd3.Parameters.Add("@PriceIncludeTax", SqlDbType.Real);
            Cmd3.Parameters["@PriceIncludeTax"].Value = price;
            Cmd3.Parameters.Add("@Tax", SqlDbType.Real);
            Cmd3.Parameters["@Tax"].Value = price/11;
            Cmd3.Parameters.Add("@PriceInText", SqlDbType.NText);
            Cmd3.Parameters["@PriceInText"].Value = mmPriceInText.Text;
            if (mmNote.Text == "")
            {
                Cmd3.Parameters.Add("@Note", SqlDbType.NText);
                Cmd3.Parameters["@Note"].Value = System.DBNull.Value;
            }
            else
            {
                Cmd3.Parameters.Add("@Note", SqlDbType.NText);
                Cmd3.Parameters["@Note"].Value = mmNote.Text;
            }
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            ASPxGridView4.DataBind();
        }

        protected void ASPxGridView4_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            string RBN = ASPxGridView4.GetRowValues(Convert.ToInt32(e.Parameters), "RedBillNo").ToString();
            Int32 RID =Convert.ToInt32(ASPxGridView4.GetRowValues(Convert.ToInt32(e.Parameters), "RedBillID"));
            lbRedBillNo.Text = RBN;
            DateTime RBDate = Convert.ToDateTime(ASPxGridView4.GetRowValues(Convert.ToInt32(e.Parameters), "RedBillDate"));
            int CompID = Convert.ToInt32(ASPxGridView4.GetRowValues(Convert.ToInt32(e.Parameters), "CompanyID"));
            RBNo = RBN;
            RBID = RID;
            txtRedBillNo.Text = RBN;
            dtRedBill.Value = RBDate;
            cbcompanyname.Value = CompID;
            //Load Company Info
            string sql = "select CompanyName,Address,Province,PhoneNo,FaxNo,Taxcode from Company, Province where CompanyID='" + CompID + "'and [Company].[ProvinceID]=[Province].[ProvinceID]";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtAddress.Text = dr.GetValue(1).ToString();
            txtphone.Text = dr.GetValue(3).ToString();
            txtfax.Text = dr.GetValue(4).ToString();
            txttaxid.Text = dr.GetValue(5).ToString();
            dr.Close();
            conn.Close();
            //Load Bill Info
            string sql1 = "SELECT RedBillNo, RedBillDate, CompanyID, PriceNonTax, PriceIncludeTax, Note,PriceInText, Finish,Tax FROM RedBill WHERE RedBillNo='"+RBN+"'";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            SqlDataReader dr1 = Cmd1.ExecuteReader();
            dr1.Read();
            txtPriceNonTax.Text = dr1.GetValue(3).ToString();
            txtPriceIncludeTax.Text = dr1.GetValue(4).ToString();
            mmNote.Text = dr1.GetValue(5).ToString();
            mmPriceInText.Text = dr1.GetValue(6).ToString();
            txtTax.Text = dr1.GetValue(8).ToString();
            if (dr1.GetValue(7).ToString() == "0")
            {
                btInitialCreate.Enabled = false;
                btFinish.Enabled = true;
                btUpdate.Enabled = true;
                btDelete.Enabled = true;
            }
            else
            {
                btInitialCreate.Enabled = false;
                btFinish.Enabled = false;
                btUpdate.Enabled = true;
                btDelete.Enabled = true;
            }
            dr1.Close();
            conn1.Close();
            mmNote.Enabled = true;
            ASPxGridView1.DataBind();
        }

        protected void btFinish_Click(object sender, EventArgs e)
        {
            //Update TestReport HoldBill Field
            string sql1 = "UPDATE TestReport SET HoldRedBill=1 WHERE RedBillID='"+RBID+"'";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView1.DataBind();
            ASPxGridView3.DataBind();
            //Update RedBill Status
            string sql3 = "UPDATE RedBill SET Note=@Note,Finish=1 WHERE RedBillNo=('" + RBNo + "')";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            if (mmNote.Text == "")
            {
                Cmd3.Parameters.Add("@Note", SqlDbType.NText);
                Cmd3.Parameters["@Note"].Value = System.DBNull.Value;
            }
            else
            {
                Cmd3.Parameters.Add("@Note", SqlDbType.NText);
                Cmd3.Parameters["@Note"].Value = mmNote.Text;
            }
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            ASPxGridView4.DataBind();
            btInitialCreate.Enabled = false;
            btFinish.Enabled = false;
            btDelete.Enabled = true;
            btUpdate.Enabled = true;
            lblnotification.Text =String.Concat("Đã xác nhận hoàn tất quá trình tạo hóa đơn tài chính số ",RBNo);
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            txtRedBillNo.Text = null;
            dtRedBill.Value = null;
            cbcompanyname.Value = null;
            txtAddress.Text = null;
            txtphone.Text = null;
            txtfax.Text = null;
            txttaxid.Text = null;
            txtPriceNonTax.Text = null;
            txtPriceIncludeTax.Text = null;
            txtTax.Text = null;
            mmPriceInText.Text = null;
            mmNote.Text = null;
            btInitialCreate.Enabled = true;
            btFinish.Enabled = false;
            btUpdate.Enabled = false;
        }


        private string ChuyenSo(string number)
        {
            string[] dv = { "", "mươi ", "trăm ", "nghìn ", "triệu ", "tỉ " };
            string[] cs = { "không ", "một ", "hai ", "ba ", "bốn ", "năm ", "sáu ", "bảy ", "tám ", "chín " };
            string doc;
            int i, j, k, n, len, found, ddv, rd;

            len = number.Length;
            number += "ss";
            doc = "";
            found = 0;
            ddv = 0;
            rd = 0;

            i = 0;
            while (i < len)
            {
                //So chu so o hang dang duyet
                n = (len - i + 2) % 3 + 1;

                //Kiem tra so 0
                found = 0;
                for (j = 0; j < n; j++)
                {
                    if (number[i + j] != '0')
                    {
                        found = 1;
                        break;
                    }
                }

                //Duyet n chu so
                if (found == 1)
                {
                    rd = 1;
                    for (j = 0; j < n; j++)
                    {
                        ddv = 1;
                        switch (number[i + j])
                        {
                            case '0':
                                if (n - j == 3) doc += cs[0];
                                if (n - j == 2)
                                {
                                    if (number[i + j + 1] != '0') doc += "lẻ ";
                                    ddv = 0;
                                }
                                break;
                            case '1':
                                if (n - j == 3) doc += cs[1];
                                if (n - j == 2)
                                {
                                    doc += "mười ";
                                    ddv = 0;
                                }
                                if (n - j == 1)
                                {
                                    if (i + j == 0) k = 0;
                                    else k = i + j - 1;

                                    if (number[k] != '1' && number[k] != '0')
                                        doc += "mốt ";
                                    else
                                        doc += cs[1];
                                }
                                break;
                            case '5':
                                if (i + j == len - 1)
                                    doc += "lăm ";
                                else
                                    doc += cs[5];
                                break;
                            default:
                                doc += cs[(int)number[i + j] - 48];
                                break;
                        }

                        //Doc don vi nho
                        if (ddv == 1)
                        {
                            doc += dv[n - j - 1];
                        }
                    }
                }


                //Doc don vi lon
                if (len - i - n > 0)
                {
                    if ((len - i - n) % 9 == 0)
                    {
                        if (rd == 1)
                            for (k = 0; k < (len - i - n) / 9; k++)
                                doc += "tỉ ";
                        rd = 0;
                    }
                    else
                        if (found != 0) doc += dv[((len - i - n + 1) % 9) / 3 + 2];
                }

                i += n;
            }

            if (len == 1)
                if (number[0] == '0' || number[0] == '5') return cs[(int)number[0] - 48];

            return doc=doc + "đồng";
        }

        protected void ASPxGridView4_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            Int32 s = Convert.ToInt32(e.GetValue("Finish"));
            if (s==0)
                e.Row.BackColor = System.Drawing.Color.FromArgb(0xFF, 0xFF, 0x99);
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            lblnotification.Text = string.Concat("Đã cập nhật thông tin hóa đơn cho phiếu yêu cầu đo kiểm số ", RBNo);
            //Update RedBill Info
            string sql3 = "UPDATE RedBill SET RedBillNo='" + txtRedBillNo.Text + "',RedBillDate=@RedBillDate,Note=@Note WHERE RedBillNo=('" + RBNo + "')";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            Cmd3.Parameters.Add("@RedBillDate", SqlDbType.Date);
            Cmd3.Parameters["@RedBillDate"].Value = dtRedBill.Value;
            if (mmNote.Text == "")
            {
                Cmd3.Parameters.Add("@Note", SqlDbType.NText);
                Cmd3.Parameters["@Note"].Value = System.DBNull.Value;
            }
            else
            {
                Cmd3.Parameters.Add("@Note", SqlDbType.NText);
                Cmd3.Parameters["@Note"].Value = mmNote.Text;
            }
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            RBNo = txtRedBillNo.Text;
            ASPxGridView3.DataBind();
            ASPxGridView4.DataBind();
        }

        protected void ASPxGridView4_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Int32 masterkey = Convert.ToInt32(e.Keys[ASPxGridView4.KeyFieldName]);
            //Update TestReport 
            string sql1 = "UPDATE TestReport SET RedBillID=@RedBillID, HoldRedBill=@RedBillID WHERE RedBillID='" + masterkey + "'";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            Cmd1.Parameters.Add("@RedBillID", SqlDbType.Int);
            Cmd1.Parameters["@RedBillID"].Value = System.DBNull.Value;
            Cmd1.Parameters.Add("@HoldRedBill", SqlDbType.Int);
            Cmd1.Parameters["@HoldRedBill"].Value = System.DBNull.Value;
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView1.DataBind();
            ASPxGridView3.DataBind();
            //Update RedBill Status
            string sql3 = "DELETE RedBill WHERE RedBillID=('" + masterkey + "')";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            ASPxGridView4.DataBind();
            lblnotification.Text = "Đã xóa thông tin hóa đơn tài chính";
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            //Update TestReport 
            string sql1 = "UPDATE TestReport SET RedBillID=@RedBillID, HoldRedBill=@RedBillID WHERE RedBillID='" + RBID + "'";
            SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
            Cmd1.Parameters.Add("@RedBillID", SqlDbType.Int);
            Cmd1.Parameters["@RedBillID"].Value = System.DBNull.Value;
            Cmd1.Parameters.Add("@HoldRedBill", SqlDbType.Int);
            Cmd1.Parameters["@HoldRedBill"].Value = System.DBNull.Value;
            conn1.Open();
            Cmd1.ExecuteNonQuery();
            conn1.Close();
            ASPxGridView1.DataBind();
            ASPxGridView3.DataBind();
            //Update RedBill Status
            string sql3 = "DELETE RedBill WHERE RedBillID=('" + RBID + "')";
            SqlConnection conn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd3 = new SqlCommand(sql3, conn3);
            conn3.Open();
            Cmd3.ExecuteNonQuery();
            conn3.Close();
            ASPxGridView4.DataBind();
            lblnotification.Text = "Đã xóa thông tin hóa đơn tài chính";
            //New value
            txtRedBillNo.Text = null;
            dtRedBill.Value = null;
            cbcompanyname.Value = null;
            txtAddress.Text = null;
            txtphone.Text = null;
            txtfax.Text = null;
            txttaxid.Text = null;
            txtPriceNonTax.Text = null;
            txtPriceIncludeTax.Text = null;
            txtTax.Text = null;
            mmPriceInText.Text = null;
            mmNote.Text = null;
            btInitialCreate.Enabled = true;
            btFinish.Enabled = false;
            btUpdate.Enabled = false;
            btDelete.Enabled = false;
        }


    }
}