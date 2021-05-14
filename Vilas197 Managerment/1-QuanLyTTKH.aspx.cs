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
    public partial class QuanLyTTKH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A9, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btSave.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn thông tin khách hàng này?');");
            txtCompanyID.Enabled = false;
            btDelete.Enabled = false;
        }



        protected void btSave_Click(object sender, EventArgs e)
        {
            if (txtCompanyName.Text != "" && txtFastCompanyName.Text != "" && txtAddress.Text != "" && cbProvince.Value != "")
            {

                //
                string sql = "insert into Company (CompanyName, FastCompanyName, Address, ProvinceID, PhoneNo, FaxNo, TaxCode) values (@CompanyName, @FastCompanyName, @Address, '" + cbProvince.Value + "',@PhoneNo,@FaxNo,@TaxCode)";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@CompanyName", SqlDbType.NText);
                Cmd.Parameters["@CompanyName"].Value = txtCompanyName.Text;
                Cmd.Parameters.Add("@FastCompanyName", SqlDbType.NText);
                Cmd.Parameters["@FastCompanyName"].Value = txtFastCompanyName.Text;
                Cmd.Parameters.Add("@Address", SqlDbType.NText);
                Cmd.Parameters["@Address"].Value = txtAddress.Text;
                //Phone
                Cmd.Parameters.Add("@PhoneNo", SqlDbType.NText);
                if (txtphone.Text == "")
                    Cmd.Parameters["@PhoneNo"].Value = System.DBNull.Value;
                else
                    Cmd.Parameters["@PhoneNo"].Value = txtphone.Text;
                //Fax
                Cmd.Parameters.Add("@FaxNo", SqlDbType.NText);
                if ( txtfax.Text=="")
                    Cmd.Parameters["@FaxNo"].Value = System.DBNull.Value;
                else
                    Cmd.Parameters["@FaxNo"].Value = txtfax.Text;
                //TaxCode
                Cmd.Parameters.Add("@TaxCode", SqlDbType.NText);
                if (txttaxid.Text=="")
                    Cmd.Parameters["@TaxCode"].Value = System.DBNull.Value;
                else
                    Cmd.Parameters["@TaxCode"].Value = txttaxid.Text;
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                ASPxGridView2.DataBind();
                lblnotification.Text = null;
                //Update new ID
                string sql0 = "SELECT MAX(CompanyID) From Company";
                SqlConnection conn0 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd0 = new SqlCommand(sql0, conn0);
                conn0.Open();
                SqlDataReader dr0 = Cmd0.ExecuteReader();
                dr0.Read();
                txtCompanyID.Text = dr0.GetValue(0).ToString();
                btDelete.Enabled = true;
            }
            else
                lblnotification.Text = "Bạn phải điền thông tin ở các mục bắt buộc có dấu (*)";
        }



        protected void cbcompanyname2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ASPxGridView2.DataBind();
        }

     
    
        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            btSave.Enabled = false;
            btNew.Enabled = true;
            btDelete.Enabled = true;
            //Load CompanyID 
            string masterKeyValue = ASPxGridView2.GetRowValues(Convert.ToInt32(e.Parameters), "CompanyID").ToString();
            string sql = "SELECT  Company.CompanyID, Company.CompanyName, Company.FastCompanyName, Company.Address, Company.ProvinceID, Company.PhoneNo, Company.FaxNo, Company.TaxCode, Company.Invalid, Company.Contract, Province.ProvinceID AS Expr1, Province.Province FROM Company INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID WHERE Company.CompanyID='"+Convert.ToInt32(masterKeyValue)+"'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtCompanyID.Text = dr.GetValue(0).ToString();
            txtCompanyName.Text = dr.GetValue(1).ToString();
            txtFastCompanyName.Text = dr.GetValue(2).ToString();
            txtAddress.Text = dr.GetValue(3).ToString();
            txtphone.Text = dr.GetValue(5).ToString();
            txtfax.Text = dr.GetValue(6).ToString();
            txttaxid.Text = dr.GetValue(7).ToString();
            cbProvince.Value = dr.GetValue(4);
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            txtCompanyID.Text = null;
            txtCompanyName.Text = null;
            txtFastCompanyName.Text = null;
            txtAddress.Text = null;
            txtphone.Text = null;
            txtfax.Text = null;
            txttaxid.Text = null;
            cbProvince.Value = null;
            btSave.Enabled = true;
            btNew.Enabled = true;
            btDelete.Enabled = false;

        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            string sql = "UPDATE Company SET Invalid=1 WHERE CompanyID='" + Convert.ToInt32(txtCompanyID.Text) + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            Cmd.ExecuteNonQuery();
            conn.Close();
            ASPxGridView2.DataBind();
            txtCompanyID.Text = null;
            txtCompanyName.Text = null;
            txtFastCompanyName.Text = null;
            txtAddress.Text = null;
            txtphone.Text = null;
            txtfax.Text = null;
            txttaxid.Text = null;
            cbProvince.Value = null;
            btSave.Enabled = true;
            btNew.Enabled = true;
            btDelete.Enabled = false;

        }




    }
}