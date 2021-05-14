<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyThietBi.Master" AutoEventWireup="true" CodeBehind="2-QuanLyTTThietBi.aspx.cs" Inherits="LabManagement.QuanLyTTThietBi" %>
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
            width: 158px;
        }
        .style24
        {
        }
        .style25
        {
            width: 189px;
            color: #0033CC;
        }
        .style32
    {
        width: 745px;
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
        .style48
        {
            width: 71%;
            height: 48px;
        }
        .style49
        {
            width: 635px;
        }
        .style52
        {
            width: 309px;
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
        width: 281px;
    }
        .style58
        {
            width: 191px;
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
            Text="QUẢN LÝ THÔNG TIN HỆ THỐNG ĐO">
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
            <td class="style33">
                Mã hệ thống đo kiểm (*)</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtTestSysNo" runat="server" BackColor="#FFCCFF" 
                    Width="170px" Font-Bold="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Tên hệ thống đo (*)</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtTestSysName" runat="server" Width="540px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Ký hiệu (*)</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtTestSysModel" runat="server" Width="540px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Hãng sản xuất (*)</td>
            <td class="style24" colspan="3">
                <dx:ASPxTextBox ID="txtManufacturer" runat="server" Width="540px" Height="17px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Nơi sản xuất (*)</td>
            <td class="style58">
                <dx:ASPxComboBox ID="cbCountry" runat="server" 
                    DataSourceID="SqlDataSourceCountry" ValueType="System.Int32" 
                    ValueField="CountryID" TextField="CountryName" DropDownStyle="DropDown" 
                    IncrementalFilteringMode="Contains">
                </dx:ASPxComboBox>
            </td>
            <td class="style23">
                Năm sản xuất</td>
            <td>
                <dx:ASPxTextBox ID="txtMadeYear" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Lĩnh vực đo</td>
            <td class="style58">
                <dx:ASPxComboBox ID="cbTestField" runat="server" SelectedIndex="0"
                    ValueType="System.Int32" DataSourceID="SqlDataSource_TestField" 
                    TextField="FiledInfo" ValueField="FieldID">
                </dx:ASPxComboBox>
            </td>
            <td class="style23">
                Nguồn gốc</td>
            <td>
                <dx:ASPxComboBox ID="cbTestSysSource" runat="server" SelectedIndex="0"
                    ValueType="System.Int32" DataSourceID="SqlDataSource_TestSystemSource" 
                    TextField="SourceInfo" ValueField="SourceID">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Ngày nhận</td>
            <td class="style58">
                <dx:ASPxDateEdit ID="dtreceive" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style23">
                Tình trạng thiết bị&nbsp; (*)</td>
            <td>
                <dx:ASPxComboBox ID="cbStatus" runat="server" SelectedIndex="0"
                    ValueType="System.Int32" DataSourceID="SqlDataSource_TestSysStatus" 
                    TextField="TestSysStatusName" ValueField="TestSysStatusID">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Tình trạng quản lý</td>
            <td class="style58">
                <dx:ASPxComboBox ID="cbMangStatus" runat="server" SelectedIndex="0" 
                    ValueType="System.String">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Có đăng ký" Value="1" />
                        <dx:ListEditItem Text="Không đăng ký" Value="0" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td class="style23">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style55">
                Chỉ tiêu đo</td>
            <td class="style24" colspan="3">
                <dx:ASPxMemo ID="mmSpec" runat="server" Height="90px" Width="341px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <strong>Thông tin bổ sung</strong></td>
            <td class="style24" colspan="3">
                <dx:ASPxMemo ID="mmInfo" runat="server" Height="90px" Width="341px">
                </dx:ASPxMemo>
            </td>
        </tr>
    </table>
        <table class="style48">
            <tr>
                <td class="style49">
                    &nbsp;</td>
                <td class="style52">
                    <dx:ASPxButton ID="btsave" runat="server"
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu" 
                        Height="25px" onclick="btsave_Click" Width="136px"> 
                   
                    </dx:ASPxButton>
                </td>
                <td class="style57">
                    <dx:ASPxButton ID="btDelete" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xóa" Width="136px" onclick="btDelete_Click">
                     </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton ID="btnew" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Nhập mới" 
                        Width="125px" onclick="btnew_Click" Height="25px">
                    </dx:ASPxButton>
                </td>
            </tr>
    </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các hệ thống đo kiểm">
        </dx:ASPxLabel>
        </strong>
    </p>
    <p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="LinqDataSource1" KeyFieldName="TestSysID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView2_CustomCallback" style="margin-right: 0px" 
                oncustomcolumndisplaytext="ASPxGridView2_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Sửa">
                    </EditButton>
                    <UpdateButton Text="Cập nhật"></UpdateButton>
                    <CancelButton Text="Thoát"></CancelButton>
                    <ClearFilterButton Visible="True">
                    </ClearFilterButton>--%>
                </dx:GridViewCommandColumn>
<dx:GridViewDataTextColumn FieldName="STT" VisibleIndex="1" Caption="STT" UnboundType="Integer">
<EditFormSettings Visible="False"></EditFormSettings>
    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
    </CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TestSysID" ReadOnly="True" ShowInCustomizationForm="True" 
                    Visible="False" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>
</dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TestSysNo" VisibleIndex="3" 
                    Caption="Mã hệ thống đo" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên hệ thống đo" FieldName="TestSysID" 
                    ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" DropDownStyle="DropDown" 
                        IncrementalFilteringMode="Contains" TextField="TestSysName" 
                        ValueField="TestSysID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Tên hệ thống đo" FieldName="TestSysName" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="6" 
                    Caption="Ký hiệu" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer"  VisibleIndex="7" 
                    Caption="Hãng sản xuất" ShowInCustomizationForm="True" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Nơi sản xuất" FieldName="CountryID" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCountry" TextField="CountryName" 
                        ValueField="CountryID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="MadeYear"
                    VisibleIndex="9" Caption="Năm sản xuất" Visible="False" 
                    ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataDateColumn FieldName="ReceiveDate" VisibleIndex="10" 
                    Caption="Ngày nhận" Visible="False" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn Caption="Thông tin bổ sung" FieldName="History" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                    <PropertiesMemoEdit Height="90px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                    ShowInCustomizationForm="True" VisibleIndex="13">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSysStatus" 
                        TextField="TestSysStatusName" ValueField="TestSysStatusID" 
                        ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Nguồn gốc" FieldName="SourceID" 
                    ShowInCustomizationForm="True" VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystemSource" 
                        TextField="SourceInfo" ValueField="SourceID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Lĩnh vực đo" FieldName="FieldID" 
                    ShowInCustomizationForm="True" VisibleIndex="12">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestField" 
                        TextField="FiledInfo" ValueField="FieldID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn Caption="Chỉ tiêu đo" FieldName="TestSpec" 
                    Visible="False" VisibleIndex="15">
                    <PropertiesMemoEdit Height="90px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>

                <dx:GridViewDataComboBoxColumn Caption="Tình trạng quản lý" 
                    FieldName="Register" VisibleIndex="14">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Có đăng ký" Value="1" />
                            <dx:ListEditItem Text="Không đăng ký" Value="0" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

            </Columns>
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
             <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly=true ConfirmDelete=true AllowFocusedRow=true />
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
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
                ContextTypeName="LabManagement.LINQ.LabdataDataContext" EntityTypeName="" 
                TableName="TestSystems" OrderBy="TestSysNo" EnableInsert="True" 
                EnableUpdate="True" Where="Valid == @Valid">
                <WhereParameters>
                    <asp:Parameter DefaultValue="1" Name="Valid" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
    
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
