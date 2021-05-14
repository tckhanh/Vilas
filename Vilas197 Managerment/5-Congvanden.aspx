<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="True" CodeBehind="5-Congvanden.aspx.cs" Inherits="LabManagement._5_Congvanden" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"  Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style85
        {
            width: 93px;
        }
        .style87
        {
            width: 236px;
        }
        .style88
        {
            width: 59%;
        }
        .style89
        {
            width: 233px;
        }
        .style90
        {
            width: 22%;
        }
        .style91
        {
            width: 28%;
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
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<dx:ASPxLabel 
            ID="ASPxLabel6" runat="server" Text="QUẢN LÝ CÔNG VĂN ĐẾN" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
    <p>
        &nbsp;</p>
            <table class="style19" style="height: 9px; width: 78%">
                <tr>
                    <td bgcolor="#FFFF99" class="style87">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Thông tin Công văn đến" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
                    </td>
                    <td>
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" 
                    NavigateUrl="~/5-LoaiCongvan.aspx" Text="Cập nhật loại công văn" Font-Bold="True" 
                            Font-Italic="False" Font-Size="Small" ForeColor="#0000CC" />
                    </td>
                    <td>
                <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" 
                    NavigateUrl="~/0-CauhinhHT.aspx" Text="Cập nhật đơn vị ban hành" Font-Bold="True" 
                            Font-Italic="False" Font-Size="Small" ForeColor="#0000CC" />
                    </td>
                    <td>
                <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" 
                    NavigateUrl="~/5-DanhmucCVden.aspx" Text="Trở về trang trước" Font-Bold="True" 
                            Font-Italic="False" Font-Size="Small" ForeColor="#0000CC" />
                    </td>
                </tr>
            </table>
            <table class="style19" style="width: 80%">
                <tr>
                    <td width="25%">
                        &nbsp;</td>
                    <td width="75%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td width="25%">
                        &nbsp;</td>
                    <td width="75%">
                <dx:ASPxLabel ID="lblnotification" runat="server" Font-Italic="True" 
                    Font-Overline="False" Font-Underline="True" ForeColor="Red" 
                    Font-Bold="True">
                </dx:ASPxLabel>
                    </td>
                </tr>
            </table>
            <table style="height: 196px; width: 64%">
                <tr>
                    <td class="style88" width="20%">
                        Loại công văn(*)</td>
                    <td class="style90">
                        <dx:ASPxComboBox ID="CmbType" runat="server" 
                            DataSourceID="SqlDataSourceDocType" 
                            onselectedindexchanged="CmbType_SelectedIndexChanged" TextField="DocCatName" 
                            ValueField="DocCatID" AutoPostBack="True" TextFormatString="{0}" 
                            ValueType="System.Int32" style="margin-bottom: 0px">
                            <Columns>
                                <dx:ListBoxColumn FieldName="DocCatID" Visible="False" />
                                <dx:ListBoxColumn FieldName="DocCatCode" Visible="False" />
                                <dx:ListBoxColumn FieldName="DocCatName" />
                            </Columns>
                        </dx:ASPxComboBox>
                    </td>
                    <td class="style91">
                        Đơn vị ban hành (*)</td>
                    <td width="25%">
                        <dx:ASPxComboBox ID="CmbOffice" runat="server" 
                            DataSourceID="SqlDataSourceOffice" TextField="OfficeName" ValueField="OfficeID" 
                            ValueType="System.Int32" TextFormatString="{1}">
                            <Columns>
                                <dx:ListBoxColumn FieldName="OfficeID" Visible="False" />
                                <dx:ListBoxColumn FieldName="OfficeCode" />
                                <dx:ListBoxColumn FieldName="OfficeName" />
                            </Columns>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="style88" width="20%">
                        Số CV đến tạm lấy (*)</td>
                    <td class="style90">
                        <dx:ASPxTextBox ID="txtSeriNo" runat="server" Width="170px" Enabled="False">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style91">
                        Ngày CV đến (*)</td>
                    <td width="25%">
                        <dx:ASPxDateEdit ID="ASPxDateIn" runat="server">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="style88" width="20%">
                        Số công văn (*)</td>
                    <td class="style90">
                        <dx:ASPxTextBox ID="txtDocNo" runat="server" Width="170px">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style91">
                        Ngày công văn (*)</td>
                    <td width="25%">
                        <dx:ASPxDateEdit ID="ASPxDateIssue" runat="server">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="style88" width="20%">
                        Trích yếu()</td>
                    <td colspan="3" style="width: 60%" width="25%">
                        <dx:ASPxMemo ID="MemoAbout" runat="server" Height="71px" Width="500px">
                        </dx:ASPxMemo>
                    </td>
                </tr>
                <tr>
                    <td class="style88" width="20%">
                        File dữ liệu</td>
                    <td class="style90">
    <strong>
                        <asp:FileUpload ID="FileUpload2" runat="server" />
        </strong>
                    </td>
                    <td class="style91">
                        &nbsp;</td>
                    <td width="25%">
                        &nbsp;</td>
                </tr>
            </table>
            
            <table class="style19" style="height: 31px; width: 60%">
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
            <table class="style19">
                <tr>
                    <td>
    <strong>
                        <dx:ASPxButton ID="ASPxButtonUpload" runat="server" 
                            onclick="ASPxButtonUpload_Click" Text="Tải dữ liệu" Visible="False">
                        </dx:ASPxButton>
        </strong>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtUploadFile" runat="server" Width="400px" Visible="False">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <dx:ASPxTextBox ID="txtURL" runat="server" BackColor="#FFFFCC" Enabled="False" 
                            Width="400px" Visible="False">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table class="style19" style="height: 9px; width: 46%">
                <tr>
                    <td bgcolor="#FFFF99" class="style89">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel8" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh mục Công văn đến" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style89">
                        &nbsp;</td>
                    <td>
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
                <dx:GridViewCommandColumn VisibleIndex="0" Width="50px" ShowEditButton="True">
                    <%--<EditButton Text="Sửa" Visible="True">
                    </EditButton>
                    <CancelButton Text="Hủy bỏ">
                    </CancelButton>
                    <UpdateButton Text="Cập nhật">
                    </UpdateButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="DocID" ReadOnly="True" Visible="False" 
                    VisibleIndex="1" Caption="ID Công văn">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="DocCatID" 
                    ShowInCustomizationForm="True" VisibleIndex="4" Caption="Loại công văn" 
                    Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceDocType" TextField="DocCatName" 
                        ValueField="DocCatID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="SeriNo" VisibleIndex="2" 
                    Caption="Số CV đến" Width="70px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DocDate" VisibleIndex="6" 
                    Caption="Ngày công văn" Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Đơn vị ban hành" FieldName="OfficeID" 
                    VisibleIndex="7" Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceOffice" TextField="OfficeName" 
                        ValueField="OfficeID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn FieldName="About" VisibleIndex="8" Width="200px" 
                    Caption="Trích yếu">
                    <PropertiesMemoEdit Rows="2">
                    </PropertiesMemoEdit>
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings ColumnSpan="2" CaptionLocation="Near" RowSpan="5" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataDateColumn FieldName="InDate" VisibleIndex="3" 
                    Caption="Ngày CV đến" Width="100px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Tập tin" FieldName="URL" 
                    VisibleIndex="9" Width="100px">
<PropertiesHyperLinkEdit Text="File đính kèm">
    <Style Font-Bold="True">
    </Style>
                    </PropertiesHyperLinkEdit>

                    <EditFormSettings Visible="False" />

                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Số công văn" FieldName="DocNo" 
                    VisibleIndex="5" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0}">
                    </PropertiesTextEdit>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ten tap tin" FieldName="FileName" 
                    Visible="False" VisibleIndex="11" Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CreateStaffID" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="10" 
                    Caption="Người tạo" Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" ValueType="System.String">
                    </PropertiesComboBox>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="12" 
                    Caption="Ngày tạo" Visible="False" Width="100px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ModifyStaffID" 
                    ShowInCustomizationForm="True" VisibleIndex="13" Caption="Người cập nhật" 
                    Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffID" ValueType="System.String">
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
                <dx:GridViewDataCheckColumn FieldName="Invalid" VisibleIndex="15" 
                    Caption="Hết hiệu lực" Width="70px">
                    <PropertiesCheckEdit DisplayTextChecked="Hết hiệu lực" 
                        DisplayTextUnchecked="Còn hiệu lực">
                    </PropertiesCheckEdit>
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="Deleted" Visible="False" 
                    VisibleIndex="16" Caption="Bị xóa">
                </dx:GridViewDataCheckColumn>
            </Columns>
            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="true" AllowFocusedRow=true />
            <SettingsEditing EditFormColumnCount="4" />
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
                    Font-Underline="False" Wrap="True">
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
                Text="Hiển thị cả những công văn đã hết hiệu lực" Font-Bold="True" 
                ForeColor="Blue">
            </dx:ASPxCheckBox>
            <p>
            <asp:SqlDataSource ID="SqlDataSourceDocType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            
                
                    
                    SelectCommand="SELECT DocCatID, DocCatCode, DocCatName, Invalid FROM QS_DocCategories WHERE (Invalid = @Invalid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="false" Name="Invalid" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            DeleteCommand="DELETE FROM [QS_DocIn] WHERE [DocID] = @original_DocID" 
            InsertCommand="INSERT INTO [QS_DocIn] ([DocCatID], [SeriNo], [DocNo], [DocDate], [About], [InDate], [FileName], [URL], [CreateStaffID], [CreateDate], [ModifyStaffID], [ModifyDate], [Invalid], [Deleted]) VALUES (@DocCatID, @SeriNo, @DocNo, @DocDate, @About, @InDate, @FileName, @URL, @CreateStaffID, @CreateDate, @ModifyStaffID, @ModifyDate, @Invalid, @Deleted)" 
            SelectCommand="SELECT DocID, DocCatID, SeriNo, DocNo, DocDate, About, InDate, FileName, URL, CreateStaffID, CreateDate, ModifyStaffID, ModifyDate, Invalid, Deleted, OfficeID FROM QS_DocIns WHERE (Deleted = @Deleted) AND (Invalid = @DisplayInvalid OR Invalid = @False)" 
            
            
            UpdateCommand="UPDATE QS_DocIns SET DocNo = @DocNo, DocDate = @DocDate, About = @About, ModifyStaffID = @ModifyStaffID, ModifyDate = @ModifyDate, Invalid = @Invalid, OfficeID = @OfficeID, DocCatID = @DocCatID WHERE (DocID = @DocID)" 
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_DocID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DocCatID" Type="Int32" />
                <asp:Parameter Name="SeriNo" Type="Int32" />
                <asp:Parameter Name="DocNo" Type="String" />
                <asp:Parameter Name="DocDate" DbType="Date" />
                <asp:Parameter Name="About" Type="String" />
                <asp:Parameter Name="InDate" DbType="Date" />
                <asp:Parameter Name="FileName" Type="String" />
                <asp:Parameter Name="URL" Type="String" />
                <asp:Parameter Name="CreateStaffID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="CreateDate" />
                <asp:Parameter Name="ModifyStaffID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="ModifyDate" />
                <asp:Parameter Name="Invalid" Type="Boolean" />
                <asp:Parameter Name="Deleted" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="Deleted" />
                <asp:SessionParameter DefaultValue="False" Name="DisplayInvalid" 
                    SessionField="DisplayInvalid" />
                <asp:Parameter DefaultValue="False" Name="False" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DocNo" />
                <asp:Parameter Name="DocDate" />
                <asp:Parameter Name="About" />
                <asp:Parameter Name="ModifyStaffID" />
                <asp:Parameter Name="ModifyDate" />
                <asp:Parameter Name="Invalid" />
                <asp:Parameter Name="OfficeID" />
                <asp:Parameter Name="DocCatID" />
                <asp:Parameter Name="DocID" />
            </UpdateParameters>
        </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
                    SelectCommand="SELECT [StaffID], [StaffFistName] FROM [Staff]">
                </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceOffice" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            
                
                    
                    SelectCommand="SELECT QS_Offices.* FROM QS_Offices">
        </asp:SqlDataSource>

    </p>
    <p>
  
        &nbsp;</p>
</asp:Content>
