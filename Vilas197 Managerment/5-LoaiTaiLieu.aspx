<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="5-LoaiTaiLieu.aspx.cs" Inherits="LabManagement._5_LoaiTaiLieu" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .style32
    {
        width: 682px;
        font-size: medium;
            height: 88px;
        }
    .style33
    {
        width: 189px;
    }
        .style58
        {
            width: 83%;
            height: 56px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <dx:ASPxLabel 
            ID="ASPxLabel6" runat="server" Text="QUẢN LÝ LOẠI TÀI LIỆU HỆ THỐNG CHẤT LƯỢNG" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
    
    <table class="style32">
        <tr>
            <td class="style33" width="30%">
                &nbsp;</td>
            <td id="txtCompanyName0" class="style64" width="50%">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                    ForeColor="#0000CC" NavigateUrl="~/5-TaiLieu.aspx" Font-Size="Small">Trở về trang trước</asp:HyperLink>
            </td>
            <td id="Td1" class="style64" width="20%">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style33" width="30%">
                &nbsp;</td>
            <td colspan="1" id="txtCompanyName0" class="style64" width="50%">
                <dx:ASPxLabel ID="LabelNotification" runat="server" Font-Italic="True" 
                            Font-Overline="False" Font-Underline="True" 
            ForeColor="Red" Font-Bold="True">
                </dx:ASPxLabel>
            
            </td>
            <td width="20%">
            </td>
        </tr>
        <tr>
            <td class="style33" width="30%">
                Mã loại tài liệu(*):</td>
            <td id="txtCompanyName0" class="style64" width="50%">
                <dx:ASPxTextBox ID="TxtDocTypeCode" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td id="Td1" class="style64" width="20%">
                <dx:ASPxTextBox ID="txtDocTypeID" runat="server" Width="170px" 
                    BackColor="#FFFFCC" Visible="False">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style65" width="30%">
                Tên loại tài liệu(*):</td>
            <td id="txtCompanyName1" class="style66" width="50%">
                <dx:ASPxTextBox ID="TxtDocTypeName" runat="server" Width="300px">
                </dx:ASPxTextBox>
            </td>
            <td class="style33" width="20%">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style67" width="30%">
                &nbsp;</td>
            <td id="txtCompanyName2" class="style68" width="50%">
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
                    Font-Bold="True" style="font-weight: 700">
                </dx:ASPxButton>
            </td>
            <td align="center" class="style63">
                <dx:ASPxButton ID="btDelete" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa" 
                    onclick="btDelete_Click" Enabled="False" Height="25px" Width="81px" 
                    Font-Bold="True" Font-Italic="False" style="font-weight: 700">
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
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách loại tài liệu">
        </dx:ASPxLabel>
        </strong>
    </p>
    <p>
        <dx:ASPxGridView ID="ASPxGridViewDocType" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSource1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
            CssPostfix="PlasticBlue" onrowupdating="ASPxGridViewDocType_RowUpdating" 
            KeyFieldName="DocTypeID" onrowinserting="ASPxGridViewDocType_RowInserting" 
            oncustomcallback="ASPxGridViewDocType_CustomCallback" 
            onstartrowediting="ASPxGridViewDocType_StartRowEditing">
            <SettingsPager Summary-Text="" ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
                <Summary Text="">
                </Summary>
            </SettingsPager>
            <ClientSideEvents RowDblClick="function(s, e) {
	grid1.PerformCallback(s.GetFocusedRowIndex());
}" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Sửa">
                    </EditButton>
                    <CancelButton Text="Hủy bỏ" Visible="True">
                    </CancelButton>
                    <UpdateButton Text="Cập nhật">
                    </UpdateButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="DocTypeID" 
                    VisibleIndex="1" Visible="False">
                </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="DocTypeCode" ShowInCustomizationForm="True" 
                    Caption="Mã loại tài liệu" VisibleIndex="2" Width="70px">
    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocTypeName" VisibleIndex="3" 
                    Caption="Loại tài liệu" ShowInCustomizationForm="True" Width="200px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="CreateDate" 
                    VisibleIndex="4" Caption="Ngày tạo" ShowInCustomizationForm="True" 
                    Width="100px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="ModifyDate" 
                    VisibleIndex="6" Caption="Ngày cập nhật" ShowInCustomizationForm="True" 
                    UnboundType="DateTime" Width="100px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Total" Visible="False" VisibleIndex="7" 
                    Width="70px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Invalid" VisibleIndex="8" 
                    Caption="Hết hiệu lực" Width="70px">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người cập nhật" 
                    FieldName="ModifyStaffID" VisibleIndex="5" Width="100px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataComboBoxColumn>
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
    <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" AutoPostBack="True" 
        Font-Bold="True" ForeColor="Blue" 
        oncheckedchanged="ASPxCheckBox1_CheckedChanged" 
        Text="Hiển thị cả những loại tài liệu đã hết hiệu lực">
    </dx:ASPxCheckBox>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
            DeleteCommand="DELETE FROM [QS_DocTypes] WHERE [DocTypeCode] = @original_DocTypeCode" 
            InsertCommand="INSERT INTO QS_DocTypes(DocTypeCode, DocTypeName, CreateDate, CreateStaffID, ModifyDate, ModifyStaffID, Invalid, Deleted) VALUES (@DocTypeCode, @DocTypeName, @CreateDate, @CreateStaffID, @ModifyDate, @ModifyStaffID, @Invalid, @Deleted)" 
            SelectCommand="SELECT QS_DocTypes.DocTypeID, QS_DocTypes.DocTypeCode, QS_DocTypes.DocTypeName, QS_DocTypes.CreateDate, QS_DocTypes.CreateStaffID, QS_DocTypes.ModifyDate, QS_DocTypes.ModifyStaffID, QS_DocTypes.Invalid, QS_DocTypes.Deleted, DocumentsGroupbyType.Total FROM QS_DocTypes LEFT OUTER JOIN DocumentsGroupbyType ON QS_DocTypes.DocTypeID = DocumentsGroupbyType.DocTypeID WHERE (QS_DocTypes.Invalid = @Invalid OR QS_DocTypes.Invalid = @DisplayInvalid) AND (QS_DocTypes.Deleted = @Deleted)" 
            
            
            UpdateCommand="UPDATE QS_DocTypes SET DocTypeName = @DocTypeName, ModifyDate = @ModifyDate, Invalid = @Invalid WHERE (DocTypeID = @original_DocTypeID)" 
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
                <asp:SessionParameter DefaultValue="False" Name="Invalid" 
                    SessionField="DisplayInvalid" />
                <asp:CookieParameter CookieName="DisplayInvalid" DefaultValue="False" 
                    Name="DisplayInvalid" />
                <asp:Parameter DefaultValue="False" Name="Deleted" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DocTypeName" Type="String" />
                <asp:Parameter DbType="Date" Name="ModifyDate" />
                <asp:Parameter Name="Invalid" />
                <asp:Parameter Name="original_DocTypeID" />
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
