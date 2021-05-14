using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LabManagement.Report;

namespace LabManagement.ReportForm
{
    public partial class BillPaperFromRelease : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string RNo = TraKetQua.RQNo2.ToString();
            //int RNo = Convert.ToInt32(Request.QueryString["RequestNo"]);
            ReportViewer1.Report = CreateReport(RNo);
        }

        private DevExpress.XtraReports.UI.XtraReport CreateReport(string RequestNo)
        {
            Bill report = new Bill();
            report.SetReportParameter(RequestNo);
            return report;
              
        }

    }
}