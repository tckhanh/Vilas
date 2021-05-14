using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LabManagement.Report;

namespace LabManagement.ReportForm
{
    public partial class TestingActivityReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DateTime BD = BaoCaoDotXuat.BD;
            DateTime ED = BaoCaoDotXuat.ED;
            //int RNo = Convert.ToInt32(Request.QueryString["RequestNo"]);
            ReportViewer1.Report = CreateReport(BD,ED);
        }

        private DevExpress.XtraReports.UI.XtraReport CreateReport(DateTime BD,DateTime ED)
        {
            ActivityReport report = new ActivityReport();
            report.SetReportParameter(BD,ED);
            return report;            
        }

    }
}