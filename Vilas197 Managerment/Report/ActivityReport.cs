using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace LabManagement.Report
{
    public partial class ActivityReport : DevExpress.XtraReports.UI.XtraReport
    {
        public ActivityReport()
        {
            InitializeComponent();
            equipmentTypeTableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            equipmentType1TableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            groupEquipmentTableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            groupEquipment1TableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            groupEquipment2TableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            dataTable1TableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            dataTable2TableAdapter.Connection = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
        }
        public void SetReportParameter(DateTime BD, DateTime ED)
        {
            testingReport1.Clear();
            equipmentTypeTableAdapter.Fill(testingReport1.EquipmentType, BD, ED);
            equipmentType1TableAdapter.Fill(testingReport1.EquipmentType1, BD, ED);
            groupEquipmentTableAdapter.Fill(testingReport1.GroupEquipment, BD, ED);
            groupEquipment1TableAdapter.Fill(testingReport1.GroupEquipment1, BD, ED);
            groupEquipment2TableAdapter.Fill(testingReport1.GroupEquipment2, BD, ED);
            dataTable1TableAdapter.Fill(testingReport1.DataTable1, BD, ED);
            dataTable2TableAdapter.Fill(testingReport1.DataTable2,BD,ED);
        }

        private void lbBD_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbBD.Text = string.Format("{0:dd/MM/yyyy}", BaoCaoDotXuat.BD);
        }

        private void lbED_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbED.Text = string.Format("{0:dd/MM/yyyy}", BaoCaoDotXuat.ED);
        }

        private void lbNumOfRequest_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbNumOfRequest.Text = BaoCaoDotXuat.SumofRequest.ToString();
        }

        private void lbNumOfTestReport_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbNumOfTestReport.Text = BaoCaoDotXuat.SumofRequesHasReport.ToString();
        }

        private void lbNumOfReQuestNonIssue_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbNumOfReQuestNonIssue.Text = BaoCaoDotXuat.SumofRequestNonIssue.ToString();
        }

        private void lbNumOfTestReportIssueIntime_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbNumOfTestReportIssueIntime.Text = BaoCaoDotXuat.SumofTestReportInTime.ToString();
        }

        private void lbNumOfTestReportIssueOvertime_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbNumOfTestReportIssueOvertime.Text = BaoCaoDotXuat.SumofTestReportOverTime.ToString();
        }

        private void lbNumOfRequestInProcess_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbNumOfRequestInProcess.Text = BaoCaoDotXuat.SumofRequestInProcess.ToString();
        }

        private void lbNumOfRequestInProcessOverTime_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbNumOfRequestInProcessOverTime.Text = BaoCaoDotXuat.SumofRequestInProcessOverTime.ToString();
        }

        private void lbSumPrice_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            lbSumPrice.Text = String.Format("{0:#,###.##} VNĐ", BaoCaoDotXuat.SumofPrice);
        }
     
    }
}
