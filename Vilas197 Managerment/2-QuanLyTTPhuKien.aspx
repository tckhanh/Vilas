<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyThietBi.Master" AutoEventWireup="true" CodeBehind="2-QuanLyTTPhuKien.aspx.cs" Inherits="LabManagement.QuanLyTTPhuKien" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<%@ Register assembly="DevExpress.XtraReports.v20.1.Web.WebForms, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style19
        {
            color: #CC3300;
            font-size: xx-large;
        }
        .style20
        {
            width: 728px;
        }
        .style21
        {
            width: 123px;
        }
        .style23
        {
            width: 111px;
        }
        .style24
        {
        }
        .style32
    {
        width: 747px;
        font-size: medium;
    }
    .style33
    {
        width: 189px;
    }
    .style35
    {
        color: #CC3300;
        font-size: x-large;
        width: 100%;
    }
        .style53
        {
            width: 71%;
            height: 57px;
        }
        .style54
        {
            font-size: x-large;
            color: #CC3300;
        }
        .style55
        {
            width: 189px;
            color: #000000;
        }
        .style56
        {
            font-size: x-large;
            color: #CC3300;
            height: 44px;
        }
    .style57
    {
        width: 172px;
            height: 50px;
        }
        .style58
        {
            width: 189px;
            font-size: medium;
            color: #0033CC;
        }
        .style59
        {
            width: 189px;
            color: #0033CC;
        }
        .style60
        {
            width: 237px;
            height: 50px;
        }
        .style61
        {
            width: 166px;
        }
        .style62
        {
            height: 50px;
            width: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style53">
        <tr>
            <td class="style56" style="text-align: center">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssClass="style35" 
            Font-Bold="True" Font-Italic="False" Font-Size="X-Large" 
            Text="QUẢN LÝ THÔNG TIN THIẾT BỊ ĐO">
        </dx:ASPxLabel>
        </strong>
            </td>
        </tr>
        <tr>
            <td class="style54" style="text-align: center">
                <dx:ASPxLabel ID="lbNotification" runat="server" Font-Bold="False" 
                    Font-Italic="True" Font-Size="Small" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
    <table class="style32">
        <tr>
            <td class="style58">
                <strong>Hệ thống đo</strong></td>
            <td colspan="4">
                <dx:ASPxComboBox ID="cbTestSys" runat="server" AutoPostBack="true" 
                    EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" 
                    DataSourceID="SqlDataSource_TestSystem" ValueType="System.Int32" 
                    ValueField="TestSysID" TextField="TestSysName" Height="18px" Width="540px" 
                    TextFormatString="{1}" BackColor="#FFCCFF" 
                    onselectedindexchanged="cbTestSys_SelectedIndexChanged" 
                    DropDownStyle="DropDown">
                    <Columns>
                    <dx:ListBoxColumn Width="40" Caption="Mã hệ thống đo" FieldName="TestSysNo" />
                    <dx:ListBoxColumn Caption="Tên hệ thống đo" FieldName="TestSysName" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style59">
                <strong>Mã thiết bị (*)</strong></td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtAccNo" runat="server" BackColor="#FFCCFF" 
                    Width="170px" Font-Bold="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Tên thiết bị (*)</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtAccName" runat="server" Width="540px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Ký hiệu (*)</td>
            <td colspan="2">
                <dx:ASPxTextBox ID="txtAccModel" runat="server" Width="170px" Height="16px">
                </dx:ASPxTextBox>
            </td>
            <td class="style61">
                Serial Number (*)</td>
            <td>
                <dx:ASPxTextBox ID="txtSN" runat="server" Width="170px" Height="16px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Hãng sản xuất (*)</td>
            <td class="style24" colspan="4">
                <dx:ASPxTextBox ID="txtManufacturer" runat="server" Width="540px" Height="17px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Thân máy hay phụ kiện</td>
            <td class="style24">
                <dx:ASPxComboBox ID="cbBody" runat="server" SelectedIndex="0" 
                    ValueType="System.Int32">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Phụ kiện" Value="0" />
                        <dx:ListEditItem Text="Thân máy" Value="1" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td class="style23" colspan="2">
                Thành phần</td>
            <td>
                <dx:ASPxComboBox ID="cbMas" runat="server" SelectedIndex="0" 
                    ValueType="System.Int32">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Thành phần phụ" Value="0" />
                        <dx:ListEditItem Text="Thành phần chính" Value="1" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Nơi sản xuất (*)</td>
            <td class="style24">
                <dx:ASPxComboBox ID="cbCountry" runat="server" 
                    DataSourceID="SqlDataSourceCountry" ValueType="System.Int32" 
                    ValueField="CountryID" TextField="CountryName" DropDownStyle="DropDown" 
                    IncrementalFilteringMode="Contains">
                </dx:ASPxComboBox>
            </td>
            <td class="style23" colspan="2">
                Năm sản xuất</td>
            <td>
                <dx:ASPxTextBox ID="txtMadeYear" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Loại thiết bị</td>
            <td class="style24">
                <dx:ASPxComboBox ID="cbAccType" runat="server"
                    ValueType="System.Int32" DataSourceID="SqlDataSource_AccType" 
                    TextField="AccTypeName" ValueField="AccTypeID">
                </dx:ASPxComboBox>
            </td>
            <td class="style23" colspan="2">
                Tình trạng&nbsp; (*)</td>
            <td>
                <dx:ASPxComboBox ID="cbStatus" runat="server" SelectedIndex="0"
                    ValueType="System.Int32" DataSourceID="SqlDataSource_TestSysStatus" 
                    TextField="TestSysStatusName" ValueField="TestSysStatusID">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Ngày nhận</td>
            <td class="style24">
                <dx:ASPxDateEdit ID="dtreceive" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style23" colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style55">
                Thông tin bổ sung</td>
            <td class="style24" colspan="4">
                <dx:ASPxMemo ID="mmInfo" runat="server" Height="90px" Width="341px">
                </dx:ASPxMemo>
            </td>
        </tr>
    </table>
        <table>
            <tr>
                <td class="style60" align="right">
                    <dx:ASPxButton ID="btsave" runat="server"
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu" 
                        Height="25px" onclick="btsave_Click" Width="136px"> 
                   
                    </dx:ASPxButton>
                </td>
                <td class="style57" align="right">
                    <dx:ASPxButton ID="btDelete" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xóa" Width="136px" onclick="btDelete_Click">
                    </dx:ASPxButton>
                </td>
                <td align="right" class="style62">
                    <dx:ASPxButton ID="btnewrequestNext" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Nhập tiếp" 
                        Width="125px" onclick="btnewrequestNext_Click">
                    </dx:ASPxButton>
                </td>
                <td align="right" class="style62">
                    <dx:ASPxButton ID="btnewrequest" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Nhập mới" 
                        Width="125px" onclick="btnewrequest_Click">
                    </dx:ASPxButton>
                </td>
            </tr>
    </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách thiết bị">
        </dx:ASPxLabel>
        &nbsp;</strong></p>
    <p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="SqlDataSource1" KeyFieldName="AccID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView2_CustomCallback" style="margin-right: 0px" 
                oncustomcolumndisplaytext="ASPxGridView2_CustomColumnDisplayText" 
                onbeforegetcallbackresult="ASPxGridView2_BeforeGetCallbackResult">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Sửa"></EditButton>
                    <UpdateButton Text="Cập nhật"></UpdateButton>
                    <CancelButton Text="Thoát"></CancelButton>
                    <ClearFilterButton Visible="True" Text="Xóa lọc">
                    </ClearFilterButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                    VisibleIndex="1" Width="50px">
                    <EditFormSettings Visible="False" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Hệ thống đo" FieldName="TestSysID" 
                    VisibleIndex="2" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystem" 
                        TextField="TestSysName" ValueField="TestSysID" ValueType="System.String">
                        <Columns>
                            <dx:ListBoxColumn Caption="Mã hệ thống đo" FieldName="TestSysNo" />
                            <dx:ListBoxColumn Caption="Tên hệ thống đo" FieldName="TestSysName" />
                        </Columns>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Hệ thống đo" FieldName="TestSysID" 
                    VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystem" 
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains" 
                        TextField="TestSysName" ValueField="TestSysID" ValueType="System.Int32" 
                        TextFormatString="{1}">
                        <Columns>
                            <dx:ListBoxColumn Caption="Mã hệ thống đo" FieldName="TestSysNo" 
                                Width="100px" />
                            <dx:ListBoxColumn Caption="Tên hệ thống đo" FieldName="TestSysName" 
                                Width="400px" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="AccNo" VisibleIndex="5" 
                    Caption="Mã thiết bị"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccName" VisibleIndex="4" 
                    Caption="Tên thiết bị">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" 
                    VisibleIndex="6" Caption="Ký hiệu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SN" VisibleIndex="7" 
                    Caption="Serial Number" Visible="False" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hãng sản xuất" FieldName="Manufacturer" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Nơi sản xuất" FieldName="CountryID" 
                    VisibleIndex="9" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCountry" TextField="CountryName" 
                        ValueField="CountryID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="AccTypeID" 
                    VisibleIndex="14" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSource_AccType" 
                        TextField="AccTypeName" ValueField="AccTypeID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="MadeYear"  VisibleIndex="10" 
                    Caption="Năm sản xuất" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày nhận" FieldName="ReceiveDate" 
                    VisibleIndex="11" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn Caption="Thông tin bổ sung" FieldName="History" 
                    Visible="False" VisibleIndex="17">
                    <PropertiesMemoEdit Height="150px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                    VisibleIndex="16">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSysStatus" 
                        TextField="TestSysStatusName" ValueField="TestSysStatusID" 
                        ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="Hold" 
                    VisibleIndex="15">
                    <PropertiesComboBox ValueType="System.Int32" 
                        DataSourceID="SqlDataSource_AccHoldStatus" TextField="AccHoldName" 
                        ValueField="AccHoldID">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Thân máy hay phụ kiện" FieldName="Body" 
                    VisibleIndex="12" Visible="False">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Phụ kiện" Value="0" />
                            <dx:ListEditItem Text="Thân máy" Value="1" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Thành phần" FieldName="MainAcc" 
                    VisibleIndex="13">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Thành phần phụ" Value="0" />
                            <dx:ListEditItem Text="Thành phần chính" Value="1" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

            </Columns>
            <SettingsPager Summary-Text="" PageSize="20">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
             <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="true" AllowFocusedRow="true" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                SelectCommand="SELECT * FROM [TestAccessory]" 
                DeleteCommand="DELETE FROM [TestAccessory] WHERE [AccID] = @AccID" 
                InsertCommand="INSERT INTO [TestAccessory] ([TestSysID], [AccNo], [AccName], [Model], [SN], [Manufacturer], [CountryID], [AccTypeID], [MadeYear], [ReceiveDate], [History], [StatusID], [Hold], [Body], [MainAcc], [Valid]) VALUES (@TestSysID, @AccNo, @AccName, @Model, @SN, @Manufacturer, @CountryID, @AccTypeID, @MadeYear, @ReceiveDate, @History, @StatusID, @Hold, @Body, @MainAcc, @Valid)" 
                UpdateCommand="UPDATE [TestAccessory] SET [TestSysID] = @TestSysID, [AccNo] = @AccNo, [AccName] = @AccName, [Model] = @Model, [SN] = @SN, [Manufacturer] = @Manufacturer, [CountryID] = @CountryID, [AccTypeID] = @AccTypeID, [MadeYear] = @MadeYear, [ReceiveDate] = @ReceiveDate, [History] = @History, [StatusID] = @StatusID, [Hold] = @Hold, [Body] = @Body, [MainAcc] = @MainAcc, [Valid] = @Valid WHERE [AccID] = @AccID">
                <DeleteParameters>
                    <asp:Parameter Name="AccID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TestSysID" Type="Int32" />
                    <asp:Parameter Name="AccNo" Type="String" />
                    <asp:Parameter Name="AccName" Type="String" />
                    <asp:Parameter Name="Model" Type="String" />
                    <asp:Parameter Name="SN" Type="String" />
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="CountryID" Type="Int32" />
                    <asp:Parameter Name="AccTypeID" Type="Int32" />
                    <asp:Parameter Name="MadeYear" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ReceiveDate" />
                    <asp:Parameter Name="History" Type="String" />
                    <asp:Parameter Name="StatusID" Type="Int32" />
                    <asp:Parameter Name="Hold" Type="Int32" />
                    <asp:Parameter Name="Body" Type="Int32" />
                    <asp:Parameter Name="MainAcc" Type="Int32" />
                    <asp:Parameter Name="Valid" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TestSysID" Type="Int32" />
                    <asp:Parameter Name="AccNo" Type="String" />
                    <asp:Parameter Name="AccName" Type="String" />
                    <asp:Parameter Name="Model" Type="String" />
                    <asp:Parameter Name="SN" Type="String" />
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="CountryID" Type="Int32" />
                    <asp:Parameter Name="AccTypeID" Type="Int32" />
                    <asp:Parameter Name="MadeYear" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ReceiveDate" />
                    <asp:Parameter Name="History" Type="String" />
                    <asp:Parameter Name="StatusID" Type="Int32" />
                    <asp:Parameter Name="Hold" Type="Int32" />
                    <asp:Parameter Name="Body" Type="Int32" />
                    <asp:Parameter Name="MainAcc" Type="Int32" />
                    <asp:Parameter Name="Valid" Type="Int32" />
                    <asp:Parameter Name="AccID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    
    </p>
<p>
  
        <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            
            SelectCommand="SELECT CountryID, CountryName FROM Country ORDER BY CAST(CountryName AS Nvarchar)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestSysStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestSysStatus]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestSystemSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestSystemSource]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestField" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestField]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestSystem" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            SelectCommand="SELECT TestSysID, TestSysNo, TestSysName, Model, Manufacturer, CountryID, MadeYear, ReceiveDate, History, StatusID, SourceID, FieldID, TestSpec, Valid, Register FROM TestSystem ORDER BY TestSysNo"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_AccType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [AccType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_AccHoldStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [AccHoldStatus]"></asp:SqlDataSource>
</p>
    <p>
  
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
