using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace LabManagement.Report
{
    public partial class _5_Danhmucgoc : DevExpress.XtraReports.UI.XtraReport
    {
        private int Stt = 0;
        public _5_Danhmucgoc()
        {
            InitializeComponent();
        }

        private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            Stt++;
            xrLabelStt.Text = Stt.ToString();
        }

    }
}
