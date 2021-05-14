<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyThietBi.Master" AutoEventWireup="true" CodeBehind="2-QuanLySuCo.aspx.cs" Inherits="LabManagement.QuanLySuCo" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style27
        {
            width: 242px;
            color: #000000;
            height: 10px;
        }
        .style34
        {
            height: 10px;
            width: 390px;
        }
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
            width: 233px;
        }
        .style51
        {
            color: #0033CC;
            height: 10px;
            font-weight: bold;
            width: 242px;
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
            width: 233px;
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
        .style65
        {
            height: 26px;
        }
        .style67
        {
            height: 10px;
        }
    .style68
    {
        font-weight: bold;
        color: #003366;
        height: 10px;
        width: 269px;
    }
    .style69
    {
        font-weight: bold;
        color: #003366;
        height: 55px;
        width: 269px;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="height: 39px; width: 75%">
        <tr>
            <td style="text-align: center" valign="top" class="style65">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="X-Large" 
                    ForeColor="#CC3300" style="font-weight: 700" Text="QUẢN LÝ SỰ CỐ">
                </dx:ASPxLabel>
            </td>
        </tr>
        </table>
        <table class="style19" style="width: 75%">
            <tr>
                <td style="text-align: center">
                <dx:ASPxLabel ID="lbNotification" runat="server" 
                    style="font-style: italic; color: #FF0000" Text="ASPxLabel">
                </dx:ASPxLabel>
                </td>
            </tr>
    </table>
    <table>
        <tr>
            <td class="style51">
                <strong>Hệ thống đo</strong></td>
            <td class="style34">
                <dx:ASPxComboBox ID="cbTestSys" runat="server" AutoPostBack="true" 
                    EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" 
                    DataSourceID="SqlDataSource_TestSystem" ValueType="System.Int32" 
                    ValueField="TestSysID" TextField="TestSysName" Height="16px" Width="540px" 
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
            <td class="style51">
                Thiết bị đo (*)</td>
            <td class="style34">
                <dx:ASPxComboBox ID="cbTestAcc" runat="server" AutoPostBack="True" 
                    EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" 
                    DataSourceID="SqlDataSource_TestSystemAcc" ValueType="System.Int32" 
                    ValueField="AccID" TextField="AccName" Height="17px" Width="540px" 
                    TextFormatString="{1}" BackColor="#FFCCFF" 
                    onselectedindexchanged="cbTestSys_SelectedIndexChanged" 
                    DropDownStyle="DropDown">
                    <Columns>
                    <dx:ListBoxColumn Width="40" Caption="Mã thiết bị" FieldName="AccNo" />
                    <dx:ListBoxColumn Caption="Tên thiết bị" FieldName="AccName" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style27">
                Tên sự cố (*)</td>
            <td class="style34">
                <dx:ASPxTextBox ID="txtIncidentName" runat="server" Width="540px" Height="16px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style27">
                Ngày xảy ra sự cố (*)</td>
            <td class="style67">
                <dx:ASPxDateEdit ID="dtIncidentDate" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style27">
                Ngày hoàn tất khắc phục sự cố</td>
            <td class="style67">
                <dx:ASPxDateEdit ID="dtSolveDate" runat="server" BackColor="#FFFFCC">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style27">
                Tình trạng sự cố (*)</td>
            <td class="style34">
                <dx:ASPxComboBox ID="cbIncidentStatus" runat="server" 
                    DataSourceID="SqlDataSource_IncidentStatus" Height="18px" SelectedIndex="0" 
                    TextField="IncidentStatusName" ValueField="IncidentStatusID" 
                    ValueType="System.Int32" Width="376px">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style27">
                Mức độ ảnh hưởng đến hệ thống (*)</td>
            <td class="style34">
                <dx:ASPxComboBox ID="cbEffectTestSys" runat="server" 
                    DataSourceID="SqlDataSource_EffectToSysStatus" Height="18px" SelectedIndex="0" 
                    TextField="EffectName" ValueField="EffectID" ValueType="System.Int32" 
                    Width="376px">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style27">
                Mô tả sự cố</td>
            <td class="style34">
                <dx:ASPxMemo ID="mmDetail" runat="server" Height="104px" Width="377px" 
                    style="margin-left: 0px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style27">
                Giải pháp</td>
            <td class="style34">
                <dx:ASPxMemo ID="mmSolve" runat="server" Height="104px" Width="377px" 
                    BackColor="#FFFFCC" style="margin-left: 0px">
                </dx:ASPxMemo>
            </td>
        </tr>
        </table>
    <table class="style19" style="width: 75%">
        <tr>
            <td class="style58" align="center">
                &nbsp;</td>
            <td class="style59" align="center">
                &nbsp;</td>
            <td class="style68" align="center">
                &nbsp;</td>
            <td class="style60" align="center">
                &nbsp;</td>
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
            <td class="style69" align="center">
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
            Text="Danh sách các sự cố của" ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;<dx:ASPxLabel ID="lbTestSysName" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            ForeColor="#003399">
        </dx:ASPxLabel>
        </strong>
    </p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="SqlDataSource_Incident" KeyFieldName="IncidentID" EnableCallBacks="False"
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
                    <CancelButton Text="Thoát"></CancelButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                    VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Hệ thống đo" FieldName="TestSysID" 
                    ReadOnly="True" Visible="False" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystem" 
                        TextField="TestSysName" ValueField="TestSysID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="IncidentID" VisibleIndex="3" 
                    ReadOnly="True" ShowInCustomizationForm="True" Visible="False">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataComboBoxColumn Caption="Tên thiết bị" FieldName="AccID" 
                    ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystemAcc" 
                        TextField="AccName" TextFormatString="{1}" ValueField="AccID" 
                        ValueType="System.Int32">
                        <Columns>
                            <dx:ListBoxColumn Caption="Mã thiết bị" FieldName="AccNo" Width="40px" />
                            <dx:ListBoxColumn Caption="Tên thiết bị" FieldName="AccName" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="IncidentName" VisibleIndex="6" 
                    ShowInCustomizationForm="True" Caption="Tên sự cố">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataMemoColumn Caption="Chi tiết sự cố" FieldName="Detail" 
                    Visible="False" VisibleIndex="12">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Phương pháp khắc phục" FieldName="Solve" 
                    Visible="False" VisibleIndex="13">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                    ShowInCustomizationForm="True" VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="SqlDataSource_IncidentStatus" 
                        TextField="IncidentStatusName" ValueField="IncidentStatusID" 
                        ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Mức độ ảnh hưởng" 
                    FieldName="EffectToSysID" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="SqlDataSource_EffectToSysStatus" 
                        TextField="EffectName" ValueField="EffectID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="SolveDate" 
                    VisibleIndex="9" ShowInCustomizationForm="True" 
                    Caption="Ngày khắc phục xong" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="IncidentDate" 
                    VisibleIndex="7" ShowInCustomizationForm="True" 
                    Caption="Ngày phát hiện sự cố" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="InitDate" ShowInCustomizationForm="True" 
                    VisibleIndex="8" Caption="Ngày báo sự cố" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>

                <dx:GridViewDataTextColumn Caption="Mã thiết bị" FieldName="AccNo" 
                    VisibleIndex="5">
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
            <asp:SqlDataSource ID="SqlDataSource_Incident" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" SelectCommand="SELECT     TestSystem.TestSysID, Incident.IncidentID, Incident.AccID, TestAccessory.AccNo, Incident.IncidentName, Incident.Detail, Incident.Solve, Incident.StatusID, Incident.EffectToSysID, 
                      Incident.SolveDate, Incident.IncidentDate, Incident.InitDate
FROM         Incident INNER JOIN
                      TestAccessory ON Incident.AccID = TestAccessory.AccID INNER JOIN
                      TestSystem ON TestAccessory.TestSysID = TestSystem.TestSysID
WHERE TestSystem.TestSysID=@TestSysID ORDER BY Incident.StatusID asc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbTestSys" DefaultValue="0" Name="TestSysID" 
                        PropertyName="Value" />
                </SelectParameters>
    </asp:SqlDataSource>
            <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách toàn bộ các sự cố" ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
    </p>
            <dx:ASPxGridView ID="ASPxGridView3" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid3"
            DataSourceID="SqlDataSource_IncidentAll" KeyFieldName="IncidentID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView3_CustomCallback" 
        style="margin-right: 0px" 
        onhtmlrowprepared="ASPxGridView3_HtmlRowPrepared" 
        oncustomcolumndisplaytext="ASPxGridView3_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid3.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Chi tiết">
                    </EditButton>
                    <UpdateButton Text=" "></UpdateButton>
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
                    ReadOnly="True" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystem" 
                        TextField="TestSysName" ValueField="TestSysID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="IncidentID" VisibleIndex="3" 
                    ReadOnly="True" ShowInCustomizationForm="True" Visible="False">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataComboBoxColumn Caption="Tên thiết bị" FieldName="AccID" 
                    ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystemAccAll" 
                        TextField="AccName" TextFormatString="{1}" ValueField="AccID" 
                        ValueType="System.Int32">
                        <Columns>
                            <dx:ListBoxColumn Caption="Mã thiết bị" FieldName="AccNo" Width="40px" />
                            <dx:ListBoxColumn Caption="Tên thiết bị" FieldName="AccName" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="IncidentName" VisibleIndex="6" 
                    ShowInCustomizationForm="True" Caption="Tên sự cố">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataMemoColumn Caption="Chi tiết sự cố" FieldName="Detail" 
                    Visible="False" VisibleIndex="13">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Phương pháp khắc phục" FieldName="Solve" 
                    Visible="False" VisibleIndex="12">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                    ShowInCustomizationForm="True" VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="SqlDataSource_IncidentStatus" 
                        TextField="IncidentStatusName" ValueField="IncidentStatusID" 
                        ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Mức độ ảnh hưởng" 
                    FieldName="EffectToSysID" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="SqlDataSource_EffectToSysStatus" 
                        TextField="EffectName" ValueField="EffectID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="SolveDate" 
                    VisibleIndex="9" ShowInCustomizationForm="True" 
                    Caption="Ngày khắc phục xong" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="IncidentDate" 
                    VisibleIndex="7" ShowInCustomizationForm="True" 
                    Caption="Ngày phát hiện sự cố" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="InitDate" ShowInCustomizationForm="True" 
                    VisibleIndex="8" Caption="Ngày báo sự cố" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>

                <dx:GridViewDataTextColumn Caption="Mã thiết bị" FieldName="AccNo" 
                    VisibleIndex="5">
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
            <asp:SqlDataSource ID="SqlDataSource_IncidentAll" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        SelectCommand="SELECT     TestSystem.TestSysID, Incident.IncidentID, Incident.AccID,TestAccessory.AccNo,Incident.IncidentName, Incident.Detail, Incident.Solve, Incident.StatusID, Incident.EffectToSysID, 
                      Incident.SolveDate, Incident.IncidentDate, Incident.InitDate
FROM         Incident INNER JOIN
                      TestAccessory ON Incident.AccID = TestAccessory.AccID INNER JOIN
                      TestSystem ON TestAccessory.TestSysID = TestSystem.TestSysID
ORDER BY Incident.StatusID asc,Incident.EffectToSysID desc, Incident.InitDate desc">
    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_Calibration" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        SelectCommand="SELECT CalibID, TestSysID, CalibNo, CalibFrom, CalibDate, EndValidDate, Note, DATEDIFF(DAY, GETDATE(), EndValidDate) AS DayLeft, CASE WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 180 THEN 2 WHEN (DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 180 AND DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 0) THEN 1 WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 0 THEN 0 END AS Status FROM Calibration WHERE (TestSysID = @TestSysID) ORDER BY DayLeft desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbTestSys" DefaultValue="0" Name="TestSysID" 
                        PropertyName="Value" />
                </SelectParameters>
    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_CalibrationAll" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        SelectCommand="SELECT CalibID, TestSysID, CalibNo, CalibFrom, CalibDate, EndValidDate, Note, DATEDIFF(DAY, GETDATE(), EndValidDate) AS DayLeft, CASE WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 180 THEN 2 WHEN (DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 180 AND DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 0) THEN 1 WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 0 THEN 0 END AS Status FROM Calibration AS Ca WHERE (EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration WHERE (TestSysID = Ca.TestSysID)))">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestSystem" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestSystem]"></asp:SqlDataSource>
                     
        <asp:SqlDataSource ID="SqlDataSource_TestSystemAcc" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
        SelectCommand="SELECT * FROM [TestAccessory] WHERE ([TestSysID] = @TestSysID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbTestSys" DefaultValue="0" Name="TestSysID" 
                    PropertyName="Value" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
                     
        <asp:SqlDataSource ID="SqlDataSource_TestSystemAccAll" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
        SelectCommand="SELECT * FROM [TestAccessory]">
    </asp:SqlDataSource>
                     
    <asp:SqlDataSource ID="SqlDataSource_IncidentStatus" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        SelectCommand="SELECT * FROM [IncidentStatus]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_EffectToSysStatus" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        SelectCommand="SELECT * FROM [EffectToSys]"></asp:SqlDataSource>
                     
    <br />
                     
    </asp:Content>
