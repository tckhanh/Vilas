using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace LabManagement.Report
{
    public partial class Bill : DevExpress.XtraReports.UI.XtraReport
    {
        public Bill()
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
