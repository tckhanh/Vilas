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
    public partial class _5_Congvandi : System.Web.UI.Page
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
                    string sql1 = "SELECT AccessRight.C2, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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

                if (CmbType.Value != null && CmbOffice.Value != null && txtSeriNo.Text != null && txtDocNo.Text != null && ASPxDateIn.Value != null && ASPxDateIssue.Value != null)
                {
                    // Kiem tra trung lap
                    
                    QSDataContext myQS = new QSDataContext();
                    var check = (from p in myQS.QS_DocOuts
                                 where (p.DocNo.ToUpper() == txtDocNo.Text.ToUpper() && p.DocDate.ToString() == ASPxDateIssue.Text)
                                 select p.DocID);

                    if (check.Any() == true)
                    {
                        lblnotification.Text = "Công văn đã tồn tại rồi";
                    }
                    else
                    {
                        QS_DocOut my = new QS_DocOut();

                        my.DocCatID = Convert.ToInt32(CmbType.Value);
                        my.OfficeID = Convert.ToInt32(CmbOffice.Value);

                        // Cap nhat cho so ke tiep
                        QS_Option my2 = myQS.QS_Options.SingleOrDefault(p => p.Year == DateTime.Today.Year);

                        if (my2 != null)
                        {
                            my.SeriNo = Convert.ToInt32(my2.DocNoOut);
                            my2.DocNoOut = my2.DocNoOut + 1;
                        }
                        else
                            my.SeriNo = Convert.ToInt32(txtSeriNo.Text);


                        my.OutDate = Convert.ToDateTime(ASPxDateIn.Value);
                        my.DocNo = txtDocNo.Text;
                        my.DocDate = Convert.ToDateTime(ASPxDateIssue.Value);
                        my.About = MemoAbout.Text;
                        if (TaiFile() == true)
                        {
                            my.FileName = txtUploadFile.Text;
                            my.URL = txtURL.Text;
                        }

                        my.CreateDate = DateTime.Today;
                        my.CreateStaffID = Session["StaffID"].ToString();

                        my.ModifyDate = DateTime.Today;
                        my.ModifyStaffID = Session["StaffID"].ToString();

                        my.Invalid = false;
                        my.Deleted = false;


                        myQS.QS_DocOuts.InsertOnSubmit(my);

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
                lblnotification.Text = except.ToString();
                Console.WriteLine("{0} Exception caught.", except);
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            QSDataContext myQS = new QSDataContext();
            QS_DocOut my = myQS.QS_DocOuts.SingleOrDefault(p => p.DocID.ToString() == txtDocID.Text);

            my.Deleted = true;

            myQS.SubmitChanges();
            myQS.Dispose();

            ResetInput();
            ASPxGridView1.DataBind();

            btNew.Enabled = true;
            btDelete.Enabled = false;
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            ResetReadonly();
            ResetInput();

            QSDataContext myQS = new QSDataContext();

            /*
             * QS_DocIssue my = myQS.QS_Options.SingleOrDefault(p => p.IssueID == Convert.ToInt32(lblIssueID.Text));
                my.Invalid = true;
             */

            QS_Option my = (from p in myQS.QS_Options
                              where p.Year == DateTime.Today.Year
                              select p).FirstOrDefault();
            if (my != null)
                txtSeriNo.Text = Convert.ToString(Convert.ToInt32(my.DocNoOut.ToString()));
            else
            {
                
                QS_Option my3 = new QS_Option();
                my3.Year = DateTime.Today.Year;
                my3.DocNoIn = 1;
                my3.DocNoOut = 1;

                myQS.QS_Options.InsertOnSubmit(my);
                myQS.SubmitChanges();

                txtSeriNo.Text = "1";
            }


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
            txtSeriNo.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeCode").ToString();
            txtDocNo.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Title").ToString();
            MemoAbstract.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "Abstract").ToString();
        }

 */
  
        protected void CmbType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txtDocID.Text = CmbType.Items[CmbType.SelectedIndex].GetValue("StdTypeCode").ToString();
            txtTypeCode.Text = CmbType.SelectedItem.GetValue("DocCatCode").ToString();
            
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
            txtDocID.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocID").ToString();
            CmbType.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocCatID");
            CmbOffice.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "OfficeID");
            txtSeriNo.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "SeriNo").ToString();
            ASPxDateIn.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "OutDate");

            txtDocNo.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocNo").ToString();
            ASPxDateIssue.Value = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "DocDate");

            MemoAbout.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "About").ToString();
            txtUploadFile.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "FileName").ToString();
            txtURL.Text = ASPxGridView1.GetRowValues(Convert.ToInt32(e.Parameters), "URL").ToString();
            
            
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
            CmbOffice.ReadOnly = true;
            //txtSeriNo.ReadOnly = true;
            ASPxDateIn.ReadOnly = true; 
            txtDocNo.ReadOnly = true;
            ASPxDateIssue.ReadOnly = true;
            MemoAbout.ReadOnly = true;
            FileUpload2.Enabled = false;
            txtUploadFile.ReadOnly = true;
          

            ASPxButtonUpload.Enabled = false;
            
        }

        protected void ResetReadonly()
        {
            CmbType.ReadOnly = false;
            CmbOffice.ReadOnly = false;

            //txtSeriNo.ReadOnly = false;
            ASPxDateIn.ReadOnly = false;
            txtDocNo.ReadOnly = false;
            ASPxDateIssue.ReadOnly = false;
            MemoAbout.ReadOnly = false;
            FileUpload2.Enabled = true;
            txtUploadFile.ReadOnly = false;
          
            ASPxButtonUpload.Enabled = true;
            
        }


        protected void ResetInput()
        {
            CmbType.SelectedIndex = -1;
            CmbOffice.SelectedIndex = -1;
            txtSeriNo.Text = null;
            ASPxDateIn.Value = DateTime.Today;
            txtDocNo.Text = null;
            ASPxDateIssue.Value = DateTime.Today;

            MemoAbout.Text = null;
            txtUploadFile.Text = null;
            txtURL.Text = null;
                        
            txtDocID.Text = null;
            txtTypeCode.Text = null;

            lblnotification.Text = null;
            

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

        protected void txtDocNo_TextChanged(object sender, EventArgs e)
        {

        }


        protected void ASPxButtonUpload_Click(object sender, EventArgs e)
        {

           

        }

        protected Boolean TaiFile()
        {
            Boolean fileOK = false;
            string fileName = "NoName";
            string virtpath = String.Format("~/DATA/CVDEN/{0}/", DateTime.Today.Year);
            string filePath = "";


            Guid GU = new Guid();
            string fName = GU.ToString();

            if ((CmbType.SelectedIndex == -1) || (CmbOffice.SelectedIndex == -1))
            {
                lblnotification.Text = "Error: Loại Công văn hoặc tên cơ quan chưa được chọn";
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
                        virtpath = virtpath + CmbType.SelectedItem.GetValue("DocCatCode").ToString().Trim();
                        filePath = Page.MapPath(virtpath);

                        // Kiem tra Folder tao Folder neu chua co
                        if (!Directory.Exists(filePath)) // TODO: needs to be created ONLY from setup phase with Security Permissions
                            Directory.CreateDirectory(filePath);

                        // Luu File
                        FileUpload2.PostedFile.SaveAs(filePath + "/" + txtSeriNo.Text + "_" + fileName); // makes unique filename

                        txtUploadFile.Text = FileUpload2.FileName;
                        txtURL.Text = virtpath + "/" + txtSeriNo.Text + "_" + fileName;
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
                    lblnotification.Text = "Error: Cannot accept files of this type.";
                    return false;
                }

            }
        }

    } 
}