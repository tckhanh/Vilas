<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-NhanMau.aspx.cs" Inherits="LabManagement.NhanMau" %>
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
            width: 3px;
        }
        .style25
        {
            width: 189px;
            color: #0033CC;
        }
        .style26
        {
            width: 740px;
        }
        .style29
        {
            width: 195px;
            text-align: center;
        }
        .style30
        {
        }
    .style31
    {
        color: #0033CC;
            text-align: left;
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
            width: 195px;
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
            width: 2417px;
        }
        .style47
        {
            width: 129px;
        }
        .style48
        {
            width: 78%;
        }
        .style53
        {
            width: 71%;
            height: 47px;
        }
        .style54
        {
            font-size: x-large;
            color: #CC3300;
            height: 22px;
        }
        .style58
        {
            width: 189px;
            color: #000000;
        }
        .style59
        {
            color: #000000;
            text-align: left;
        }
        .style60
        {
            width: 163px;
        }
        .style61
        {
            width: 164px;
        }
        .style62
        {
            width: 151px;
        }
        .style63
        {
            width: 171px;
        }
        .style64
        {
            font-size: x-large;
            color: #CC3300;
            height: 47px;
        }
        .style142
        {
            width: 100%;
            height: 223px;
        }
        .style143
        {
            height: 27px;
            text-align: center;
            font-weight: bold;
        }
        .style146
        {
            height: 35px;
        }
        .style147
        {
            text-align: center;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style53">
        <tr>
            <td class="style64" style="text-align: center">
        <strong>
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssClass="style35" 
            Font-Bold="True" Font-Italic="False" Font-Size="X-Large" 
            Text="NHẬN MẪU ĐO KIỂM">
        </dx:ASPxLabel>
        </strong>
            </td>
        </tr>
        <tr>
            <td class="style54" style="text-align: center">
        <strong>
        <dx:ASPxLabel ID="lblnotification" runat="server" Font-Italic="True" 
            Font-Overline="False" Font-Underline="True" ForeColor="Red">
        </dx:ASPxLabel>
        </strong>
            </td>
        </tr>
    </table>
        <strong>
        <dx:ASPxPanel ID="paComment" runat="server" Height="264px" Width="788px" 
        Visible="False">
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="style142">
        <tr>
            <td class="style147">
                <strong>
                <dx:ASPxLabel ID="lbReceiveStaffComDate" runat="server" Font-Bold="True" 
                    style="color: #003399; font-style: italic" Font-Size="Medium">
                </dx:ASPxLabel>
                </strong>
            </td>
            <td class="style147">
                <strong>
                <dx:ASPxLabel ID="lbTestStaffComDate" runat="server" Font-Bold="True" 
                    style="color: #003399; font-style: italic" Font-Size="Medium">
                </dx:ASPxLabel>
                </strong>
            </td>
            <td class="style147">
                <strong>
                <dx:ASPxLabel ID="lbApprStaffComDate" runat="server" Font-Bold="True" 
                    style="color: #003399; font-style: italic" Font-Size="Medium">
                </dx:ASPxLabel>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="style143" bgcolor="#FFFF99">
                <strong>Ý kiến của chuyên viên nhận mẫu</strong></td>
            <td class="style143">
                <strong>Ý kiến của chuyên viên đo kiểm</strong></td>
            <td class="style143">
                <strong>Ý kiến của người phê duyệt</strong></td>
        </tr>
        <tr bgcolor="#669999">
            <td align="center">
                <dx:ASPxMemo ID="mmReceiveStaff" runat="server" Height="150px" Width="250px" 
                    BackColor="#FFFFCC">
                </dx:ASPxMemo>
            </td>
            <td align="center">
                <dx:ASPxMemo ID="mmTestingStaff" runat="server" 
                    Height="150px" Width="250px" ReadOnly="True">
                </dx:ASPxMemo>
            </td>
            <td align="center">
                <dx:ASPxMemo ID="mmApproveStaff" runat="server" Height="150px" Width="250px" 
                    ReadOnly="True">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr bgcolor="#669999">
            <td align="center" bgcolor="White" class="style146" colspan="3">
                <strong>
                <dx:ASPxButton ID="btFinishReCheck" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    OnClick="btFinishReCheck_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                    Text="Hoàn tất xử lý lại" Width="240px">
                </dx:ASPxButton>
                </strong>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
            <Border BorderColor="Black" BorderStyle="Solid" />
    </dx:ASPxPanel>
        </strong>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssClass="style35" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Thông tin Khách Hàng">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong></p>
    <table class="style32">
        <tr>
            <td class="style33">
                Tên công ty (*)</td>
            <td colspan="3">
                <dx:ASPxComboBox ID="cbcompanyname" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCompany" 
                    ValueType="System.Int32" Width="540px" ValueField="CompanyID" 
                    TextField="CompanyID" 
                    onselectedindexchanged="cbcompanyname_SelectedIndexChanged" 
                    IncrementalFilteringMode="Contains" DropDownStyle="DropDown" Height="16px" 
                    TextFormatString="{0}">
                    <Columns>
                    <dx:ListBoxColumn Width="500px" Caption="Tên Công ty" FieldName="CompanyName" />
                    <dx:ListBoxColumn width="300px" caption="Địa Chỉ" FieldName="Address"/>
                    <dx:ListBoxColumn width="100px" caption="Tỉnh/TP" FieldName="Province"/>
                    </Columns>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Địa Chỉ</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="540px" Height="16px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">
                Số Điện thoại</td>
            <td class="style24">
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
            <td class="style24">
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
                Người liên hệ (*)</td>
            <td class="style24">
                <dx:ASPxComboBox ID="cbperson" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True" 
                    DataSourceID="SqlDataSourceContact" ValueType="System.Int32" width="251px" 
                    ValueField="ContactID" TextFormatString="{0} {1}" Height="20px" TextField="ContactID" 
                    onselectedindexchanged="cbperson_SelectedIndexChanged" >
                    <columns>
                    <dx:ListBoxColumn Caption="Họ" FieldName="LastName" />
                    <dx:ListBoxColumn caption="Tên" FieldName="FirstName"/>
                    </columns>
                </dx:ASPxComboBox>
            </td>
            <td class="style23">
                Điện Thoại</td>
            <td>
                <dx:ASPxTextBox ID="txtperphone" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style58">
                Hợp đồng đo</td>
            <td class="style24">
                <dx:ASPxComboBox ID="cbcontract" runat="server" SelectedIndex="0" 
                    AutoPostBack="True" EnableIncrementalFiltering="True"
                    ValueType="System.Int32" 
                    onselectedindexchanged="cbcontract_SelectedIndexChanged">
                    <Items>
                        <dx:ListEditItem Text="KHÔNG" Value="0" />
                        <dx:ListEditItem Text="CÓ" Value="1" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td class="style59">
                Số hợp đồng</td>
            <td>
                <dx:ASPxTextBox ID="txtContractNo" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <strong>Số phiếu yêu cầu đo kiểm<br />
                <dx:ASPxLabel ID="lbexpect" runat="server" Text="(dự kiến)">
                </dx:ASPxLabel>
                </strong></td>
            <td class="style24">
                <dx:ASPxTextBox ID="txtRequestNum" runat="server" BackColor="#FFCCFF" 
                    Width="170px" Font-Bold="True">
                </dx:ASPxTextBox>
            </td>
            <td class="style31">
                <strong>
                <dx:ASPxLabel ID="lbBillNo" runat="server" Text="Số phiếu thu" 
                    style="text-align: left">
                </dx:ASPxLabel>
                </strong></td>
            <td>
                <dx:ASPxTextBox ID="txtBillNum" runat="server" BackColor="#FFCCFF" 
                    Font-Bold="True" Width="170px" style="text-align: left">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <strong>
                <dx:ASPxLabel ID="lbBillNo0" runat="server" Text="Xuất phiếu thu">
                </dx:ASPxLabel>
                </strong></td>
            <td class="style24">
                <dx:ASPxComboBox ID="cbHasBill" runat="server" SelectedIndex="1" 
                    AutoPostBack="True" EnableIncrementalFiltering="True"
                    ValueType="System.Int32" 
                    onselectedindexchanged="cbHasBill_SelectedIndexChanged" 
                    BackColor="#FFCCFF">
                    <Items>
                        <dx:ListEditItem Text="KHÔNG" Value="0" />
                        <dx:ListEditItem Text="CÓ" Value="1" Selected="True" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td class="style31">
                &nbsp;</td>
            <td>
                    <dx:ASPxButton ID="btNewBill" runat="server"
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Tạo phiếu thu mới" 
                        Height="25px" Width="169px" onclick="btNewBill_Click"> 
                   
                    </dx:ASPxButton>
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
                Tên mẫu đo kiểm (*)</td>
            <td colspan="3">
                <dx:ASPxComboBox ID="cbtestname" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSourceEquipment" TextField="EquTypeID" 
                    ValueField="EquTypeID" TextFormatString="{1}"
                    ValueType="System.String" Width="540px" 
                    onselectedindexchanged="cbtestname_SelectedIndexChanged" 
                    DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    <columns>
                        <dx:ListBoxColumn Caption="Mã sản phẩm" FieldName="EquTypeID" />
                    <dx:ListBoxColumn Caption="Loại thiết bị" FieldName="EquTypeName" Width="500px"/>
                    <dx:ListBoxColumn caption="Tiêu Chuẩn" FieldName="Standards" Width="300px"/>
                    </columns>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Tên hiển thị</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtDisplayTestName" runat="server" Height="20px" Width="540px" 
                    Font-Italic="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Tên bổ sung</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtEquName" runat="server" Height="20px" Width="540px" 
                    Font-Italic="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Ký hiệu (*)</td>
            <td class="style47">
                <dx:ASPxTextBox ID="txtModel" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td class="style29">
                Serial Number&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                <dx:ASPxTextBox ID="txtSN" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Hãng sản xuất (*)</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtcompmaking" runat="server" Width="540px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Nơi sản xuất (*)</td>
            <td class="style44" colspan="3">
                <dx:ASPxComboBox ID="cbCountry" runat="server" 
                    DataSourceID="SqlDataSourceCountry" ValueType="System.String" 
                    ValueField="CountryID" TextField="CountryName" DropDownStyle="DropDown" 
                    IncrementalFilteringMode="Contains" Width="540px">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Phương pháp thử</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txttestmethod" runat="server" Height="19px" Width="540px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Tiêu chuẩn đánh giá</td>
            <td class="style30" colspan="3">
                <dx:ASPxTextBox ID="txtstandard" runat="server" Width="540px" Height="21px">
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
                <dx:ASPxTextBox ID="txtpriceintext" runat="server" Height="16px" Width="540px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style46">
                Ngày nhận mẫu (*)</td>
            <td class="style39">
                <dx:ASPxDateEdit ID="dtreceive" runat="server">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
            <td class="style40">
                Ngày trả dự kiến&nbsp;&nbsp;(*)&nbsp;&nbsp;&nbsp; </td>
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
        <table class="style48">
            <tr>
                <td class="style62" align="center">
                    <dx:ASPxButton ID="btsave" runat="server"
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu" 
                        Height="25px" onclick="btsave_Click"> 
                   
                    </dx:ASPxButton>
                </td>
                <td class="style60">
                    <dx:ASPxButton ID="btPrint" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="In Phiếu nhận mẫu" Width="136px" onclick="btPrint_Click">
                        <ClientSideEvents Click="function (s, e) {window.open('ReportForm/RequestPaper.aspx', '_blank')}" />
                    </dx:ASPxButton>
                </td>
                <td class="style61">
                    <dx:ASPxButton ID="btPrintBill" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="In Phiếu thu" Width="136px" onclick="btPrintBill_Click">
                        <ClientSideEvents Click="function (s, e) {window.open('ReportForm/BillPaper.aspx', '_blank')}" />
                    </dx:ASPxButton>
                </td>
                <td class="style63">
                    <dx:ASPxButton ID="btNext" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Nhận tiếp" 
                        Width="125px" onclick="btNext_Click">
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton ID="btnewrequest" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Nhận mẫu mới" 
                        Width="125px" onclick="btnewrequest_Click">
                    </dx:ASPxButton>
                </td>
            </tr>
    </table>
    <p>
        <strong>
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các yêu cầu đo kiểm được chuyên viên đo yêu cầu xử lý lại">
        </dx:ASPxLabel>
        </strong>
    </p>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSource_RequestRequiredEdit" 
        KeyFieldName="RequestID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView1_CustomCallback" 
                onrowupdating="ASPxGridView1_RowUpdating" 
                onstartrowediting="ASPxGridView1_StartRowEditing">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True" >
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text="Tạo mới">
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
                <dx:GridViewDataTextColumn FieldName="RequestNo" Caption="Số phiếu" 
                    VisibleIndex="1" Width="40px" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True"/>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CompanyID" Caption="Tên công ty"
                    VisibleIndex="4" Width="150px"> 
                     <PropertiesComboBox DataSourceID="SqlDataSourceCompany" 
                        TextField="CompanyName" ValueField="CompanyID" ValueType=System.Int32 
                         DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                     </PropertiesComboBox>
                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ContactID" Caption="Người liên hệ" Visible=false 
                    VisibleIndex="5">
                    <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceContact_Ori" 
                        TextField= "FullName" ValueField="ContactID">
                     </PropertiesComboBox>
                   <EditFormSettings Visible="True"/>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EquTypeID" Caption="Loại thiết bị" VisibleIndex="6" 
                    ShowInCustomizationForm="True" Width="150px">
                    <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceEquipment" 
                        TextField= "EquTypeName" ValueField="EquTypeID" DropDownStyle="DropDown" 
                        IncrementalFilteringMode="Contains">
                     </PropertiesComboBox>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="EquTypeName" VisibleIndex="7" Visible=false Caption="Tên bổ sung" 
                    ShowInCustomizationForm="True">
                   <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" Caption="Ký hiệu"  VisibleIndex="8" 
                    ShowInCustomizationForm="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" Caption="Hãng sản xuất" VisibleIndex="9" 
                    ShowInCustomizationForm="True" Width="150px">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="MadeInID" Caption="Nơi sản xuất" Visible=false
                    VisibleIndex="11">
                    <PropertiesComboBox ValueType="System.String" DataSourceID="SqlDataSourceCountry" 
                        TextField="CountryName" ValueField="CountryID">
                    </PropertiesComboBox>
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="13" Visible=false Caption="Serial/Imei"
                    ShowInCustomizationForm="True">
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" Caption="Ngày nhận mẫu" VisibleIndex="16" 
                    ShowInCustomizationForm="True">
                    <PropertiesDateEdit>
                      <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                      </CalendarProperties>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" Visible=false 
                    Caption="Ngày trả KQ dự kiến" VisibleIndex="17" 
                    ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True"/>
                    <PropertiesDateEdit>
                      <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                      </CalendarProperties>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn FieldName="Accessories" Caption="Phụ kiện" Visible=false 
                    VisibleIndex="20">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn FieldName="Note" Caption="Ghi chú" VisibleIndex="22" 
                    Visible=false> 
                     <PropertiesMemoEdit Height="100px">
                     </PropertiesMemoEdit>
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ReceiveStaffID" 
                    caption="Nhân viên tiếp nhận" VisibleIndex="18" 
                    ShowInCustomizationForm="True" ReadOnly="True" Width="70px">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu thu" FieldName="BillNo" 
                    VisibleIndex="2" Width="50px" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số hợp đồng" FieldName="ContractNo"
                    VisibleIndex="3">
                    <EditFormSettings Visible="True"/>
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
            <asp:SqlDataSource ID="SqlDataSource_RequestRequiredEdit" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                
                SelectCommand="SELECT RequestID, RequestNo, ContractNo, BillNo, BillDate, CompanyID, ContactID, EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei, Standards, TestMethod, Accessories, ReceiveDate, ReceiveStaffID, AppointmentDate, ReturnStaffID, ReturnDate, StatusID, Note, HoldEquip, ConfirmDate, RecheckStatusID FROM Request WHERE (RecheckStatusID = 2) ORDER BY ReceiveDate DESC, RequestNo DESC" 
                DeleteCommand="SELECT RequestID, RequestNo, ContractNo, BillNo, BillDate, CompanyID, ContactID, EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei, Standards, TestMethod, Accessories, ReceiveDate, ReceiveStaffID, AppointmentDate, ReturnStaffID, ReturnDate, StatusID, Note, HoldEquip, ConfirmDate FROM Request" 
                
        UpdateCommand="SELECT RequestID, RequestNo, ContractNo, BillNo, BillDate, CompanyID, ContactID, EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei, Standards, TestMethod, Accessories, ReceiveDate, ReceiveStaffID, AppointmentDate, ReturnStaffID, ReturnDate, StatusID, Note, HoldEquip, ConfirmDate FROM Request"></asp:SqlDataSource>
    
            <p>
                <strong>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19" 
            Font-Bold="True" Font-Italic="False" Font-Size="Medium" 
            Text="Danh sách các yêu cầu đo kiểm">
        </dx:ASPxLabel>
        <dx:ASPxComboBox ID="cbcompanyname2" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                    DataSourceID="SqlDataSourceCompany" 
                    ValueType="System.Int32" Width="400px" ValueField="CompanyID"
                    TextFormatString="{0}" 
                    TextField="CompanyID" 
                    IncrementalFilteringMode="StartsWith" Visible="False">
                    <Columns>
                    <dx:ListBoxColumn Width="300px" Caption="Tên Công ty" FieldName="CompanyName" />
                    <dx:ListBoxColumn width="300px" caption="Địa Chỉ" FieldName="Address"/>
                    <dx:ListBoxColumn width="100px" caption="Tỉnh/TP" FieldName="Province"/>
                    </Columns>
        </dx:ASPxComboBox>
        </strong>
    </p>
    <p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="SqlDataSource_Request" KeyFieldName="RequestID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView2_CustomCallback" 
                onrowdeleting="ASPxGridView2_RowDeleting" 
                onrowupdating="ASPxGridView2_RowUpdating" 
                onstartrowediting="ASPxGridView2_StartRowEditing">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" >
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text="Tạo mới">
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
                <dx:GridViewDataTextColumn FieldName="RequestNo" Caption="Số phiếu" 
                    VisibleIndex="1" Width="40pt" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True"/>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CompanyID" Caption="Tên công ty"
                    VisibleIndex="4" Width="150px"> 
                     <PropertiesComboBox DataSourceID="SqlDataSourceCompany" 
                        TextField="CompanyName" ValueField="CompanyID" ValueType=System.Int32 
                         DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                     </PropertiesComboBox>
                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ContactID" Caption="Người liên hệ" Visible=false 
                    VisibleIndex="5">
                    <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceContact_Ori" 
                        TextField= "FullName" ValueField="ContactID">
                     </PropertiesComboBox>
                   <EditFormSettings Visible="True"/>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EquTypeID" Caption="Loại thiết bị" VisibleIndex="6" 
                    ShowInCustomizationForm="True" Width="150px">
                    <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceEquipment" 
                        TextField= "EquTypeName" ValueField="EquTypeID" DropDownStyle="DropDown" 
                        IncrementalFilteringMode="Contains">
                     </PropertiesComboBox>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="EquTypeName" VisibleIndex="7" Visible=false Caption="Tên bổ sung" 
                    ShowInCustomizationForm="True">
                   <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Model" Caption="Ký hiệu"  VisibleIndex="8" 
                    ShowInCustomizationForm="True">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" Caption="Hãng sản xuất" VisibleIndex="9" 
                    ShowInCustomizationForm="True" Width="150px">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="MadeInID" Caption="Nơi sản xuất" Visible=false
                    VisibleIndex="11">
                    <PropertiesComboBox ValueType="System.String" DataSourceID="SqlDataSourceCountry" 
                        TextField="CountryName" ValueField="CountryID">
                    </PropertiesComboBox>
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="13" Visible=false Caption="Serial/Imei"
                    ShowInCustomizationForm="True">
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" Caption="Ngày nhận mẫu" VisibleIndex="16" 
                    ShowInCustomizationForm="True">
                    <PropertiesDateEdit>
                      <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                      </CalendarProperties>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" Visible=false 
                    Caption="Ngày trả KQ dự kiến" VisibleIndex="17" 
                    ShowInCustomizationForm="True">
                    <EditFormSettings Visible="True"/>
                    <PropertiesDateEdit>
                      <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
                      </CalendarProperties>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn FieldName="Accessories" Caption="Phụ kiện" Visible=false 
                    VisibleIndex="20">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True"/>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn FieldName="Note" Caption="Ghi chú" VisibleIndex="22" 
                    Visible=false> 
                     <PropertiesMemoEdit Height="100px">
                     </PropertiesMemoEdit>
                     <EditFormSettings Visible="True"/>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ReceiveStaffID" 
                    caption="Nhân viên tiếp nhận" VisibleIndex="18" 
                    ShowInCustomizationForm="True" ReadOnly="True" Width="70px">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu thu" FieldName="BillNo" 
                    VisibleIndex="2" Width="50px" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số hợp đồng" FieldName="ContractNo"
                    VisibleIndex="3">
                    <EditFormSettings Visible="True"/>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
            <asp:SqlDataSource ID="SqlDataSource_Request" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                
                SelectCommand="SELECT RequestID, RequestNo, ContractNo, BillNo, BillDate, CompanyID, ContactID, EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei, Standards, TestMethod, Accessories, ReceiveDate, ReceiveStaffID, AppointmentDate, ReturnStaffID, ReturnDate, StatusID, Note, HoldEquip, ConfirmDate FROM Request WHERE (StatusID = 1) ORDER BY ReceiveDate DESC, RequestID DESC" 
                DeleteCommand="SELECT RequestID, RequestNo, ContractNo, BillNo, BillDate, CompanyID, ContactID, EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei, Standards, TestMethod, Accessories, ReceiveDate, ReceiveStaffID, AppointmentDate, ReturnStaffID, ReturnDate, StatusID, Note, HoldEquip, ConfirmDate FROM Request" 
                
                UpdateCommand="SELECT RequestID, RequestNo, ContractNo, BillNo, BillDate, CompanyID, ContactID, EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei, Standards, TestMethod, Accessories, ReceiveDate, ReceiveStaffID, AppointmentDate, ReturnStaffID, ReturnDate, StatusID, Note, HoldEquip, ConfirmDate FROM Request"></asp:SqlDataSource>
    
    </p>
<p>
  
        <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            
            SelectCommand="SELECT * FROM [Company],[Province] where [Company].[ProvinceID]=[Province].[ProvinceID] and  [Company].[Invalid]!=1 Order by convert(nvarchar(500),[FastCompanyName])">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceContact" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            SelectCommand="SELECT * FROM [Contact] where CompanyID=@CompanyID  ORDER BY convert(nvarchar(500),[FirstName])">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbcompanyname" Name="CompanyID" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceEquipment" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [EquipmentType] WHERE ([Invalid] = @Invalid)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="Invalid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            SelectCommand="SELECT * FROM [Country] ORDER BY Convert(nvarchar(500),[CountryName])">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceContact_Ori" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [Contact] WHERE ([CompanyID] = @CompanyID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbcompanyname2" Name="CompanyID" 
                    PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT Staff.* FROM Staff ORDER BY convert(nvarchar(500),[StaffFistName])">
        </asp:SqlDataSource>
</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
