using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LabManagement.Report;
using System.Data.SqlClient;
using System.Data;

namespace LabManagement.Report_Form
{
    public partial class HandPaper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            int HandoverID = Convert.ToInt32(QuanLyBanGiaoTB.handID);
            ReportViewer1.Report = CreateReport(HandoverID); 
        }

        private DevExpress.XtraReports.UI.XtraReport CreateReport(int HandoverID)
        {
            //Check kind of handover (Internal or External)                           
            string sql4 = "SELECT ReceiveStaffID FROM Handover WHERE HandoverID='" + HandoverID + "'";
            SqlConnection conn4 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
            SqlCommand Cmd4 = new SqlCommand(sql4, conn4);
            conn4.Open();
            SqlDataReader dr4 = Cmd4.ExecuteReader();
            dr4.Read();
            string sID = dr4.GetValue(0).ToString();
            dr4.Close();
            conn4.Close();
            if (sID == "")
            {
                LabManagement.Report.HandoverPaper report = new HandoverPaper();
                report.SetReportParameter(HandoverID);
                return report;
            }
            else
            {
                LabManagement.Report.HandoverPaper2 report = new HandoverPaper2();
                report.SetReportParameter(HandoverID);
                return report;
            }
        }

    }
}