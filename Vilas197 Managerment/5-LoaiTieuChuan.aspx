<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="5-LoaiTieuChuan.aspx.cs" Inherits="LabManagement._5_LoaiTieuChuan" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


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
        .style58
        {
            width: 58%;
            height: 22px;
        }
        .style60
        {
            height: 53px;
            width: 277px;
        }
        .style59
        {
            width: 259px;
            height: 53px;
        }
        .style63
        {
            width: 182px;
            height: 53px;
        }
        .style64
        {
            width: 268435232px;
        }
        .style65
        {
            width: 189px;
            height: 22px;
        }
        .style66
        {
            width: 268435232px;
            height: 22px;
        }
        .style67
        {
            width: 189px;
            height: 24px;
        }
        .style68
        {
            width: 268435232px;
            height: 24px;
        }
        .style69
        {
            width: 225px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxLabel 
            ID="ASPxLabel6" runat="server" Text="QUẢN LÝ LOẠI TIÊU CHUẨN KỸ THUẬT" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <table class="style19" style="height: 24px; width: 60%">
            <tr>
                <td bgcolor="#FFFF99" class="style69">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Thông tin loại tiêu chuẩn" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Font-Bold="True" 
                        ForeColor="#0000CC" NavigateUrl="~/5-Tieuchuan.aspx" 
                        Text="Trở về trang trước" />
                </td>
            </tr>
        </table>
    </p>
    <p>
         <dx:ASPxLabel ID="LabelNotification" runat="server" Font-Italic="True" 
                            Font-Overline="False" Font-Underline="True" 
            ForeColor="Red" Font-Bold="True">
                </dx:ASPxLabel>
    </p>
    <table class="style32">
        <tr>
            <td class="style33">
                Mã loại tiêu chuẩn(*):</td>
            <td colspan="3" id="txtCompanyName0" class="style64">
                <dx:ASPxTextBox ID="TxtStdTypeCode" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td class="style33">
                &nbsp;</td>
            <td colspan="3" id="Td1" class="style64">
                <dx:ASPxTextBox ID="txtStdTypeID" runat="server" Width="170px" 
                    BackColor="#FFFFCC" Visible="False">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style65">
                Tên loại tiêu chuẩn(*):</td>
            <td colspan="3" id="txtCompanyName1" class="style66">
                <dx:ASPxTextBox ID="TxtStdTypeName" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td class="style33">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style67">
                &nbsp;</td>
            <td colspan="3" id="txtCompanyName2" class="style68">
                &nbsp;</td>
        </tr>
                <strong>
                    <dx:ASPxLabel ID="lblnotification" runat="server" Font-Italic="True" 
                        Font-Overline="False" Font-Underline="True" ForeColor="Red">
                     </dx:ASPxLabel>
                </strong>
                
    </table>
    <table class="style58">
        <tr>
            <td align="center" class="style60">
                <dx:ASPxButton ID="btSave" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu" 
                    onclick="btSave_Click" Enabled="False" Height="22px" Width="79px" 
                    Font-Bold="True">
                </dx:ASPxButton>
            </td>
            <td align="center" class="style63">
                <dx:ASPxButton ID="btDelete" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa" 
                    onclick="btDelete_Click" Enabled="False" Height="25px" Width="81px" 
                    Font-Bold="True">
                </dx:ASPxButton>
            </td>
            <td align="center" class="style59">
                <dx:ASPxButton ID="btCancel" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Hủy bỏ" 
                    onclick="btCancel_Click" Enabled="False" Height="26px" Width="78px" 
                    Font-Bold="True">
                </dx:ASPxButton>
            </td>
            <td align="center" class="style59">
                <dx:ASPxButton ID="btNew" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo mới" 
                    onclick="btNew_Click" Height="18px" Width="82px" Font-Bold="True">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
        <table class="style19" style="height: 26px; width: 47%">
            <tr>
                <td bgcolor="#FFFF99" class="style69">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel8" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách loại tiêu chuẩn" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    <p>
        <dx:ASPxGridView ID="ASPxGridViewDocType" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSource1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue" onrowupdating="ASPxGridViewDocType_RowUpdating" 
            KeyFieldName="StdTypeID" onrowinserting="ASPxGridViewDocType_RowInserting" 
            oncustomcallback="ASPxGridViewDocType_CustomCallback" 
            onstartrowediting="ASPxGridViewDocType_StartRowEditing">
            <SettingsPager Summary-Text="" ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Tiếp &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Trước">
                </PrevPageButton>
                <Summary Text="">
                </Summary>
            </SettingsPager>
            <ClientSideEvents RowDblClick="function(s, e) {
	grid1.PerformCallback(s.GetFocusedRowIndex());
}" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" 
                    Width="50px" ShowEditButton="True">
                    <%--<EditButton Text="Sửa" Visible="True">
                    </EditButton>
                    <CancelButton Text="HỦy bỏ">
                    </CancelButton>
                    <UpdateButton Text="Cập nhật">
                    </UpdateButton>--%>
                </dx:GridViewCommandColumn>
<dx:GridViewDataTextColumn FieldName="StdTypeID" ShowInCustomizationForm="True" Visible="False" 
                    VisibleIndex="1" ReadOnly="True"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StdTypeCode" 
                    VisibleIndex="2" ShowInCustomizationForm="True" 
                    Caption="Mã loại tiêu chuẩn" Width="70px">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="StdTypeName" ShowInCustomizationForm="True" 
                    VisibleIndex="3" Caption="Loại tiêu chuẩn" Width="200px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CreateStaffID" VisibleIndex="4" 
                    ShowInCustomizationForm="True" Visible="False" Caption="Người tạo" 
                    Width="100px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" 
                    VisibleIndex="5" ShowInCustomizationForm="True" Caption="Ngày tạo" 
                    Width="100px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ModifyStaffID" 
                    ShowInCustomizationForm="True" VisibleIndex="6" Caption="Người cập nhật" 
                    Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="ModifyDate" 
                    VisibleIndex="7" ShowInCustomizationForm="True" Caption="Ngày cập nhật" 
                    Width="100px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Total" Visible="False" VisibleIndex="8" 
                    Width="50px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Invalid" VisibleIndex="9" 
                    Caption="Hết hiệu lực" Width="70px">
                </dx:GridViewDataCheckColumn>
            </Columns>
            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="true" AllowFocusedRow="true" />
            <Settings UseFixedTableLayout="True" />
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
    </p>
    <p>
        <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" AutoPostBack="True" 
            Font-Bold="True" ForeColor="Blue" 
            oncheckedchanged="ASPxCheckBox1_CheckedChanged" 
            Text="Hiển thị cả những loại tài liệu đã hết hiệu lực">
        </dx:ASPxCheckBox>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            DeleteCommand="DELETE FROM [QS_DocTypes] WHERE [DocTypeCode] = @original_DocTypeCode" 
            InsertCommand="INSERT INTO QS_DocTypes(DocTypeCode, DocTypeName, CreateDate, CreateStaffID, ModifyDate, ModifyStaffID, Invalid, Deleted) VALUES (@DocTypeCode, @DocTypeName, @CreateDate, @CreateStaffID, @ModifyDate, @ModifyStaffID, @Invalid, @Deleted)" 
            SelectCommand="SELECT QS_StandardTypes.StdTypeID, QS_StandardTypes.StdTypeCode, QS_StandardTypes.StdTypeName, QS_StandardTypes.CreateStaffID, QS_StandardTypes.CreateDate, QS_StandardTypes.ModifyStaffID, QS_StandardTypes.ModifyDate, QS_StandardTypes.Invalid, QS_StandardTypes.Deleted, StandardsGroupbyStdType.Total FROM QS_StandardTypes LEFT OUTER JOIN StandardsGroupbyStdType ON QS_StandardTypes.StdTypeID = StandardsGroupbyStdType.StdTypeID WHERE  (QS_StandardTypes.Deleted = @Deleted) AND (QS_StandardTypes.Invalid = @DisplayInvalid OR QS_StandardTypes.Invalid = @False)" 
            
            
            UpdateCommand="UPDATE QS_StandardTypes SET StdTypeName = @StdTypeName, ModifyStaffID = @ModifyStaffID, ModifyDate = @ModifyDate, Invalid = @Invalid WHERE (StdTypeID = @original_StdTypeID)" 
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="original_DocTypeCode" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DocTypeCode" Type="String" />
                <asp:Parameter Name="DocTypeName" Type="String" />
                <asp:Parameter DbType="Date" Name="CreateDate" />
                <asp:Parameter Name="CreateStaffID" Type="String" />
                <asp:Parameter DbType="Date" Name="ModifyDate" />
                <asp:Parameter Name="ModifyStaffID" Type="String" />
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
                <asp:Parameter Name="StdTypeName" />
                <asp:Parameter Name="ModifyStaffID" />
                <asp:Parameter DbType="Date" Name="ModifyDate" />
                <asp:Parameter Name="Invalid" Type="Boolean" />
                <asp:Parameter Name="original_StdTypeID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            SelectCommand="SELECT [StaffID], [StaffFistName] FROM [Staff]">
        </asp:SqlDataSource>
    </p>
    <p>
  
        &nbsp;</p>
</asp:Content>
