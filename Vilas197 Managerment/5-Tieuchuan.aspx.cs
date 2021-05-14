using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using System.Xml;
using System.Data.SqlClient;

namespace LabManagement
{
    public partial class _5_TieuChuan : System.Web.UI.Page
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
                    string sql1 = "SELECT AccessRight.C4, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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

                if (CmbType.Value != null && TxtDocCode.Text != null && TxtTitle.Text != null && txtUploadFile.Text != null)
                {
                    // Kiem tra trung lap
                    QSDataContext myQS = new QSDataContext();
                    var check = (from p in myQS.QS_Standards
                                 where p.StdCode.ToUpper() == TxtDocCode.Text.ToUpper()
                                 select p.StdID);

                    if (check.Any() == true)
                    {
                        lblnotification.Text = "Mã tiêu chuẩn đã tồn tại rồi";
                    }
                    else
                    {
                        QS_Standard my = new QS_Standard();

                        my.StdCode = TxtDocCode.Text;
                        my.StdTypeID = Convert.ToInt32(CmbType.Value.ToString());
                        my.StdTitle = TxtTitle.Text;
                        my.Abstract = MemoAbstract.Text;
                        my.FileName = txtUploadFile.Text;
                        my.URL = txtURL.Text;
                        my.ValidDate = Convert.ToDateTime(ASPxDateValid.Value);
                        my.IssueDate = Convert.ToDateTime(ASPxDateIssue.Value);
                        
                        my.CreateDate = DateTime.Today;
                        my.CreateStaffID = Session["StaffID"].ToString();

                        my.ModifyDate = DateTime.Today;
                        my.ModifyStaffID = Session["StaffID"].ToString();

                        my.Invalid = false;
                        my.Deleted = false;


                        myQS.QS_Standards.InsertOnSubmit(my);

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
                lblnotification.Text = except.ToString(); // "Mã tiêu chuẩn phải là duy nhất";
                Console.WriteLine("{0} Exception caught.", except);
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            QSDataContext myQS = new QSDataContext();
            QS_Standard my = myQS.QS_Standards.SingleOrDefault(p => p.StdID.ToString() == txtDocID.Text);
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
            ResetInput();

            btNew.Enabled = false;
            btnCacel.Enabled = true;
            btSave.Enabled = true;
            btDelete.Enabled = false;

        }

/*
        protected void ASPxGridView2_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            CmbType.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeID");
            //txtID2.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocID").ToString();
            TxtDocCode.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeCode").ToString();
            TxtTitle.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Title").ToString();
            MemoAbstract.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Abstract").ToString();
        }

 */
  
        protected void CmbType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txtDocID.Text = CmbType.Items[CmbType.SelectedIndex].GetValue("StdTypeCode").ToString();
            txtDocID.Text = CmbType.SelectedItem.GetValue("StdTypeCode").ToString();
            
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
            CmbType.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "StdTypeID");
            TxtDocCode.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "StdCode").ToString();

            TxtTitle.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "StdTitle").ToString();
            MemoAbstract.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Abstract").ToString();
            txtUploadFile.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "FileName").ToString();
            txtURL.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "URL").ToString();
            ASPxDateIssue.Value = Convert.ToDateTime(ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "IssueDate"));
            ASPxDateValid.Value = Convert.ToDateTime(ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "ValidDate"));

            SetReadonly();
            
            btSave.Enabled = false;
            btNew.Enabled = true;
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
        }


        protected void SetReadonly()
        {
            CmbType.ReadOnly = true;
            TxtDocCode.ReadOnly = true;
            TxtTitle.ReadOnly = true;
            MemoAbstract.ReadOnly = true;
            FileUpload2.Enabled = false;
            txtUploadFile.ReadOnly = true;
            ASPxDateIssue.ReadOnly = true;
            ASPxDateValid.ReadOnly = true;

            ASPxButtonUpload.Enabled = false;
            
        }

        protected void ResetReadonly()
        {
            CmbType.ReadOnly = false;
            TxtDocCode.ReadOnly = false;
            TxtTitle.ReadOnly = false;
            MemoAbstract.ReadOnly = false;
            FileUpload2.Enabled = true;
            txtUploadFile.ReadOnly = false;
            ASPxDateIssue.ReadOnly = false;
            ASPxDateValid.ReadOnly = false;

            ASPxButtonUpload.Enabled = true;
            
        }


        protected void ResetInput()
        {
            CmbType.SelectedIndex = -1;
            TxtDocCode.Text = null;
            TxtTitle.Text = null;
            MemoAbstract.Text = null;
            txtUploadFile.Text = null;
            txtURL.Text = null;
                        
            txtDocID.Text = null;
            lblnotification.Text = null;
            ASPxDateIssue.Value = DateTime.Today;
            ASPxDateValid.Value = DateTime.Today;


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

        protected void TxtTitle_TextChanged(object sender, EventArgs e)
        {

        }


        protected void ASPxButtonUpload_Click(object sender, EventArgs e)
        {

            Boolean fileOK = false;
            string fileName = "NoName";
            string virtpath = "~/DATA/TC/";
            string filePath = "";
            
            Guid GU = new Guid();
            string fName = GU.ToString();

            if (CmbType.SelectedIndex == -1)
                lblnotification.Text = "Error: Loại Tiêu chuẩn chưa được chọn";
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
                        virtpath = virtpath + CmbType.SelectedItem.GetValue("StdTypeCode");
                        filePath = Page.MapPath(virtpath);

                        // Kiem tra Folder tao Folder neu chua co
                        if (!Directory.Exists(filePath)) // TODO: needs to be created ONLY from setup phase with Security Permissions
                            Directory.CreateDirectory(filePath);

                        // Luu File
                        FileUpload2.PostedFile.SaveAs(filePath + "/" + fileName); // makes unique filename

                        txtUploadFile.Text = FileUpload2.FileName;
                        txtURL.Text = virtpath + "/" + fileName;

                    }
                    catch (Exception ex)
                    {
                        lblnotification.Text = ex.ToString(); // "Error: File could not be uploaded.";
                    }
                }
                else
                {
                    lblnotification.Text = "Error: Cannot accept files of this type.";
                }

            }

        }

    } 
}