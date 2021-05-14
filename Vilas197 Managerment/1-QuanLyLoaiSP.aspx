<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-QuanLyLoaiSP.aspx.cs" Inherits="LabManagement.QuanLyLoaiSP" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style29
        {
            width: 104px;
        }
        .style30
        {
            width: 206px;
        }
        .style32
        {
            width: 205px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style19" style="height: 54px; width: 79%">
        <tr>
            <td style="text-align: center" valign="top">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="X-Large" 
                    ForeColor="#CC3300" style="font-weight: 700" 
                    Text="QUẢN LÝ LOẠI SẢN PHẨM ĐO">
                </dx:ASPxLabel>
            </td>
        </tr>
        </table>

    <table>
        <tr>
            <td colspan="2">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="#CC3300" Text="Thông tin loại sản phẩm đo">
                </dx:ASPxLabel>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <dx:ASPxLabel ID="lbNotifi" runat="server" 
            style="font-style: italic; color: #FF0000; font-weight: 700">
        </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Mã loại sản phẩm đo 
                (*)</td>
            <td>
                <dx:ASPxTextBox ID="txtEquipID" runat="server" BackColor="#FFCCFF" 
                    Height="17px" Width="96px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Nhóm sản phẩm</td>
            <td>
                <dx:ASPxComboBox ID="cbGroupEquipment" runat="server" 
                    DataSourceID="GroupEquipment" TextField="GroupEquName" ValueField="GroupEquID" 
                    ValueType="System.Int32" Width="550px">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Tên sản phẩm (*)</td>
            <td>
                <dx:ASPxTextBox ID="txtEquipName" runat="server" Height="17px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Tên hiển thị</td>
            <td>
                <dx:ASPxTextBox ID="txtEquipDisplayName" runat="server" Height="17px" 
                    Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Phương pháp đo (*)</td>
            <td>
                <dx:ASPxTextBox ID="txtTestMethod" runat="server" Height="16px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Tiêu chuẩn đánh giá (*)</td>
            <td>
                <dx:ASPxTextBox ID="txtStandard" runat="server" Height="17px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Chi phí đo (VNĐ) 
                (*)</td>
            <td>
                <dx:ASPxTextBox ID="txtPrice" runat="server" Width="170px" 
                    DisplayFormatString="###,###,###,###,0">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Chi phí đo bằng chữ 
                (*)</td>
            <td>
                <dx:ASPxTextBox ID="txtPriceInText" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Trạng thái hiển thị</td>
            <td>
                <dx:ASPxComboBox ID="cbDisStatus" runat="server" SelectedIndex="0" 
                    ValueType="System.Int32">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Hiển thị" Value="0" />
                        <dx:ListEditItem Text="Ẩn" Value="1" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Thiết bị đo kiểm</td>
            <td>
                <dx:ASPxMemo ID="mmTestingEquipment" runat="server" Height="111px" 
                    Width="355px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style32">
                Thông tin quy chuẩn</td>
            <td>
                <dx:ASPxMemo ID="mmInfo" runat="server" Height="111px" Width="355px">
                </dx:ASPxMemo>
            </td>
        </tr>
        </table>
    <table class="style19" style="width: 60%; height: 58px">
        <tr>
            <td align="right" class="style29">
                &nbsp;</td>
            <td align="right" class="style30">
                <dx:ASPxButton ID="btSave" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu" 
                    onclick="btSave_Click" Height="25px" Width="100px">
                </dx:ASPxButton>
            </td>
            <td align="right">
                <dx:ASPxButton ID="btNew" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo mới" 
                    onclick="btNew_Click">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <p>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="#CC3300" 
            Text="Danh sách các loại sản phẩm đo">
                </dx:ASPxLabel>
    </p>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="EquipmentType" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        style="text-align: center" KeyFieldName="EquTypeID" 
        oncustomcallback="ASPxGridView1_CustomCallback">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True">
                <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text="Tạo mới">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="DeleteButton" Text="Xóa bỏ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Sửa đổi">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="UpdateButton" Text="Cập nhật">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="ClearFilterButton" Text="Xóa lọc">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="CancelButton" Text="Thoát">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>--%>                
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="EquTypeID" 
                VisibleIndex="1" ShowInCustomizationForm="True" 
                Caption="Mã loại SP" Width="60px">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Nhóm sản phẩm" FieldName="GroupID" 
                VisibleIndex="2">
                <PropertiesComboBox DataSourceID="GroupEquipment" TextField="GroupEquName" 
                    ValueField="GroupEquID" ValueType="System.Int32">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
<dx:GridViewDataTextColumn FieldName="EquTypeName" ShowInCustomizationForm="True" 
                VisibleIndex="3" Caption="Tên sản phẩm"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="EquTypeDisplayName" ShowInCustomizationForm="True" 
                Visible="False" VisibleIndex="4" Caption="Tên hiển thị">
    <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Standards" VisibleIndex="5" 
                ShowInCustomizationForm="True" Caption="Tiêu chuẩn">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="6" Caption="Phí đo kiểm" 
                ShowInCustomizationForm="True" Width="70px" >
                <PropertiesTextEdit DisplayFormatString="###,###,###,###,###">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Trạng thái hiển thị" 
                FieldName="Invalid" VisibleIndex="8">
                <PropertiesComboBox ValueType="System.String">
                    <Items>
                        
<dx:ListEditItem Text="Hiển thị" Value="0" />
                        
<dx:ListEditItem Text="Ẩn" Value="1" />
                    
</Items>
                
</PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Phí đo kiểm bằng chữ" 
                FieldName="PriceInText" ShowInCustomizationForm="True" Visible="False" 
                VisibleIndex="7">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="Thông tin quy chuẩn" FieldName="Info" 
                VisibleIndex="9" Visible="False">
                <PropertiesMemoEdit Height="100px">
                </PropertiesMemoEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataMemoColumn Caption="Thiết bị đo" FieldName="TestingEquipment" 
                Visible="False" VisibleIndex="10">
                <PropertiesMemoEdit Height="100px">
                </PropertiesMemoEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataTextColumn FieldName="TestMethod" VisibleIndex="11" 
                Visible="False" Caption="Phương pháp đo">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager Summary-Text="">
            <NextPageButton Text="Tiếp">
            </NextPageButton>
            <PrevPageButton Text="Trước">
            </PrevPageButton>
            <Summary Text="Trang {0}/{1} ({2} Hồ sơ)">
            </Summary>
        </SettingsPager>
        <SettingsBehavior ConfirmDelete="true" AllowFocusedRow="true" />
            <Settings ShowFilterRow="True" />
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
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
            <asp:SqlDataSource ID="EquipmentType" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        DeleteCommand="DELETE FROM [EquipmentType] WHERE [EquTypeID] = @EquTypeID" 
        InsertCommand="INSERT INTO [EquipmentType] ([EquTypeID], [GroupID], [EquTypeName], [EquTypeDisplayName], [BriefName], [Standards], [TestMethod], [Price], [PriceInText], [Info], [InitDate], [Invalid], [TestingEquipment]) VALUES (@EquTypeID, @GroupID, @EquTypeName, @EquTypeDisplayName, @BriefName, @Standards, @TestMethod, @Price, @PriceInText, @Info, @InitDate, @Invalid, @TestingEquipment)" 
        SelectCommand="SELECT * FROM [EquipmentType]" 
        UpdateCommand="UPDATE [EquipmentType] SET [GroupID] = @GroupID, [EquTypeName] = @EquTypeName, [EquTypeDisplayName] = @EquTypeDisplayName, [BriefName] = @BriefName, [Standards] = @Standards, [TestMethod] = @TestMethod, [Price] = @Price, [PriceInText] = @PriceInText, [Info] = @Info, [InitDate] = @InitDate, [Invalid] = @Invalid, [TestingEquipment] = @TestingEquipment WHERE [EquTypeID] = @EquTypeID">
                <DeleteParameters>
                    <asp:Parameter Name="EquTypeID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EquTypeID" Type="String" />
                    <asp:Parameter Name="GroupID" Type="Int32" />
                    <asp:Parameter Name="EquTypeName" Type="String" />
                    <asp:Parameter Name="EquTypeDisplayName" Type="String" />
                    <asp:Parameter Name="BriefName" Type="String" />
                    <asp:Parameter Name="Standards" Type="String" />
                    <asp:Parameter Name="TestMethod" Type="String" />
                    <asp:Parameter Name="Price" Type="Single" />
                    <asp:Parameter Name="PriceInText" Type="String" />
                    <asp:Parameter Name="Info" Type="String" />
                    <asp:Parameter DbType="Date" Name="InitDate" />
                    <asp:Parameter Name="Invalid" Type="Int32" />
                    <asp:Parameter Name="TestingEquipment" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="GroupID" Type="Int32" />
                    <asp:Parameter Name="EquTypeName" Type="String" />
                    <asp:Parameter Name="EquTypeDisplayName" Type="String" />
                    <asp:Parameter Name="BriefName" Type="String" />
                    <asp:Parameter Name="Standards" Type="String" />
                    <asp:Parameter Name="TestMethod" Type="String" />
                    <asp:Parameter Name="Price" Type="Single" />
                    <asp:Parameter Name="PriceInText" Type="String" />
                    <asp:Parameter Name="Info" Type="String" />
                    <asp:Parameter DbType="Date" Name="InitDate" />
                    <asp:Parameter Name="Invalid" Type="Int32" />
                    <asp:Parameter Name="TestingEquipment" Type="String" />
                    <asp:Parameter Name="EquTypeID" Type="String" />
                </UpdateParameters>
    </asp:SqlDataSource>
                      
    <asp:SqlDataSource ID="GroupEquipment" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        SelectCommand="SELECT * FROM [GroupEquipment]"></asp:SqlDataSource>
                      
    <br />
                      
    </asp:Content>
