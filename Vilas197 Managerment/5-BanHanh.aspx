<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="True" CodeBehind="5-BanHanh.aspx.cs" Inherits="LabManagement._5_BanHanh" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style88
        {
            width: 630px;
            height: 26px;
        }
        .style89
        {
            height: 26px;
        }
        .style91
        {
            width: 30%;
            height: 30px;
        }
        .style92
        {
            width: 30%;
            height: 30px;
        }
        .style93
        {
            width: 40%;
            height: 30px;
        }
        .style99
        {
            width: 174px;
            height: 11px;
        }
        .style100
        {
            height: 11px;
        }
        .style101
        {
            width: 229px;
        }
        .style102
        {
            width: 178px;
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
                var filterCondition = "[DocID] == " + txtID2.GetText();
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
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxLabel 
            ID="ASPxLabel6" runat="server" Text="CẬP NHẬT BAN HÀNH TÀI LIỆU HỆ THỐNG CHẤT LƯỢNG" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
    <p>
        &nbsp;&nbsp;</p>
            <strong>
            <br />
            <table class="style19" style="width: 79%">
                <tr>
                    <td bgcolor="#FFFF99" class="style101">
                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" CssClass="style19" 
                            Font-Bold="True" Font-Italic="False" Font-Size="Medium" ForeColor="#CC3300" 
                            Text="Cập nhật tài liệu ban hành">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblSelectedDocName1" runat="server" Font-Size="Medium" 
                            ForeColor="Blue" style="font-weight: 700">
                        </dx:ASPxLabel>
                    </td>
                </tr>
            </table>
        </strong>

            <table class="style19" style="width: 102%; height: 235px;">
                <tr>
                    <td class="style88" width="40%">
                        </td>
                    <td class="style89" colspan="2">
                        <dx:ASPxLabel ID="lblnotification" runat="server" Font-Bold="True" 
                            Font-Italic="True" Font-Underline="True" ForeColor="Red">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td class="style91" width="40%">
                        Lần ban hành(*)</td>
                    <td class="style92">
                        <dx:ASPxTextBox ID="txtIssueNo" runat="server" Width="188px">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style93">
                        </td>
                </tr>
                <tr>
                    <td class="style91" width="40%">
                        Ngày ban hành(*)</td>
                    <td class="style92">
                        <dx:ASPxDateEdit ID="ASPxDateIssue" runat="server" Width="188px">
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="style93">
                        </td>
                </tr>
                <tr>
                    <td class="style91" width="40%">
                        File dữ liệu (*)</td>
                    <td class="style92">
    <strong>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
        </strong>
                    </td>
                    <td class="style93">
                        </td>
                </tr>
                <tr>
                    <td class="style91" width="40%">
                        Số QĐ ban hành(*)</td>
                    <td class="style92">
    <strong>
                        <dx:ASPxTextBox ID="txtDecisionNo" runat="server" Height="16px" Width="188px">
                        </dx:ASPxTextBox>
        </strong>
                    </td>
                    <td class="style93">
                        <dx:ASPxCheckBox ID="chkKeepInfo" runat="server" Font-Bold="True" 
                            Text="  Giữ lại các thông tin ban hành">
                        </dx:ASPxCheckBox>
                        </td>
                </tr>
                <tr>
                    <td class="style91" width="40%">
                        Ngày quyết định(*)</td>
                    <td class="style92">
    <strong>
                        <dx:ASPxDateEdit ID="DateEditDecisionDate" runat="server" Height="16px" 
                            Width="188px">
                        </dx:ASPxDateEdit>
        </strong>
                    </td>
                    <td class="style93">
                        </td>
                </tr>
                <tr>
                    <td class="style91" width="40%">
                        Ghi chú sự thay đổi</td>
                    <td class="style92" colspan="2">
    <strong>
                        <dx:ASPxMemo ID="MemoNotes" runat="server" Height="71px" Width="450px">
                        </dx:ASPxMemo>
        </strong>
                    </td>
                </tr>                
            </table>
            <table class="style19" style="height: 61px; width: 72%">                
                <tr>
                    <td width="20%">
                        &nbsp;</td>
                    <td width="20%">
    <strong>
                <dx:ASPxButton ID="btSave0" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu" 
                            Enabled="False" onclick="btSave0_Click" Height="23px" Width="75px" 
                            Font-Bold="True">
                </dx:ASPxButton>
        </strong>
                    </td>
                    <td width="20%">
    <strong>
                <dx:ASPxButton ID="btDelete0" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa" 
                            Enabled="False" onclick="btDelete0_Click" Height="23px" Width="71px" 
                            Font-Bold="True">
                </dx:ASPxButton>
        </strong>
                    </td>
                    <td width="20%">
                <strong>
                
                        <dx:ASPxButton ID="btnCacel" runat="server" Height="25px" 
                            onclick="btnCacel_Click" Text="Hủy bỏ" Width="79px" 
                            CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                            Enabled="False" Font-Bold="True">
                        </dx:ASPxButton>
        </strong>
                    </td>
                    <td width="20%">
    <strong>
                <dx:ASPxButton ID="btNew0" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo mới" 
                            Enabled="False" EnableTheming="True" onclick="btNew0_Click" 
                            Font-Bold="True">
                </dx:ASPxButton>
        </strong>
                    </td>
                </tr>
            </table>
            <table class="style19">
                <tr>
                    <td>
                        <dx:ASPxButton ID="ASPxButtonUpload" runat="server" 
                            onclick="ASPxButtonUpload_Click" Text="Tải dữ liệu" Visible="False">
                        </dx:ASPxButton>
                    </td>
                    <td>
    <strong>
                        <dx:ASPxTextBox ID="txtUploadFile" runat="server" 
                            ClientInstanceName="txtUploadFile" Height="16px" 
                            BackColor="#FFFFCC" ReadOnly="True" NullText="Tập tin tài liệu ban hành" 
                            Width="450px" Visible="False">
                        </dx:ASPxTextBox>
        </strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <dx:ASPxTextBox ID="txtURL" runat="server" Enabled="False" Width="450px" 
                            Visible="False">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
            <table class="style19" style="height: 12px; width: 67%">
                    <tr>
                        <td bgcolor="#FFFF99" class="style102">       
                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
                                Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
                                Text="Danh mục tài liệu" ForeColor="#CC3300">
                            </dx:ASPxLabel>
                        </td>
                            
                        <td style="text-align: center">
                            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Font-Bold="True" 
                                Font-Italic="True" ForeColor="Blue" NavigateUrl="~/5-TaiLieu.aspx" 
                            Text="Cập nhật Danh mục tài liệu" Font-Size="Medium" 
                                style="text-align: left" />
                        </td>
                    </tr>
                </table>
               
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSource1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue" 
            KeyFieldName="DocID" oncustomcallback="ASPxGridView1_CustomCallback">
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
            <dx:GridViewDataTextColumn FieldName="DocID" VisibleIndex="3" 
                    ReadOnly="True" ShowInCustomizationForm="True" Caption="ID tài liệu" 
                    Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocCode" 
                    VisibleIndex="4" ShowInCustomizationForm="True" Width="100px" 
                    Caption="Mã tài liệu">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocTypeName" Visible="False" 
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="DocTypeID" VisibleIndex="0" 
                    Caption="Mã loại tài liệu" Width="70px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDocType" TextField="DocTypeCode" 
                        ValueField="DocTypeID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="5" 
                    ShowInCustomizationForm="True" Width="200px" Caption="Tên tài liệu">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ModifyDate" 
                    VisibleIndex="6" ShowInCustomizationForm="True" Caption="Ngày cập nhật" 
                    Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ModifyStaffID" 
                    ShowInCustomizationForm="True" VisibleIndex="8" Caption="Mã người cập nhật" 
                    Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" 
                AllowFocusedRow="true" AutoExpandAllGroups="True"/>
            <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterBar="Auto" 
                ShowFilterRow="True" ShowFilterRowMenu="True" />
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
                <GroupRow Font-Bold="True" Font-Size="Larger" ForeColor="#CC3300">
                </GroupRow>
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
                Font-Bold="True" oncheckedchanged="ASPxCheckBox1_CheckedChanged1" 
                Text="Hiển thị cả những tài liệu đã hết hiệu lực" ForeColor="Blue">
            </dx:ASPxCheckBox>
            <strong>
            <br />
        </strong>

            <br />

                    <table class="style19" style="height: 26px; width: 79%">
                <tr>
                    <td class="style99" bgcolor="#FFFF99">
    <strong>
        <dx:ASPxLabel ID="ASPxLabel9" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Nhật ký ban hành" ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;</strong></td>
                    <td class="style100">
    <strong>
                        <dx:ASPxLabel ID="lblSelectedDocName" runat="server" ForeColor="Blue" Font-Size="Medium">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="lblDocID" runat="server" Visible="False">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="lblDocCode" runat="server" Visible="False">
                        </dx:ASPxLabel>
                        <dx:ASPxLabel ID="lblIssueID" runat="server" Visible="False">
                        </dx:ASPxLabel>
                        </strong></td>
                </tr>
            </table>

            <p>
                <strong>
        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" 
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
            DataSourceID="SqlDataSource2" KeyFieldName="IssueID" 
            ClientInstanceName="grid2" oncustomcallback="ASPxGridView2_CustomCallback" 
                    EnableCallBacks="False" onrowupdating="ASPxGridView2_RowUpdating" 
                    Width="702px" onstartrowediting="ASPxGridView2_StartRowEditing1">
            <ClientSideEvents RowDblClick="function(s, e) {
	s.PerformCallback(s.GetFocusedRowIndex());
}" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" 
                    Width="50px" ShowEditButton="True">
                    <%--<EditButton Text="Sửa" Visible="True">
                    </EditButton>
                    <CancelButton Text="Hủy bỏ">
                    </CancelButton>
                    <UpdateButton Text="Cập nhật">
                    </UpdateButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="IssueID" VisibleIndex="1" 
                    ReadOnly="True" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocID" VisibleIndex="2" ReadOnly="True" 
                    Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Lần ban hành" FieldName="URL" 
                    ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                    <PropertiesHyperLinkEdit TextField="IssueNo">
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Ngày ban hành" FieldName="URL" 
                    ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                    <PropertiesHyperLinkEdit TextField="IssueDate" TextFormatString="dd/mm/yyyy">
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="DecisionNo" VisibleIndex="5" 
                    Caption="Số Quyết định" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DecisionDate" VisibleIndex="6" 
                    Caption="Ngày Quyết định" Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn Caption="Ghi chú các thay đổi" 
                    FieldName="NotesOfUpdating" VisibleIndex="9" Width="200px">
                    <PropertiesMemoEdit Height="75px">
                    </PropertiesMemoEdit>
                    <EditFormSettings CaptionLocation="Near" ColumnSpan="2" RowSpan="5" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="URL" VisibleIndex="8" 
                    Caption="Đường liên kết" Visible="False">
                    <PropertiesHyperLinkEdit TextField="FileName">
                    </PropertiesHyperLinkEdit>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataDateColumn FieldName="ExpireDate" VisibleIndex="10" 
                    Visible="False">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataCheckColumn FieldName="Invalid" VisibleIndex="15" 
                    Caption="Hết hiệu lực" Width="70px">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="CreateStaffID" 
                    VisibleIndex="11" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="12" 
                    Visible="False">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người cập nhật" 
                    FieldName="ModifyStaffID" ShowInCustomizationForm="True" VisibleIndex="13" 
                    Width="70px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="ModifyDate" VisibleIndex="14" 
                    Caption="Ngày cập nhật" Width="100px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Tên tập tin" FieldName="FileName" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                AllowSelectSingleRowOnly="True" />
            
            <SettingsPager ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Tiếp &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Trước">
                </PrevPageButton>
            </SettingsPager>
            <Settings EnableFilterControlPopupMenuScrolling="True" ShowPreview="True" 
                UseFixedTableLayout="True" />
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
                    HorizontalAlign="Center" Wrap="True">
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
        </strong>
    </p>
            <p>
                &nbsp;</p>
            
            <asp:SqlDataSource ID="SqlDataSourceDocType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            
                
                SelectCommand="SELECT DocTypeID, DocTypeCode, DocTypeName FROM QS_DocTypes ORDER BY DocTypeCode">
        </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
                SelectCommand="SELECT StaffID, StaffFistName FROM Staff">
            </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            DeleteCommand="DELETE FROM [QS_Documents] WHERE [DocID] = @original_DocID" 
            InsertCommand="INSERT INTO QS_Documents(DocCode, DocTypeID, Title, Abstract, CreateDate, CreateStaffID, ModifyDate, ModifyStaffID) VALUES (@DocCode, @DocTypeID, @Title, @Abstract, @CreateDate, @CreateStaffID, @ModifyDate, @ModifyStaffID)" 
            SelectCommand="SELECT QS_Documents.DocID, QS_Documents.DocCode, QS_Documents.DocTypeID, QS_Documents.Title, QS_Documents.ModifyDate, QS_Documents.ModifyStaffID, QS_Documents.Invalid, QS_Documents.Deleted, QS_DocTypes.DocTypeName, QS_DocTypes.DocTypeCode FROM QS_Documents INNER JOIN QS_DocTypes ON QS_Documents.DocTypeID = QS_DocTypes.DocTypeID WHERE (QS_Documents.Deleted = @Deleted1) AND (QS_Documents.Invalid = @DisplayInvalid1 OR QS_Documents.Invalid = @False1) ORDER BY QS_Documents.DocCode" 
            
            
            UpdateCommand="UPDATE QS_Documents SET Title = @Title, Abstract = @Abstract, ModifyDate = @ModifyDate, ModifyStaffID = @ModifyStaffID WHERE (DocID = @original_DocID)" 
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
                <asp:Parameter DefaultValue="False" Name="Deleted1" />
                <asp:SessionParameter DefaultValue="False" Name="DisplayInvalid1" 
                    SessionField="DisplayInvalid1" />
                <asp:Parameter DefaultValue="False" Name="False1" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Abstract" Type="String" />
                <asp:Parameter DbType="Date" Name="ModifyDate" />
                <asp:Parameter Name="ModifyStaffID" Type="String" />
                <asp:Parameter Name="original_DocID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
                SelectCommand="SELECT IssueID, DocID, IssueNo, IssueDate, DecisionNo, DecisionDate, NotesOfUpdating, FileName, URL, ExpireDate, Invalid, CreateStaffID, CreateDate, ModifyStaffID, ModifyDate, Deleted FROM QS_DocIssues" 
                
                
                    
                
                UpdateCommand="UPDATE QS_DocIssues SET DecisionNo = @DecisionNo, DecisionDate = @DecisionDate, NotesOfUpdating = @NotesOfUpdating, Invalid = @Invalid, ModifyStaffID = @ModifyStaffID, ModifyDate = @ModifyDate WHERE (IssueID = @IssueID)">
                <UpdateParameters>
                    <asp:Parameter Name="DecisionNo" />
                    <asp:Parameter Name="DecisionDate" />
                    <asp:Parameter Name="NotesOfUpdating" />
                    <asp:Parameter Name="Invalid" />
                    <asp:Parameter Name="ModifyStaffID" />
                    <asp:Parameter Name="ModifyDate" />
                    <asp:Parameter Name="IssueID" />
                </UpdateParameters>
            </asp:SqlDataSource>

            </asp:Content>
