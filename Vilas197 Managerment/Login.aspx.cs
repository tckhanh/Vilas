using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LabManagement
{
    public partial class WebForm1 : System.Web.UI.Page
        
    {

        protected void Button1_Click(object sender, EventArgs e)
        {
            string iusername=txtusername.Text;
            string ipass = txtpass.Text;
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
                SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString); 
                SqlCommand Cmd2 = new SqlCommand("select StaffID from Staff where Username=@iuser and Password=@ipass", conn2);
                Cmd2.Parameters.AddWithValue("@iuser", iusername);
                Cmd2.Parameters.AddWithValue("@ipass", ipass);
                conn2.Open();
                SqlDataReader dr = Cmd2.ExecuteReader();
                dr.Read();
                Session["username"] = iusername;
                Session["StaffID"] = dr.GetValue(0).ToString();
                conn2.Close();
                conn2.Dispose();
                Response.Redirect("TrangChinh.aspx");
            }
            else
            {
                lbfail.Text = ("Sai tên đăng nhập hoặc mật khẩu");
            }


        
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

  }
}