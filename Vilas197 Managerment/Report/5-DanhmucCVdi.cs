using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace LabManagement.Report
{
    public partial class _5_DanhmucCVdi : DevExpress.XtraReports.UI.XtraReport
    {
        private int Stt = 0;
        public _5_DanhmucCVdi()
        {
            InitializeComponent();
        }

        private void _5_DanhmucCVdi_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            
            //danhmucCVdiAdapter1.Fill(dataset_danhmucCVdi1.DanhmucCVdi, (DateTime)param1.Value , (DateTime)param2.Value);
        }

        private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            Stt++;
            xrTableCellStt.Text = Stt.ToString();
        }

    }
}
