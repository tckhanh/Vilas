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
    public partial class TrangChinh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("Login.aspx");
            lblUsername.Text = Session["username"].ToString();
            lblUsername1.Text = Session["username"].ToString();
            //btSave.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn lưu thông tin loại sản phẩm đo này?');");        
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            Response.Redirect("1-KetQuaDo.aspx");
        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            Response.Redirect("1-XacNhan.aspx");
        }

        protected void ASPxGridView2_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
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

        protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
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