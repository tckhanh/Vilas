<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-KetQuaDo.aspx.cs" Inherits="LabManagement.KetQuaDo" UICulture="vi-vn" %>
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
            width: 1014px;
            color: #000000;
        }
        .style30
        {
        }
    .style32
    {
        width: 785px;
        font-size: medium;
            height: 43px;
            margin-right: 0px;
        }
    .style33
    {
            width: 1014px;
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
        .style47
        {
            width: 129px;
        }
        .style56
        {
            width: 119px;
        }
        .style110
        {
            width: 150px;
        }
        .style113
        {
            width: 75%;
            height: 52px;
        }
        .style116
        {
            width: 152px;
        }
        .style117
        {
            text-align: center;
        }
        .style118
        {
            width: 118px;
            text-align: left;
        }
        .style123
        {
            width: 232px;
        }
        .style124
        {
            width: 137px;
            height: 1px;
        }
        .style125
        {
            width: 137px;
            text-align: center;
        }
        .style127
        {
            width: 1014px;
            font-size: medium;
            margin-right: 0px;
        }
        .style128
        {
            width: 1014px;
            font-size: medium;
            height: 1px;
            margin-right: 0px;
        }
        .style129
        {
            width: 150px;
            height: 1px;
        }
        .style130
        {
            width: 1014px;
            font-size: medium;
            height: 37px;
            margin-right: 0px;
        }
        .style131
        {
            height: 37px;
        }
        .style132
        {
            width: 176px;
            text-align: center;
        }
        .style133
        {
            color: Black;
            width: 176px;
            text-align: center;
        }
        .style134
        {
            width: 3315px;
        }
        .style135
        {
            width: 176px;
            text-align: center;
        }
        .style136
        {
            height: 53px;
        }
        .style137
        {
            width: 75%;
            height: 40px;
        }
        .style138
        {
            color: #FF0000;
        }
        .style139
        {
            width: 118px;
            text-align: left;
            color: #FF0000;
        }
        .style140
        {
            width: 176px;
        }
        .style141
        {
            width: 210px;
        }
        .style145
        {
            width: 75%;
        }
        .style146
        {
            width: 347px;
        }
        .style147
        {
            width: 147px;
        }
        .style142
        {
            width: 100%;
            height: 196px;
        }
        .style143
        {
            height: 27px;
            text-align: center;
            font-weight: bold;
        }
        .style149
        {
            width: 227px;
        }
        .style150
        {
            width: 395px;
        }
        .style151
        {
            text-align: center;
            width: 284px;
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
            Text="BAN HÀNH KẾT QUẢ ĐO KIỂM">
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
        <strong>
        <dx:ASPxPanel ID="paComment1" runat="server" Height="220px" Width="785px">
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="style142">
        <tr>
            <td class="style143">
                <strong>
                <dx:ASPxLabel ID="lbReceiveStaffComDate" runat="server" Font-Bold="True" 
                    style="color: #003399; font-style: italic" Font-Size="Medium">
                </dx:ASPxLabel>
                </strong>
            </td>
            <td class="style143">
                <strong>
                <dx:ASPxLabel ID="lbTestStaffComDate" runat="server" Font-Bold="True" 
                    style="color: #003399; font-style: italic" Font-Size="Medium">
                </dx:ASPxLabel>
                </strong>
            </td>
            <td class="style143">
                <strong>
                <dx:ASPxLabel ID="lbApprStaffComDate" runat="server" Font-Bold="True" 
                    style="color: #003399; font-style: italic" Font-Size="Medium">
                </dx:ASPxLabel>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="style143">
                <strong>Ý kiến của chuyên viên nhận mẫu</strong></td>
            <td bgcolor="#FFFF99" class="style143">
                <strong>Ý kiến của chuyên viên đo kiểm</strong></td>
            <td class="style143">
                <strong>Ý kiến của người phê duyệt</strong></td>
        </tr>
        <tr bgcolor="#669999">
            <td align="center">
                <dx:ASPxMemo ID="mmReceiveStaff" runat="server" Height="150px" Width="250px" 
                    ReadOnly="True">
                </dx:ASPxMemo>
            </td>
            <td align="center">
                <dx:ASPxMemo ID="mmTestingStaff" runat="server" BackColor="#FFFFCC" 
                    Height="150px" Width="250px">
                </dx:ASPxMemo>
            </td>
            <td align="center">
                <dx:ASPxMemo ID="mmApproveStaff" runat="server" Height="150px" Width="250px" 
                    ReadOnly="True">
                </dx:ASPxMemo>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
            <Border BorderColor="Black" BorderStyle="Solid" />
    </dx:ASPxPanel>
        <table class="style32">
            <tr>
                <td align="center" class="style150">
                    <dx:ASPxButton ID="btReCheck" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Đề nghị xử lý lại thông tin nhận mẫu" 
                        onclick="btReCheck_Click" Width="240px">
                    </dx:ASPxButton>
                </td>
                <td align="center">
        <strong>
                    <dx:ASPxButton ID="btFinishReCheck" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Hoàn tất xử lý lại" 
                        onclick="btFinishReCheck_Click" Width="240px">
                    </dx:ASPxButton>
        </strong>
                </td>
            </tr>
    </table>
    <br />
        <table class="style137">
            <tr>
                <td align="center">
                    <dx:ASPxCheckBox ID="chIssue" runat="server" Font-Size="Medium" 
                        ForeColor="#CC3300" Text="Ban hành kết quả" AutoPostBack="True" 
                        Checked="True" CheckState="Checked" oncheckedchanged="chIssue_CheckedChanged">
                    </dx:ASPxCheckBox>
                </td>
                <td align="center">
                    <strong>
                    <dx:ASPxCheckBox ID="chNonIssue" runat="server" Font-Size="Medium" 
                        ForeColor="#CC3300" Text="Không ban hành kết quả" AutoPostBack="True" 
                        oncheckedchanged="chNonIssue_CheckedChanged">
                    </dx:ASPxCheckBox>
        </strong>
                </td>
            </tr>
    </table>
        </strong>
    <table class="style32">
        <tr>
            <td class="style116">
                Số kết quả
                <dx:ASPxLabel ID="lbExpect" runat="server" Font-Bold="True" Font-Size="Small" 
                    ForeColor="Red">
                </dx:ASPxLabel>
            </td>
            <td class="style151">
                <dx:ASPxTextBox ID="txtTestReportNo" runat="server" BackColor="#FFCCFF" 
                    Font-Bold="True" Width="170px" Height="16px">
                </dx:ASPxTextBox>
            </td>
            <td class="style118">
                Đánh giá KQĐK</td>
            <td>
                <dx:ASPxComboBox ID="cbKind" runat="server"  
                    EnableIncrementalFiltering="True" ValueType="System.Int32" width="170px" 
                    Height="18px" style="text-align: left"  
                    onselectedindexchanged="cbTestSession_SelectedIndexChanged" 
                    SelectedIndex="0" >
                    <Items>
                        <dx:ListEditItem Text="Bình thường" Value="1" Selected="True" />
                        <dx:ListEditItem Text="Không bình thường" Value="0" />
                    </Items>

                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style116">
                Ngày đo kiểm</td>
            <td class="style151">
                <dx:ASPxDateEdit ID="dtTestDate" runat="server" AutoPostBack=true  
                    ondatechanged="dtTestDate_DateChanged">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style118">
                Buổi đo</td>
            <td>
                <dx:ASPxComboBox ID="cbTestSession" runat="server" AutoPostBack="True" 
                    EnableIncrementalFiltering="True" ValueType="System.Int32" width="170px" 
                    Height="18px" style="text-align: left" IncrementalFilteringMode="StartsWith" 
                    onselectedindexchanged="cbTestSession_SelectedIndexChanged" 
                    SelectedIndex="0" >
                    <Items>
                        <dx:ListEditItem Text="Sáng" Value="0" />
                        <dx:ListEditItem Text="Chiều" Value="1" />
                    </Items>

                </dx:ASPxComboBox>
                </td>
        </tr>
        <tr>
            <td class="style116">
                Nhiệt độ (độ C)&nbsp;</td>
            <td class="style151">
                <dx:ASPxTextBox ID="txtTemp" runat="server" Width="170px" Height="20px">
                </dx:ASPxTextBox>
            </td>
            <td class="style118">
                Độ ẩm 
                (%)</td>
            <td>
                <dx:ASPxTextBox ID="txtHum" runat="server" Width="170px" Height="20px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style138">
                <dx:ASPxLabel ID="lbIssueDate" runat="server" 
                    style="font-family: 'Times New Roman', Times, serif; font-size: 12pt; color: #FF0000;" 
                    Text="Ngày ban hành">
                </dx:ASPxLabel>
            </td>
            <td class="style151">
                <dx:ASPxDateEdit ID="dtIssueReportDate" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style139">
                Người đề xuất</td>
            <td>
                <dx:ASPxComboBox ID="cbIssueStaff" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceApproveStaff" ValueType="System.String" width="250px" 
                    ValueField="StaffID"  Height="18px" 
                        TextField="StaffFullName" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" 
                    ReadOnly="True" >
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style138">
                Người phê duyệt</td>
            <td class="style151">
                <dx:ASPxComboBox ID="cbApproveStaff" runat="server" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceApproveStaff" ValueType="System.String" width="250px" 
                    ValueField="StaffID"  Height="18px" 
                        TextField="StaffFullName" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                </dx:ASPxComboBox>
            </td>
            <td class="style139">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style116">
                <dx:ASPxLabel ID="lbIssueOrNon" runat="server" 
                    style="font-family: 'Times New Roman', Times, serif; font-size: 12pt; color: #FF0000;" 
                    Text="Lịch sử đo kiểm">
                </dx:ASPxLabel>
            </td>
            <td class="style117" colspan="3">
                    <dx:ASPxMemo ID="mmTestHistory" runat="server" Height="87px" 
                        style="text-align: left" Width="381px">
                    </dx:ASPxMemo>
                </td>
        </tr>
        </table>
        <table class="style145">
            <tr>
                <td class="style146">
                    <dx:ASPxUploadControl ID="UpTestReport" runat="server" Height="16px" 
                        Width="321px">
                        <BrowseButton Text="Chọn File kết quả">
                            <Image AlternateText="đấ">
                            </Image>
                        </BrowseButton>
                    </dx:ASPxUploadControl>
                </td>
                <td class="style147">
                    <dx:ASPxButton ID="btUpload" runat="server" 
                        CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" CssPostfix="Office2003Blue" 
                        SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css" Text="Upload Kết quả" 
                        onclick="btUpload_Click" Width="123px">
                    </dx:ASPxButton>
                </td>
                <td align="center">
                    <dx:ASPxHyperLink ID="hlFileName" runat="server" 
                        style="font-style: italic; text-decoration: underline">
                    </dx:ASPxHyperLink>
                </td>
            </tr>
    </table>
        <table class="style32">
            <tr>
                <td align="center" class="style141">
                    <dx:ASPxButton ID="btSave" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu mới" 
                        onclick="btSave_Click" Width="100px">
                    </dx:ASPxButton>
                </td>
                <td align="center" class="style149">
                    <dx:ASPxButton ID="btUpdate" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật" 
                        onclick="btUpdate_Click" Width="100px">
                    </dx:ASPxButton>
                </td>
                <td align="center" class="style140">
                    <dx:ASPxButton ID="btDelete" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa" 
                        onclick="btDelete_Click" Width="100px">
                    </dx:ASPxButton>
                </td>
                <td align="center" class="style123">
                    <dx:ASPxButton ID="btPrint" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="In Kết quả" Width="100px">
                        <ClientSideEvents Click="function (s, e) {window.open('ReportForm/TRPForm.aspx', '_blank')}" />
                    </dx:ASPxButton>
                </td>
                <td align="center">
                    <dx:ASPxButton ID="btNew" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo mới" 
                        onclick="btNew_Click" Width="100px">
                    </dx:ASPxButton>
                </td>
            </tr>
    </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssClass="style35" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Thông tin phân công đo">
        </dx:ASPxLabel>
        </strong></p>
        <table style="style57; width: 789px;">
            <tr>
                <td class="style127" align="left">
                    <span class="dxmLite_Office2003Blue">Người phân công</span></td>
                <td class="style110" align="left">
                <dx:ASPxComboBox ID="cbAssign" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff1" ValueType="System.String" width="250px" 
                    ValueField="StaffID"  Height="18px" 
                        TextField="StaffID" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                    <columns>
                    <dx:ListBoxColumn FieldName="StaffFullName" />
                    </columns>
                </dx:ASPxComboBox>
                </td>
                <td class="style125">
                    Ngày phân công</td>
                <td align="left">
                <dx:ASPxDateEdit ID="dtAssign" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td class="style127" align="left">
                    Tên mẫu đo kiểm</td>
                <td align="left" colspan="3">
                <dx:ASPxTextBox ID="txtEquipName2" runat="server" Width="640px" 
                        Height="16px" style="margin-left: 0px">
                </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td class="style128" align="left">
                    Nhân viên đo 1</td>
                <td class="style129" align="left">
                <dx:ASPxComboBox ID="cbStaff1" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff1" ValueType="System.String" width="250px" 
                    ValueField="StaffID"  Height="18px" 
                        TextField="StaffID" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                    <columns>
                    <dx:ListBoxColumn FieldName="StaffFullName" />
                    </columns>
                </dx:ASPxComboBox>
                </td>
                <td class="style124" align="center">
                    Nhân viên đo 2</td>
                <td class="dxmVerticalMenuItemSpacing_Office2003Blue" align="center">
                <dx:ASPxComboBox ID="cbStaff2" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff2" ValueType="System.String" width="250px" 
                    ValueField="StaffID" Height="18px" 
                        TextField="StaffID" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                    <columns>
                    <dx:ListBoxColumn FieldName="StaffFullName" />
                    </columns>
                </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="style130" align="left">
                    Lưu ý</td>
                <td align="left" colspan="3" class="style131">
                    <dx:ASPxMemo ID="mmAssignNote" runat="server" Height="87px" 
                        style="text-align: left" Width="384px">
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
        </strong></p>
    <table class="style32">
        <tr>
            <td class="style33" bgcolor="White">
                <strong>Số phiếu yêu cầu đo kiểm</strong></td>
            <td colspan="3" bgcolor="White" style="text-align: center">
                <dx:ASPxComboBox ID="cbRequestNo" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceRequest" ValueType="System.Int32" width="197px" 
                    ValueField="RequestID"  Height="18px" 
                        TextField="RequestNo" BackColor="#FFCCFF" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                 </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Tên công ty </td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtCompanyName" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Địa Chỉ</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="550px" Height="21px">
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
            <td class="style132">
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
            <td class="style132">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style33">
                Người liên hệ </td>
            <td class="style56">
                <dx:ASPxTextBox ID="txtContact" runat="server" Width="197px">
                </dx:ASPxTextBox>
            </td>
            <td class="style132">
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
            <td class="style133">
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
    <table class="style32">
        <tr>
            <td class="style33">
                Nhân viên nhận mẫu</td>
            <td colspan="3">
                <dx:ASPxComboBox ID="cbReceiveStaff" runat="server" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceStaff" ValueType="System.String" width="250px" 
                    ValueField="StaffID"  Height="18px" 
                        TextField="StaffFullName" 
                        IncrementalFilteringMode="StartsWith" style="text-align: left" >
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                <strong>Tên mẫu đo kiểm </strong> </td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtEquipName" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Tên bổ sung</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtEquName" runat="server" Height="20px" Width="550px" 
                    Font-Italic="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Hãng sản xuất </td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtcompmaking" runat="server" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Nơi sản xuất </td>
            <td class="style44" colspan="3">
                <dx:ASPxTextBox ID="txtMadeIn" runat="server" Width="197px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Ký hiệu </td>
            <td class="style47">
                <dx:ASPxTextBox ID="txtModel" runat="server" Width="197px">
                </dx:ASPxTextBox>
            </td>
            <td class="style135">
                Serial Number&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                <dx:ASPxTextBox ID="txtSN" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Phương pháp thử</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txttestmethod" runat="server" Height="19px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Tiêu chuẩn đánh giá</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtstandard" runat="server" Width="550px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Phí đo kiểm (VNĐ)</td>
            <td class="style43" colspan="3">
                <dx:ASPxTextBox ID="txtprice" runat="server" Width="197px" Height="17px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Viết bằng chữ</td>
            <td class="style36" colspan="3">
                <dx:ASPxTextBox ID="txtpriceintext" runat="server" Height="16px" Width="550px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Ngày nhận mẫu </td>
            <td class="style39">
                <dx:ASPxDateEdit ID="dtreceive" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style132">
                Ngày trả dự kiến&nbsp;&nbsp;&nbsp; </td>
            <td class="style41">
                <dx:ASPxDateEdit ID="dtrelease" runat="server" >
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Phụ kiện kèm theo</td>
            <td class="style45" colspan="3">
                <dx:ASPxMemo ID="mmAcce" runat="server" Height="71px" Width="310px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Ghi chú</td>
            <td class="style45" colspan="3">
                <dx:ASPxMemo ID="mmNote" runat="server" Height="71px" Width="310px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="style134">
                &nbsp;</td>
            <td class="style45" colspan="3">
                &nbsp;</td>
        </tr>
    </table>

        <p>

        <strong>
        <dx:ASPxLabel ID="ASPxLabel6" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các yêu cầu đo kiểm chờ xử lý">
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
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="DeleteButton" Text=" ">
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
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="10" 
                    Caption="Ngày xác nhận đo" Visible="False">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="RequestID" Visible=false
                    VisibleIndex="1" ReadOnly="True">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RequestNo" VisibleIndex="2" 
                    Caption="Số phiếu">
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyName"  VisibleIndex="3" 
                    Caption="Tên công ty">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EquTypeName" VisibleIndex="4" 
                    Caption="Loại thiết bị">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="5" Caption="Ký hiệu">
                <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" VisibleIndex="6" 
                    Caption="Hãng sản xuất">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="7" Visible=false>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" VisibleIndex="8" 
                    Caption="Ngày nhận mẫu" Visible=false>
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" VisibleIndex="9" 
                    Caption="Ngày trả dự kiến">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="11" 
                    Caption="Ngày phân công" Visible=false>
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffID" VisibleIndex="12" 
                    Visible=false >
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffName" Caption="Người phân công"
                    VisibleIndex="13" Visible="False">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="ReceiveStaffID" VisibleIndex="14" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TestStaff1ID" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Test1StaffName" 
                    caption="Nhân viên đo 1" VisibleIndex="17" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffFistName">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff2ID" VisibleIndex="16" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Test2StaffName" 
                    caption="Nhân viên đo 2" VisibleIndex="19" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffFistName">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                    VisibleIndex="21">
                    <PropertiesComboBox DataSourceID="SqlDataSourceRequestSt" 
                        TextField="StatusName" ValueField="StatusID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Ghi chú" FieldName="RecheckStatusID" 
                    ShowInCustomizationForm="True" VisibleIndex="22">
                    <PropertiesComboBox DataSourceID="SqlDataSourceRecheckSt" 
                        TextField="RecheckStatus" ValueField="RecheckID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

            </Columns>
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text=""></Summary>
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
                
        
        
        
        
        SelectCommand="SELECT Request.RequestID, Request.RequestNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.Manufacturer, Request.Serial_Imei, Request.ReceiveDate, Request.AppointmentDate, Assignment.AssignDate, AssignStaff.StaffID AS AssignStaffID, AssignStaff.StaffFistName AS AssignStaffName, TestStaff1.StaffID AS TestStaff1ID, TestStaff1.StaffFistName AS Test1StaffName, TestStaff2.StaffID AS TestStaff2ID, TestStaff2.StaffFistName AS Test2StaffName, RequestStatus.StatusName, Assignment.AssignmentID, Assignment.TestStaffID1, Assignment.TestStaffID2, Assignment.AssignNote, Request.ConfirmDate, Request.RecheckStatusID, Request.StatusID, Request.ReceiveStaffID FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff) AS AssignStaff ON Assignment.AssignStaffID = AssignStaff.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_2) AS TestStaff1 ON Assignment.TestStaffID1 = TestStaff1.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_1) AS TestStaff2 ON Assignment.TestStaffID2 = TestStaff2.StaffID INNER JOIN Company ON Request.CompanyID = Company.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID INNER JOIN RequestStatus ON Request.StatusID = RequestStatus.StatusID WHERE (RequestStatus.StatusID = 3) AND (TestStaff1.StaffID = @StaffID) AND (Request.RecheckStatusID IS NULL OR Request.RecheckStatusID = 4) OR (RequestStatus.StatusID = 3) AND (Request.RecheckStatusID IS NULL OR Request.RecheckStatusID = 4) AND (TestStaff2.StaffID = @StaffID) OR (TestStaff1.StaffID = @StaffID) AND (Request.RecheckStatusID = 1 OR Request.RecheckStatusID = 3) OR (Request.RecheckStatusID = 1 OR Request.RecheckStatusID = 3) AND (TestStaff2.StaffID = @StaffID) ORDER BY Request.RecheckStatusID DESC, Assignment.AssignDate DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="StaffID" SessionField="StaffID" />
                </SelectParameters>              
            </asp:SqlDataSource>

    <p>

        <strong>
        <dx:ASPxLabel ID="ASPxLabel12" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các yêu cầu đo kiểm chuyển chuyên viên nhận mẫu xử lý lại">
        </dx:ASPxLabel>
        </strong></p>
            <dx:ASPxGridView ID="ASPxGridView4" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid4"
            DataSourceID="SqlDataSourceAssignInfo3" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="AssignmentID" 
                oncustomcallback="ASPxGridView4_CustomCallback" 
        onhtmlrowprepared="ASPxGridView4_HtmlRowPrepared">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid4.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="DeleteButton" Text=" ">
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
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="10" 
                    Caption="Ngày xác nhận đo" Visible="False">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="RequestID" Visible=false
                    VisibleIndex="1" ReadOnly="True">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RequestNo" VisibleIndex="2" 
                    Caption="Số phiếu">
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyName"  VisibleIndex="3" 
                    Caption="Tên công ty">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EquTypeName" VisibleIndex="4" 
                    Caption="Loại thiết bị">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="5" Caption="Ký hiệu">
                <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" VisibleIndex="6" 
                    Caption="Hãng sản xuất">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="7" Visible=false>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" VisibleIndex="8" 
                    Caption="Ngày nhận mẫu" Visible=false>
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" VisibleIndex="9" 
                    Caption="Ngày trả dự kiến">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="11" 
                    Caption="Ngày phân công" Visible=false>
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffID" VisibleIndex="12" 
                    Visible=false >
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffName" Caption="Người phân công"
                    VisibleIndex="13" Visible="False">
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff1ID" VisibleIndex="14" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ReceiveStaffID" 
                    caption="Nhân viên nhận mẫu" VisibleIndex="16">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Nhân viên đo 1" 
                    FieldName="Test1StaffName" ShowInCustomizationForm="True" VisibleIndex="17">
                    <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                        ValueField="StaffFistName" ValueType="System.String">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff2ID" VisibleIndex="15" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Test2StaffName" 
                    caption="Nhân viên đo 2" VisibleIndex="20" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffFistName">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                    VisibleIndex="22">
                    <PropertiesComboBox DataSourceID="SqlDataSourceRequestSt" 
                        TextField="StatusName" ValueField="StatusID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Ghi chú" FieldName="RecheckStatusID" 
                    ShowInCustomizationForm="True" VisibleIndex="23" Visible="False">
                    <PropertiesComboBox DataSourceID="SqlDataSourceRecheckSt" 
                        TextField="RecheckStatus" ValueField="RecheckID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

            </Columns>
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text=""></Summary>
            </SettingsPager>
             <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly=true ConfirmDelete=true AllowFocusedRow=true />
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
            <asp:SqlDataSource ID="SqlDataSourceAssignInfo3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>"                    
                
        
        
        
        
        SelectCommand="SELECT Request.RequestID, Request.RequestNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.Manufacturer, Request.Serial_Imei, Request.ReceiveDate, Request.AppointmentDate, Assignment.AssignDate, AssignStaff.StaffID AS AssignStaffID, AssignStaff.StaffFistName AS AssignStaffName, TestStaff1.StaffID AS TestStaff1ID, TestStaff1.StaffFistName AS Test1StaffName, TestStaff2.StaffID AS TestStaff2ID, TestStaff2.StaffFistName AS Test2StaffName, RequestStatus.StatusName, Assignment.AssignmentID, Assignment.TestStaffID1, Assignment.TestStaffID2, Assignment.AssignNote, Request.ConfirmDate, Request.RecheckStatusID, Request.StatusID, Request.ReceiveStaffID FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff) AS AssignStaff ON Assignment.AssignStaffID = AssignStaff.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_2) AS TestStaff1 ON Assignment.TestStaffID1 = TestStaff1.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_1) AS TestStaff2 ON Assignment.TestStaffID2 = TestStaff2.StaffID INNER JOIN Company ON Request.CompanyID = Company.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID INNER JOIN RequestStatus ON Request.StatusID = RequestStatus.StatusID WHERE (TestStaff1.StaffID = @StaffID) AND (Request.RecheckStatusID = 2) OR (Request.RecheckStatusID = 2) AND (TestStaff2.StaffID = @StaffID) ORDER BY Request.RecheckStatusID DESC, Assignment.AssignDate DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="StaffID" SessionField="StaffID" />
                </SelectParameters>              
            </asp:SqlDataSource>

        <p>

            <strong>
        <dx:ASPxLabel ID="ASPxLabel10" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các kết quả xử lý được tạo bởi nhóm đo">
        </dx:ASPxLabel>
        &nbsp;<dx:ASPxLabel ID="txtStaff" runat="server" Font-Bold="True" 
            Font-Italic="True" Font-Size="Medium" ForeColor="#000099" Text="ASPxLabel">
        </dx:ASPxLabel>
        &nbsp;&nbsp;<dx:ASPxLabel ID="ASPxLabel11" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="chờ được phê duyệt">
        </dx:ASPxLabel>
        </strong></p>

            <dx:ASPxGridView ID="ASPxGridView3" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid3"
            DataSourceID="SqlDataSourceAssignInfo2" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="RequestID" 
                oncustomcallback="ASPxGridView3_CustomCallback" 
                    onhtmlrowprepared="ASPxGridView3_HtmlRowPrepared">
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
                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                        <ClearFilterButton Visible="True" Text="Xóa lọc">
                        </ClearFilterButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="RequestID" ReadOnly="True" 
                        Visible="False" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số KQ" FieldName="ReportNo" 
                        VisibleIndex="1" ShowInCustomizationForm="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="RequestNo" 
                        VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Tên Công ty" FieldName="CompanyID" 
                        VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName" 
                            ValueField="CompanyID" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="ContactID" Visible="False" 
                        VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="EquTypeID" 
                        VisibleIndex="5">
                        <PropertiesComboBox DataSourceID="SqlDataSourceEquipment" 
                            TextField="EquTypeName" ValueField="EquTypeID" ValueType="System.String">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="EquTypeName" Visible="False" 
                        VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="Model" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Hãng sản xuất" FieldName="Manufacturer" 
                        VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MadeInID" Visible="False" 
                        VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Serial_Imei" Visible="False" 
                        VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày nhận mẫu" FieldName="ReceiveDate" 
                        VisibleIndex="11">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày trả dự kiến" 
                        FieldName="AppointmentDate" VisibleIndex="12">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Người phê duyệt" FieldName="StaffIDApprove" 
                        VisibleIndex="21">
                        <PropertiesComboBox DataSourceID="SqlDataSourceApproveStaff" 
                            TextField="StaffFullName" ValueField="StaffID" ValueType="System.String">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                        ShowInCustomizationForm="True" VisibleIndex="22">
                        <PropertiesComboBox DataSourceID="SqlDataSourceRequestSt" 
                            TextField="StatusName" ValueField="StatusID" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="TestReportKind" Visible="False" 
                        VisibleIndex="25">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AssignStaffID" Visible="False" 
                        VisibleIndex="24">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ReceiveStaffID" Visible="False" 
                        VisibleIndex="26">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TestStaffID1" 
                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="27">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TestStaffID2" Visible="False" 
                        VisibleIndex="29">
                    </dx:GridViewDataTextColumn>
                </Columns>
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
            <asp:SqlDataSource ID="SqlDataSourceAssignInfo2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>"                    
                
        
        
                    
                    
        
        SelectCommand="SELECT Request.RequestID, Request.RequestNo, Request.ContractNo, Request.BillNo, Request.BillDate, Request.CompanyID, Request.ContactID, Request.EquTypeID, Request.EquTypeName, Request.Model, Request.Manufacturer, Request.MadeInID, Request.Serial_Imei, Request.Standards, Request.TestMethod, Request.Accessories, Request.ReceiveDate, Request.ReceiveStaffID, Request.AppointmentDate, Request.ReturnStaffID, Request.ReturnDate, Request.StatusID, Request.Note, Request.HoldEquip, Request.ConfirmDate, Request.InternalNote, Request.StaffIDNonIssue, (SELECT TestReportNo FROM TestReport WHERE (AssignmentID = Request.RequestID)) AS ReportNo, (SELECT TestReportIssueDate FROM TestReport AS TestReport_1 WHERE (AssignmentID = Request.RequestID)) AS TestRPIssueDate, (SELECT Kind FROM TestReport AS TestReport_2 WHERE (AssignmentID = Request.RequestID)) AS TestReportKind, (SELECT CreateRPStaff FROM TestReport AS TestReport_3 WHERE (AssignmentID = Request.RequestID)) AS CreateRPStaffID, Request.NonIssueDate, Request.StaffIDApprove, Request.ApproveNonIssueDate, Assignment.TestStaffID1, Assignment.TestStaffID2, Assignment.AssignStaffID FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID WHERE (Request.StatusID = 4 OR Request.StatusID = 6) AND (Assignment.TestStaffID1 = @StaffID) OR (Request.StatusID = 4 OR Request.StatusID = 6) AND (Assignment.TestStaffID2 = @StaffID) ORDER BY Request.ReceiveDate DESC, Request.RequestNo DESC">
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
         <asp:SqlDataSource ID="SqlDataSourceApproveStaff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            
            
            
            SelectCommand="SELECT * FROM [Staff] ORDER BY CONVERT (nvarchar(500), StaffFistName)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRequestSt" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            
            SelectCommand="SELECT * FROM [RequestStatus]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceRecheckSt" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            
            SelectCommand="SELECT * FROM [RecheckStatus]">
        </asp:SqlDataSource>

</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
