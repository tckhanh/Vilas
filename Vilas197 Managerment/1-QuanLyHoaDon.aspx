<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-QuanLyHoaDon.aspx.cs" Inherits="LabManagement.QuanLyHoaDon" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraReports.v20.1.Web.WebForms, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style19 {
            color: #CC3300;
            font-size: xx-large;
        }

        .style20 {
            width: 728px;
        }

        .style21 {
            width: 123px;
        }

        .style23 {
            width: 125px;
        }

        .style32 {
            width: 744px;
            font-size: medium;
            height: 69px;
            margin-bottom: 0px;
        }

        .style35 {
            color: #CC3300;
            font-size: x-large;
            width: 100%;
        }

        .style53 {
            width: 71%;
            height: 72px;
        }

        .style54 {
            font-size: x-large;
            color: #CC3300;
            height: 41px;
        }

        .style58 {
            width: 89%;
            height: 22px;
        }

        .style60 {
            height: 53px;
            width: 187px;
        }

        .style61 {
        }

        .style62 {
            width: 165px;
            color: #000099;
        }

        .style63 {
            width: 150px;
            color: #000099;
            height: 5px;
        }

        .style64 {
        }

        .style71 {
            width: 171px;
        }

        .style72 {
            width: 196px;
        }

        .style73 {
            width: 165px;
            color: #000099;
            height: 5px;
        }

        .style74 {
            height: 5px;
        }

        .style75 {
            width: 144px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style53">
        <tr>
            <td class="style54" style="text-align: center">
                <strong>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssClass="style35"
                        Font-Bold="True" Font-Italic="False" Font-Size="X-Large"
                        Text="QUẢN LÝ HÓA ĐƠN TÀI CHÍNH">
                    </dx:ASPxLabel>
                </strong>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxLabel ID="lblnotification" runat="server" Font-Italic="True"
                    Font-Overline="False" Font-Underline="False" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
    <table class="style32">
        <tr>
            <td class="style73">
                <strong>Số hóa đơn</strong></td>
            <td class="style74">
                <dx:ASPxTextBox ID="txtRedBillNo" runat="server" Width="198px" Height="20px"
                    BackColor="#FFCCFF">
                </dx:ASPxTextBox>
            </td>
            <td class="style63">
                <strong>Ngày xuất hóa đơn</strong></td>
            <td class="style74">
                <dx:ASPxDateEdit ID="dtRedBill" runat="server" BackColor="#FFCCFF">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style62">&nbsp;</td>
            <td class="style64" align="center" colspan="2">
                <dx:ASPxButton ID="btUpdate" runat="server"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật"
                    OnClick="btUpdate_Click">
                </dx:ASPxButton>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <p style="margin-top: 6px; margin-bottom: 9px">
        <strong>
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssClass="style35"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Thông tin Khách Hàng">
            </dx:ASPxLabel>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
    <table style="width: 753px">
        <tr>
            <td class="style71">Tên công ty (*)</td>
            <td colspan="3">
                <dx:ASPxComboBox ID="cbcompanyname" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCompany"
                    ValueType="System.Int32" Width="540px" ValueField="CompanyID"
                    TextField="CompanyID"
                    OnSelectedIndexChanged="cbcompanyname_SelectedIndexChanged"
                    IncrementalFilteringMode="Contains" DropDownStyle="DropDown" Height="16px"
                    TextFormatString="{0}">
                    <Columns>
                        <dx:ListBoxColumn Width="500px" Caption="Tên Công ty" FieldName="CompanyName" />
                        <dx:ListBoxColumn Width="300px" Caption="Địa Chỉ" FieldName="Address" />
                        <dx:ListBoxColumn Width="100px" Caption="Tỉnh/TP" FieldName="Province" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style71">Địa Chỉ</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="540px" Height="16px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style71">Số Điện thoại</td>
            <td class="style61">
                <dx:ASPxTextBox ID="txtphone" runat="server" Width="197px" Height="17px">
                </dx:ASPxTextBox>
            </td>
            <td class="style23">Số Fax</td>
            <td>
                <dx:ASPxTextBox ID="txtfax" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style71">Mã số thuế</td>
            <td class="style61">
                <dx:ASPxTextBox ID="txttaxid" runat="server" Width="198px" Height="20px">
                </dx:ASPxTextBox>
            </td>
            <td class="style23">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <p style="margin-top: 6px; margin-bottom: 9px">
        <strong>
            <dx:ASPxLabel ID="ASPxLabel6" runat="server" CssClass="style35"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Thông tin hóa đơn">
            </dx:ASPxLabel>
        </strong>
    </p>
    <p style="margin-top: 6px; margin-bottom: 9px">
        <table>
            <tr>
                <td class="style71">Giá trước thuế </td>
                <td class="style61">
                    <dx:ASPxTextBox ID="txtPriceNonTax" runat="server" Width="197px" Height="17px"
                        DisplayFormatString="###,###,###,###,0">
                    </dx:ASPxTextBox>
                </td>
                <td>VNĐ</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style71">Thuế VAT</td>
                <td class="style61">
                    <dx:ASPxTextBox ID="txtTax" runat="server" Width="197px" Height="17px"
                        DisplayFormatString="###,###,###,###,0">
                    </dx:ASPxTextBox>
                </td>
                <td>VNĐ</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style71">Giá sau thuế (10% VAT)</td>
                <td class="style61">
                    <dx:ASPxTextBox ID="txtPriceIncludeTax" runat="server" Width="197px"
                        Height="17px" DisplayFormatString="###,###,###,###,0">
                    </dx:ASPxTextBox>
                </td>
                <td>VNĐ</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="style32">
            <tr>
                <td class="style71">Viết bằng chữ</td>
                <td class="style61">
                    <dx:ASPxMemo ID="mmPriceInText" runat="server" Height="71px" Width="400px">
                    </dx:ASPxMemo>
                </td>
            </tr>
            <tr>
                <td class="style71">Ghi chú</td>
                <td class="style61">
                    <dx:ASPxMemo ID="mmNote" runat="server" Height="71px" Width="400px">
                    </dx:ASPxMemo>
                </td>
            </tr>
        </table>
    </p>
    <table>
        <tr>
            <td align="center" width="200">
                <dx:ASPxButton ID="btInitialCreate" runat="server"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo thông tin ban đầu"
                    OnClick="btInitialCreate_Click" Width="164px">
                </dx:ASPxButton>
            </td>
            <td align="center" width="200">
                <dx:ASPxButton ID="btFinish" runat="server"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Hoàn tất tạo hóa đơn"
                    OnClick="btFinish_Click" Width="173px">
                </dx:ASPxButton>
            </td>
            <td align="center" width="100">
                <dx:ASPxButton ID="btDelete" runat="server"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa"
                    OnClick="btDelete_Click">
                </dx:ASPxButton>
            </td>
            <td align="center" width="150">
                <dx:ASPxButton ID="btNew" runat="server"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo mới"
                    OnClick="btNew_Click">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <p>
        <strong>
            <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="style19"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Danh sách các kết quả đo kiểm trong hóa đơn số ">
            </dx:ASPxLabel>
            <dx:ASPxLabel ID="lbRedBillNo" runat="server" CssClass="style19"
                Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#000099">
            </dx:ASPxLabel>
        </strong>
    </p>
    <p>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server"
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSourceAssignInfo1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
            KeyFieldName="RequestID" OnCustomCallback="ASPxGridView1_CustomCallback"
            Width="900px">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <SettingsPager Summary-Text="">
                <NextPageButton Text="Tiếp"></NextPageButton>
                <PrevPageButton Text="Trước"></PrevPageButton>

                <Summary Text=""></Summary>
            </SettingsPager>
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0"
                    Width="50px">
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="DeleteButton" Text="Xóa bỏ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Chi tiết">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="UpdateButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="ClearFilterButton" Text="Xóa lọc">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="CancelButton" Text="Thoát">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="RequestID" ReadOnly="True"
                    Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số KQ" FieldName="ReportNo"
                    VisibleIndex="2" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="RequestNo"
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu thu" FieldName="BillNo"
                    ShowInCustomizationForm="True" VisibleIndex="3">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số hợp đồng" FieldName="ContractNo"
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Số hóa đơn" FieldName="RedBillID"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="SqlDataSource_RedBill" TextField="RedBillNo"
                        ValueField="RedBillID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên Công ty" FieldName="CompanyID"
                    VisibleIndex="6" Width="120px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName"
                        ValueField="CompanyID" ValueType="System.Int32" DropDownStyle="DropDown"
                        IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người liên hệ" FieldName="ContactID"
                    Visible="False" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="SqlDataSourceContact" TextField="FullName"
                        ValueField="ContactID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Số di động" FieldName="ContactID"
                    Visible="False" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="SqlDataSourceContact"
                        TextField="ContactPhone" ValueField="ContactID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="EquTypeID"
                    VisibleIndex="9" Width="120px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEquipment"
                        TextField="EquTypeName" ValueField="EquTypeID" ValueType="System.String"
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="11" Caption="Phí đo">
                    <PropertiesTextEdit DisplayFormatString="###,###,###,###,##0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="Model"
                    VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer"
                    Visible="False" VisibleIndex="12" ShowInCustomizationForm="True"
                    Caption="Hãng sản xuất">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MadeInID" Visible="False"
                    VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" Visible="False"
                    VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày nhận mẫu" FieldName="ReceiveDate"
                    VisibleIndex="15" Visible="False">
                    <PropertiesDateEdit>
                        <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                        </CalendarProperties>
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả dự kiến"
                    FieldName="AppointmentDate" VisibleIndex="16" Visible="False">
                    <PropertiesDateEdit>
                        <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                        </CalendarProperties>
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày ban hành KQ"
                    FieldName="TestRPIssueDate" ShowInCustomizationForm="True"
                    VisibleIndex="17" Width="20px">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                    <FilterCellStyle Wrap="True">
                    </FilterCellStyle>
                    <HeaderStyle Wrap="True" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người phê duyệt" FieldName="StaffIDApprove"
                    VisibleIndex="18" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff"
                        TextField="StaffFullName" ValueField="StaffID" ValueType="System.String"
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID"
                    ShowInCustomizationForm="True" VisibleIndex="19" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceRequestSt"
                        TextField="StatusName" ValueField="StatusID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="TestReportKind" Visible="False"
                    VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả mẫu" FieldName="ReturnDate"
                    Visible="False" VisibleIndex="20">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả mẫu"
                    FieldName="ReturnStaffID" Visible="False" VisibleIndex="21">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả KQ" FieldName="ReturnRPDate"
                    Visible="False" VisibleIndex="22">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả KQ"
                    FieldName="ReturnRPStaffID" Visible="False" VisibleIndex="23">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả hóa đơn"
                    FieldName="ReturnRBStaffID" Visible="False" VisibleIndex="27">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả hóa đơn" FieldName="ReturnRBDate"
                    Visible="False" VisibleIndex="26">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
            </Columns>
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
        <asp:SqlDataSource ID="SqlDataSourceAssignInfo1" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT Request.RequestID, Request.RequestNo, Request.ContractNo, Request.BillNo, Request.BillDate, Request.CompanyID, Request.ContactID, Request.EquTypeID, Request.EquTypeName, Request.Model, Request.Manufacturer, Request.MadeInID, Request.Serial_Imei, Request.Standards, Request.TestMethod, Request.Accessories, Request.ReceiveDate, Request.ReceiveStaffID, Request.AppointmentDate, Request.ReturnStaffID, Request.ReturnDate, Request.StatusID, Request.Note, Request.HoldEquip, Request.ConfirmDate, Request.InternalNote, Request.StaffIDNonIssue, (SELECT TestReportNo FROM TestReport WHERE (AssignmentID = Request.RequestID)) AS ReportNo, (SELECT TestReportIssueDate FROM TestReport AS TestReport_1 WHERE (AssignmentID = Request.RequestID)) AS TestRPIssueDate, (SELECT Kind FROM TestReport AS TestReport_2 WHERE (AssignmentID = Request.RequestID)) AS TestReportKind, (SELECT ReturnRPDate FROM TestReport AS TestReport_3 WHERE (AssignmentID = Request.RequestID)) AS ReturnRPDate, (SELECT ReturnStaffID FROM TestReport AS TestReport_4 WHERE (AssignmentID = Request.RequestID)) AS ReturnRPStaffID, (SELECT ReturnRBDate FROM TestReport AS TestReport_5 WHERE (AssignmentID = Request.RequestID)) AS ReturnRBDate, (SELECT ReturnRBStaffID FROM TestReport AS TestReport_6 WHERE (AssignmentID = Request.RequestID)) AS ReturnRBStaffID, (SELECT RedBillID FROM TestReport AS TestReport_7 WHERE (AssignmentID = Request.RequestID)) AS RedBillID, (SELECT RedBillNo FROM RedBill AS RedBill_1 WHERE (RedBillID = (SELECT RedBillID FROM TestReport AS TestReport_7 WHERE (AssignmentID = Request.RequestID)))) AS RedBillNo, Request.NonIssueDate, Request.StaffIDApprove, Request.ApproveNonIssueDate, EquipmentType.Price FROM Request INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID WHERE ((SELECT TestReportNo FROM TestReport AS TestReport_8 WHERE (AssignmentID = Request.RequestID)) IS NOT NULL) AND ((SELECT RedBillNo FROM RedBill AS RedBill_1 WHERE (RedBillID = (SELECT RedBillID FROM TestReport AS TestReport_7 WHERE (AssignmentID = Request.RequestID)))) = @RedBillNo) ORDER BY Request.ReceiveDate DESC, Request.RequestNo DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtRedBillNo" Name="RedBillNo"
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

    </p>
    <p>
        <strong>
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Danh sách các kết quả đo kiểm chờ xuất hóa đơn">
            </dx:ASPxLabel>
        </strong>
    </p>
    <p>

        <dx:ASPxGridView ID="ASPxGridView3" runat="server"
            AutoGenerateColumns="False" ClientInstanceName="grid3"
            DataSourceID="SqlDataSourceAssignInfo2" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
            KeyFieldName="RequestID"
            OnCustomCallback="ASPxGridView3_CustomCallback"
            OnHtmlRowPrepared="ASPxGridView3_HtmlRowPrepared" Width="900px">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid3.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <SettingsPager Summary-Text="">
                <NextPageButton Text="Tiếp"></NextPageButton>
                <PrevPageButton Text="Trước"></PrevPageButton>

                <Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0"
                    Width="50px" ShowEditButton="True">
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="DeleteButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Chi tiết">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="UpdateButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="ClearFilterButton" Text="Xóa lọc">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="CancelButton" Text="Thoát">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="RequestID" ReadOnly="True"
                    Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số KQ" FieldName="ReportNo"
                    VisibleIndex="2" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="RequestNo"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu thu" FieldName="BillNo"
                    ShowInCustomizationForm="True" VisibleIndex="3">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ContractNo" VisibleIndex="4"
                    Caption="Số hợp đồng">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Số hóa đơn" FieldName="RedBillID"
                    VisibleIndex="5" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSource_RedBill"
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                        TextField="RedBillNo" ValueField="RedBillID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên Công ty" FieldName="CompanyID"
                    VisibleIndex="6" Width="120px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName"
                        ValueField="CompanyID" ValueType="System.Int32" DropDownStyle="DropDown"
                        IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người liên hệ" FieldName="ContactID"
                    Visible="False" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="SqlDataSourceContact" TextField="FullName"
                        ValueField="ContactID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Số di động" FieldName="ContactID"
                    Visible="False" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="SqlDataSourceContact"
                        TextField="ContactPhone" ValueField="ContactID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="EquTypeID"
                    VisibleIndex="9" Width="120px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEquipment"
                        TextField="EquTypeName" ValueField="EquTypeID" ValueType="System.String"
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Price" ShowInCustomizationForm="True" VisibleIndex="11"
                    Caption="Phí đo">
                    <PropertiesTextEdit DisplayFormatString="###,###,###,###,##0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="Model"
                    VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hãng sản xuất" FieldName="Manufacturer"
                    VisibleIndex="12" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MadeInID" Visible="False"
                    VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" Visible="False"
                    VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày nhận mẫu" FieldName="ReceiveDate"
                    VisibleIndex="15" Visible="False">
                    <PropertiesDateEdit>
                        <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                        </CalendarProperties>
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả dự kiến"
                    FieldName="AppointmentDate" VisibleIndex="16" Visible="False">
                    <PropertiesDateEdit>
                        <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                        </CalendarProperties>
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày ban hành KQ"
                    FieldName="TestRPIssueDate" ShowInCustomizationForm="True"
                    VisibleIndex="17" Width="50px">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                    <HeaderStyle Wrap="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người phê duyệt" FieldName="StaffIDApprove"
                    VisibleIndex="18" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff"
                        TextField="StaffFullName" ValueField="StaffID" ValueType="System.String"
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID"
                    ShowInCustomizationForm="True" VisibleIndex="19" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceRequestSt"
                        TextField="StatusName" ValueField="StatusID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="TestReportKind" Visible="False"
                    VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả mẫu" FieldName="ReturnDate"
                    Visible="False" VisibleIndex="20">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả mẫu"
                    FieldName="ReturnStaffID" Visible="False" VisibleIndex="21">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả KQ" FieldName="ReturnRPDate"
                    Visible="False" VisibleIndex="22">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả KQ"
                    FieldName="ReturnRPStaffID" Visible="False" VisibleIndex="23">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả hóa đơn"
                    FieldName="ReturnRBStaffID" Visible="False" VisibleIndex="27">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả hóa đơn" FieldName="ReturnRBDate"
                    Visible="False" VisibleIndex="26">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
            </Columns>
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
        <asp:SqlDataSource ID="SqlDataSourceAssignInfo2" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT Request.RequestID, Request.RequestNo, Request.ContractNo, Request.BillNo, Request.BillDate, Request.CompanyID, Request.ContactID, Request.EquTypeID, Request.EquTypeName, Request.Model, Request.Manufacturer, Request.MadeInID, Request.Serial_Imei, Request.Standards, Request.TestMethod, Request.Accessories, Request.ReceiveDate, Request.ReceiveStaffID, Request.AppointmentDate, Request.ReturnStaffID, Request.ReturnDate, Request.StatusID, Request.Note, Request.HoldEquip, Request.ConfirmDate, Request.InternalNote, Request.StaffIDNonIssue, (SELECT TestReportNo FROM TestReport WHERE (AssignmentID = Request.RequestID)) AS ReportNo, (SELECT TestReportIssueDate FROM TestReport AS TestReport_1 WHERE (AssignmentID = Request.RequestID)) AS TestRPIssueDate, (SELECT Kind FROM TestReport AS TestReport_2 WHERE (AssignmentID = Request.RequestID)) AS TestReportKind, (SELECT ReturnRPDate FROM TestReport AS TestReport_3 WHERE (AssignmentID = Request.RequestID)) AS ReturnRPDate, (SELECT ReturnStaffID FROM TestReport AS TestReport_4 WHERE (AssignmentID = Request.RequestID)) AS ReturnRPStaffID, (SELECT ReturnRBDate FROM TestReport AS TestReport_5 WHERE (AssignmentID = Request.RequestID)) AS ReturnRBDate, (SELECT ReturnRBStaffID FROM TestReport AS TestReport_6 WHERE (AssignmentID = Request.RequestID)) AS ReturnRBStaffID, (SELECT RedBillID FROM TestReport AS TestReport_7 WHERE (AssignmentID = Request.RequestID)) AS RedBillID, Request.NonIssueDate, Request.StaffIDApprove, Request.ApproveNonIssueDate, EquipmentType.Price FROM Request INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID WHERE ((SELECT TestReportNo FROM TestReport AS TestReport_8 WHERE (AssignmentID = Request.RequestID)) IS NOT NULL) AND (Request.StatusID = 5) AND ((SELECT RedBillID FROM TestReport AS TestReport_7 WHERE (AssignmentID = Request.RequestID)) IS NULL) ORDER BY Request.ReceiveDate DESC, Request.RequestNo DESC"></asp:SqlDataSource>

    </p>
    <p>

        <strong>
            <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssClass="style19"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Danh sách các hóa đơn tài chính">
            </dx:ASPxLabel>
        </strong>

    </p>

    <dx:ASPxGridView ID="ASPxGridView4" runat="server"
        AutoGenerateColumns="False" ClientInstanceName="grid4"
        DataSourceID="SqlDataSource_RedBill" EnableCallBacks="False"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
        KeyFieldName="RedBillID"
        OnCustomCallback="ASPxGridView4_CustomCallback"
        OnHtmlRowPrepared="ASPxGridView4_HtmlRowPrepared"
        OnRowDeleting="ASPxGridView4_RowDeleting" Width="900px">
        <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid4.PerformCallback(s.GetFocusedRowIndex());
              }" />
        <SettingsPager Summary-Text="">
            <NextPageButton Text="Tiếp"></NextPageButton>
            <PrevPageButton Text="Trước"></PrevPageButton>

            <Summary Text=""></Summary>
        </SettingsPager>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="RedBillID"
                VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Số hóa đơn" FieldName="RedBillNo"
                ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="RedBillDate"
                VisibleIndex="3" Caption="Ngày xuất hóa đơn">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tên công ty" FieldName="CompanyID"
                VisibleIndex="4">
                <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName"
                    ValueField="CompanyID" ValueType="System.Int32">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="PriceNonTax"
                VisibleIndex="5" Caption="Phí đo trước thuế">
                <PropertiesTextEdit DisplayFormatString="###,###,###,###,0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PriceIncludeTax" VisibleIndex="6"
                Caption="Phí đo sau thuế">
                <PropertiesTextEdit DisplayFormatString="###,###,###,###,0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Note" VisibleIndex="7" Caption="Ghi chú"></dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tình trạng hóa đơn" FieldName="Finish"
                VisibleIndex="8">
                <PropertiesComboBox ValueType="System.String">
                    <Items>
                        <dx:ListEditItem Text="Chờ phê duyệt" Value="0" />
                        <dx:ListEditItem Text="Đã phê duyệt" Value="1" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
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
    <asp:SqlDataSource ID="SqlDataSource_RedBill" runat="server"
        ConnectionString="<%$ ConnectionStrings:db_mang %>"
        SelectCommand="SELECT RedBill.RedBillNo, RedBill.RedBillDate, RedBill.CompanyID, RedBill.PriceNonTax, RedBill.PriceIncludeTax, RedBill.Note, RedBill.Finish, Company.Address, Company.PhoneNo, Company.FaxNo, Company.TaxCode, RedBill.RedBillID FROM RedBill INNER JOIN Company ON RedBill.CompanyID = Company.CompanyID ORDER BY RedBill.RedBillNo DESC"
        DeleteCommand="SELECT RedBillID FROM RedBill"></asp:SqlDataSource>
    <p>

        <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [Company],[Province] where [Company].[ProvinceID]=[Province].[ProvinceID] Order by convert(nvarchar(500),[FastCompanyName])"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceContact" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [Contact]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceEquipment" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [EquipmentType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [Country] ORDER BY Convert(nvarchar(500),[CountryName])"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStaff1" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT StaffID, StaffFistName, StaffLastName, StaffFullName, PhoneNo, HomeAddress, HomePhone, Email, BeginDate, EndDate, Department, WorkHistory, TrainHistory, Username, Password, StaffImg FROM Staff ORDER BY CONVERT (nvarchar(500), StaffFistName)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStaff2" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [Staff]  ORDER BY CONVERT (nvarchar(500), StaffFistName)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRequest" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [Request] ORDER BY [RequestID] DESC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [Staff] ORDER BY CONVERT (nvarchar(500), StaffFistName)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceApproveStaff" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [Staff] ORDER BY CONVERT (nvarchar(500), StaffFistName)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRequestSt" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [RequestStatus]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRequestStSuccsess" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [RequestStatus] WHERE (([StatusID] = 5) OR ([StatusID] = 7))"></asp:SqlDataSource>

        <strong>
            <asp:SqlDataSource ID="SqlDataSourceProvince" runat="server"
                ConnectionString="<%$ ConnectionStrings:db_mang %>"
                SelectCommand="SELECT * FROM [Province]"></asp:SqlDataSource>
        </strong>

    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
</asp:Content>
