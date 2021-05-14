using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Data.SqlClient;
using DevExpress.Utils;

namespace LabManagement
{
    public partial class _5_TaiLieu : System.Web.UI.Page
    {
        Boolean myNewButton;


        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["username"] = "admin"; Session["StaffID"] = "001";

            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.C1, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
                    SqlConnection conn1 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["db_mang"].ConnectionString);
                    SqlCommand Cmd1 = new SqlCommand(sql1, conn1);
                    conn1.Open();
                    SqlDataReader dr1 = Cmd1.ExecuteReader();
                    dr1.Read();
                    if (dr1.GetValue(1).ToString() == "1")
                    {
                        if (dr1.GetValue(0).ToString() == "0")
                            Response.Redirect("FailAccess.aspx");
                    }
                    else
                    {
                        Response.Redirect("FailAccess.aspx");
                    }
                    dr1.Close();
                    conn1.Close();
                }
            }

            //  Ở đây sẽ mô tả xử lí chung trong tất cả event. 
        }


        protected void btSave_Click(object sender, EventArgs e)
        {
            try
            {

                if (CmbDocType.Value != null && TxtDocCode.Text != null && TxtTitle.Text != null)
                {
                    QSDataContext myQS = new QSDataContext();
                    var check = (from p in myQS.QS_Documents
                                 where p.DocCode.ToUpper() == TxtDocCode.Text.ToUpper()
                                 select p.DocID);

                    if (check.Any() == true)
                    {
                        lblnotification.Text = "Mã tài liệu đã tồn tại rồi";
                    }
                    else
                    {
                        QS_Document my = new QS_Document();

                        my.DocCode = TxtDocCode.Text;
                        my.DocTypeID = Convert.ToInt32(CmbDocType.Value.ToString());
                        my.Title = TxtTitle.Text;
                        my.Abstract = MemoAbstract.Text;

                        my.CreateDate = DateTime.Today;
                        my.CreateStaffID = Session["StaffID"].ToString();

                        my.ModifyDate = DateTime.Today;
                        my.ModifyStaffID = Session["StaffID"].ToString();

                        my.Invalid = false;
                        my.Deleted = false;


                        myQS.QS_Documents.InsertOnSubmit(my);

                        myQS.SubmitChanges();


                        SetReadonly();
                        ResetInput();

                        btSave.Enabled = false;

                        ASPxGridView1.DataBind();
                    }

                    myQS.Dispose();

                }
                else
                {
                    lblnotification.Text = "Bạn phải điền thông tin ở các mục bắt buộc có dấu (*)";
                }
            }

            catch (Exception except)
            {
                lblnotification.Text = except.ToString(); // "Mã tài liệu phải là duy nhất";
                Console.WriteLine("{0} Exception caught.", except);
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            QSDataContext myQS = new QSDataContext();
            QS_Document my = myQS.QS_Documents.SingleOrDefault(p => p.DocID.ToString() == txtDocID.Text);
            if (my != null)
            {
                my.Deleted = true;

                myQS.SubmitChanges();
                myQS.Dispose();
            }
            ASPxGridView1.DataBind();
            TxtDocCode.Text = null;
            TxtTitle.Text = null;
            txtDocID.Text = null;

            btNew.Enabled = true;
            
            btDelete.Enabled = false;
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            ResetReadonly();
            TxtDocCode.Text = null;
            TxtTitle.Text = null;
            txtDocID.Text = null;
            MemoAbstract.Text = null;

            lblnotification.Text = null;

            ResetReadonly();

            btNew.Enabled = false;
            btnCacel.Enabled = true;
            btSave.Enabled = true;
            btDelete.Enabled = false;

        }

        
        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            CmbDocType.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeID");
            txtDocID.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocID").ToString();
            TxtDocCode.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocCode").ToString();
            TxtTitle.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Title").ToString();
            MemoAbstract.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Abstract").ToString();
        }

        protected void CmbDocType_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ASPxGridView1_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            myNewButton = true;

            if (e.NewValues["CreateDate"] == null)
            {
                e.NewValues["CreateDate"] = DateTime.Today;
            }
            e.NewValues["ModifyDate"] = DateTime.Today;

            e.NewValues["CreateStaffID"] = Session["StaffID"];
            e.NewValues["ModifyStaffID"] = Session["StaffID"];

        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            CmbDocType.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeID");
            TxtDocCode.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocCode").ToString();
            txtDocID.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocID").ToString();
            TxtTitle.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Title").ToString();
            MemoAbstract.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Abstract").ToString();

            //btSave.Enabled = false;
            //btNew.Enabled = true;


            if (Convert.ToBoolean(ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Invalid")) == true)
                btDelete.Enabled = true;
            else
                btDelete.Enabled = false;
            
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            if (e.NewValues["CreateDate"] == null)
            {
                e.NewValues["CreateDate"] = DateTime.Today;
            }
            e.NewValues["ModifyDate"] = DateTime.Today;

            e.NewValues["CreateStaffID"] = Session["StaffID"];
            e.NewValues["ModifyStaffID"] = Session["StaffID"];

        }


        protected void ASPxGridView2_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            if (e.NewValues["CreateDate"] == null)
            {
                e.NewValues["CreateDate"] = DateTime.Today;
            }
            e.NewValues["ModifyDate"] = DateTime.Today;

            e.NewValues["CreateStaffID"] = Session["StaffID"];
            e.NewValues["ModifyStaffID"] = Session["StaffID"];

        }

        protected void ASPxGridView1_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "DocTypeCode" || e.Column.FieldName == "DocCode" || e.Column.FieldName == "CreateDate")
                if (myNewButton == true)
                {
                    e.Editor.Enabled = true;
                }
                else
                {
                    e.Editor.Enabled = false;
                }

        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            myNewButton = false;
            if (ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, "Total").GetType() != DBNull.Value.GetType())
            {
                (ASPxGridView1.Columns["Invalid"] as GridViewDataColumn).EditFormSettings.Visible = DefaultBoolean.False;
            }
            else
            {
                (ASPxGridView1.Columns["Invalid"] as GridViewDataColumn).EditFormSettings.Visible = DefaultBoolean.True;
            }

        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            System.Threading.Thread.Sleep(2000);

            /*
             * ASPxUploadControl uploadControl = sender as ASPxUploadControl;

            if (uploadControl.UploadedFiles != null && uploadControl.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl.UploadedFiles[i];
                    if (file.FileName != "")
                    {
                        string fileName = string.Format("{0}{1}", MapPath("~/Images/"), file.FileName);
                        //file.SaveAs(fileName, true);//OnLine Demo Restriction
                    }
                }
            }

            */

            string fileName = e.UploadedFile.FileName;
            string virtpath = "~/HTCL/";
            string filePath = Page.MapPath(virtpath);
            Guid GU = new Guid();
            string fName = GU.ToString();
            if (!Directory.Exists(filePath)) // TODO: needs to be created ONLY from setup phase with Security Permissions
                Directory.CreateDirectory(filePath);


            e.UploadedFile.SaveAs(filePath + fileName, true); // makes unique filename
            e.CallbackData = fileName;
        }


        protected void SetReadonly()
        {
            CmbDocType.ReadOnly = true;
            TxtDocCode.ReadOnly = true;
            TxtTitle.ReadOnly = true;
            MemoAbstract.ReadOnly = true;
        }

        protected void ResetReadonly()
        {
            CmbDocType.ReadOnly = false;
            TxtDocCode.ReadOnly = false;
            TxtTitle.ReadOnly = false;
            MemoAbstract.ReadOnly = false;
        }


        protected void ResetInput()
        {
            CmbDocType.SelectedIndex = -1;
            TxtDocCode.Text = null;
            TxtTitle.Text = null;
            MemoAbstract.Text = null;

            btDelete.Enabled = false;
            btnCacel.Enabled = false;
            btSave.Enabled = false;
            btNew.Enabled = true;

        }

        protected void btnCacel_Click(object sender, EventArgs e)
        {
            ResetInput();
            SetReadonly();
        }

        protected void ASPxCheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            Session["DisplayInvalid"] = ASPxCheckBox1.Checked;
            ASPxGridView1.DataBind();
        }


    } 
}