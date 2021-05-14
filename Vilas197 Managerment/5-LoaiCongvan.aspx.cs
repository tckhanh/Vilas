using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using DevExpress.Web;
using DevExpress.Utils;


namespace LabManagement
{
    public partial class _5_LoaiCongvan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["username"] = "admin"; Session["StaffID"] = "001";

            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("Login.aspx");
                else
                {
                    string sql1 = "SELECT AccessRight.C3, Staff.Enable FROM AccessRight INNER JOIN Staff ON AccessRight.StaffID = Staff.StaffID WHERE Staff.StaffID='" + Session["StaffID"] + "'";
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

                if (TxtStdTypeCode.Text != "" && TxtStdTypeName.Text != "")
                {
                    QSDataContext myQS = new QSDataContext();

                    var checkStdTypes = (from p in myQS.QS_DocCategories
                                         where p.DocCatCode.ToUpper() == TxtStdTypeCode.Text.ToUpper()
                                         select p);

                    if (checkStdTypes.Any() == true)
                    {
                        lblnotification.Text = "Mã loại công văn đã tồn tại rồi";
                    }
                    else
                    {
                        QS_DocCategory myStdType = new QS_DocCategory();

                        myStdType.DocCatCode = TxtStdTypeCode.Text;
                        myStdType.DocCatName = TxtStdTypeName.Text;


                        myStdType.CreateDate = DateTime.Today;
                        myStdType.CreateStaffID = Session["StaffID"].ToString();

                        myStdType.ModifyDate = DateTime.Today;
                        myStdType.ModifyStaffID = Session["StaffID"].ToString();

                        myStdType.Invalid = false;
                        myStdType.Deleted = false;
                        

                        myQS.QS_DocCategories.InsertOnSubmit(myStdType);

                        myQS.SubmitChanges();
                        
                        lblnotification.Text = null;

                        SetReadonly();
                        ResetInput();

                        btSave.Enabled = false;
                        ASPxGridViewDocType.DataBind();
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
                LabelNotification.Text = except.ToString(); // "Mã loại công văn phải là duy nhất";
                Console.WriteLine("{0} Exception caught.", except);
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            QSDataContext myQS = new QSDataContext();
            QS_DocCategory myStdType = myQS.QS_DocCategories.SingleOrDefault(p => p.DocCatID.ToString() == txtStdTypeID.Text);
            if (myStdType != null)
            {
                myStdType.Deleted = true;

                myQS.SubmitChanges();
                myQS.Dispose();
            }
            ASPxGridViewDocType.DataBind();
            TxtStdTypeCode.Text = null;
            TxtStdTypeName.Text = null;
            txtStdTypeID.Text = null;

            btNew.Enabled = true;
            btDelete.Enabled = false;
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            TxtStdTypeCode.Text = null;
            TxtStdTypeName.Text = null;
            
            ResetReadonly();

            btSave.Enabled = true;
            btCancel.Enabled = true;
            btDelete.Enabled = false;
            btNew.Enabled = false;

            lblnotification.Text = null;
            
        }

        protected void ASPxGridViewDocType_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            if (e.NewValues["ModifyDate"] == null)
            {
                e.NewValues["ModifyDate"] = DateTime.Today;
            }
            e.NewValues["ModifyStaffID"] = Session["StaffID"];

        }

        protected void ASPxGridViewDocType_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            if (e.NewValues["CreateDate"] == null)
            {
                e.NewValues["CreateDate"] = DateTime.Today;
            }
            e.NewValues["CreateStaffID"] = Session["StaffID"];
            e.NewValues["ModifyStaffID"] = Session["StaffID"];

            //e.NewValues["Invalid"] = false;

        }

        protected void ASPxGridViewDocType_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {

            TxtStdTypeCode.Text = ASPxGridViewDocType.GetRowValues(Convert.ToInt32(e.Parameters), "DocCatCode").ToString();
            TxtStdTypeName.Text = ASPxGridViewDocType.GetRowValues(Convert.ToInt32(e.Parameters), "DocCatName").ToString();
            txtStdTypeID.Text = ASPxGridViewDocType.GetRowValues(Convert.ToInt32(e.Parameters), "DocCatID").ToString();

            btSave.Enabled = false;
            btNew.Enabled = true;

            if (Convert.ToBoolean(ASPxGridViewDocType.GetRowValues(Convert.ToInt32(e.Parameters), "Invalid")) == true)
                btDelete.Enabled = true;
            else
                btDelete.Enabled = false;
            
        }

        protected void SetReadonly()
        {
            TxtStdTypeCode.ReadOnly = true;
            TxtStdTypeName.ReadOnly = true;
        }

        protected void ResetReadonly()
        {
            TxtStdTypeCode.ReadOnly = false;
            TxtStdTypeName.ReadOnly = false;
        }


        protected void ResetInput()
        {
            LabelNotification.Text = null;
            TxtStdTypeCode.Text = null;
            TxtStdTypeName.Text = null;            
            
            btDelete.Enabled = false;
            btCancel.Enabled = false;
            btSave.Enabled = false;
            btNew.Enabled = true;

        }

        protected void btCancel_Click(object sender, EventArgs e)
        {
            ResetInput();
            SetReadonly();
        }

        protected void ASPxCheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            Session["DisplayInvalid"] = ASPxCheckBox1.Checked;
            ASPxGridViewDocType.DataBind();
        }

        protected void ASPxGridViewDocType_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            if ((ASPxGridViewDocType.GetRowValuesByKeyValue(e.EditingKeyValue, "TotalDocIn").GetType() == DBNull.Value.GetType()) && (ASPxGridViewDocType.GetRowValuesByKeyValue(e.EditingKeyValue, "TotalDocOut").GetType() == DBNull.Value.GetType()))
                (ASPxGridViewDocType.Columns["Invalid"] as GridViewDataColumn).EditFormSettings.Visible = DefaultBoolean.True;
            else
                (ASPxGridViewDocType.Columns["Invalid"] as GridViewDataColumn).EditFormSettings.Visible = DefaultBoolean.False;
        }

    }
}