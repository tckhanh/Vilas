<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyThietBi.Master" AutoEventWireup="true" CodeBehind="2-QuanLyBanGiaoTB.aspx.cs" Inherits="LabManagement.QuanLyBanGiaoTB" %>
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
        .style24
        {
        }
        .style32
    {
        width: 699px;
        font-size: medium;
            margin-right: 0px;
        }
    .style33
    {
            width: 2756px;
        }
    .style35
    {
        color: #CC3300;
        font-size: x-large;
        width: 100%;
    }
        .style48
        {
            width: 67%;
            height: 10px;
        }
        .style53
        {
            width: 70%;
            height: 89px;
        }
        .style54
        {
            font-size: x-large;
            color: #CC3300;
        }
        .style56
        {
            font-size: x-large;
            color: #CC3300;
            height: 44px;
        }
    .style57
    {
        height: 6px;
        }
        .style59
        {
            width: 2756px;
            color: #000000;
        }
        .style60
        {
            width: 150px;
            height: 6px;
        }
        .style62
        {
        }
        .style63
        {
            width: 96px;
        }
        .style66
        {
            text-align: center;
            width: 252px;
        }
        .style67
        {
            height: 6px;
        }
        .style68
        {
            width: 150px;
            height: 38px;
        }
        .style69
        {
            width: 190px;
            height: 38px;
        }
        .style70
        {
            width: 201px;
            height: 38px;
        }
        .style71
        {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style53">
        <tr>
            <td class="style56" style="text-align: center" colspan="2">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssClass="style35" 
            Font-Bold="True" Font-Italic="False" Font-Size="X-Large" 
            Text="QUẢN LÝ BÀN GIAO THIẾT BỊ">
        </dx:ASPxLabel>
        </strong>
            </td>
        </tr>
        <tr>
            <td class="style54" style="text-align: center" colspan="2">
                <dx:ASPxLabel ID="lbNotification" runat="server" Font-Bold="False" 
                    Font-Italic="True" Font-Size="Small" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <dx:ASPxCheckBox ID="chInternal" runat="server" AutoPostBack="True" 
                    oncheckedchanged="chInternal_CheckedChanged" 
                    Text="Người nhận là nhân viên phòng đo">
                </dx:ASPxCheckBox>
            </td>
            <td align="center">
                <dx:ASPxCheckBox ID="chExternal" runat="server" AutoPostBack="True" 
                    oncheckedchanged="chExternal_CheckedChanged" 
                    Text="Người nhận là người bên ngoài phòng đo">
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
    <table class="style32">
        <tr>
            <td class="style59">
                <strong>Số phiếu bàn giao</strong></td>
            <td colspan="2" class="style62">
                <dx:ASPxTextBox ID="txtPaperNo" runat="server" BackColor="#FFCCFF" 
                    Width="170px" Font-Bold="True">
                </dx:ASPxTextBox>
            </td>
            <td colspan="2" class="style62" align="center">
                    <dx:ASPxButton ID="btSearch" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tìm" 
                        Width="125px" onclick="btSearch_Click">
                    </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td class="style59">
                Người bàn giao</td>
            <td colspan="4" class="style62">
                <dx:ASPxComboBox ID="cbStaffIssue" runat="server" 
                    DataSourceID="SqlDataSource_Staff" TextField="StaffFullName" 
                    ValueField="StaffID" ValueType="System.String" Width="300px">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style59">
                Người nhận nội bộ</td>
            <td colspan="4" class="style62">
                <dx:ASPxComboBox ID="cbStaff" runat="server" DataSourceID="SqlDataSource_Staff" 
                    TextField="StaffFullName" ValueField="StaffID" ValueType="System.String" 
                    Width="300px">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style59">
                Tên đơn vị</td>
            <td colspan="4" class="style62">
                <dx:ASPxTextBox ID="txtCompName" runat="server" Width="500px" Height="16px" 
                    BackColor="#FFFFCC">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style59">
                Địa chỉ</td>
            <td colspan="4" class="style62">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="500px" Height="16px" 
                    BackColor="#FFFFCC">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Số điện thoại</td>
            <td>
                <dx:ASPxTextBox ID="txtPhone" runat="server" Width="168px" Height="16px" 
                    BackColor="#FFFFCC">
                </dx:ASPxTextBox>
            </td>
            <td colspan="2" class="style66">
                Số Fax</td>
            <td>
                <dx:ASPxTextBox ID="txtFax" runat="server" Width="170px" Height="20px" 
                    BackColor="#FFFFCC">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style59">
                Tên người nhận</td>
            <td colspan="4" class="style62">
                <dx:ASPxTextBox ID="txtPersonName" runat="server" Width="500px" Height="16px" 
                    BackColor="#FFFFCC">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Chức vụ</td>
            <td colspan="4">
                <dx:ASPxTextBox ID="txtPosition" runat="server" Width="500px" Height="16px" 
                    BackColor="#FFFFCC">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Số CMND</td>
            <td>
                <dx:ASPxTextBox ID="txtID" runat="server" Width="168px" Height="16px" 
                    BackColor="#FFFFCC">
                </dx:ASPxTextBox>
            </td>
            <td colspan="2" class="style66">
                Số di động</td>
            <td>
                <dx:ASPxTextBox ID="txtMobileNo" runat="server" Width="170px" Height="20px" 
                    BackColor="#FFFFCC">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Ngày bàn giao</td>
            <td class="style63">
                <dx:ASPxDateEdit ID="dthandover" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style66" colspan="2">
                Ngày trả dự kiến</td>
            <td class="style24">
                <dx:ASPxDateEdit ID="dtReceive" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style59">
                Thông tin bổ sung</td>
            <td class="style24" colspan="4">
                <dx:ASPxMemo ID="mmNote" runat="server" Height="90px" Width="341px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style59" bgcolor="#FFCCFF">
                Tình trạng phiếu</td>
            <td class="style24" colspan="2" bgcolor="#FFCCFF">
                <dx:ASPxComboBox ID="cbHandStatus" runat="server" 
                    DataSourceID="SqlDataSource_HandoverStatus" TextField="HandStatusName" 
                    ValueField="HandStatusID" ValueType="System.Int32" Width="300px" 
                    BackColor="#FFFFCC" AutoPostBack="True" 
                    onselectedindexchanged="cbHandStatus_SelectedIndexChanged">
                </dx:ASPxComboBox>
            </td>
            <td class="style24" colspan="2" align="center" rowspan="2">
                    <dx:ASPxButton ID="btUpdate" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật" 
                        Width="125px" onclick="btUpdate_Click">
                    </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td class="style59" bgcolor="#FFCCFF">
                Ngày trả thực tế</td>
            <td class="style24" colspan="2" bgcolor="#FFCCFF">
                <dx:ASPxDateEdit ID="dtReceiveRe" runat="server" BackColor="#FFFFCC" 
                    AutoPostBack="True" ondatechanged="dtReceiveRe_DateChanged">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
    </table>
        <table class="style48">
            <tr>
                <td class="style68" align="right">
                    <dx:ASPxButton ID="btsave" runat="server"
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu phiếu bàn giao" 
                        Height="25px" onclick="btsave_Click" Width="136px"> 
                   
                    </dx:ASPxButton>
                </td>
                <td class="style69" align="right">
                    <dx:ASPxButton ID="btDelete" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xóa phiếu bàn giao" Width="172px" onclick="btDelete_Click">
                    </dx:ASPxButton>
                </td>
                <td align="right" class="style70">
                    <dx:ASPxButton ID="btClearList" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa danh sách phụ kiện" 
                        Width="179px" onclick="btClearList_Click" Height="22px">
                    </dx:ASPxButton>
                </td>
                <td align="right" class="style71">
                    <dx:ASPxButton ID="btnew" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Nhập mới" 
                        Width="125px" onclick="btnew_Click">
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td class="style60" align="right">
                    &nbsp;</td>
                <td class="style57" align="center" colspan="2">
                    <dx:ASPxButton ID="cbPrint" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="In Biên bản bàn giao" 
                        Width="196px">
                        <ClientSideEvents Click="function (s, e) {window.open('ReportForm/HandoverPaper.aspx', '_blank')}" />
                    </dx:ASPxButton>
                </td>
                <td align="right" class="style67">
                    &nbsp;</td>
            </tr>
    </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách thiết bị nằm trong phiếu bàn giao số">
        </dx:ASPxLabel>
        &nbsp;<dx:ASPxLabel ID="lbHandoverNo" runat="server" Font-Size="Medium" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        </strong>
    </p>
            <dx:ASPxGridView ID="ASPxGridView3" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid3"
            DataSourceID="SqlDataSource_HandoverAcc" KeyFieldName="HandAccID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        style="margin-right: 0px" onrowdeleted="ASPxGridView3_RowDeleted" 
        oncustomcallback="ASPxGridView3_CustomCallback" 
        onrowupdating="ASPxGridView3_RowUpdating" 
        oncustomcolumndisplaytext="ASPxGridView3_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid3.PerformCallback(s.GetFocusedRowIndex());
              }"  
            />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Chi tiết"></EditButton>
                    <UpdateButton Text="Cập nhật"></UpdateButton>
                    <DeleteButton Visible="True" Text="Xóa">
                    </DeleteButton>
                    <CancelButton Text="Thoát"></CancelButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" VisibleIndex="1" 
                    UnboundType="String">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TestSysName" ShowInCustomizationForm="True" 
                    Caption="Hệ thống đo" VisibleIndex="2" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccNo" VisibleIndex="3" 
                    Caption="Mã phụ kiện"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccName" VisibleIndex="4" 
                    Caption="Tên phụ kiện">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" 
                    VisibleIndex="5" Caption="Ký hiệu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" VisibleIndex="7" 
                    Caption="Hãng sản xuất" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nơi sản xuất" FieldName="CountryName" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MadeYear"  VisibleIndex="9" 
                    Caption="Năm sản xuất" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Serial" FieldName="SN" VisibleIndex="6" 
                    ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True" />
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" 
                    FieldName="TestSysStatusID" VisibleIndex="14">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSysStatus" 
                        TextField="TestSysStatusName" ValueField="TestSysStatusID" 
                        ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Thân máy hay phụ kiện" FieldName="Body" 
                    VisibleIndex="10" ReadOnly="True">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Phụ kiện" Value="0" />
                            <dx:ListEditItem Text="Thân máy" Value="1" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Thành phần" FieldName="MainAcc" 
                    VisibleIndex="11" ReadOnly="True">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Thành phần phụ" Value="0" />
                            <dx:ListEditItem Text="Thành phần chính" Value="1" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="HandAccID" 
                    ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                </dx:GridViewDataTextColumn>

            </Columns>
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
             <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="true" AllowFocusedRow="true" />
             <SettingsText ConfirmDelete="Bạn có muốn xóa thông tin phụ kiện này ra khỏi phiếu bàn giao" />
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
            <asp:SqlDataSource ID="SqlDataSource_HandoverAcc" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        SelectCommand="SELECT HandoverAcc.HandoverID, Handover.HandoverNo, TestSystem.TestSysName, TestAccessory.AccName, TestAccessory.Model, TestAccessory.SN, HandoverAcc.AccID, TestAccessory.Manufacturer, Country.CountryName, TestAccessory.Body, AccType.AccTypeName, TestAccessory.MainAcc, TestAccessory.Valid, TestAccessory.AccNo, TestAccessory.AccTypeID, TestAccessory.Hold, TestAccessory.MadeYear, TestSysStatus.TestSysStatusName, HandoverAcc.HandAccID, TestSysStatus.TestSysStatusID FROM Handover INNER JOIN HandoverAcc ON Handover.HandoverID = HandoverAcc.HandoverID INNER JOIN TestAccessory ON HandoverAcc.AccID = TestAccessory.AccID INNER JOIN TestSystem ON TestAccessory.TestSysID = TestSystem.TestSysID INNER JOIN Country ON TestAccessory.CountryID = Country.CountryID INNER JOIN AccType ON TestAccessory.AccTypeID = AccType.AccTypeID INNER JOIN TestSysStatus ON HandoverAcc.Status = TestSysStatus.TestSysStatusID WHERE (Handover.HandoverNo = @HandoverNo)" 
        EnableViewState="False" DeleteCommand="SELECT HandAccID FROM HandoverAcc" 
        UpdateCommand="SELECT HandAccID FROM HandoverAcc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtPaperNo" DefaultValue="0" Name="HandoverNo" 
                        PropertyName="Text" />
                </SelectParameters>
    </asp:SqlDataSource>
    <p>
        &nbsp;</p>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách thiết bị tại phòng đo">
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
                    <%--<EditButton Text="Sửa"></EditButton>
                    <UpdateButton Text="Cập nhật"></UpdateButton>
                    <CancelButton Text="Thoát"></CancelButton>
                    <ClearFilterButton Visible="True" Text="Xóa lọc">
                    </ClearFilterButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="AccID" 
                    VisibleIndex="1" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" 
                    ShowInCustomizationForm="True" UnboundType="Integer" VisibleIndex="2" 
                    Width="50px">
                    <EditFormSettings Visible="False" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Hệ thống đo" FieldName="TestSysID" 
                    VisibleIndex="3" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
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
                    VisibleIndex="4">
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
                <dx:GridViewDataTextColumn FieldName="AccNo" VisibleIndex="6" 
                    Caption="Mã thiết bị"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccName" VisibleIndex="5" 
                    Caption="Tên thiết bị">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" 
                    VisibleIndex="7" Caption="Ký hiệu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SN" VisibleIndex="8" 
                    Caption="Serial Number" Visible="False" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hãng sản xuất" FieldName="Manufacturer" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Nơi sản xuất" FieldName="CountryID" 
                    VisibleIndex="10" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCountry" TextField="CountryName" 
                        ValueField="CountryID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="AccTypeID" 
                    VisibleIndex="15" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSource_AccType" 
                        TextField="AccTypeName" ValueField="AccTypeID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="MadeYear"  VisibleIndex="11" 
                    Caption="Năm sản xuất" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày nhận" FieldName="ReceiveDate" 
                    VisibleIndex="12" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn Caption="Thông tin bổ sung" FieldName="History" 
                    Visible="False" VisibleIndex="18">
                    <PropertiesMemoEdit Height="150px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                    VisibleIndex="17">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSysStatus" 
                        TextField="TestSysStatusName" ValueField="TestSysStatusID" 
                        ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="Hold" 
                    VisibleIndex="16">
                    <PropertiesComboBox ValueType="System.Int32" 
                        DataSourceID="SqlDataSource_AccHoldStatus" TextField="AccHoldName" 
                        ValueField="AccHoldID">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Thân máy hay phụ kiện" FieldName="Body" 
                    VisibleIndex="13" Visible="False">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Phụ kiện" Value="0" />
                            <dx:ListEditItem Text="Thân máy" Value="1" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Thành phần" FieldName="MainAcc" 
                    VisibleIndex="14">
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
        <strong>
        <dx:ASPxLabel ID="ASPxLabel6" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các phiếu bàn giao">
        </dx:ASPxLabel>
        </strong>
    
    </p>
            <dx:ASPxGridView ID="ASPxGridView4" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid4"
            DataSourceID="SqlDataSource_HandoverPaper" KeyFieldName="HandoverID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView4_CustomCallback" 
        style="margin-right: 0px" 
        onhtmlrowprepared="ASPxGridView4_HtmlRowPrepared">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid4.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Chi tiết">
                    </EditButton>
                    <UpdateButton Text=" "></UpdateButton>
                    <CancelButton Text="Thoát"></CancelButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="HandoverID" VisibleIndex="1" 
                    ReadOnly="True" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HandoverNo" VisibleIndex="2" 
                    Caption="Số phiếu bàn giao">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="HandoverDate" 
                    VisibleIndex="3" Caption="Ngày bàn giao">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="HandoverReceiveEx" VisibleIndex="4" 
                    Caption="Ngày trả dự kiến" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="HandoverReceiveRe" VisibleIndex="5" 
                    Caption="Ngày trả thực tế">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người nhận nội bộ" 
                    FieldName="ReceiveStaffID" ShowInCustomizationForm="True" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="SqlDataSource_Staff" 
                        TextField="StaffFullName" ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="8" 
                    Caption="Đơn vị nhận bàn giao">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Address"  VisibleIndex="9" 
                    Caption="Địa chỉ" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Phone" VisibleIndex="10" 
                    Caption="Số điện thoại" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Fax" VisibleIndex="11" 
                    Caption="Số Fax" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="PerName" ShowInCustomizationForm="True" 
                    Caption="Người nhận bên ngoài" Visible="False" VisibleIndex="12">
<EditFormSettings Visible="True"></EditFormSettings>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Position" ShowInCustomizationForm="True" 
                    Caption="Chức vụ" Visible="False" VisibleIndex="13">
<EditFormSettings Visible="True"></EditFormSettings>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="PerID" ShowInCustomizationForm="True" Caption="Số CMND" 
                    Visible="False" VisibleIndex="14">
<EditFormSettings Visible="True"></EditFormSettings>
</dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PerPhoneNo" VisibleIndex="15" 
                    Caption="Số điện thoại" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tình trạng bàn giao" 
                    FieldName="HandoverStatusID" ShowInCustomizationForm="True" 
                    VisibleIndex="16">
                    <PropertiesComboBox DataSourceID="SqlDataSource_HandoverStatus" 
                        TextField="HandStatusName" ValueField="HandStatusID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người bàn giao" 
                    FieldName="HandoverStaffID" ShowInCustomizationForm="True" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="SqlDataSource_Staff" 
                        TextField="StaffFullName" ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn Caption="Ghi chú" FieldName="Note" Visible="False" 
                    VisibleIndex="17">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>

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
    <asp:SqlDataSource ID="SqlDataSource_HandoverPaper" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        SelectCommand="SELECT * FROM [Handover] ORDER BY [HandoverDate] DESC"></asp:SqlDataSource>
<p>
  
        <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            SelectCommand="SELECT * FROM [Country]">
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
        <asp:SqlDataSource ID="SqlDataSource_Staff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [Staff]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_HandoverStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [HandoverStatus]"></asp:SqlDataSource>
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
    <p>
        &nbsp;</p>
</asp:Content>
