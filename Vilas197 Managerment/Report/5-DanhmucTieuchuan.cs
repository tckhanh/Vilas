using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

namespace LabManagement.Report
{
    public partial class _5_DanhmucTieuchuan : DevExpress.XtraReports.UI.XtraReport
    {
        private int Stt = 0;
        public _5_DanhmucTieuchuan()
        {
            InitializeComponent();
        }

        private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            Stt++;
            xrTableCellStt.Text = Stt.ToString();
        }

    }
}
