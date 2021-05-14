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
    public partial class QuanLyMoiTruong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A10, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
            if (dtdate.Value == null)
            {
                dtdate.Value = System.DateTime.Now;
                //Load data to Interface
                string sql = "Select tMor,hMor,tAft,hAft From Environment Where date=@date";
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.Parameters.Add("@date", SqlDbType.Date);
                Cmd.Parameters["@date"].Value = dtdate.Value;
                conn.Open();
                SqlDataReader dr = Cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows)
                {
                    if (dr.GetValue(0).ToString() != "")
                        txttMor.Text = dr.GetValue(0).ToString();
                    if (dr.GetValue(1).ToString() != "")
                        txthMor.Text = dr.GetValue(1).ToString();
                    if (dr.GetValue(2).ToString() != "")
                        txttAf.Text = dr.GetValue(2).ToString();
                    if (dr.GetValue(3).ToString() != "")
                        txthAf.Text = dr.GetValue(3).ToString();
                    dr.Close();
                    conn.Close();
                }
            }

        }


        protected void btUpdateMor_Click(object sender, EventArgs e)
        {
            //Check exist record
            string sql = "Select tMor,hMor,StaffMor From Environment Where date=@date";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            Cmd.Parameters.Add("@date", SqlDbType.Date);
            Cmd.Parameters["@date"].Value = dtdate.Value;
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
             {
                 lbNotifi.Text = null;
                 string sql1 = "UPDATE Environment SET tMor='" + txttMor.Text + "',hMor='" + txthMor.Text + "', StaffMor='"+Session["StaffID"]+"'  WHERE date=@date"; 
                 SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                 SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                 Cmd1.Parameters.Add("@date", SqlDbType.Date);
                 Cmd1.Parameters["@date"].Value = dtdate.Value;
                 conn1.Open();
                 Cmd1.ExecuteNonQuery();
                 conn1.Close();
             }
            if (!dr.HasRows)
            {
                lbNotifi.Text = null;
                string sql2 = "insert into Environment (tMor, hMor,StaffMor,date) values (@tMor,@hMor,@StaffMor,@date)";
                SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                Cmd2.Parameters.Add("@tMor", SqlDbType.NVarChar, 50);
                Cmd2.Parameters["@tMor"].Value = txttMor.Text;
                Cmd2.Parameters.Add("@hMor", SqlDbType.NVarChar, 50);
                Cmd2.Parameters["@hMor"].Value = txthMor.Text;
                Cmd2.Parameters.Add("@StaffMor", SqlDbType.NVarChar, 50);
                Cmd2.Parameters["@StaffMor"].Value = Session["StaffID"].ToString();
                Cmd2.Parameters.Add("@date", SqlDbType.Date);
                Cmd2.Parameters["@date"].Value = dtdate.Value;
                conn2.Open();
                Cmd2.ExecuteNonQuery();
                conn2.Close();
            }
            ASPxGridView1.DataBind();
        }

        protected void btUpdateAft_Click(object sender, EventArgs e)
        {
            string sql = "Select tAft,hAft,StaffAft From Environment Where date=@date";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            Cmd.Parameters.Add("@date", SqlDbType.Date);
            Cmd.Parameters["@date"].Value = dtdate.Value;
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                lbNotifi.Text = null;
                string sql1 = "UPDATE Environment SET tAft='" + txttAf.Text + "',hAft='" + txthAf.Text + "', StaffAft='" + Session["StaffID"] + "'  WHERE date=@date";
                SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                Cmd1.Parameters.Add("@date", SqlDbType.Date);
                Cmd1.Parameters["@date"].Value = dtdate.Value;
                conn1.Open();
                Cmd1.ExecuteNonQuery();
                conn1.Close();

            }
            if (!dr.HasRows)
            {
                lbNotifi.Text = null;
                string sql2 = "insert into Environment (tAft, hAft,StaffAft,date) values (@tAft,@hAft,@StaffAft,@date)";
                SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                SqlCommand Cmd2 = new SqlCommand(sql2, conn2);
                Cmd2.Parameters.Add("@tAft", SqlDbType.NVarChar, 50);
                Cmd2.Parameters["@tAft"].Value = txttMor.Text;
                Cmd2.Parameters.Add("@hAft", SqlDbType.NVarChar, 50);
                Cmd2.Parameters["@hAft"].Value = txthMor.Text;
                Cmd2.Parameters.Add("@StaffAft", SqlDbType.NVarChar, 50);
                Cmd2.Parameters["@StaffAft"].Value = Session["StaffID"].ToString();
                Cmd2.Parameters.Add("@date", SqlDbType.Date);
                Cmd2.Parameters["@date"].Value = dtdate.Value;
                conn2.Open();
                Cmd2.ExecuteNonQuery();
                conn2.Close();
            }
            ASPxGridView1.DataBind();
        }




        public string txt { get; set; }

        protected void dtdate_DateChanged(object sender, EventArgs e)
        {
            lbNotifi.Text = null;
            string sql = "Select tMor,hMor,tAft,hAft From Environment Where date=@date";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            Cmd.Parameters.Add("@date", SqlDbType.Date);
            Cmd.Parameters["@date"].Value = dtdate.Value;
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                if (dr.GetValue(0).ToString() != "")
                    txttMor.Text = dr.GetValue(0).ToString();
                else
                    txttMor.Text = null;
                if (dr.GetValue(1).ToString() != "")
                    txthMor.Text = dr.GetValue(1).ToString();
                else
                    txthMor.Text = null;
                if (dr.GetValue(2).ToString() != "")
                    txttAf.Text = dr.GetValue(2).ToString();
                else
                    txttAf.Text = null;
                if (dr.GetValue(3).ToString() != "")
                    txthAf.Text = dr.GetValue(3).ToString();
                else
                    txthAf.Text = null;
                dr.Close();
                conn.Close();
            }
            else
            {
                txthAf.Text = null;
                txthMor.Text = null;
                txttAf.Text = null;
                txttMor.Text = null;
            }
        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            DateTime masterKeyValue1 =Convert.ToDateTime(ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "date"));
            dtdate.Value = masterKeyValue1;
            string sql = "Select tMor,hMor,tAft,hAft From Environment Where date=@date";
            SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd = new SqlCommand(sql, conn);
            Cmd.Parameters.Add("@date", SqlDbType.Date);
            Cmd.Parameters["@date"].Value = dtdate.Value;
            conn.Open();
            SqlDataReader dr = Cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                if (dr.GetValue(0).ToString() != "")
                    txttMor.Text = dr.GetValue(0).ToString();
                else
                    txttMor.Text = null;
                if (dr.GetValue(1).ToString() != "")
                    txthMor.Text = dr.GetValue(1).ToString();
                else
                    txthMor.Text = null;
                if (dr.GetValue(2).ToString() != "")
                    txttAf.Text = dr.GetValue(2).ToString();
                else
                    txttAf.Text = null;
                if (dr.GetValue(3).ToString() != "")
                    txthAf.Text = dr.GetValue(3).ToString();
                else
                    txthAf.Text = null;
                dr.Close();
                conn.Close();
            }
            else
            {
                txthAf.Text = null;
                txthMor.Text = null;
                txttAf.Text = null;
                txttMor.Text = null;
            }
        }
    }
}