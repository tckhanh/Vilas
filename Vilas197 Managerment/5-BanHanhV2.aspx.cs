using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Xml;
using DevExpress.Utils;

namespace LabManagement
{
    public partial class _5_BanHanhV2 : System.Web.UI.Page
    {
        Boolean myNewButton;


        protected void Page_Load(object sender, EventArgs e)
        {
           //Session["username"] = "admin"; Session["StaffID"] = "001";

            if (Session["username"] == null)
                Response.Redirect("Login.aspx");

            //  Sử dụng IsPostBack property, phán đoán xem có postback hay không? 
            if (!Page.IsPostBack)
            {
                //  ở đây sẽ mô tả xử lí khởi tạo. 
                
                SetReadonly();
                // ASPxGridView2.FilterExpression = "[DocID] = 0";
                Session["DisplayInvalid"]= false;
            }
            //  Ở đây sẽ mô tả xử lí chung trong tất cả event. 

        }

/*
        protected void btSave_Click(object sender, EventArgs e)
        {
            
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            
        }


        protected void ASPxComboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ASPxGridView1.FilterExpression = "[DocTypeID] = " + ASPxComboBox2.Value;
            ASPxGridView1.FocusedRowIndex = -1;
        }

        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            CmbDocType.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeID");
            //txtID2.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocID").ToString();
            TxtDocCode.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeCode").ToString();
            TxtTitle.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Title").ToString();
            MemoAbstract.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Abstract").ToString();
            ASPxDateCreate.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "CreateDate");
        }

        protected void CmbDocType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ASPxComboBox2.Value = CmbDocType.Value;
        }

       

        protected void ASPxGridView2_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            myNewButton = true;

            e.NewValues["IssueDate"] = DateTime.Today;
            e.NewValues["CreateDate"] = DateTime.Today;
            e.NewValues["ModifyDate"] = DateTime.Today;
            e.NewValues["CreateStaffID"] = Session["StaffID"];
            e.NewValues["ModifyStaffID"] = Session["StaffID"];
            e.NewValues["DecisionNo"] = txtDecisionNo.Text;
            e.NewValues["DecisionDate"] = DateEditDecisionDate.Value;
            e.NewValues["FileName"] = txtUploadFile.Text;
            e.NewValues["NotesOfUpdating"] = MemoNotes.Text;

            e.NewValues["DocID"] = lblSelectedDocID.Text;

            
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
        }

 */
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



        protected void ASPxButtonUpload_Click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            string fileName = "NoName";
            string virtpath = "~/DATA/HTCL/";
            string filePath = "";

            Guid GU = new Guid();
            string fName = GU.ToString();

            if (txtIssueNo.Text != null)
                fName = txtIssueNo.Text + "_" + Convert.ToDateTime(ASPxDateIssue.Value).Year;
            else
                fName = "0" + "_" + Convert.ToDateTime(ASPxDateIssue.Value).Year;

            if (lblDocCode == null )
                lblnotification.Text = "Error: Tài liệu chưa được chọn";
            else
            {
                if (FileUpload2.HasFile)
                {
                    /* Kiểm tra loại File chấp nhận
                    String fileExtension = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
                    String[] allowedExtensions = { ".pdf", ".doc", ".docx", ".jpeg", ".jpg" };

                    for (int i = 0; i < allowedExtensions.Length; i++)
                        {
                            if (fileExtension == allowedExtensions[i])
                            {
                                fileOK = true;
                                break;
                            }           
                        }
                     */
                    fileName = FileUpload2.FileName;
                    fileOK = true;
                }

                if (fileOK)
                {
                    try
                    {
                        virtpath = virtpath + lblDocCode.Text;
                        filePath = Page.MapPath(virtpath);

                        // Kiem tra Folder tao Folder neu chua co
                        if (!Directory.Exists(filePath)) // TODO: needs to be created ONLY from setup phase with Security Permissions
                            Directory.CreateDirectory(filePath);

                        // Luu File
                        FileUpload2.PostedFile.SaveAs(filePath + "/" + fName + "_" + fileName); // makes unique filename

                        txtUploadFile.Text = FileUpload2.FileName;
                        txtURL.Text = virtpath + "/" + fName + "_" + fileName;
                    }
                    catch (Exception ex)
                    {
                        lblnotification.Text = ex.ToString();
                    }
                }
                else
                {
                    lblnotification.Text = "Error: Cannot accept files of this type.";
                }

            }

           
        }

        protected void ASPxGridView2_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            
            if (e.NewValues["CreateDate"] == null)
            {
                e.NewValues["CreateDate"] = DateTime.Today;
            }

            if (e.NewValues["ModifyDate"] == null)
            {
                e.NewValues["ModifyDate"] = DateTime.Today;
            }
            e.NewValues["CreateStaffID"] = Session["StaffID"];
            e.NewValues["ModifyStaffID"] = Session["StaffID"];


        }

        protected void ASPxGridView2_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (myNewButton == true)  // Insert Mode
            {
                if (e.Column.FieldName == "DocID" || e.Column.FieldName == "ModifyDate")
                    e.Editor.Enabled= false;
                else
                    e.Editor.Enabled = true;
            }
            else
            {
                if (e.Column.FieldName == "DocID" || e.Column.FieldName == "IssueNo" || e.Column.FieldName == "CreateDate")
                    e.Editor.Enabled = false;
                else
                    e.Editor.Enabled = true;
            }
        }

        protected void ASPxGridView2_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            myNewButton = false;
        }

        protected void ASPxGridView2_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            QSDataContext myQS = new QSDataContext();
            QS_DocIssue my = myQS.QS_DocIssues.SingleOrDefault(p => p.IssueID.ToString() == e.Keys[(sender as ASPxGridView).KeyFieldName]);

            my.Invalid = true;
            my.ExpireDate = DateTime.Today;

            myQS.SubmitChanges();
            myQS.Dispose();
        }

        protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            
            lblSelectedDocName.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeName").ToString() + " - ";
            lblSelectedDocName.Text = lblSelectedDocName.Text + ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Title").ToString();
            lblSelectedDocName1.Text = lblSelectedDocName.Text;

            lblDocID.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocID").ToString();
            lblDocCode.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocCode").ToString();

            //ASPxGridView2.FilterExpression = "[DocID] = " + lblDocID.Text;

            btNew0.Enabled = false;
            btDelete0.Enabled = false;
            btnCacel.Enabled = false;
            btSave0.Enabled = false;
            
            if (lblDocID.Text != null && ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Invalid").GetType() != DBNull.Value.GetType() )
                if (Convert.ToBoolean(ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Invalid")) == false)
                    btNew0.Enabled = true;
            
            //ASPxGridView2.FocusedRowIndex = -1;           
        }

        protected void ASPxGridView2_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            lblIssueID.Text = (sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "IssueID").ToString();

            txtIssueNo.Text = (sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "IssueNo").ToString();
            ASPxDateIssue.Value = Convert.ToDateTime((sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "IssueDate"));
            txtDecisionNo.Text = (sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "DecisionNo").ToString();
            DateEditDecisionDate.Value = Convert.ToDateTime((sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "DecisionDate").ToString());
            txtUploadFile.Text = (sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "FileName").ToString();
            MemoNotes.Text = (sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "NotesOfUpdating").ToString();
            txtURL.Text = (sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "URL").ToString();


            lblSelectedDocName.Text = null;
            lblSelectedDocName1.Text = null;

            lblDocID.Text = null;
            lblDocCode.Text = null;

            btNew0.Enabled = false;
            btDelete0.Enabled = false;
            btnCacel.Enabled = false;
            btSave0.Enabled = false;

            if (Convert.ToBoolean((sender as ASPxGridView).GetRowValues(Convert.ToInt32(e.Parameters), "Invalid")) == true)
                btDelete0.Enabled = true;

        }

        protected void btNew0_Click(object sender, EventArgs e)
        {
            ResetReadonly();
            ResetInput();

            QSDataContext myQS = new QSDataContext();

            /*
                QS_DocIssue my = myQS.QS_DocIssues.SingleOrDefault(p => p.IssueID == Convert.ToInt32(lblIssueID.Text));
                my.Invalid = true;
             */

            
            QS_DocIssue my = (from p in myQS.QS_DocIssues
                                where p.DocID == Convert.ToInt32(lblDocID.Text)
                                orderby p.IssueNo descending
                                select p).FirstOrDefault();

            if (my != null)
                txtIssueNo.Text = Convert.ToString(Convert.ToInt32(my.IssueNo.ToString()) + 1);
            else
                txtIssueNo.Text = "1";

            myQS.Dispose();
            
            ResetReadonly();

            btNew0.Enabled = false;
            btnCacel.Enabled = true;
            btSave0.Enabled = true;
            btDelete0.Enabled = false;
            
        }

        protected void SetReadonly()
        {
            txtIssueNo.ReadOnly = true;
            ASPxDateIssue.ReadOnly = true;
            txtUploadFile.ReadOnly = true;
            txtDecisionNo.ReadOnly = true;
            DateEditDecisionDate.ReadOnly = true;
            MemoNotes.ReadOnly = true;
            chkKeepInfo.Enabled = false;
        }

        protected void ResetReadonly()
        {
            txtIssueNo.ReadOnly = false;
            ASPxDateIssue.ReadOnly = false;
            txtUploadFile.ReadOnly = false;
            txtDecisionNo.ReadOnly = false;
            DateEditDecisionDate.ReadOnly = false;
            MemoNotes.ReadOnly = false;
            chkKeepInfo.Enabled = true;
            
        }

        protected void ResetInput()
        {
            txtIssueNo.Text = null;
            ASPxDateIssue.Value = DateTime.Today;
            txtUploadFile.Text = null;
            txtURL.Text = null;

            if (chkKeepInfo.Checked == false)
            {
                txtDecisionNo.Text = null;
                DateEditDecisionDate.Value = DateTime.Today;
                MemoNotes.Text = null;
            }

            lblnotification.Text = null;

            btDelete0.Enabled = false;
            btnCacel.Enabled = false;
            btSave0.Enabled = false;
            btNew0.Enabled = true;

        }

        protected void btSave0_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtIssueNo.Text != null && ASPxDateIssue.Value != null && txtUploadFile.Text != null && txtDecisionNo.Text!= null && DateEditDecisionDate.Value!=null)
                {
                    QSDataContext myQS = new QSDataContext();
                    var check = (from p in myQS.QS_DocIssues
                                 where p.DocID == Convert.ToInt32(lblDocID.Text) && p.IssueNo == Convert.ToInt32(txtIssueNo.Text)
                                 select p.DocID);

                   if (check.Any() == true)
                    {
                        lblnotification.Text = "Tài liệu đã được ban hành rồi";
                    }
                   else
                   {
                       if (TaiFile() == true)
                       {
                           QS_DocIssue my = new QS_DocIssue();
                           QS_Document myParent = myQS.QS_Documents.SingleOrDefault(c => c.DocID == Convert.ToInt32(lblDocID.Text));

                           my.IssueNo = Convert.ToInt32(txtIssueNo.Text);
                           my.IssueDate = Convert.ToDateTime(ASPxDateIssue.Value);
                           my.FileName = txtUploadFile.Text;
                           my.URL = txtURL.Text;
                           my.DecisionNo = txtDecisionNo.Text;
                           my.DecisionDate = Convert.ToDateTime(DateEditDecisionDate.Value);
                           my.NotesOfUpdating = MemoNotes.Text;
                           my.CreateDate = DateTime.Today;
                           my.CreateStaffID = Session["StaffID"].ToString();
                           my.ModifyDate = DateTime.Today;
                           my.ModifyStaffID = Session["StaffID"].ToString();
                           my.Invalid = false;
                           my.Deleted = false;

                           myParent.QS_DocIssues.Add(my);
                           myQS.SubmitChanges();
                           var my1 = (from p in myQS.QS_DocIssues
                                      where p.DocID == Convert.ToInt32(lblDocID.Text) && p.Invalid == false
                                      orderby p.IssueNo descending
                                      select p).FirstOrDefault();
                           if (my1 != null)
                           {
                               var my2 = (from p in myQS.QS_DocIssues
                                          where p.DocID == Convert.ToInt32(lblDocID.Text) && p.Invalid == false && p.IssueNo < my1.IssueNo
                                          select p);

                               foreach (QS_DocIssue myIssue in my2)
                               {
                                   myIssue.Invalid = true;
                                   myIssue.ExpireDate = DateTime.Today;
                                   myIssue.ModifyDate = DateTime.Today;
                                   myIssue.ModifyStaffID = Session["StaffID"].ToString();
                                   myQS.SubmitChanges();
                               }
                           }
                           SetReadonly();
                           ResetInput();

                           btSave0.Enabled = false;

                           /*

                           if ((ASPxGridView1.FindDetailRowTemplateControl(0,"ASPxGridView2") as ASPxGridView).GetType() != DBNull.Value.GetType())
                                (ASPxGridView1.FindDetailRowTemplateControl(0,"ASPxGridView2") as ASPxGridView).DataBind();
                           */

                           //ASPxGridView2.DataBind();
                       }
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
                lblnotification.Text = except.ToString();
                Console.WriteLine("{0} Exception caught.", except);
            }
        }

        protected void ASPxGridView2_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["ModifyDate"] = DateTime.Today;
            e.NewValues["ModifyStaffID"] = Session["StaffID"];

        }

        protected void btDelete0_Click(object sender, EventArgs e)
        {
            QSDataContext myQS = new QSDataContext();
            
            QS_DocIssue my = myQS.QS_DocIssues.SingleOrDefault(p => p.IssueID == Convert.ToInt32(lblIssueID.Text));
            my.Deleted = true;
            
            /*

            var my = (from p in myQS.QS_DocIssues
                       where p.IssueID == Convert.ToInt32(lblIssueID.Text)
                       select p);

            myQS.QS_DocIssues.DeleteAllOnSubmit(my);
             * 
             */

             myQS.SubmitChanges();

            myQS.Dispose();

            SetReadonly();
            ResetInput();
                        
            //ASPxGridView2.DataBind();
            //(ASPxGridView1.FindDetailRowTemplateControl(0,"ASPxGridView2") as ASPxGridView).DataBind();

            btSave0.Enabled = false;
            btNew0.Enabled = true;
            btDelete0.Enabled = false;
        }

        
        protected void btnCacel_Click(object sender, EventArgs e)
        {
            ResetInput();
            SetReadonly();
        }

        protected void ASPxCheckBox1_CheckedChanged1(object sender, EventArgs e)
        {
            Session["DisplayInvalid1"] = ASPxCheckBox1.Checked;
            ASPxGridView1.DataBind();
        }


        protected Boolean TaiFile()
        {
            Boolean fileOK = false;
            string fileName = "NoName";
            string virtpath = "~/DATA/HTCL/";
            string filePath = "";

            txtURL.Text = "";

            Guid GU = new Guid();
            string fName = GU.ToString();

            if (txtIssueNo.Text != null)
                fName = txtIssueNo.Text + "_" + Convert.ToDateTime(ASPxDateIssue.Value).Year;
            else
                fName = "0" + "_" + Convert.ToDateTime(ASPxDateIssue.Value).Year;

            if (lblDocCode == null)
            {
                lblnotification.Text = "Error: Tài liệu chưa được chọn";
                return false;
            }
            else
            {
                if (FileUpload2.HasFile)
                {
                    /* Kiểm tra loại File chấp nhận
                    String fileExtension = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
                    String[] allowedExtensions = { ".pdf", ".doc", ".docx", ".jpeg", ".jpg" };

                    for (int i = 0; i < allowedExtensions.Length; i++)
                        {
                            if (fileExtension == allowedExtensions[i])
                            {
                                fileOK = true;
                                break;
                            }           
                        }
                     */
                    fileName = FileUpload2.FileName;
                    fileOK = true;
                }
                else
                {
                    lblnotification.Text = "Khong co File dinh kem";
                    return false;
                }

                if (fileOK)
                {
                    try
                    {
                        virtpath = virtpath + lblDocCode.Text;
                        filePath = Page.MapPath(virtpath);

                        // Kiem tra Folder tao Folder neu chua co
                        if (!Directory.Exists(filePath)) // TODO: needs to be created ONLY from setup phase with Security Permissions
                            Directory.CreateDirectory(filePath);

                        // Luu File
                        FileUpload2.PostedFile.SaveAs(filePath + "/" + fName + "_" + fileName); // makes unique filename

                        txtUploadFile.Text = FileUpload2.FileName;
                        txtURL.Text = virtpath + "/" + fName + "_" + fileName;
                        return true;
                    }
                    catch (Exception ex)
                    {
                        lblnotification.Text = ex.ToString();
                        return false;
                    }
                }
                else
                {
                    lblnotification.Text = "Loai File nay Khong duoc chap nhan" ;
                    return false;
                }

            }
        }

        protected void ASPxGridView2_StartRowEditing1(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            if (Convert.ToBoolean((sender as ASPxGridView).GetRowValuesByKeyValue(e.EditingKeyValue, "Invalid")) == true)
            {
                ((sender as ASPxGridView).Columns["Invalid"] as GridViewDataColumn).EditFormSettings.Visible = DefaultBoolean.False;
            }
            else
            {
                ((sender as ASPxGridView).Columns["Invalid"] as GridViewDataColumn).EditFormSettings.Visible = DefaultBoolean.True;
            }
        }

        protected void ASPxGridView2_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["DocID"] = (sender as ASPxGridView).GetMasterRowKeyValue();

        }
    } 
}