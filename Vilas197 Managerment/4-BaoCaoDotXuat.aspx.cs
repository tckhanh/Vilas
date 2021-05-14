using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data.SqlClient;
using System.Data;
using DevExpress.XtraPivotGrid;
using DevExpress.XtraPivotGrid.Data;

namespace LabManagement
{
    public partial class BaoCaoDotXuat : System.Web.UI.Page
    {
        public static double SumofRequest,SumofRequestNonIssue,SumofRequesHasReport,SumofPrice;
        public static double SumofTestReportInTime, SumofTestReportOverTime, SumofRequestInProcess, SumofRequestInProcessOverTime;
        public static DateTime BD, ED;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.A12, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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
        protected void ASPxGridView1_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void ASPxGridView1_SummaryDisplayText(object sender, DevExpress.Web.ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            //Sum of Request
            if (e.Item.FieldName == "NumOfRequest")
                SumofRequest = Convert.ToDouble(e.Value);
            if (e.Item.FieldName == "NumofRequestHasContract")
                SumofRequest = SumofRequest + Convert.ToDouble(e.Value);
            lbSumRequest.Text = SumofRequest.ToString();
            //Sum of Request Non Issue
            if (e.Item.FieldName == "NumOfRequestNonIssue")
                SumofRequestNonIssue = Convert.ToDouble(e.Value);
            if (e.Item.FieldName == "NumOfRequestNonIssueHasContract")
                SumofRequestNonIssue = SumofRequestNonIssue + Convert.ToDouble(e.Value);
            lbSumNonIssue.Text = SumofRequestNonIssue.ToString();
            //Sum of Request Has TestReport
            if (e.Item.FieldName == "NumOfTestReport")
                SumofRequesHasReport = Convert.ToDouble(e.Value);
            if (e.Item.FieldName == "NumOfTestReportHasContract")
                SumofRequesHasReport = SumofRequesHasReport + Convert.ToDouble(e.Value);
            lbSumIssue.Text = SumofRequesHasReport.ToString();
            //Sum of Price
            if (e.Item.FieldName == "SumPrice")
                SumofPrice = Convert.ToDouble(e.Value);
            if (e.Item.FieldName == "SumPriceHasContract")
                SumofPrice = SumofPrice + Convert.ToDouble(e.Value);
            lbSumPrice.Text = String.Format("{0:#,###.##} VNĐ", SumofPrice);
        }

        protected void ASPxGridView2_CustomColumnDisplayText(object sender, DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void ASPxGridView3_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void ASPxGridView4_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
        {
            if (e.Column.FieldName != "STT") return;
            if (Convert.ToInt32(e.Value) == 0)
                e.DisplayText = Convert.ToString(e.VisibleRowIndex + 1);
        }

        protected void d2_DateChanged(object sender, EventArgs e)
        {
            BD = Convert.ToDateTime(d1.Value);
            ED = Convert.ToDateTime(d2.Value);
        }

        protected void d1_DateChanged(object sender, EventArgs e)
        {
            BD = Convert.ToDateTime(d1.Value);
            ED = Convert.ToDateTime(d2.Value);
        }

        protected void ASPxGridView2_SummaryDisplayText(object sender, ASPxGridViewSummaryDisplayTextEventArgs e)
        {
            //Sum of TestReportInTime
            if (e.Item.FieldName == "SumTestReportInTime")
                SumofTestReportInTime = Convert.ToDouble(e.Value);
            lbSumTestReportInTime.Text = SumofTestReportInTime.ToString();
            //Sum of TestReportOverTime
            if (e.Item.FieldName == "SumTestReportOverTime")
                SumofTestReportOverTime =  Convert.ToDouble(e.Value);
            lbSumTestReportOverTime.Text = SumofTestReportOverTime.ToString();
            //Sum of RequestInProCessOverTime
            if (e.Item.FieldName == "SumRequestInProCessOverTime")
                SumofRequestInProcessOverTime = Convert.ToDouble(e.Value);
            lbSumRequestInProcessOverTime.Text = SumofRequestInProcessOverTime.ToString();
            //Sum of Price
            if (e.Item.FieldName == "SumRequestInProCess")
                SumofRequestInProcess = Convert.ToDouble(e.Value);
            lbSumRequestInProcess.Text = SumofRequestInProcess.ToString();
        }

        protected void ASPxPivotGrid1_FieldValueDisplayText(object sender, DevExpress.Web.ASPxPivotGrid.PivotFieldDisplayTextEventArgs e)
        {
            if (e.ValueType == DevExpress.XtraPivotGrid.PivotGridValueType.GrandTotal && e.DataField != null && e.IsColumn)
                e.DisplayText = "Tổng cộng";
        }

        protected void btExportExcel_Click(object sender, EventArgs e)
        {
            ASPxPivotGridExporter1.ExportXlsToResponse("Summary");
        }

        protected void btExportExcelEnv_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse();
        }

        protected void btExportExcelMoney_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter2.WriteXlsToResponse();
        }



    }
}