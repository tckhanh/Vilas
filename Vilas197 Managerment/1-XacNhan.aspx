<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-XacNhan.aspx.cs" Inherits="LabManagement.XacNhan" UICulture="vi-vn" %>
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
        .style25
        {
            width: 1029px;
            color: #000000;
        }
        .style26
        {
            width: 751px;
        }
        .style30
        {
        }
    .style31
    {
        width: 185px;
        color: #000000;
            text-align: center;
        }
    .style32
    {
        width: 753px;
        font-size: medium;
    }
    .style33
    {
            width: 1029px;
        }
    .style35
    {
        color: #CC3300;
        font-size: medium;
        width: 100%;
    }
        .style36
        {
        }
        .style39
        {
            width: 129px;
            height: 8px;
        }
        .style40
        {
            width: 176px;
            height: 8px;
            text-align: center;
        }
        .style41
        {
            height: 8px;
        }
        .style43
        {
            height: 22px;
        }
        .style44
        {
        }
        .style45
        {
        }
        .style46
        {
            width: 4848px;
        }
        .style47
        {
            width: 129px;
        }
        .style56
        {
            width: 119px;
        }
        .style63
        {
            height: 19px;
        }
        .style98
        {
        }
        .style99
        {
            height: 45px;
        }
        .style100
        {
            height: 45px;
        }
        .style103
        {
            width: 4577px;
            color: #003366;
        }
        .style105
        {
            width: 4577px;
            height: 19px;
            font-weight: 700;
            color: #003366;
            text-align: left;
        }
        .style108
        {
            width: 1029px;
            height: 35px;
        }
        .style109
        {
            height: 35px;
        }
        .style110
        {
        }
    .style111
    {
        height: 19px;
        width: 137px;
    }
    .style112
    {
        height: 19px;
        width: 175px;
        color: #003366;
            text-align: center;
        }
        .style113
        {
            width: 176px;
            text-align: center;
        }
        .style114
        {
            width: 185px;
            text-align: center;
        }
        .style115
        {
            height: 27px;
        }
        .style116
        {
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table style="width: 749px">
            <tr>
                <td class="style116" align="center" colspan="4" width="1000">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssClass="style35" 
            Font-Bold="True" Font-Italic="False" Font-Size="X-Large" 
            Text="XÁC NHẬN ĐO KIỂM">
        </dx:ASPxLabel>
        </strong>
                    </td>
            </tr>
            <tr>
                <td align="left" colspan="4" style="text-align: center" class="style115">
        <dx:ASPxLabel ID="lblnotifiReAssign" runat="server" Font-Italic="True" 
            Font-Overline="False" Font-Underline="False" ForeColor="Red">
        </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td class="style105" align="left" bgcolor="#FFFFCC">
                    <strong style="text-align: left">Người phân công</strong></td>
                <td class="style111" align="left" bgcolor="#FFFFCC">
                <dx:ASPxComboBox ID="cbAssign" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff1" ValueType="System.String" width="250px" 
                    ValueField="StaffID"  Height="18px" 
                        TextField="StaffID" BackColor="#FFFF66" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                    <columns>
                    <dx:ListBoxColumn Caption="Họ và Tên" FieldName="StaffFullName" />
                    </columns>
                </dx:ASPxComboBox>
                </td>
                <td class="style112" align="left" bgcolor="#FFFFCC">
                    <strong>Ngày phân công</strong></td>
                <td class="style63" align="left" bgcolor="#FFFFCC">
                <dx:ASPxDateEdit ID="dtAssign" runat="server" BackColor="#FFFF66">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td class="style105" align="left" bgcolor="#FFFFCC">
                    <strong>Tên mẫu đo kiểm</strong></td>
                <td class="style63" align="left" colspan="3" bgcolor="#FFFFCC">
                <dx:ASPxTextBox ID="txtEquipName2" runat="server" Width="550px" BackColor="#FFCCFF" 
                        Height="16px">
                </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td class="style103" align="left" bgcolor="#FFFFCC">
                    <strong>Nhân viên đo 1</strong></td>
                <td class="style110" align="left" bgcolor="#FFFFCC" colspan="3">
                <dx:ASPxComboBox ID="cbStaff1" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff1" ValueType="System.String" width="250px" 
                    ValueField="StaffID"  Height="18px" 
                        TextField="StaffID" BackColor="#FFCCFF" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                    <columns>
                    <dx:ListBoxColumn Caption="Họ và Tên" FieldName="StaffFullName" />
                    </columns>
                </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="style103" align="left" bgcolor="#FFFFCC">
                    <strong>Nhân viên đo 2</strong></td>
                <td class="style110" align="left" bgcolor="#FFFFCC" colspan="3">
                <dx:ASPxComboBox ID="cbStaff2" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff2" ValueType="System.String" width="250px" 
                    ValueField="StaffID" Height="18px" 
                        TextField="StaffID" BackColor="#FFCCFF" 
                        IncrementalFilteringMode="StartsWith" >
                    <columns>
                    <dx:ListBoxColumn Caption="Họ và Tên" FieldName="StaffFullName" />
                    </columns>
                </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="style103" align="left" bgcolor="#FFFFCC">
                    <strong>Lưu ý</strong></td>
                <td class="style98" align="left" bgcolor="#FFFFCC" colspan="3">
                    <dx:ASPxMemo ID="mmAssignNote" runat="server" BackColor="#FFCCFF" Height="71px" 
                        style="text-align: left" Width="422px">
                    </dx:ASPxMemo>
                </td>
            </tr>
            <tr>
                <td class="style99" align="center" colspan="4">
                    <dx:ASPxButton ID="btConfirm" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xác nhận phân công" Width="160px" onclick="btConfirm_Click">
                    </dx:ASPxButton>
                    </td>
            </tr>
            </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssClass="style35" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Thông tin Khách Hàng">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
        <dx:ASPxLabel ID="lblnotification" runat="server" Font-Italic="True" 
            Font-Overline="False" Font-Underline="False" ForeColor="Red">
        </dx:ASPxLabel>
        </p>
    <table class="style32">
        <tr>
            <td class="style108" bgcolor="White">
                <strong>Số phiếu yêu cầu đo kiểm</strong></td>
            <td colspan="3" bgcolor="White" class="style109" style="text-align: center">
                <dx:ASPxComboBox ID="cbRequestNo" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceRequest" ValueType="System.Int32" width="195px" 
                    ValueField="RequestID"  Height="16px" 
                        TextField="RequestID" BackColor="#FFCCFF" style="text-align: left" 
                    DropDownStyle="DropDown" >
                        <Columns>
                        <dx:ListBoxColumn Caption="Họ và Tên" FieldName="RequestNo" />
                        </Columns>
                 </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Tên công ty </td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtCompanyName" runat="server" Width="550px" Height="17px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Địa Chỉ</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="550px" Height="16px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Số Điện thoại</td>
            <td class="style56">
                <dx:ASPxTextBox ID="txtphone" runat="server" Width="197px" Height="17px">
                </dx:ASPxTextBox>
            </td>
            <td class="style114">
                Số Fax</td>
            <td>
                <dx:ASPxTextBox ID="txtfax" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Mã số thuế</td>
            <td class="style56">
                <dx:ASPxTextBox ID="txttaxid" runat="server" Width="198px" Height="20px">
                </dx:ASPxTextBox>
            </td>
            <td class="style114">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style33">
                Người liên hệ </td>
            <td class="style56">
                <dx:ASPxTextBox ID="txtContact" runat="server" Width="197px" Height="16px">
                </dx:ASPxTextBox>
            </td>
            <td class="style114">
                Điện Thoại</td>
            <td>
                <dx:ASPxTextBox ID="txtperphone" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                Số phiếu thu</td>
            <td class="style56">
                <dx:ASPxTextBox ID="txtBillNum" runat="server" BackColor="#FFCCFF" 
                    Font-Bold="True" Width="197px">
                </dx:ASPxTextBox>
            </td>
            <td class="style31">
                Số hợp đồng</td>
            <td>
                <dx:ASPxTextBox ID="txtContractNo" runat="server" BackColor="#FFCCFF" 
                    Font-Bold="True" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
    </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Thông tin Mẫu đo kiểm">
        </dx:ASPxLabel>
        </strong></p>
    <table class="style26">
        <tr>
            <td class="style46">
                Tên mẫu đo kiểm </td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtEquipName" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Tên bổ sung</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtEquName" runat="server" Height="20px" Width="550px" 
                    Font-Italic="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Hãng sản xuất </td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtcompmaking" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Nơi sản xuất </td>
            <td class="style44" colspan="3">
                <dx:ASPxTextBox ID="txtMadeIn" runat="server" Width="197px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Ký hiệu </td>
            <td class="style47">
                <dx:ASPxTextBox ID="txtModel" runat="server" Width="197px">
                </dx:ASPxTextBox>
            </td>
            <td class="style113">
                Serial Number&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                <dx:ASPxTextBox ID="txtSN" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Phương pháp thử</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txttestmethod" runat="server" Height="19px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Tiêu chuẩn đánh giá</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtstandard" runat="server" Width="550px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Phí đo kiểm (VNĐ)</td>
            <td class="style43" colspan="3">
                <dx:ASPxTextBox ID="txtprice" runat="server" Width="197px" Height="17px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Viết bằng chữ</td>
            <td class="style36" colspan="3">
                <dx:ASPxTextBox ID="txtpriceintext" runat="server" Height="16px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Ngày nhận mẫu </td>
            <td class="style39">
                <dx:ASPxDateEdit ID="dtreceive" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style40">
                Ngày trả dự kiến&nbsp;&nbsp;&nbsp; </td>
            <td class="style41">
                <dx:ASPxDateEdit ID="dtrelease" runat="server" Width="170px" >
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Phụ kiện kèm theo</td>
            <td class="style45" colspan="3">
                <dx:ASPxMemo ID="mmAcce" runat="server" Height="71px" Width="310px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Ghi chú</td>
            <td class="style45" colspan="3">
                <dx:ASPxMemo ID="mmNote" runat="server" Height="71px" Width="310px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style46">
                &nbsp;</td>
            <td class="style45" colspan="3">
                &nbsp;</td>
        </tr>
    </table>

        <strong>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các yêu cầu đo kiểm đã phân công cho">
        </dx:ASPxLabel>
        &nbsp;<dx:ASPxLabel ID="lbStaff" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#000099">
        </dx:ASPxLabel>
        &nbsp;
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="chờ được xác nhận">
        </dx:ASPxLabel>
        </strong>
    <p>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSourceAssignInfo" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="AssignmentID" 
                oncustomcallback="ASPxGridView1_CustomCallback" 
                onhtmlrowprepared="ASPxGridView1_HtmlRowPrepared">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                    <ClearFilterButton Visible="True">
                    </ClearFilterButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="RequestID" Visible=false
                    VisibleIndex="1" ReadOnly="True">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RequestNo" VisibleIndex="2" 
                    Caption="Số phiếu">
                     <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên công ty" FieldName="CompanyID" 
                    VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName" 
                        ValueField="CompanyID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="EquTypeID" 
                    VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEquipment" 
                        TextField="EquTypeName" ValueField="EquTypeID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="5" Caption="Ký hiệu">
                <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" VisibleIndex="6" 
                    Caption="Hãng sản xuất">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="7" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" VisibleIndex="8" 
                    Caption="Ngày nhận mẫu" Visible=false>
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" VisibleIndex="9" 
                    Caption="Ngày trả dự kiến">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="10" 
                    Caption="Ngày phân công">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffID" VisibleIndex="11" 
                    Visible=false >
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffName" Caption="Người phân công"
                    VisibleIndex="12">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff1ID" VisibleIndex="13" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TestStaff1ID" 
                    caption="Nhân viên đo 1" VisibleIndex="22" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff2ID" VisibleIndex="15" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TestStaff2ID" 
                    caption="Nhân viên đo 2" VisibleIndex="22" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="StatusName" VisibleIndex="17" 
                    Caption="Ghi chú" Visible=false>
                </dx:GridViewDataTextColumn>

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
            <asp:SqlDataSource ID="SqlDataSourceAssignInfo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>"                    
                
                SelectCommand="SELECT Request.RequestID, Request.RequestNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.Manufacturer, Request.Serial_Imei, Request.ReceiveDate, Request.AppointmentDate, Assignment.AssignDate, AssignStaff.StaffID AS AssignStaffID, AssignStaff.StaffFistName AS AssignStaffName, TestStaff1.StaffID AS TestStaff1ID, TestStaff1.StaffFistName AS Test1StaffName, TestStaff2.StaffID AS TestStaff2ID, TestStaff2.StaffFistName AS Test2StaffName, RequestStatus.StatusName, Assignment.AssignmentID, Assignment.TestStaffID1, Assignment.TestStaffID2, Assignment.AssignNote, Request.CompanyID, Request.EquTypeID FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff) AS AssignStaff ON Assignment.AssignStaffID = AssignStaff.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_2) AS TestStaff1 ON Assignment.TestStaffID1 = TestStaff1.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_1) AS TestStaff2 ON Assignment.TestStaffID2 = TestStaff2.StaffID INNER JOIN Company ON Request.CompanyID = Company.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID INNER JOIN RequestStatus ON Request.StatusID = RequestStatus.StatusID WHERE (RequestStatus.StatusID = 2) AND (TestStaff1.StaffID = @TestStaff1ID) OR (RequestStatus.StatusID = 2) AND (TestStaff2.StaffID = @TestStaff1ID) ORDER BY Assignment.AssignDate DESC"           
                
                
                
                DeleteCommand="DELETE FROM Assignment WHERE (AssignmentID = @AssignmentID)">
                <DeleteParameters>
                    <asp:Parameter Name="AssignmentID" Type="Int32"/>
                </DeleteParameters>
                
                <SelectParameters>
                    <asp:SessionParameter Name="TestStaff1ID" SessionField="StaffID" />
                </SelectParameters>
                
            </asp:SqlDataSource>
    
    </p>
        <p>

        <strong>
        <dx:ASPxLabel ID="ASPxLabel6" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các yêu cầu đo kiểm đã được xác nhận đang tiến hành đo kiểm">
        </dx:ASPxLabel>
        </strong>
    
    </p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid2"
            DataSourceID="SqlDataSourceAssignInfo1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="AssignmentID" 
                oncustomcallback="ASPxGridView2_CustomCallback" 
            onhtmlrowprepared="ASPxGridView2_HtmlRowPrepared">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid2.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <ClearFilterButton Visible="True">
                    </ClearFilterButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="10" 
                    Caption="Ngày xác nhận đo">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="RequestID" Visible=false
                    VisibleIndex="1" ReadOnly="True">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RequestNo" VisibleIndex="2" 
                    Caption="Số phiếu">
                     <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên công ty" FieldName="CompanyID" 
                    VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName" 
                        ValueField="CompanyID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="EquTypeID" 
                    VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEquipment" 
                        TextField="EquTypeName" ValueField="EquTypeID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="5" Caption="Ký hiệu">
                <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" VisibleIndex="6" 
                    Caption="Hãng sản xuất">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="7" Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" VisibleIndex="8" 
                    Caption="Ngày nhận mẫu" Visible=false>
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" VisibleIndex="9" 
                    Caption="Ngày trả dự kiến">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="11" 
                    Caption="Ngày phân công" Visible=false>
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffID" VisibleIndex="12" 
                    Visible=false >
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffName" Caption="Người phân công"
                    VisibleIndex="13">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff1ID" VisibleIndex="14" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TestStaff1ID" 
                    caption="Nhân viên đo 1" VisibleIndex="22" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff2ID" VisibleIndex="15" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TestStaff2ID" 
                    caption="Nhân viên đo 2" VisibleIndex="22" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="StatusName" VisibleIndex="17" 
                    Caption="Ghi chú" Visible=false>
                </dx:GridViewDataTextColumn>

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
            <asp:SqlDataSource ID="SqlDataSourceAssignInfo1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>"                    
                
                SelectCommand="SELECT Request.RequestID, Request.RequestNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.Manufacturer, Request.Serial_Imei, Request.ReceiveDate, Request.AppointmentDate, Assignment.AssignDate, AssignStaff.StaffID AS AssignStaffID, AssignStaff.StaffFistName AS AssignStaffName, TestStaff1.StaffID AS TestStaff1ID, TestStaff1.StaffFistName AS Test1StaffName, TestStaff2.StaffID AS TestStaff2ID, TestStaff2.StaffFistName AS Test2StaffName, RequestStatus.StatusName, Assignment.AssignmentID, Assignment.TestStaffID1, Assignment.TestStaffID2, Assignment.AssignNote, Request.ConfirmDate, Request.CompanyID, Request.EquTypeID FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff) AS AssignStaff ON Assignment.AssignStaffID = AssignStaff.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_2) AS TestStaff1 ON Assignment.TestStaffID1 = TestStaff1.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_1) AS TestStaff2 ON Assignment.TestStaffID2 = TestStaff2.StaffID INNER JOIN Company ON Request.CompanyID = Company.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID INNER JOIN RequestStatus ON Request.StatusID = RequestStatus.StatusID WHERE (RequestStatus.StatusID = 3) AND (TestStaff1.StaffID = @StaffID) AND (Request.RecheckStatusID IS NULL OR Request.RecheckStatusID = 4) OR (RequestStatus.StatusID = 3) AND (Request.RecheckStatusID IS NULL OR Request.RecheckStatusID = 4) AND (TestStaff2.StaffID = @StaffID) OR (TestStaff1.StaffID = @StaffID) AND (Request.RecheckStatusID = 1 OR Request.RecheckStatusID = 3) OR (Request.RecheckStatusID = 1 OR Request.RecheckStatusID = 3) AND (TestStaff2.StaffID = @StaffID) ORDER BY Assignment.AssignDate DESC"           
                
                
            
            
            
            DeleteCommand="DELETE FROM Assignment WHERE (AssignmentID = @AssignmentID)">
                <DeleteParameters>
                    <asp:Parameter Name="AssignmentID" Type="Int32"/>
                </DeleteParameters>
                
                <SelectParameters>
                    <asp:SessionParameter Name="StaffID" SessionField="StaffID" />
                </SelectParameters>
                
            </asp:SqlDataSource>
    
<p>
  
        <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            SelectCommand="SELECT * FROM [Company],[Province] where [Company].[ProvinceID]=[Province].[ProvinceID] Order by convert(nvarchar(500),[FastCompanyName])">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceContact" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            SelectCommand="SELECT * FROM [Contact]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceEquipment" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [EquipmentType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            SelectCommand="SELECT * FROM [Country] ORDER BY Convert(nvarchar(500),[CountryName])">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceStaff1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            SelectCommand="SELECT StaffID, StaffFistName, StaffLastName, StaffFullName, PhoneNo, HomeAddress, HomePhone, Email, BeginDate, EndDate, Department, WorkHistory, TrainHistory, Username, Password, StaffImg FROM Staff ORDER BY CONVERT (nvarchar(500), StaffFistName)">
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceStaff2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            
            SelectCommand="SELECT * FROM [Staff] WHERE ([StaffID] &lt;&gt; @StaffID) ORDER BY CONVERT (nvarchar(500), StaffFistName)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="cbStaff1" Name="StaffID" PropertyName="Value" 
                     Type="String" />
             </SelectParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRequest" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                    SelectCommand="SELECT * FROM [Request] ORDER BY [RequestID] DESC">
                </asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            
            
            SelectCommand="SELECT * FROM [Staff] ORDER BY CONVERT (nvarchar(500), StaffFistName)">
        </asp:SqlDataSource>
</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
