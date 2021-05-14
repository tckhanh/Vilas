using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace LabManagement.Report
{
    public partial class HandoverPaper2 : DevExpress.XtraReports.UI.XtraReport
    {
        public HandoverPaper2()
        {
            InitializeComponent();
            handoverTableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            handoverAccTableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
        }
        public void SetReportParameter(int HandoverID)
        {
            handoverInternal1.Clear();
            handoverTableAdapter.Fill(handoverInternal1.Handover, HandoverID);
            handoverAccTableAdapter.Fill(handoverInternal1.HandoverAcc, HandoverID);
        }

    }
}
