<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="True" CodeBehind="5-Tieuchuan.aspx.cs" Inherits="LabManagement._5_TieuChuan" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style85
        {
            width: 93px;
        }
        .style86
        {
            width: 293px;
        }
        .style87
        {
            width: 223px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <script language="javascript" type="text/javascript">
    // <![CDATA[

            function myGridFocusedRowChanged() {
                // Query the server for the "DocTypeID;DocID;DocTypeCode;Title;Abstract;CreateDate" fields from the focused row 
                // The values will be returned to the OnGetRowValues() function

                grid1.GetRowValues(grid1.GetFocusedRowIndex(), 'StdTypeID;StdID;StdTypeCode;Title;Abstract;CreateDate', myGetRowValues);

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
                    // Query the server for the "StdTypeID;StdID;StdTypeCode;Title;Abstract;CreateDate" fields from the focused row 
                    // The values will be returned to the OnGetRowValues() function

                   grid1.GetRowValues(grid1.GetFocusedRowIndex(), 'StdTypeID;StdID;StdTypeCode;Title;Abstract;CreateDate', myGridRowDoubleClick);

                }

                // Value array contains "StdTypeID;StdID;StdTypeCode;Title;Abstract;CreateDate" field values returned from the server 
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
            ID="ASPxLabel6" runat="server" Text="QUẢN LÝ DANH MỤC TIÊU CHUẨN" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
            <br />
            <table class="style19" style="height: 23px; width: 65%">
                <tr>
                    <td bgcolor="#FFFF99">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Thông tin Tiêu chuẩn" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
                    </td>
                    <td>
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" 
                    NavigateUrl="~/5-LoaiTieuChuan.aspx" Text="Cập nhật loại tiêu chuẩn" Font-Bold="True" 
                            Font-Italic="False" Font-Size="Small" ForeColor="#0000CC" />
                    </td>
                    <td>
                <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" 
                    NavigateUrl="~/5-DanhmucTieuchuan.aspx" Text="Trở về trang trước" Font-Bold="True" 
                            Font-Italic="False" Font-Size="Small" ForeColor="#0000CC" />
                    </td>
                </tr>
                </table>
            <table class="style19" style="height: 9px; width: 67%">
                <tr>
                    <td class="style87">
                        &nbsp;</td>
                    <td>
                <dx:ASPxLabel ID="lblnotification" runat="server" Font-Italic="True" 
                    Font-Overline="False" Font-Underline="True" ForeColor="Red" 
                    Font-Bold="True">
                </dx:ASPxLabel>
                    </td>
                </tr>
            </table>
           
            <table style="height: 254px; width: 73%">
                <tr>
                    <td width="30%">
                        Loại tiêu chuẩn(*)</td>
                    <td width="30%">
                        <dx:ASPxComboBox ID="CmbType" runat="server" 
                            DataSourceID="SqlDataSourceDocType" 
                            onselectedindexchanged="CmbType_SelectedIndexChanged" TextField="StdTypeName" 
                            ValueField="StdTypeID" AutoPostBack="True" TextFormatString="{0}" 
                            ValueType="System.Int32" style="margin-bottom: 0px">
                            <Columns>
                                <dx:ListBoxColumn FieldName="StdTypeID" Visible="False" />
                                <dx:ListBoxColumn FieldName="StdTypeCode" Width="50px" />
                                <dx:ListBoxColumn FieldName="StdTypeName" />
                            </Columns>
                        </dx:ASPxComboBox>
                    </td>
                    <td width="40%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="30%">
                        Mã tiêu chuẩn(*)</td>
                    <td width="30%">
                        <dx:ASPxTextBox ID="TxtDocCode" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td width="40%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="30%">
                        Tên tiêu chuẩn (*)</td>
                    <td colspan="2" style="width: 70%" width="30%">
                        <dx:ASPxTextBox ID="TxtTitle" runat="server" Width="400px">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td width="30%">
                        Tóm tắt()</td>
                    <td colspan="2" width="40%">
                        <dx:ASPxMemo ID="MemoAbstract" runat="server" Height="71px" Width="400px">
                        </dx:ASPxMemo>
                    </td>
                </tr>
                <tr>
                    <td width="30%">
                        Ngày ban hành</td>
                    <td width="30%">
                        <dx:ASPxDateEdit ID="ASPxDateIssue" runat="server">
                        </dx:ASPxDateEdit>
                    </td>
                    <td width="40%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="30%">
                        Ngày có hiệu lực</td>
                    <td width="30%">
                        <dx:ASPxDateEdit ID="ASPxDateValid" runat="server">
                        </dx:ASPxDateEdit>
                    </td>
                    <td width="40%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="30%">
                        File dữ liệu (*)</td>
                    <td width="30%">
    <strong>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
        </strong>
                    </td>
                    <td width="40%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="30%">
    <strong>
                        <dx:ASPxButton ID="ASPxButtonUpload" runat="server" 
                            onclick="ASPxButtonUpload_Click" Text="Tải dữ liệu">
                        </dx:ASPxButton>
        </strong>
                    </td>
                    <td colspan="2" style="width: 70%" width="30%">
                        <dx:ASPxTextBox ID="txtUploadFile" runat="server" Width="400px">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td width="30%">
                
                        Tập tin liên kết</td>
                    <td colspan="2" style="width: 70%" width="30%">
                        <dx:ASPxTextBox ID="txtURL" runat="server" BackColor="#FFFFCC" Enabled="False" 
                            Width="400px">
                        </dx:ASPxTextBox>
                    </td>
                </tr>                
            </table>
            
            <br />
            <table class="style19" style="height: 34px; width: 77%">
                <tr>
                    <td>
                <dx:ASPxTextBox ID="txtDocID" runat="server" Width="170px" 
                    BackColor="#FFFFCC" Visible="False">
                </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtTypeCode" runat="server" Width="170px" Visible="False">
                        </dx:ASPxTextBox>
                    </td>                    
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
            <br />
            <br />
            <br />
            <table class="style19" style="height: 9px; width: 46%">
                <tr>
                    <td bgcolor="#FFFF99" class="style86">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel8" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh mục Tiêu chuẩn" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
       
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSource1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue" onrowupdating="ASPxGridView1_RowUpdating" 
            KeyFieldName="StdID" 
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
                    Width="50px" ShowEditButton="True">
                    <%--<EditButton Text="Sửa" Visible="True">
                    </EditButton>
                    <CancelButton Text="Hủy bỏ">
                    </CancelButton>
                    <UpdateButton Text="Cập nhật">
                    </UpdateButton>
                    <ClearFilterButton Visible="True">
                    </ClearFilterButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="StdID" ReadOnly="True" VisibleIndex="1" 
                    Visible="False" Width="50px">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Mã tiêu chuẩn" FieldName="URL" 
                    ShowInCustomizationForm="True" VisibleIndex="3" Width="150px">
                    <PropertiesHyperLinkEdit TextField="StdCode">
                    </PropertiesHyperLinkEdit>
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="StdTitle" VisibleIndex="4" Width="200px" 
                    Caption="Tên tiêu chuẩn">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="StdTypeID" VisibleIndex="2" 
                    Caption="Loại tiêu chuẩn" Width="70px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDocType" TextField="StdTypeCode" 
                        ValueField="StdTypeID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="IssueDate" VisibleIndex="7" 
                    Caption="Ngày ban hành" Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="ValidDate" VisibleIndex="8" 
                    Caption="Ngày hiệu lực" Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="CreateStaffID" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="10" 
                    Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="11" 
                    Visible="False" Caption="Ngày tạo" Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="ModifyStaffID" VisibleIndex="12" 
                    Visible="False" Caption="Người cập nhật" Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ModifyDate" VisibleIndex="13" 
                    Visible="False" Caption="Ngày cập nhật" Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataCheckColumn FieldName="Invalid" VisibleIndex="14" 
                    Caption="Hết hiệu lực" Width="70px">
                    <PropertiesCheckEdit DisplayTextChecked="Hết hiệu lực" 
                        DisplayTextUnchecked="Còn hiệu lực">
                    </PropertiesCheckEdit>
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataMemoColumn FieldName="Abstract" ShowInCustomizationForm="True" 
                    VisibleIndex="6" Width="300px" Caption="Ghi chú">
                    <PropertiesMemoEdit Rows="4">
                    </PropertiesMemoEdit>
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings CaptionLocation="Near" ColumnSpan="2" RowSpan="1" 
                        Visible="True" />
                </dx:GridViewDataMemoColumn>
            </Columns>
            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" 
                ConfirmDelete="true" AllowFocusedRow=true AutoExpandAllGroups="True" />
            <Settings GroupFormat="" ShowFilterRow="True" 
                ShowFilterRowMenu="True" UseFixedTableLayout="True" />
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
                oncheckedchanged="ASPxCheckBox1_CheckedChanged" 
                Text="Hiển thị cả những tài liệu đã hết hiệu lực" Font-Bold="True" 
                ForeColor="Blue">
            </dx:ASPxCheckBox>
            <p>
            <asp:SqlDataSource ID="SqlDataSourceDocType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            
                
                    SelectCommand="SELECT StdTypeID, StdTypeCode, StdTypeName FROM QS_StandardTypes WHERE (Invalid = @Invalid) ORDER BY StdTypeCode">
            <SelectParameters>
                <asp:Parameter DefaultValue="false" Name="Invalid" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            DeleteCommand="DELETE FROM [QS_Documents] WHERE [DocID] = @original_DocID" 
            InsertCommand="INSERT INTO QS_Documents(DocCode, DocTypeID, Title, Abstract, CreateDate, CreateStaffID, ModifyDate, ModifyStaffID) VALUES (@DocCode, @DocTypeID, @Title, @Abstract, @CreateDate, @CreateStaffID, @ModifyDate, @ModifyStaffID)" 
            SelectCommand="SELECT StdID, StdCode, StdTitle, StdTypeID, FileName, URL, ValidDate, CreateStaffID, CreateDate, ModifyStaffID, ModifyDate, Invalid, Abstract, IssueDate, Deleted FROM QS_Standards WHERE (Invalid = @DisplayInvalid OR Invalid = @False) AND (Deleted = @Deleted)" 
            
            
            UpdateCommand="UPDATE QS_Standards SET StdTitle = @StdTitle, Abstract = @Abstract, ModifyDate = @ModifyDate, ModifyStaffID = @ModifyStaffID, Invalid = @Invalid, FileName = @FileName, ValidDate = @ValidDate, IssueDate = @IssueDate WHERE (StdID = @StdID)" 
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_DocID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DocCode" />
                <asp:Parameter Name="DocTypeID" />
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
                <asp:CookieParameter CookieName="@DisplayInvalid" DefaultValue="False" 
                    Name="DisplayInvalid" />
                <asp:Parameter DefaultValue="False" Name="False" />
                <asp:Parameter DefaultValue="False" Name="Deleted" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="StdTitle" />
                <asp:Parameter Name="Abstract" Type="String" />
                <asp:Parameter DbType="Date" Name="ModifyDate" />
                <asp:Parameter Name="ModifyStaffID" Type="String" />
                <asp:Parameter Name="Invalid" />
                <asp:Parameter Name="FileName" />
                <asp:Parameter Name="ValidDate" />
                <asp:Parameter Name="IssueDate" />
                <asp:Parameter Name="StdID" />
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
