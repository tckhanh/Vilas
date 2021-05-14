using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabManagement
{
    public partial class QuanLyNhanSu : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              lbloginname.Text = Session["username"].ToString();
        }

        protected void btexit_Click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}