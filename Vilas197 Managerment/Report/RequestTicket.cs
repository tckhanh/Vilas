using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace LabManagement.Report
{
    public partial class RequestTicket : DevExpress.XtraReports.UI.XtraReport
    {
        public RequestTicket()
        {
            InitializeComponent();
            requestInfoTableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
        }
        public void SetReportParameter(string RequestNo)
        {
            request1.Clear();
            requestInfoTableAdapter.Fill(request1.RequestInfo,RequestNo);

        }

    }
}
