<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-PhanCongDo.aspx.cs" Inherits="LabManagement.PhanCongDo" UICulture="vi-vn" %>
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
        .style25
        {
            width: 194px;
            color: #000000;
        }
        .style26
        {
            width: 709px;
        }
        .style29
        {
            width: 166px;
            text-align: center;
        }
        .style30
        {
        }
    .style31
    {
        width: 111px;
        color: #000000;
    }
    .style32
    {
        width: 735px;
        font-size: medium;
    }
    .style33
    {
            width: 194px;
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
            height: 8px;
        }
        .style40
        {
            width: 166px;
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
        .style46
        {
            width: 1349px;
        }
        .style47
        {
            width: 187px;
        }
        .style56
        {
            width: 119px;
        }
        .style63
        {
            height: 19px;
        }
        .style97
        {
            height: 49px;
        }
        .style98
        {
        }
        .style103
        {
            width: 1758px;
            color: #003366;
        }
        .style105
        {
            height: 19px;
            font-weight: 700;
            color: #003366;
        }
        .style108
        {
            width: 194px;
            height: 35px;
        }
        .style109
        {
            height: 35px;
        }
        .style110
        {
            width: 1758px;
            height: 19px;
            font-weight: 700;
            color: #003366;
        }
        .style111
        {
            width: 67%;
        }
        .style114
        {
            width: 230px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table style="width: 698px">
            <tr>
                <td class="style97" align="center" colspan="2" width="1000">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssClass="style35" 
            Font-Bold="True" Font-Italic="False" Font-Size="X-Large" 
            Text="PHÂN CÔNG ĐO KIỂM">
        </dx:ASPxLabel>
        </strong>
                    </td>
            </tr>
            <tr>
                <td class="style105" align="left" 
                    style="Style32; text-align: center;" colspan="2">
        <strong>
        <dx:ASPxLabel ID="lblnotifiReAssign" runat="server" Font-Italic="True" 
            Font-Overline="False" Font-Underline="True" ForeColor="Red">
        </dx:ASPxLabel>
        </strong></td>
            </tr>
            <tr>
                <td class="style110" align="left" bgcolor="#FFFFCC" style="Style32">
                    <strong>Tên mẫu đo kiểm</strong></td>
                <td class="style63" align="left" bgcolor="#FFFFCC">
                <dx:ASPxTextBox ID="txtEquipName2" runat="server" Width="500px" 
                        Height="16px">
                </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td class="style103" align="left" bgcolor="#FFFFCC" style="Style32">
                    <strong>Nhân viên đo 1</strong></td>
                <td class="style98" align="left" bgcolor="#FFFFCC">
                <dx:ASPxComboBox ID="cbStaff1" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff1" ValueType="System.String" width="250px" 
                    ValueField="StaffID"  Height="18px" 
                        TextField="StaffID" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                    <columns>
                    <dx:ListBoxColumn Caption="Họ và Tên" FieldName="StaffFullName" />
                    </columns>
                </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="style103" align="left" bgcolor="#FFFFCC" style="Style32">
                    <strong>Nhân viên đo 2</strong></td>
                <td class="style98" align="left" bgcolor="#FFFFCC">
                <dx:ASPxComboBox ID="cbStaff2" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff2" ValueType="System.String" width="250px" 
                    ValueField="StaffID" Height="18px" 
                        TextField="StaffID" 
                        IncrementalFilteringMode="StartsWith" >
                    <columns>
                    <dx:ListBoxColumn Caption="Họ và Tên" FieldName="StaffFullName" />
                    </columns>
                </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="style103" align="left" bgcolor="#FFFFCC" style="Style32">
                    <strong>Lưu ý</strong></td>
                <td class="style98" align="left" bgcolor="#FFFFCC">
                    <dx:ASPxMemo ID="mmAssignNote" runat="server" Height="96px" 
                        style="text-align: left" Width="400px">
                    </dx:ASPxMemo>
                </td>
            </tr>
            </table>
        <table class="style111">
            <tr>
                <td align="center" class="style114">
                    &nbsp;</td>
                <td align="center">
                    <dx:ASPxButton ID="btAssign" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Phân công đo" Width="137px" onclick="btAssign_Click">
                    </dx:ASPxButton>
                </td>
                <td align="center">
                    <dx:ASPxButton ID="btDeleteAssign" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xóa phân công" Width="160px" onclick="btDeleteAssign_Click">
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
        <dx:ASPxLabel ID="lblnotification" runat="server" Font-Italic="True" 
            Font-Overline="False" Font-Underline="True" ForeColor="Red">
        </dx:ASPxLabel>
        </strong></p>
    <table class="style32">
        <tr>
            <td class="style108" bgcolor="White">
                <strong>Số phiếu yêu cầu đo kiểm</strong></td>
            <td colspan="3" bgcolor="White" class="style109" style="text-align: center">
                <dx:ASPxComboBox ID="cbRequestNo" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceRequest" ValueType="System.Int32" width="250px" 
                    ValueField="RequestID"  Height="18px" 
                        TextField="RequestID" BackColor="#FFCCFF" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
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
                <dx:ASPxTextBox ID="txtCompanyName" runat="server" Width="515px" Height="16px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Địa Chỉ</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="515px" Height="19px">
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
            <td class="style23">
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
            <td class="style23">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style33">
                Người liên hệ </td>
            <td class="style56">
                <dx:ASPxTextBox ID="txtContact" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td class="style23">
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
                    Font-Bold="True" Width="170px">
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
                <dx:ASPxTextBox ID="txtEquipName" runat="server" Width="515px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Tên bổ sung</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtEquName" runat="server" Height="20px" Width="515px" 
                    Font-Italic="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Hãng sản xuất </td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtcompmaking" runat="server" Width="300px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Nơi sản xuất </td>
            <td class="style44" colspan="3">
                <dx:ASPxTextBox ID="txtMadeIn" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Ký hiệu </td>
            <td class="style47">
                <dx:ASPxTextBox ID="txtModel" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td class="style29" align="right">
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
                <dx:ASPxTextBox ID="txttestmethod" runat="server" Height="19px" Width="299px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Tiêu chuẩn đánh giá</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtstandard" runat="server" Width="299px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Phí đo kiểm (VNĐ)</td>
            <td class="style43" colspan="3">
                <dx:ASPxTextBox ID="txtprice" runat="server" Width="170px" Height="17px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Viết bằng chữ</td>
            <td class="style36" colspan="3">
                <dx:ASPxTextBox ID="txtpriceintext" runat="server" Height="16px" Width="392px">
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
                <dx:ASPxDateEdit ID="dtrelease" runat="server" >
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Phụ kiện kèm theo</td>
            <td class="style39" colspan="3">
                <dx:ASPxMemo ID="mmAcce" runat="server" Height="71px" Width="310px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Ghi chú</td>
            <td class="style39" colspan="3">
                <dx:ASPxMemo ID="mmNote" runat="server" Height="71px" Width="310px">
                </dx:ASPxMemo>
            </td>
        </tr>
        </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các yêu cầu đo kiểm chờ phân công">
        </dx:ASPxLabel>
        </strong>
    </p>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server"  
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSourceExpectAssign"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView1_CustomCallback"  
            KeyFieldName="RequestID" EnableCallBacks="False" 
            onhtmlrowprepared="ASPxGridView1_HtmlRowPrepared">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="RequestID" Visible=false
                    VisibleIndex="0" ReadOnly="True">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RequestNo" VisibleIndex="1" Caption="Số phiếu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyName"  VisibleIndex="2" Caption="Tên công ty">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EquTypeName" VisibleIndex="3" Caption="Loại thiết bị">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="4" Caption="Ký hiệu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" VisibleIndex="6" Caption="Hãng sản xuất">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="5" Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" VisibleIndex="8" 
                    Caption="Ngày nhận mẫu">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" VisibleIndex="9" 
                    Caption="Ngày trả dự kiến">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="7" Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StaffID" Visible=false
                    VisibleIndex="10">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="StaffFistName" VisibleIndex="11" Caption="Người nhận mẫu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StatusID" VisibleIndex="12" Visible=false>
                </dx:GridViewDataTextColumn>

            </Columns>
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text=""></Summary>
            </SettingsPager>
             <SettingsBehavior AllowSelectByRowClick="true" ConfirmDelete=true 
                    AllowFocusedRow=true />
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
<asp:SqlDataSource ID="SqlDataSourceExpectAssign" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                
                
                
            SelectCommand="SELECT Request.RequestID, Request.RequestNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.Manufacturer, Request.Serial_Imei, Request.ReceiveDate, Request.AppointmentDate, Company.Address, ReceiveStaff.StaffID, ReceiveStaff.StaffFistName, Request.StatusID FROM Request INNER JOIN Company ON Request.CompanyID = Company.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff) AS ReceiveStaff ON Request.ReceiveStaffID = ReceiveStaff.StaffID WHERE (Request.StatusID = 1)">
            </asp:SqlDataSource>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các yêu cầu đo kiểm đã phân công bởi">
        </dx:ASPxLabel>
        &nbsp;<dx:ASPxLabel ID="lbStaff" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="True" Font-Size="Medium" ForeColor="#000099">
        </dx:ASPxLabel>
        &nbsp;
        <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="chờ được xác nhận">
        </dx:ASPxLabel>
        </strong>
    </p>
    <p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid2"
            DataSourceID="SqlDataSourceAssignInfo" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="AssignmentID" 
                oncustomcallback="ASPxGridView2_CustomCallback" 
                onhtmlrowprepared="ASPxGridView2_HtmlRowPrepared" 
                onrowupdating="ASPxGridView2_RowUpdating" 
                onrowdeleting="ASPxGridView2_RowDeleting">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid2.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True">
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text=" ">
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
                <dx:GridViewDataTextColumn FieldName="RequestID" Visible=false
                    VisibleIndex="1" ReadOnly="True">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RequestNo" VisibleIndex="2" 
                    Caption="Số phiếu" ReadOnly="True">
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên công ty" FieldName="CompanyID" 
                    VisibleIndex="3" ReadOnly="True">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName" 
                        ValueField="CompanyID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="EquTypeName" VisibleIndex="4" 
                    Caption="Loại thiết bị" ReadOnly="True">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="5" Caption="Ký hiệu" 
                    ReadOnly="True">
                <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" VisibleIndex="6" 
                    Caption="Hãng sản xuất" Visible="False" ReadOnly="True">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="7" 
                    Visible=false ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" VisibleIndex="8" 
                    Caption="Ngày nhận mẫu" Visible=false ReadOnly="True">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" VisibleIndex="9" 
                    Caption="Ngày trả dự kiến" ReadOnly="True">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="10" 
                    Caption="Ngày phân công" ReadOnly="True">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người phân công" 
                    FieldName="AssignStaffID" ReadOnly="True" ShowInCustomizationForm="True" 
                    VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TestStaff1ID" 
                    caption="Nhân viên đo 1" VisibleIndex="16" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                         <Style BackColor="#FFCCFF">
                         </Style>
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn FieldName="TestStaff2ID" 
                    caption="Nhân viên đo 2" VisibleIndex="22" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                         <Style BackColor="#FFCCFF">
                         </Style>
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn Caption="Ghi chú" FieldName="AssignNote" 
                    Visible="False" VisibleIndex="24">
                    <PropertiesMemoEdit Height="100px">
                        <Style BackColor="#FFCCFF">
                        </Style>
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>

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
                
                SelectCommand="SELECT Request.RequestID, Request.RequestNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.Manufacturer, Request.Serial_Imei, Request.ReceiveDate, Request.AppointmentDate, Assignment.AssignDate, AssignStaff.StaffID AS AssignStaffID, AssignStaff.StaffFistName AS AssignStaffName, TestStaff1.StaffID AS TestStaff1ID, TestStaff1.StaffFistName AS Test1StaffName, TestStaff2.StaffID AS TestStaff2ID, TestStaff2.StaffFistName AS Test2StaffName, RequestStatus.StatusName, Assignment.AssignmentID, Assignment.TestStaffID1, Assignment.TestStaffID2, Assignment.AssignNote, Request.CompanyID FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff) AS AssignStaff ON Assignment.AssignStaffID = AssignStaff.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_2) AS TestStaff1 ON Assignment.TestStaffID1 = TestStaff1.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_1) AS TestStaff2 ON Assignment.TestStaffID2 = TestStaff2.StaffID INNER JOIN Company ON Request.CompanyID = Company.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID INNER JOIN RequestStatus ON Request.StatusID = RequestStatus.StatusID WHERE (RequestStatus.StatusID = 2) ORDER BY Assignment.AssignDate DESC"           
                
                
                
                DeleteCommand="SELECT Assignment.* FROM Assignment" 
                UpdateCommand="SELECT Assignment.* FROM Assignment">
                
            </asp:SqlDataSource>
    
    </p>
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
            
            
            
            SelectCommand="SELECT StaffID, StaffNo, StaffFistName, StaffLastName, StaffFullName, ID, PhoneNo, HomeAddress, HomePhone, Email, BeginDate, EndDate, Department, Position, WorkHistory, TrainHistory, Username, Password, StaffImg FROM Staff WHERE (StaffID &lt;&gt; @StaffID) ORDER BY CONVERT (nvarchar(500), StaffFistName)">
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
            
            
            
            
            SelectCommand="SELECT StaffID, StaffNo, StaffFistName, StaffLastName, StaffFullName, ID, PhoneNo, HomeAddress, HomePhone, Email, BeginDate, EndDate, Department, Position, WorkHistory, TrainHistory, Username, Password, StaffImg FROM Staff ORDER BY CONVERT (nvarchar(500), StaffFistName)">
        </asp:SqlDataSource>
</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
