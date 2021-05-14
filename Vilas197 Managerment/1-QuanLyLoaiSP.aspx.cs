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
    public partial class QuanLyLoaiSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A11, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            btSave.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn lưu thông tin loại sản phẩm đo này?');");
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            //
            if (txtEquipID.Text != "" && txtEquipName.Text != "" && txtStandard.Text != "" && txtStandard.Text != "" && txtTestMethod.Text != "" && txtPrice.Text != "" && txtPriceInText.Text != "")
            {
                string sql = "insert into EquipmentType (EquTypeID,EquTypeName,EquTypeDisplayName,Standards,TestMethod,Price,PriceInText,Info,InitDate,Invalid,GroupID,TestingEquipment) values (@EquTypeID,@EquTypeName,@EquTypeDisplayName,@Standards,@TestMethod,@Price,@PriceInText,@Info,Getdate(),@Invalid,'" + cbGroupEquipment.Value + "',@TestingEquipment)";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@EquTypeID", SqlDbType.NText);
                Cmd.Parameters["@EquTypeID"].Value = txtEquipID.Text;
                Cmd.Parameters.Add("@EquTypeName", SqlDbType.NText);
                Cmd.Parameters["@EquTypeName"].Value = txtEquipName.Text;
                Cmd.Parameters.Add("@EquTypeDisplayName", SqlDbType.NText);
                Cmd.Parameters["@EquTypeDisplayName"].Value = txtEquipDisplayName.Text;
                Cmd.Parameters.Add("@Standards", SqlDbType.NText);
                Cmd.Parameters["@Standards"].Value = txtStandard.Text;
                Cmd.Parameters.Add("@TestMethod", SqlDbType.NText);
                Cmd.Parameters["@TestMethod"].Value = txtTestMethod.Text;
                Cmd.Parameters.Add("@Price", SqlDbType.Real);
                Cmd.Parameters["@Price"].Value = Convert.ToDouble(txtPrice.Text);
                Cmd.Parameters.Add("@PriceInText", SqlDbType.NText);
                Cmd.Parameters["@PriceInText"].Value = txtPriceInText.Text;
                Cmd.Parameters.Add("@Info", SqlDbType.NText);
                Cmd.Parameters["@Info"].Value = mmInfo.Text;
                Cmd.Parameters.Add("@Invalid", SqlDbType.Int);
                Cmd.Parameters["@Invalid"].Value = cbDisStatus.Value;
                Cmd.Parameters.Add("@TestingEquipment", SqlDbType.NText);
                Cmd.Parameters["@TestingEquipment"].Value = mmInfo.Text;
                conn.Open();
                Cmd.ExecuteNonQuery();
                conn.Close();
                ASPxGridView1.DataBind();
                lbNotifi.Text = null;
            }
            else
                lbNotifi.Text = "Bạn phải điền đầy đủ thông tin ở các mục bắt buộc có dấu (*)";
           
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            txtEquipID.Text=null;
            txtEquipName.Text=null;
            txtStandard.Text=null;
            txtStandard.Text=null;
            txtTestMethod.Text=null;
            txtPrice.Text=null;
            txtPriceInText.Text=null;
            mmInfo.Text = null;
            btSave.Enabled=true;
            btNew.Enabled = true;
            cbGroupEquipment.Value = null;
            txtEquipDisplayName.Text = null;
            
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            string masterKeyValue = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "EquTypeID").ToString();
            string sql = "SELECT EquTypeID, EquTypeName, BriefName,Standards,TestMethod,Price,PriceInText,Info,InitDate,Invalid,GroupID,EquTypeDisplayName,TestingEquipment FROM EquipmentType WHERE EquTypeID='" + masterKeyValue + "'";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            txtEquipID.Text = dr.GetValue(0).ToString();
            txtEquipName.Text = dr.GetValue(1).ToString();
            txtStandard.Text = dr.GetValue(3).ToString();
            txtTestMethod.Text = dr.GetValue(4).ToString();
            txtPrice.Text = dr.GetValue(5).ToString();
            txtPriceInText.Text = dr.GetValue(6).ToString();
            mmInfo.Text = dr.GetValue(7).ToString();
            cbGroupEquipment.Value = dr.GetValue(10);
            txtEquipDisplayName.Text = dr.GetValue(11).ToString();
            mmTestingEquipment.Text = dr.GetValue(12).ToString();
            dr.Close();
            conn.Close();
        }


     
    }
}