<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="True" CodeBehind="5-TaiLieu.aspx.cs" Inherits="LabManagement._5_TaiLieu" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style32
    {
        width: 802px;
        font-size: medium;
    }
    .style33
    {
        width: 189px;
    }
        .style64
        {
            width: 268435232px;
        }
        .style69
        {
            width: 79px;
        }
        .style74
        {
        }
        .style75
        {
            width: 472px;
        }
        .style77
        {
            width: 141px;
        }
        .style85
        {
            width: 93px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <script language="javascript" type="text/javascript">
    // <![CDATA[

            function myGridFocusedRowChanged() {
                // Query the server for the "DocTypeID;DocID;DocTypeCode;Title;Abstract;CreateDate" fields from the focused row 
                // The values will be returned to the OnGetRowValues() function

                grid1.GetRowValues(grid1.GetFocusedRowIndex(), 'DocTypeID;DocID;DocTypeCode;Title;Abstract;CreateDate', myGetRowValues);

            }

            // Value array contains "DocTypeID;DocID;DocTypeCode;Title;Abstract;CreateDate" field values returned from the server 
            function myGetRowValues(values) {
                //CmbDocType.SetValue(values[0]);
                txtID2.SetText(values[1]);
                TxtDocCode.SetText(values[2]);
                TxtTitle.SetText(values[3]);
                //MemoAbstract.SetText(values[4]);
                //ASPxDateCreate.SetValue(values[5]);
                var filterCondition = "[DocID] == " txtID2.GetText();
                grid2.ApplyFilter(filterCondition);
                }

               function OnGridRowDoubleClick() {
                    // Query the server for the "DocTypeID;DocID;DocTypeCode;Title;Abstract;CreateDate" fields from the focused row 
                    // The values will be returned to the OnGetRowValues() function

                   grid1.GetRowValues(grid1.GetFocusedRowIndex(), 'DocTypeID;DocID;DocTypeCode;Title;Abstract;CreateDate', myGridRowDoubleClick);

                }

                // Value array contains "DocTypeID;DocID;DocTypeCode;Title;Abstract;CreateDate" field values returned from the server 
                function myGridRowDoubleClick(values) {
                    CmbDocType.SetValue(values[0]);
                    txtID2.SetText(values[1]);
                    TxtDocCode.SetText(values[2]);
                    TxtTitle.SetText(values[3]);
                    MemoAbstract.SetText(values[4]);
                    ASPxDateCreate.SetValue(values[5]);
                }
                                
    function OnBtnUploadClick(s, e){
            if(uploadControl.GetText() != ""){
                lblCompleteMessage.SetVisible(false);
                pbUpload.SetPosition(0);
                uploadControl1.Upload();
                btnUpload.SetEnabled(false);
                pnlProgress.SetVisible(true);
            }
        }
        
        function OnUploadProgressChanged(s, e){
            pbUpload.SetPosition(e.progress);
        }
        
        function OnFileUploadComplete(s, e){
            if(e.isValid){
                btnCancel.SetVisible(false);
                btnUpload.SetEnabled(true);
                pbUpload.SetPosition(100);
                lblCompleteMessage.SetVisible(true);
            }
            else{
                btnUpload.SetEnabled(true);
                pnlProgress.SetVisible(false);
            }
        }
        
        function OnBtnCancelClick(s, e){
            uploadControl.Cancel();
            btnUpload.SetEnabled(true);
            pnlProgress.SetVisible(false);
        }
        
        function OnUploadControlTextChanged(s, e){
            btnUpload.SetEnabled(s.GetText() != "");
        }



    // ]]>
    </script>

    <p>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxLabel 
            ID="ASPxLabel6" runat="server" Text="QUẢN LÝ TÀI LIỆU HỆ THỐNG CHẤT LƯỢNG" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
            <p>
                &nbsp;</p>
            <table class="style19" style="width: 41%">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Font-Bold="True" 
                            NavigateUrl="~/5-BanHanhV2.aspx" Text="Trở về trang trước" 
                            ForeColor="#0000CC" Font-Size="Small" />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#FFFF99">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Thông tin Tài liệu HTCL" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
    <p>
                <dx:ASPxLabel ID="lblnotification" runat="server" Font-Italic="True" 
                    Font-Overline="False" Font-Underline="True" ForeColor="Red" 
                    Font-Bold="True">
                </dx:ASPxLabel>
    </p>
            <table class="style19" style="width: 61%; margin-right: 0px; height: 211px;">
                <tr>
                    <td class="style75">
                        Loại tài liệu(*)</td>
                    <td class="style77">
                <dx:ASPxComboBox ID="CmbDocType" runat="server" 
                    DataSourceID="SqlDataSourceDocType" IncrementalFilteringMode="Contains" 
                    TextField="DocTypeName" TextFormatString="{1}" ValueField="DocTypeID" 
                    ValueType="System.Int32" Height="16px" AutoPostBack="True" 
                    onselectedindexchanged="CmbDocType_SelectedIndexChanged" 
                    ClientInstanceName="CmbDocType" Width="259px" AllowMouseWheel="False">
                    <Columns>
                        <dx:ListBoxColumn FieldName="DocTypeID" Visible="False" />
                        <dx:ListBoxColumn FieldName="DocTypeCode" Width="10px" />
                        <dx:ListBoxColumn FieldName="DocTypeName" />
                    </Columns>
                </dx:ASPxComboBox>
                    </td>
                    <td>
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" 
                    NavigateUrl="~/5-LoaiTaiLieu.aspx" Text="Tạo mới loại tài liệu" Font-Bold="True" 
                            Font-Italic="False" ForeColor="#0000CC" Font-Size="Small" />
                    </td>
                    <td>
                <dx:ASPxTextBox ID="txtDocID" runat="server" Width="170px" 
                    BackColor="#FFFFCC" Visible="False">
                </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style75">
                        Mã tài liệu(*)</td>
                    <td class="style77">
                <dx:ASPxTextBox ID="TxtDocCode" runat="server" Width="257px" 
                    ClientInstanceName="TxtDocCode" Height="16px">
                </dx:ASPxTextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style75">
                        Tiêu đề (*)</td>
                    <td class="style74" colspan="2">
                <dx:ASPxTextBox ID="TxtTitle" runat="server" Width="400px" 
                    ClientInstanceName="TxtTitle">
                </dx:ASPxTextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style75">
                        Tóm tắt</td>
                    <td class="style74" colspan="2">
                <dx:ASPxMemo ID="MemoAbstract" runat="server" Height="100px" Width="320px" 
                    ClientInstanceName="MemoAbstract">
                </dx:ASPxMemo>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style75">
                        &nbsp;</td>
                    <td class="style77">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            <table style="width: 569px">
                <tr>
                    <td class="style85">
                        &nbsp;</td>
                    <td>
                <dx:ASPxButton ID="btSave" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu" 
                    onclick="btSave_Click" Enabled="False" Height="25px" Width="69px" Font-Bold="True">
                </dx:ASPxButton>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                <dx:ASPxButton ID="btDelete" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa" 
                    onclick="btDelete_Click" Enabled="False" Width="65px" Font-Bold="True">
                </dx:ASPxButton>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnCacel" runat="server" Text="Hủy bỏ" 
                            CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                            Enabled="False" onclick="btnCacel_Click" Width="74px" Font-Bold="True">
                        </dx:ASPxButton>
                    </td>
                    <td>
                <dx:ASPxButton ID="btNew" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo mới" 
                    onclick="btNew_Click" Width="81px" Height="25px" Font-Bold="True">
                </dx:ASPxButton>
                    </td>
                </tr>
            </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh mục tài liệu" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
    </p>
    <table class="style32">
        <tr>
            <td class="style69">
                &nbsp;</td>
            <td colspan="3" id="Td4" class="style64">
                &nbsp;</td>
            <td class="style33">
                &nbsp;</td>
            <td colspan="3" id="Td5" class="style64">
                &nbsp;</td>
        </tr>
    </table>
    
    
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSource1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue" onrowupdating="ASPxGridView1_RowUpdating" 
            KeyFieldName="DocID" 
            oncustomcallback="ASPxGridView1_CustomCallback" 
                oninitnewrow="ASPxGridView1_InitNewRow" 
                onstartrowediting="ASPxGridView1_StartRowEditing" 
                oncelleditorinitialize="ASPxGridView1_CellEditorInitialize">
            <SettingsPager Summary-Text="">
                <NextPageButton Text="Tiếp">
                </NextPageButton>
                <PrevPageButton Text="Trước">
                </PrevPageButton>
                <Summary Text="">
                </Summary>
            </SettingsPager>
            <ClientSideEvents RowDblClick="function(s, e) {
	s.PerformCallback(s.GetFocusedRowIndex());
}"

                
             />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" 
                    Width="50px" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True">
                    <%--<EditButton Text="Sửa" Visible="True">
                    </EditButton>
                    <NewButton Text="Thêm">
                    </NewButton>
                    <DeleteButton Text="Xóa">
                    </DeleteButton>
                    <CancelButton Text="Hủy hỏ">
                    </CancelButton>
                    <UpdateButton Text="Cập nhật">
                    </UpdateButton>--%>
                </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="DocID" Visible="False" VisibleIndex="4" 
                    Caption="ID tài liệu" ReadOnly="True">
                 <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocCode" 
                    VisibleIndex="5" Caption="Mã tài liệu" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Mã loại tài liệu" 
                    FieldName="DocTypeID" VisibleIndex="2" Width="70px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDocType" TextField="DocTypeCode" 
                        ValueField="DocTypeID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="6" 
                    Caption="Tiêu đề" Width="200px">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings ColumnSpan="2" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="Tóm tắt" FieldName="Abstract" 
                    VisibleIndex="7" Width="250px">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings CaptionLocation="Near" ColumnSpan="2" RowSpan="3" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" 
                    VisibleIndex="8" Caption="Ngày tạo" Width="100px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người tạo" FieldName="CreateStaffID" 
                    Visible="False" VisibleIndex="9" Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày cập nhật" FieldName="ModifyDate" 
                    VisibleIndex="10" Width="100px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người cập nhật" 
                    FieldName="ModifyStaffID" VisibleIndex="11" Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Total" Visible="False" VisibleIndex="12" 
                    Width="70px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Invalid" VisibleIndex="13" 
                    Caption="Hết hiệu lực" Width="70px">
                    <PropertiesCheckEdit DisplayTextChecked="Hết hiệu lực" 
                        DisplayTextUnchecked="Còn hiệu lực">
                    </PropertiesCheckEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataCheckColumn>
            </Columns>
            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="true" AllowFocusedRow=true />
            <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterBar="Auto" 
                ShowFilterRow="True" ShowFilterRowMenu="True" UseFixedTableLayout="True" />
            <SettingsText ConfirmDelete="Bạn có muốn xóa thông tin về mẫu đo này không" />
            <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                </LoadingPanelOnStatusBar>
                <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                </LoadingPanel>
            </Images>
            <ImagesFilterControl>
                <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanel>
            </ImagesFilterControl>
            <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue">
                <Header ImageSpacing="10px" SortingImageSpacing="10px" Font-Bold="True" 
                    Font-Size="Small" HorizontalAlign="Center" VerticalAlign="Middle" 
                    Wrap="True">
                </Header>
                <AlternatingRow Enabled="True">
                </AlternatingRow>
            </Styles>
            <StylesEditors>
                <CalendarHeader Spacing="11px">
                </CalendarHeader>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
        </dx:ASPxGridView>
            <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" AutoPostBack="True" 
                oncheckedchanged="ASPxCheckBox1_CheckedChanged" 
                Text="Hiển thị cả những tài liệu đã hết hiệu lực" Font-Bold="True" 
                ForeColor="#0033CC">
            </dx:ASPxCheckBox>
            <p>
            <asp:SqlDataSource ID="SqlDataSourceDocType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            
                
                    SelectCommand="SELECT DocTypeID, DocTypeCode, DocTypeName, Invalid FROM QS_DocTypes ORDER BY DocTypeCode">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            DeleteCommand="DELETE FROM [QS_Documents] WHERE [DocID] = @original_DocID" 
            InsertCommand="INSERT INTO QS_Documents(DocCode, DocTypeID, Title, Abstract, CreateDate, CreateStaffID, ModifyDate, ModifyStaffID) VALUES (@DocCode, @DocTypeID, @Title, @Abstract, @CreateDate, @CreateStaffID, @ModifyDate, @ModifyStaffID)" 
            SelectCommand="SELECT QS_Documents.DocID, QS_Documents.DocCode, QS_Documents.DocTypeID, QS_Documents.Title, QS_Documents.Abstract, QS_Documents.CreateDate, QS_Documents.CreateStaffID, QS_Documents.ModifyDate, QS_Documents.ModifyStaffID, QS_Documents.Invalid, QS_Documents.Deleted, DocIssuesGroupbyDocID.Total FROM QS_Documents LEFT OUTER JOIN DocIssuesGroupbyDocID ON QS_Documents.DocID = DocIssuesGroupbyDocID.DocID WHERE (QS_Documents.Deleted = @Deleted) AND ((QS_Documents.Invalid = @False) OR (QS_Documents.Invalid = @DisplayInvalid)) ORDER BY QS_Documents.DocCode" 
            
            
            UpdateCommand="UPDATE QS_Documents SET DocCode = @DocCode, Title = @Title, Abstract = @Abstract, ModifyDate = @ModifyDate, ModifyStaffID = @ModifyStaffID, Invalid = @Invalid WHERE (DocID = @DocID)" 
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_DocID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TxtDocCode" Name="DocCode" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="CmbDocType" Name="DocTypeID" 
                    PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="TxtTitle" Name="Title" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="MemoAbstract" Name="Abstract" 
                    PropertyName="Text" Type="String" />
                <asp:Parameter Name="CreateDate" DbType="Date" />
                <asp:Parameter Name="CreateStaffID" Type="String" />
                <asp:Parameter Name="ModifyDate" DbType="Date" />
                <asp:Parameter Name="ModifyStaffID" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="Deleted" />
                <asp:Parameter DefaultValue="False" Name="False" />
                <asp:SessionParameter DefaultValue="False" Name="DisplayInvalid" 
                    SessionField="DisplayInvalid" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DocCode" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Abstract" Type="String" />
                <asp:Parameter DbType="Date" Name="ModifyDate" />
                <asp:Parameter Name="ModifyStaffID" Type="String" />
                <asp:Parameter Name="Invalid" />
                <asp:Parameter Name="DocID" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            
                SelectCommand="SELECT StaffID, StaffFistName FROM Staff">
        </asp:SqlDataSource>

    </p>
    <p>
  
        &nbsp;</p>
</asp:Content>
