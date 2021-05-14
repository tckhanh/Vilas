using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace LabManagement.Report
{
    public partial class TestReportForm : DevExpress.XtraReports.UI.XtraReport
    {
        public TestReportForm()
        {
            InitializeComponent();
            dataTable1TableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
        }
        public void SetReportParameter(string RequestNo)
        {
            testReportForm1.Clear();
            dataTable1TableAdapter.Fill(testReportForm1.DataTable1, RequestNo);

        }


    }
}
