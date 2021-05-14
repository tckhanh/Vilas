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
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.O3, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
        }

        protected void btChangePass_Click(object sender, EventArgs e)
        {
            string iusername = Session["username"].ToString();
            string ipass = txtOldPass.Text;
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand("select count(*) from Staff where Username=@iuser and Password=@ipass", conn);
            Cmd.Parameters.AddWithValue("@iuser", iusername);
            Cmd.Parameters.AddWithValue("@ipass", ipass);
            conn.Open();
            int check = (int)Cmd.ExecuteScalar();
            conn.Close();
            conn.Dispose();
            if (check >= 1)
            {
                if (txtNewPass.Text == txtReNewPass.Text)
                {
                    string sql1 = "UPDATE Staff SET Password=@Password WHERE StaffID='" + Session["StaffID"] + "'";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    Cmd1.Parameters.Add("@Password", SqlDbType.NVarChar, 50);
                    Cmd1.Parameters["@Password"].Value = txtNewPass.Text;
                    conn1.Open();
                    Cmd1.ExecuteNonQuery();
                    conn1.Close();
                    lbNotification.Text = "Bạn đã đổi mật khẩu thành công";
                }
                else
                {
                    lbNotification.Text = "Mật khẩu mới giữa hai lần nhập không trùng nhau. ";
                }
            }
            else
                lbNotification.Text = "Bạn nhập không đúng mật khẩu hiện tại";
        }


    }
}