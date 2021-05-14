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
    public partial class _5_LoaiTaiLieu : System.Web.UI.Page
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

                if (TxtDocTypeCode.Text != "" && TxtDocTypeName.Text != "")
                {
                    QSDataContext myQS = new QSDataContext();

                    var checkDocTypes = (from p in myQS.QS_DocTypes
                                         where p.DocTypeCode.ToUpper() == TxtDocTypeCode.Text.ToUpper()
                                         select p);

                    if (checkDocTypes.Any() == true)
                    {
                        lblnotification.Text = "Mã loại tài liệu đã tồn tại rồi";
                    }
                    else
                    {
                        QS_DocType myDocType = new QS_DocType();

                        myDocType.DocTypeCode = TxtDocTypeCode.Text;
                        myDocType.DocTypeName = TxtDocTypeName.Text;

                        myDocType.CreateDate = DateTime.Today;
                        myDocType.CreateStaffID = Session["StaffID"].ToString();

                        myDocType.ModifyDate = DateTime.Today;
                        myDocType.ModifyStaffID = Session["StaffID"].ToString();

                        myDocType.Invalid = false;
                        myDocType.Deleted = false;
                        

                        myQS.QS_DocTypes.InsertOnSubmit(myDocType);

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
                LabelNotification.Text = except.ToString(); // "Mã loại tài liệu phải là duy nhất";
                Console.WriteLine("{0} Exception caught.", except);
            }
        }

        protected void btDelete_Click(object sender, EventArgs e)
        {
            QSDataContext myQS = new QSDataContext();
            QS_DocType myDocType = myQS.QS_DocTypes.SingleOrDefault(p => p.DocTypeID.ToString() == txtDocTypeID.Text);

            myDocType.Deleted = true;
            
            myQS.SubmitChanges();
            myQS.Dispose();
            
            ASPxGridViewDocType.DataBind();
            TxtDocTypeCode.Text = null;
            TxtDocTypeName.Text = null;
            txtDocTypeID.Text = null;

            btNew.Enabled = true;
            btDelete.Enabled = false;
        }

        protected void btNew_Click(object sender, EventArgs e)
        {
            TxtDocTypeCode.Text = null;
            TxtDocTypeName.Text = null;

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
         
            TxtDocTypeCode.Text = ASPxGridViewDocType.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeCode").ToString();
            TxtDocTypeName.Text = ASPxGridViewDocType.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeName").ToString();
            txtDocTypeID.Text = ASPxGridViewDocType.GetRowValues(Convert.ToInt32(e.Parameters), "DocTypeID").ToString();

            btSave.Enabled = false;
            btNew.Enabled = true;

            if (Convert.ToBoolean(ASPxGridViewDocType.GetRowValues(Convert.ToInt32(e.Parameters), "Invalid")) == true)
                btDelete.Enabled = true;
            else
                btDelete.Enabled = false;
            
        }

        protected void SetReadonly()
        {
            TxtDocTypeCode.ReadOnly = true;
            TxtDocTypeName.ReadOnly = true;
        }

        protected void ResetReadonly()
        {
            TxtDocTypeCode.ReadOnly = false;
            TxtDocTypeName.ReadOnly = false;
        }


        protected void ResetInput()
        {
            LabelNotification.Text = null;
            TxtDocTypeCode.Text = null;
            TxtDocTypeName.Text = null;            

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
            if (ASPxGridViewDocType.GetRowValuesByKeyValue(e.EditingKeyValue, "Total").GetType() != DBNull.Value.GetType())
            {
                (ASPxGridViewDocType.Columns["Invalid"] as GridViewDataColumn).EditFormSettings.Visible = DefaultBoolean.False;
            }
            else
            {
                (ASPxGridViewDocType.Columns["Invalid"] as GridViewDataColumn).EditFormSettings.Visible = DefaultBoolean.True;
            }
        }

    }
}