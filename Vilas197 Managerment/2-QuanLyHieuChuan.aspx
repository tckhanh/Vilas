<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyThietBi.Master" AutoEventWireup="true" CodeBehind="2-QuanLyHieuChuan.aspx.cs" Inherits="LabManagement.QuanLyHieuChuan" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style38
        {
            font-weight: bold;
            color: #003366;
            height: 55px;
        }
        .style39
        {
            color: #003366;
            height: 55px;
            width: 179px;
        }
        .style57
        {
            font-weight: bold;
            color: #003366;
            height: 55px;
            width: 205px;
        }
        .style58
        {
            color: #003366;
            height: 10px;
            width: 179px;
        }
        .style59
        {
            font-weight: bold;
            color: #003366;
            height: 10px;
            width: 205px;
        }
        .style60
        {
            font-weight: bold;
            color: #003366;
            height: 10px;
        }
        .style62
        {
            font-weight: bold;
            color: #003366;
            height: 10px;
            background-color: #FFFF99;
        }
        .style63
        {
            font-weight: bold;
            color: #003366;
            height: 10px;
            width: 205px;
            background-color: #FFFF99;
        }
        .style64
        {
            color: #003366;
            height: 10px;
            width: 179px;
            background-color: #FFFF99;
        }
        .style65
        {
            height: 26px;
        }
        .style68
        {
            width: 168px;
        }
        .style69
        {
            width: 207px;
        }
        .style70
        {
            width: 899px;
        }
        .style71
        {
            height: 20px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="height: 37px; width: 69%">
        <tr>
            <td style="text-align: center" valign="top" class="style65">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="X-Large" 
                    ForeColor="#CC3300" style="font-weight: 700" Text="QUẢN LÝ HIỆU CHUẨN">
                </dx:ASPxLabel>
            </td>
        </tr>
        </table>
    <table style="width: 735px">
        <tr>
            <td colspan="4" style="text-align: center" class="style71">
                <dx:ASPxLabel ID="lbNotification" runat="server" 
                    style="font-style: italic; color: #FF0000" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style70">
                <strong>Hệ thống đo (*)</strong></td>
            <td colspan="3">
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
            <td class="style70">
                Số giấy CN hiệu chuẩn</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtCalibNo" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style70">
                Nơi hiệu chuẩn 
                (*)</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtCalibFrom" runat="server" Width="540px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style70">
                Ngày hiệu chuẩn 
                (*)</td>
            <td class="style69">
                <dx:ASPxDateEdit ID="dtCalibDate" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style68">
                Ngày hết hạn 
                (*)</td>
            <td>
                <dx:ASPxDateEdit ID="dtEndValidDate" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style70">
                Ghi chú</td>
            <td colspan="3">
                <dx:ASPxMemo ID="mmNote" runat="server" Height="104px" Width="377px">
                </dx:ASPxMemo>
            </td>
        </tr>
        </table>
    <table class="style19" style="width: 77%">
        <tr>
            <td class="style58" align="center">
                &nbsp;</td>
            <td class="style59" align="center">
                &nbsp;</td>
            <td class="style60" align="center">
                &nbsp;</td>
            <td class="style60" align="center">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style64" align="center">
                <strong>Số ngày còn hiệu lực</strong></td>
            <td class="style63" align="center">
                <dx:ASPxTextBox ID="txtDateLeft" runat="server" Width="170px" 
                    BackColor="#FFCCFF">
                </dx:ASPxTextBox>
            </td>
            <td class="style62" align="center">
                Tình trạng giấy hiệu chuẩn</td>
            <td class="style62" align="center">
                <dx:ASPxComboBox ID="cbCalibStatus" runat="server" BackColor="#FFCCFF" 
                    Height="16px" ValueType="System.Int32" Width="193px">
                    <Items>
                        <dx:ListEditItem Text="Hết hạn hiệu chuẩn" Value="0" />
                        <dx:ListEditItem Text="Sắp hết hạn hiệu chuẩn" Value="1" />
                        <dx:ListEditItem Text="Còn hạn hiệu chuẩn" Value="2" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style39" align="center">
                <dx:ASPxButton ID="btSave" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    Height="16px" onclick="btSave_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu" 
                    Width="160px">
                </dx:ASPxButton>
            </td>
            <td class="style57" align="center">
                <dx:ASPxButton ID="btUpdate" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    Height="16px" onclick="btUpdate_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật" 
                    Width="160px">
                </dx:ASPxButton>
            </td>
            <td class="style38" align="center">
                <dx:ASPxButton ID="btDelete" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    Height="16px" onclick="btDelete_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa" 
                    Width="160px">
                </dx:ASPxButton>
            </td>
            <td class="style38" align="center">
                <dx:ASPxButton ID="btNew" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    Height="16px" onclick="btNew_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo mới" 
                    Width="160px">
                </dx:ASPxButton>
            </td>
        </tr>
        </table>
    <p style="text-align: left">
        &nbsp;<strong><dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các giấy chứng nhận hiệu chuẩn của " ForeColor="#CC3300">
        </dx:ASPxLabel>
        <dx:ASPxLabel ID="lbTestSysName" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            ForeColor="#003399">
        </dx:ASPxLabel>
        </strong>
    </p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="SqlDataSource_Calibration" KeyFieldName="CalibID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView2_CustomCallback" 
        style="margin-right: 0px" 
        onhtmlrowprepared="ASPxGridView2_HtmlRowPrepared" 
        oncustomcolumndisplaytext="ASPxGridView2_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Chi tiết">
                    </EditButton>
                    <UpdateButton Text=" "></UpdateButton>
                    <CancelButton Text=Thoát></CancelButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                    VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Hệ thống đo" FieldName="TestSysID" 
                    VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystem" 
                        TextField="TestSysName" ValueField="TestSysID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="3" 
                    Caption="Ký hiệu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Mã hệ thống" FieldName="TestSysNo" 
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số giấy hiệu chuẩn" FieldName="CalibNo" 
                    ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Đơn vị hiệu chuẩn" FieldName="CalibFrom" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày hiệu chuẩn" FieldName="CalibDate" 
                    VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày hết hạn" FieldName="EndValidDate" 
                    VisibleIndex="8">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn Caption="Ghi chú" FieldName="Note" Visible="False" 
                    VisibleIndex="12">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn FieldName="DayLeft" VisibleIndex="9" 
                    Caption="Số ngày còn hiệu lực" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="Status" 
                    ReadOnly="True" VisibleIndex="10">
                    <PropertiesComboBox ValueType="System.Int32">
                        <Items>
                            <dx:ListEditItem Text="Hết hạn hiệu chuẩn" Value="0" />
                            <dx:ListEditItem Text="Sắp hết hạn hiệu chuẩn" Value="1" />
                            <dx:ListEditItem Text="Còn hạn hiệu chuẩn" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="CalibID" Visible="False" 
                    VisibleIndex="11">
                </dx:GridViewDataTextColumn>

            </Columns>
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
             <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="true" AllowFocusedRow="true" />
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
            <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Bảng tổng hợp tình hình hiệu chuẩn của các hệ thống đo" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
    </p>
            <dx:ASPxGridView ID="ASPxGridView3" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid3"
            DataSourceID="SqlDataSource_CalibrationAll" KeyFieldName="CalibID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView3_CustomCallback" 
        style="margin-right: 0px" 
        onhtmlrowprepared="ASPxGridView2_HtmlRowPrepared" 
        oncustomcolumndisplaytext="ASPxGridView3_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid3.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" Width="50px" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Chi tiết">
                    </EditButton>
                    <UpdateButton Text=" "></UpdateButton>
                    <ClearFilterButton Visible="True" Text="Xóa lọc">
                    </ClearFilterButton>
                    <CancelButton Text="Thoát"></CancelButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                    VisibleIndex="1" Width="40px">
                    <EditFormSettings Visible="False" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Hệ thống đo" FieldName="TestSysID" 
                    VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystem" 
                        TextField="TestSysName" ValueField="TestSysID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="3" 
                    Caption="Ký hiệu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Mã hệ thống" FieldName="TestSysNo" 
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số giấy hiệu chuẩn" FieldName="CalibNo" 
                    ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Đơn vị hiệu chuẩn" FieldName="CalibFrom" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày hiệu chuẩn" FieldName="CalibDate" 
                    VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày hết hạn" FieldName="EndValidDate" 
                    VisibleIndex="8">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn Caption="Ghi chú" FieldName="Note" Visible="False" 
                    VisibleIndex="12">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn FieldName="DayLeft" VisibleIndex="9" 
                    Caption="Số ngày còn hiệu lực" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="Status" 
                    ReadOnly="True" VisibleIndex="10">
                    <PropertiesComboBox ValueType="System.Int32">
                        <Items>
                            <dx:ListEditItem Text="Hết hạn hiệu chuẩn" Value="0" />
                            <dx:ListEditItem Text="Sắp hết hạn hiệu chuẩn" Value="1" />
                            <dx:ListEditItem Text="Còn hạn hiệu chuẩn" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="CalibID" VisibleIndex="11" 
                    Visible="False">
                </dx:GridViewDataTextColumn>

            </Columns>
            <SettingsPager Summary-Text="">
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
            <asp:SqlDataSource ID="SqlDataSource_Calibration" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        
        SelectCommand="SELECT Calibration.CalibID, Calibration.TestSysID, Calibration.CalibNo, Calibration.CalibFrom, Calibration.CalibDate, Calibration.EndValidDate, Calibration.Note, DATEDIFF(DAY, GETDATE(), Calibration.EndValidDate) AS DayLeft, CASE WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 180 THEN 2 WHEN (DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 180 AND DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 0) THEN 1 WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 0 THEN 0 END AS Status, TestSystem.TestSysNo, TestSystem.Model FROM Calibration INNER JOIN TestSystem ON Calibration.TestSysID = TestSystem.TestSysID WHERE (Calibration.TestSysID = @TestSysID) ORDER BY DayLeft DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbTestSys" DefaultValue="0" Name="TestSysID" 
                        PropertyName="Value" />
                </SelectParameters>
    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_CalibrationAll" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        
        SelectCommand="SELECT Ca.CalibID, Ca.TestSysID, Ca.CalibNo, Ca.CalibFrom, Ca.CalibDate, Ca.EndValidDate, Ca.Note, DATEDIFF(DAY, GETDATE(), Ca.EndValidDate) AS DayLeft, CASE WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 180 THEN 2 WHEN (DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 180 AND DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 0) THEN 1 WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 0 THEN 0 END AS Status, TestSystem.TestSysNo, TestSystem.Model FROM Calibration AS Ca INNER JOIN TestSystem ON Ca.TestSysID = TestSystem.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration WHERE (TestSysID = Ca.TestSysID)))">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestSystem" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestSystem]"></asp:SqlDataSource>
                     
    <br />
                     
    </asp:Content>
