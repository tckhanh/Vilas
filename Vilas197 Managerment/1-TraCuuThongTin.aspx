<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-TraCuuThongTin.aspx.cs" Inherits="LabManagement.TraCuuThongTin" UICulture="vi-vn" %>

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

        .style25 {
            width: 1014px;
            color: #0000CC;
        }

        .style30 {
        }

        .style32 {
            width: 785px;
            font-size: medium;
            height: 53px;
            margin-right: 0px;
        }

        .style33 {
            width: 1014px;
        }

        .style35 {
            color: #CC3300;
            font-size: medium;
            width: 100%;
        }

        .style36 {
        }

        .style39 {
            width: 129px;
            height: 8px;
        }

        .style41 {
            height: 8px;
        }

        .style43 {
            height: 22px;
        }

        .style44 {
        }

        .style45 {
        }

        .style47 {
            width: 129px;
        }

        .style56 {
            width: 119px;
        }

        .style110 {
            width: 150px;
        }

        .style113 {
            width: 75%;
            height: 52px;
        }

        .style116 {
            width: 152px;
        }

        .style117 {
        }

        .style118 {
            width: 118px;
            text-align: left;
        }

        .style124 {
            width: 137px;
            height: 1px;
        }

        .style125 {
            width: 137px;
            text-align: center;
        }

        .style127 {
            width: 1014px;
            font-size: medium;
            margin-right: 0px;
        }

        .style128 {
            width: 1014px;
            font-size: medium;
            height: 1px;
            margin-right: 0px;
        }

        .style129 {
            width: 150px;
            height: 1px;
        }

        .style130 {
            width: 1014px;
            font-size: medium;
            height: 37px;
            margin-right: 0px;
        }

        .style131 {
            height: 37px;
        }

        .style132 {
            width: 176px;
            text-align: center;
        }

        .style133 {
            color: #0000CC;
            width: 176px;
            text-align: center;
        }

        .style134 {
            width: 3315px;
        }

        .style135 {
            width: 176px;
            text-align: center;
        }

        .style136 {
            height: 53px;
        }

        .style137 {
            width: 75%;
            height: 40px;
            margin-right: 0px;
        }

        .style138 {
            width: 152px;
            color: #FF0000;
        }

        .style139 {
            width: 118px;
            text-align: left;
            color: #FF0000;
        }

        .style140 {
            width: 261px;
        }

        .style98 {
            width: 291px;
            height: 40px;
        }

        .style99 {
            width: 356px;
            height: 40px;
        }

        .style100 {
            width: 304px;
            height: 40px;
        }

        .style101 {
            width: 341px;
            height: 40px;
        }

        .style71 {
            width: 74%;
            height: 79px;
        }

        .style86 {
            width: 1263px;
            height: 12px;
        }

        .style87 {
            width: 154px;
            text-align: center;
            height: 12px;
        }

        .style88 {
            width: 127px;
            text-align: center;
            height: 12px;
        }

        .style89 {
            width: 153px;
            text-align: center;
            height: 12px;
        }

        .style90 {
            width: 256px;
            height: 12px;
        }

        .style94 {
            width: 1263px;
            height: 8px;
        }

        .style91 {
            width: 154px;
            text-align: center;
            height: 8px;
        }

        .style92 {
            width: 127px;
            text-align: center;
            height: 8px;
        }

        .style93 {
            width: 153px;
            text-align: center;
            height: 8px;
        }

        .style95 {
            height: 8px;
            width: 256px;
        }

        .style78 {
            text-align: left;
            background-color: #99CCFF;
        }

        .style73 {
            width: 154px;
            text-align: center;
        }

        .style76 {
            width: 127px;
            text-align: center;
        }

        .style75 {
            width: 153px;
            text-align: center;
        }

        .style96 {
            width: 256px;
        }

        .style142 {
            width: 100%;
            height: 196px;
        }

        .style143 {
            height: 27px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style113">
        <tr>
            <td align="center" class="style136">
                <strong>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssClass="style35"
                        Font-Bold="True" Font-Italic="False" Font-Size="X-Large"
                        Text="TRA CỨU THÔNG TIN ĐO KIỂM">
                    </dx:ASPxLabel>
                </strong>
            </td>
        </tr>
        <tr>
            <td align="center">
                <strong>
                    <dx:ASPxLabel ID="lbIssueRP" runat="server" Font-Bold="False" Font-Size="Small"
                        ForeColor="Red" Font-Italic="True">
                    </dx:ASPxLabel>
                </strong>
            </td>
        </tr>
    </table>
    <table style="width: 780px">
        <tr>
            <td class="style98" align="center"></td>
            <td class="style99" align="center">
                <strong style="text-align: center">Số phiếu yêu cầu đo kiểm</strong></td>
            <td class="style100" align="center">
                <dx:ASPxTextBox ID="txtRequestNo" runat="server" BackColor="#FFCCFF"
                    Height="30px" Width="175px" Font-Size="Medium">
                </dx:ASPxTextBox>
            </td>
            <td class="style101" align="center">
                <dx:ASPxButton ID="btSearch" runat="server"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css"
                    Text="Lấy thông tin" OnClick="btSearch_Click" Width="137px">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <table class="style71">
        <tr>
            <td class="style86"></td>
            <td bgcolor="#FFFF66" class="style87" align="center">
                <strong>Mẫu đo</strong></td>
            <td bgcolor="#FFFF66" class="style88" style="text-align: center" align="center">
                <strong>Kết quả</strong></td>
            <td bgcolor="#FFFF66" class="style89" align="center">
                <strong>Hóa đơn tài chính</strong></td>
            <td bgcolor="#FFFF66" style="text-align: center" class="style90" align="center">
                <strong>Ghi chú</strong></td>
        </tr>
        <tr>
            <td class="style94">
                <strong style="text-align: center">Tình trạng</strong></td>
            <td id="S1" class="style91" align="center">
                <dx:ASPxTextBox ID="txtEquip" runat="server" Font-Size="Medium"
                    ForeColor="#FFFF99" Height="25px" HorizontalAlign="Center" ReadOnly="True"
                    Width="150px">
                </dx:ASPxTextBox>
            </td>
            <td id="S2" class="style92" align="center">
                <dx:ASPxTextBox ID="txtTestRP" runat="server" Font-Size="Medium" Height="25px"
                    HorizontalAlign="Center" ReadOnly="True" Width="150px" ForeColor="#FFFF99">
                </dx:ASPxTextBox>
            </td>
            <td id="S3" class="style93" align="center">
                <dx:ASPxTextBox ID="txtRedBill" runat="server" Font-Size="Medium" Height="25px"
                    HorizontalAlign="Center" ReadOnly="True" Width="150px" ForeColor="#FFFF99">
                </dx:ASPxTextBox>
            </td>
            <td id="S4" style="text-align: center" class="style95" align="center">
                <dx:ASPxTextBox ID="txtNotifi" runat="server" Height="27px"
                    HorizontalAlign="Center" ReadOnly="True" Width="220px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style94" align="center">
                <strong>Số</strong></td>
            <td id="S5" class="style73" align="center"></td>
            <td id="S6" class="style76" align="center">
                <dx:ASPxLabel ID="lbReportNo" runat="server" CssClass="style79"
                    Font-Size="Medium">
                </dx:ASPxLabel>
            </td>
            <td id="S7" class="style75" align="center">
                <dx:ASPxLabel ID="lbRedBillNo" runat="server" CssClass="style79"
                    Font-Size="Medium">
                </dx:ASPxLabel>
            </td>
            <td id="S8" style="text-align: center" class="style96" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td class="style78" align="center" colspan="5">&nbsp;</td>
        </tr>
    </table>
    <strong>
        <dx:ASPxPanel ID="paComment" runat="server" Height="220px" Width="785px"
            Visible="False">
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                    <table class="style142">
                        <tr>
                            <td class="style143">
                                <strong>
                                    <dx:ASPxLabel ID="lbReceiveStaffComDate" runat="server" Font-Bold="True"
                                        Style="color: #003399; font-style: italic" CssClass="style144"
                                        Font-Size="Medium">
                                    </dx:ASPxLabel>
                                </strong>
                            </td>
                            <td class="style143">
                                <strong>
                                    <dx:ASPxLabel ID="lbTestStaffComDate" runat="server" Font-Bold="True"
                                        Style="color: #003399; font-style: italic" CssClass="style144"
                                        Font-Size="Medium">
                                    </dx:ASPxLabel>
                                </strong>
                            </td>
                            <td class="style143">
                                <strong>
                                    <dx:ASPxLabel ID="lbApprStaffComDate" runat="server" Font-Bold="True"
                                        Style="color: #003399; font-style: italic" CssClass="style144"
                                        Font-Size="Medium">
                                    </dx:ASPxLabel>
                                </strong>
                            </td>
                        </tr>
                        <tr>
                            <td class="style143">
                                <strong>Ý kiến của chuyên viên nhận mẫu</strong></td>
                            <td class="style143">
                                <strong>Ý kiến của chuyên viên đo kiểm</strong></td>
                            <td class="style143" bgcolor="#FFFF99">
                                <strong>Ý kiến của người phê duyệt</strong></td>
                        </tr>
                        <tr bgcolor="#669999">
                            <td align="center">
                                <dx:ASPxMemo ID="mmReceiveStaff" runat="server" Height="150px" Width="250px"
                                    ReadOnly="True">
                                </dx:ASPxMemo>
                            </td>
                            <td align="center">
                                <dx:ASPxMemo ID="mmTestingStaff" runat="server"
                                    Height="150px" Width="250px" ReadOnly="True">
                                </dx:ASPxMemo>
                            </td>
                            <td align="center">
                                <dx:ASPxMemo ID="mmApproveStaff" runat="server" Height="150px" Width="250px"
                                    BackColor="#FFFFCC">
                                </dx:ASPxMemo>
                            </td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
            <Border BorderColor="Black" BorderStyle="Solid" />
        </dx:ASPxPanel>
        <table class="style137">
            <tr>
                <td align="center">
                    <dx:ASPxCheckBox ID="chIssue" runat="server" Font-Size="Medium"
                        ForeColor="#CC3300" Text="Ban hành kết quả" AutoPostBack="True"
                        Checked="True" CheckState="Checked" OnCheckedChanged="chIssue_CheckedChanged">
                    </dx:ASPxCheckBox>
                </td>
                <td align="center">
                    <strong>
                        <dx:ASPxCheckBox ID="chNonIssue" runat="server" Font-Size="Medium"
                            ForeColor="#CC3300" Text="Không ban hành kết quả" AutoPostBack="True"
                            OnCheckedChanged="chNonIssue_CheckedChanged">
                        </dx:ASPxCheckBox>
                    </strong>
                </td>
            </tr>
        </table>
    </strong>
    <table class="style32">
        <tr>
            <td class="style116">Số kết quả
                <dx:ASPxLabel ID="lbExpect" runat="server" Font-Bold="True" Font-Size="Small"
                    ForeColor="Red">
                </dx:ASPxLabel>
            </td>
            <td class="style140" align="left">
                <dx:ASPxTextBox ID="txtTestReportNo" runat="server" BackColor="#FFCCFF"
                    Font-Bold="True" Width="170px" Height="16px" ReadOnly="True">
                </dx:ASPxTextBox>
            </td>
            <td class="style118">Đánh giá KQĐK</td>
            <td>
                <dx:ASPxComboBox ID="cbKind" runat="server"
                    EnableIncrementalFiltering="True" ValueType="System.Int32" Width="170px"
                    Height="18px" Style="text-align: left"
                    OnSelectedIndexChanged="cbTestSession_SelectedIndexChanged"
                    SelectedIndex="0" ReadOnly="True">
                    <Items>
                        <dx:ListEditItem Text="Bình thường" Value="1" Selected="True" />
                        <dx:ListEditItem Text="Không bình thường" Value="0" />
                    </Items>

                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style116">Ngày đo kiểm</td>
            <td class="style140" align="left">
                <dx:ASPxDateEdit ID="dtTestDate" runat="server" AutoPostBack="true"
                    OnDateChanged="dtTestDate_DateChanged" ReadOnly="True">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style118">Buổi đo</td>
            <td>
                <dx:ASPxComboBox ID="cbTestSession" runat="server" AutoPostBack="True"
                    EnableIncrementalFiltering="True" ValueType="System.Int32" Width="170px"
                    Height="18px" Style="text-align: left" IncrementalFilteringMode="StartsWith"
                    OnSelectedIndexChanged="cbTestSession_SelectedIndexChanged"
                    SelectedIndex="0" ReadOnly="True">
                    <Items>
                        <dx:ListEditItem Text="Sáng" Value="0" />
                        <dx:ListEditItem Text="Chiều" Value="1" />
                    </Items>

                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style116">Nhiệt độ (độ C)&nbsp;</td>
            <td class="style140" align="left">
                <dx:ASPxTextBox ID="txtTemp" runat="server" Width="170px" Height="20px"
                    ReadOnly="True">
                </dx:ASPxTextBox>
            </td>
            <td class="style118">Độ ẩm 
                (%)</td>
            <td>
                <dx:ASPxTextBox ID="txtHum" runat="server" Width="170px" Height="20px"
                    ReadOnly="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style138">
                <dx:ASPxLabel ID="lbIssueDate" runat="server"
                    Style="font-family: 'Times New Roman', Times, serif; font-size: 12pt; color: #FF0000;"
                    Text="Ngày ban hành">
                </dx:ASPxLabel>
            </td>
            <td class="style140" align="left">
                <dx:ASPxDateEdit ID="dtIssueReportDate" runat="server" ReadOnly="True">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style139">Người đề xuất</td>
            <td>
                <dx:ASPxComboBox ID="cbIssueStaff" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                    DataSourceID="SqlDataSourceStaff" ValueType="System.String" Width="250px"
                    ValueField="StaffID" Height="18px"
                    TextField="StaffFullName"
                    IncrementalFilteringMode="StartsWith" Style="text-align: left"
                    ReadOnly="True">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style138">Người phê duyệt</td>
            <td class="style140" align="left">
                <dx:ASPxComboBox ID="cbApproveStaff" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                    DataSourceID="SqlDataSourceApproveStaff" ValueType="System.String" Width="250px"
                    ValueField="StaffID" Height="18px"
                    TextField="StaffFullName"
                    IncrementalFilteringMode="StartsWith" Style="text-align: left"
                    ReadOnly="True">
                </dx:ASPxComboBox>
            </td>
            <td class="style139">Ngày phê duyệt</td>
            <td>
                <dx:ASPxDateEdit ID="dtApproveDate" runat="server" ReadOnly="True">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style116">
                <dx:ASPxLabel ID="lbIssueOrNon" runat="server"
                    Style="font-family: 'Times New Roman', Times, serif; font-size: 12pt; color: #FF0000;"
                    Text="Lịch sử đo kiểm">
                </dx:ASPxLabel>
            </td>
            <td class="style117" colspan="3" align="left">
                <dx:ASPxMemo ID="mmTestHistory" runat="server" Height="87px"
                    Style="text-align: left" Width="381px" ReadOnly="True">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style116">Kết quả đo kiểm</td>
            <td class="style117" colspan="3">
                <dx:ASPxHyperLink ID="hlFileName" runat="server"
                    Style="font-style: italic; text-decoration: underline" />
            </td>
        </tr>
    </table>
    <p>
        <strong>
            <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssClass="style35"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Thông tin phân công đo">
            </dx:ASPxLabel>
        </strong>
    </p>
    <table style="style57; width: 789px;">
        <tr>
            <td class="style127" align="left">
                <span class="dxmLite_Office2003Blue">Người phân công</span></td>
            <td class="style110" align="left">
                <dx:ASPxComboBox ID="cbAssign" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                    DataSourceID="SqlDataSourceStaff1" ValueType="System.String" Width="250px"
                    ValueField="StaffID" Height="18px"
                    TextField="StaffID"
                    IncrementalFilteringMode="StartsWith" Style="text-align: left">
                    <Columns>
                        <dx:ListBoxColumn FieldName="StaffFullName" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td class="style125">Ngày phân công</td>
            <td align="left">
                <dx:ASPxDateEdit ID="dtAssign" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style127" align="left">Tên mẫu đo kiểm</td>
            <td align="left" colspan="3">
                <dx:ASPxTextBox ID="txtEquipName2" runat="server" Width="640px"
                    Height="16px" Style="margin-left: 0px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style128" align="left">Nhân viên đo 1</td>
            <td class="style129" align="left">
                <dx:ASPxComboBox ID="cbStaff1" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                    DataSourceID="SqlDataSourceStaff1" ValueType="System.String" Width="250px"
                    ValueField="StaffID" Height="18px"
                    TextField="StaffID"
                    IncrementalFilteringMode="StartsWith" Style="text-align: left">
                    <Columns>
                        <dx:ListBoxColumn FieldName="StaffFullName" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td class="style124" align="center">Nhân viên đo 2</td>
            <td class="dxmVerticalMenuItemSpacing_Office2003Blue" align="center">
                <dx:ASPxComboBox ID="cbStaff2" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                    DataSourceID="SqlDataSourceStaff2" ValueType="System.String" Width="250px"
                    ValueField="StaffID" Height="18px"
                    TextField="StaffID"
                    IncrementalFilteringMode="StartsWith" Style="text-align: left">
                    <Columns>
                        <dx:ListBoxColumn FieldName="StaffFullName" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style130" align="left">Lưu ý</td>
            <td align="left" colspan="3" class="style131">
                <dx:ASPxMemo ID="mmAssignNote" runat="server" Height="87px"
                    Style="text-align: left" Width="384px">
                </dx:ASPxMemo>
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
        </strong>
    </p>
    <table class="style32">
        <tr>
            <td class="style33" bgcolor="White">
                <strong>Số phiếu yêu cầu đo kiểm</strong></td>
            <td colspan="3" bgcolor="White" style="text-align: center">
                <dx:ASPxComboBox ID="cbRequestNo" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                    DataSourceID="SqlDataSourceRequest" ValueType="System.Int32" Width="197px"
                    ValueField="RequestID" Height="18px"
                    TextField="RequestNo" BackColor="#FFCCFF"
                    IncrementalFilteringMode="StartsWith" Style="text-align: left">
                    <Columns>
                        <dx:ListBoxColumn FieldName="RequestNo" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Tên công ty </td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtCompanyName" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Địa Chỉ</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="550px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Số Điện thoại</td>
            <td class="style56">
                <dx:ASPxTextBox ID="txtphone" runat="server" Width="197px" Height="17px">
                </dx:ASPxTextBox>
            </td>
            <td class="style132">Số Fax</td>
            <td>
                <dx:ASPxTextBox ID="txtfax" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Mã số thuế</td>
            <td class="style56">
                <dx:ASPxTextBox ID="txttaxid" runat="server" Width="198px" Height="20px">
                </dx:ASPxTextBox>
            </td>
            <td class="style132">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="style33">Người liên hệ </td>
            <td class="style56">
                <dx:ASPxTextBox ID="txtContact" runat="server" Width="197px">
                </dx:ASPxTextBox>
            </td>
            <td class="style132">Điện Thoại</td>
            <td>
                <dx:ASPxTextBox ID="txtperphone" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <strong>Số phiếu thu</strong></td>
            <td class="style56">
                <dx:ASPxTextBox ID="txtBillNum" runat="server" BackColor="#FFCCFF"
                    Font-Bold="True" Width="197px">
                </dx:ASPxTextBox>
            </td>
            <td class="style133">
                <strong>Số hợp đồng</strong></td>
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
        </strong>
    </p>
    <table class="style32">
        <tr>
            <td class="style33">Nhân viên nhận mẫu</td>
            <td colspan="3">
                <dx:ASPxComboBox ID="cbReceiveStaff" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                    DataSourceID="SqlDataSourceStaff" ValueType="System.String" Width="250px"
                    ValueField="StaffID" Height="18px"
                    TextField="StaffFullName"
                    IncrementalFilteringMode="StartsWith" Style="text-align: left"
                    ReadOnly="True">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                <strong>Tên mẫu đo kiểm </strong></td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtEquipName" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Tên bổ sung</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtEquName" runat="server" Height="20px" Width="550px"
                    Font-Italic="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Hãng sản xuất </td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtcompmaking" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Nơi sản xuất </td>
            <td class="style44" colspan="3">
                <dx:ASPxTextBox ID="txtMadeIn" runat="server" Width="197px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Ký hiệu </td>
            <td class="style47">
                <dx:ASPxTextBox ID="txtModel" runat="server" Width="197px">
                </dx:ASPxTextBox>
            </td>
            <td class="style135">Serial Number&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                <dx:ASPxTextBox ID="txtSN" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Phương pháp thử</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txttestmethod" runat="server" Height="19px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Tiêu chuẩn đánh giá</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtstandard" runat="server" Width="550px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Phí đo kiểm (VNĐ)</td>
            <td class="style43" colspan="3">
                <dx:ASPxTextBox ID="txtprice" runat="server" Width="197px" Height="17px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Viết bằng chữ</td>
            <td class="style36" colspan="3">
                <dx:ASPxTextBox ID="txtpriceintext" runat="server" Height="16px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Ngày nhận mẫu </td>
            <td class="style39">
                <dx:ASPxDateEdit ID="dtreceive" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style132">Ngày trả dự kiến&nbsp;&nbsp;&nbsp; </td>
            <td class="style41">
                <dx:ASPxDateEdit ID="dtrelease" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style33">Phụ kiện kèm theo</td>
            <td class="style45" colspan="3">
                <dx:ASPxMemo ID="mmAcce" runat="server" Height="71px" Width="310px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style33">Ghi chú</td>
            <td class="style45" colspan="3">
                <dx:ASPxMemo ID="mmNote" runat="server" Height="71px" Width="310px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style134">&nbsp;</td>
            <td class="style45" colspan="3">&nbsp;</td>
        </tr>
    </table>

    <p>

        <strong>
            <dx:ASPxLabel ID="ASPxLabel6" runat="server" CssClass="style19"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Danh sách các yêu cầu đo kiểm">
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
            OnHtmlRowPrepared="ASPxGridView3_HtmlRowPrepared"
            OnCustomColumnDisplayText="ASPxGridView3_CustomColumnDisplayText">
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
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowEditButton="True">
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
                    Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số hợp đồng" FieldName="ContractNo"
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số KQ" FieldName="ReportNo"
                    ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="RequestNo"
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu thu" FieldName="BillNo"
                    ShowInCustomizationForm="True" VisibleIndex="2">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Số hóa đơn" FieldName="RedBillID"
                    VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="SqlDataSourceRedBill" TextField="RedBillNo"
                        ValueField="RedBillID" ValueType="System.Int32" DropDownStyle="DropDown"
                        IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên Công ty" FieldName="CompanyID"
                    VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName"
                        ValueField="CompanyID" ValueType="System.Int32" DropDownStyle="DropDown"
                        IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="ContactID"
                    VisibleIndex="7" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="EquTypeID"
                    VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEquipment"
                        TextField="EquTypeName" ValueField="EquTypeID" ValueType="System.String"
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="EquTypeName" Visible="False"
                    VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="Model"
                    VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hãng sản xuất" FieldName="Manufacturer"
                    VisibleIndex="11" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MadeInID" Visible="False"
                    VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" Visible="False"
                    VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày nhận mẫu" FieldName="ReceiveDate"
                    VisibleIndex="14">
                    <PropertiesDateEdit>
                        <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                        </CalendarProperties>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người nhận mẫu"
                    FieldName="ReceiveStaffID" Visible="False" VisibleIndex="15">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả dự kiến"
                    FieldName="AppointmentDate" VisibleIndex="16">
                    <PropertiesDateEdit>
                        <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                        </CalendarProperties>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày xác nhận phân công"
                    FieldName="ConfirmDate" Visible="False" VisibleIndex="17">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày ban hành KQ"
                    FieldName="TestRPIssueDate" ShowInCustomizationForm="True" Visible="False"
                    VisibleIndex="18">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người phê duyệt" FieldName="StaffIDApprove"
                    VisibleIndex="19" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff"
                        TextField="StaffFullName" ValueField="StaffID" ValueType="System.String"
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày phê duyệt KQ" FieldName="ApproveDate"
                    ShowInCustomizationForm="True" UnboundType="DateTime" Visible="False"
                    VisibleIndex="20">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày phê duyệt ko ban hành KQ"
                    FieldName="ApproveNonIssueDate" ShowInCustomizationForm="True" Visible="False"
                    VisibleIndex="21">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID"
                    ShowInCustomizationForm="True" VisibleIndex="22">
                    <PropertiesComboBox DataSourceID="SqlDataSourceRequestSt"
                        TextField="StatusName" ValueField="StatusID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="TestReportKind" Visible="False"
                    VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả mẫu" FieldName="ReturnDate"
                    Visible="False" VisibleIndex="23">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả mẫu"
                    FieldName="ReturnStaffID" Visible="False" VisibleIndex="24">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả KQ" FieldName="ReturnRPDate"
                    Visible="False" VisibleIndex="25">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả KQ"
                    FieldName="ReturnRPStaffID" Visible="False" VisibleIndex="26">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Người trả hóa đơn"
                    FieldName="ReturnRBStaffID" Visible="False" VisibleIndex="29">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFullName"
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tình trạng hóa đơn"
                    FieldName="HoldRedBill" Visible="False" VisibleIndex="27">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Đã trả hóa đơn" Value="0" />
                            <dx:ListEditItem Text="Đang giữ hóa đơn" Value="1" />
                            <dx:ListEditItem Text="Chưa có hóa đơn" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Ngày trả hóa đơn" FieldName="ReturnRBDate"
                    Visible="False" VisibleIndex="28">
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
            SelectCommand="SELECT RequestID, RequestNo, ContractNo, BillNo, BillDate, CompanyID, ContactID, EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei, Standards, TestMethod, Accessories, ReceiveDate, ReceiveStaffID, AppointmentDate, ReturnStaffID, ReturnDate, StatusID, Note, HoldEquip, ConfirmDate, InternalNote, StaffIDNonIssue, (SELECT TestReportNo FROM TestReport WHERE (AssignmentID = Request.RequestID)) AS ReportNo, (SELECT TestReportIssueDate FROM TestReport AS TestReport_1 WHERE (AssignmentID = Request.RequestID)) AS TestRPIssueDate, (SELECT Kind FROM TestReport AS TestReport_2 WHERE (AssignmentID = Request.RequestID)) AS TestReportKind, (SELECT ReturnRPDate FROM TestReport AS TestReport_3 WHERE (AssignmentID = Request.RequestID)) AS ReturnRPDate, (SELECT ReturnStaffID FROM TestReport AS TestReport_4 WHERE (AssignmentID = Request.RequestID)) AS ReturnRPStaffID, (SELECT ReturnRBDate FROM TestReport AS TestReport_5 WHERE (AssignmentID = Request.RequestID)) AS ReturnRBDate, (SELECT ReturnRBStaffID FROM TestReport AS TestReport_6 WHERE (AssignmentID = Request.RequestID)) AS ReturnRBStaffID, (SELECT RedBillID FROM TestReport AS TestReport_7 WHERE (AssignmentID = Request.RequestID)) AS RedBillID, (SELECT HoldRedBill FROM TestReport AS TestReport_8 WHERE (AssignmentID = Request.RequestID)) AS HoldRedBill, (SELECT ApproveDate FROM TestReport AS TestReport_9 WHERE (AssignmentID = Request.RequestID)) AS ApproveDate, NonIssueDate, StaffIDApprove, ApproveNonIssueDate FROM Request ORDER BY ReceiveDate DESC, RequestNo DESC"></asp:SqlDataSource>

    </p>
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
            SelectCommand="SELECT * FROM [Staff] WHERE ([StaffID] &lt;&gt; @StaffID) ORDER BY CONVERT (nvarchar(500), StaffFistName)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbStaff1" Name="StaffID" PropertyName="Value"
                    Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
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
        <asp:SqlDataSource ID="SqlDataSourceRedBill" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [RedBill] ORDER BY [RedBillNo] DESC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRequestStSuccsess" runat="server"
            ConnectionString="<%$ ConnectionStrings:db_mang %>"
            SelectCommand="SELECT * FROM [RequestStatus] WHERE (([StatusID] = 5) OR ([StatusID] = 7))"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
</asp:Content>
