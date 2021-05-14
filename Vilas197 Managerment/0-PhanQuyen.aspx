<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CauHinhHT.Master" AutoEventWireup="true" CodeBehind="0-PhanQuyen.aspx.cs" Inherits="LabManagement._0_PhanQuyen" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style25
        {
            width: 357px;
        }
        .style27
        {
            width: 321px;
        }
    .dxgvControl_PlasticBlue,
.dxgvDisabled_PlasticBlue
{
	border: Solid 1px #CCCCCC;
	border-top-style: none;
	font: 9pt Tahoma;
	background-color: #F0F0F0;
	color: #000000;
	cursor: default;
}
.dxgvControl_PlasticBlue
{
	border: Solid 1px #CCCCCC;
	border-top-style: none;
	font: 9pt Tahoma;
	background-color: #F0F0F0;
	color: #000000;
	cursor: default;
}

.dxgvTable_PlasticBlue
{
    background-color: #F0F0F0;
	border:0;
	border-collapse: separate !important;
	overflow:hidden;
	font: 9pt Tahoma;
	color: #000000;
}

.dxgvTable_PlasticBlue
{
    background-color: #F0F0F0;
	border:0;
	border-collapse: separate !important;
	overflow:hidden;
	font: 9pt Tahoma;
	color: #000000;
}
.dxgvHeader_PlasticBlue {
	cursor:pointer;
	white-space:nowrap;
	padding: 7px 6px 7px 6px;
	border: solid 1px #2c4182;
	border-top-style: none;
	background-position:top;
	background-repeat:repeat-x;
	background-color:#415698;
	overflow:hidden;
    font-weight: normal;
    text-align: left;
}

.dxgvHeader_PlasticBlue {
	cursor:pointer;
	white-space:nowrap;
	padding: 7px 6px 7px 6px;
	border: solid 1px #2c4182;
	border-top-style: none;
	background-position:top;
	background-repeat:repeat-x;
	background-color:#415698;
	overflow:hidden;
    font-weight: normal;
    text-align: left;
}

.dxgvDataRow_PlasticBlue
{
	background-color: #FFFFFF;
	color: #000000;
}
.dxgvDataRow_PlasticBlue
{
	background-color: #FFFFFF;
	color: #000000;
}

.dxgvCommandColumn_PlasticBlue
{
	padding: 0px 2px 0px 2px;
}
.dxgvCommandColumn_PlasticBlue
{
	padding: 0px 2px 0px 2px;
}

.dxgvPagerTopPanel_PlasticBlue,
.dxgvPagerBottomPanel_PlasticBlue
{
	padding: 6px 0;
}

.dxgvPagerBottomPanel_PlasticBlue
{
	padding: 6px 0;
}

        .style28
        {
        }
        .style29
        {
            width: 351px;
        }
        .style30
        {
            width: 321px;
            text-align: center;
            height: 35px;
            background-color: #FFFF99;
        }
        .style32
        {
            width: 357px;
            text-align: center;
            height: 35px;
            background-color: #FFFF99;
        }
        .style33
        {
            width: 351px;
            text-align: center;
            height: 35px;
            background-color: #FFFF99;
        }
        .style34
        {
            width: 345px;
            text-align: center;
            height: 35px;
            background-color: #FFFF99;
        }
        .style35
        {
            width: 345px;
        }
        .style36
        {
            width: 345px;
            height: 33px;
        }
        .style37
        {
            width: 351px;
            height: 33px;
        }
        .style38
        {
            width: 357px;
            text-align: center;
            height: 33px;
            background-color: #FFFF99;
        }
        .style39
        {
            width: 321px;
            height: 33px;
        }
        .style40
        {
            width: 345px;
            height: 34px;
        }
        .style41
        {
            width: 351px;
            height: 34px;
        }
        .style42
        {
            width: 357px;
            text-align: center;
            height: 34px;
            background-color: #FFFF99;
        }
        .style43
        {
            width: 321px;
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style19" style="width: 81%">
        <tr>
            <td style="text-align: center">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                    Font-Size="X-Large" ForeColor="#CC3300" 
                    Text="PHÂN QUYỀN TRUY CẬP">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxLabel ID="lbNotification" runat="server" 
                    style="font-style: italic; font-size: 10pt; color: #CC3300">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
    <p style="text-align: left">
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" 
            style="color: #CC3300; font-size: medium; font-weight: 700" 
            Text="Danh sách nhân sự phòng thử nghiệm Vilas197">
        </dx:ASPxLabel>
    </p>
            <dx1:ASPxGridView ID="ASPxGridView2" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid2"
            DataSourceID="SqlDataSource_Staff" KeyFieldName="StaffID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView2_CustomCallback" 
        oncustomcolumndisplaytext="ASPxGridView2_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid2.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>        
       <Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
                <Columns>
                    <dx1:gridviewdatatextcolumn FieldName="StaffID" 
                        VisibleIndex="0" ReadOnly="True" Visible="False">
                    </dx1:gridviewdatatextcolumn>
                    <dx1:gridviewdatatextcolumn FieldName="STT" 
                        VisibleIndex="2" Caption="STT" ShowInCustomizationForm="True" 
                        UnboundType="Integer" Width="30px">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                        </CellStyle>
                    </dx1:gridviewdatatextcolumn>
                    <dx1:GridViewDataTextColumn Caption="Mã nhân viên" FieldName="StaffNo" 
                        ShowInCustomizationForm="True" VisibleIndex="3">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx1:GridViewDataTextColumn>
                    <dx1:GridViewDataComboBoxColumn Caption="Họ và tên" FieldName="StaffID" 
                        ShowInCustomizationForm="True" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="SqlDataSource_Staff" DropDownStyle="DropDown" 
                            IncrementalFilteringMode="Contains" TextField="StaffFullName" 
                            ValueField="StaffID" ValueType="System.String">
                        </PropertiesComboBox>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx1:GridViewDataComboBoxColumn>
                    <dx1:gridviewdatatextcolumn FieldName="Department" VisibleIndex="5" 
                        Caption="Phòng ban">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx1:gridviewdatatextcolumn>
                    <dx1:gridviewdatatextcolumn FieldName="Position" VisibleIndex="10" 
                        Caption="Chức vụ">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx1:gridviewdatatextcolumn>
                    <dx1:gridviewdatatextcolumn FieldName="Username" VisibleIndex="13" 
                        Caption="Tên đăng nhập">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx1:gridviewdatatextcolumn>
                    <dx1:gridviewdatatextcolumn FieldName="Password" 
                        VisibleIndex="17" Caption="Mật khẩu" ShowInCustomizationForm="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx1:gridviewdatatextcolumn>
                    <dx1:GridViewDataComboBoxColumn Caption="Trạng thái tài khoản" 
                        FieldName="Enable" ShowInCustomizationForm="True" VisibleIndex="18">
                        <PropertiesComboBox ValueType="System.Int32">
                            <Items>
                                <dx:ListEditItem Text="Đang kích hoạt" Value="1" />
                                <dx:ListEditItem Text="Ngưng kích hoạt" Value="0" />
                            </Items>
                        </PropertiesComboBox>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx1:GridViewDataComboBoxColumn>
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
            </dx1:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource_Staff" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        SelectCommand="SELECT StaffID, StaffNo, StaffFistName, StaffLastName, StaffFullName, ID, PhoneNo, HomeAddress, HomePhone, Email, BeginDate, EndDate, Department, Position, WorkHistory, TrainHistory, Username, Password, StaffImg, InWorking, Enable FROM Staff ORDER BY CAST(StaffFistName AS Nvarchar)">
    </asp:SqlDataSource>
        <p>
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" 
            style="color: #CC3300; font-size: medium; font-weight: 700" 
            Text="Tình trạng phân quyền truy cập của nhân viên">
        </dx:ASPxLabel>
    &nbsp;<dx:ASPxLabel ID="lbStaffFullName" runat="server" 
            
                style="color: #000099; font-size: medium; font-weight: 700; font-style: italic;">
        </dx:ASPxLabel>
    </p>
    <table class="style19" style="width: 86%; margin-right: 16px;">
        <tr>
            <td class="style34">
                Quản lý đo kiểm</td>
            <td class="style33">
                Quản lý thiết bị</td>
            <td class="style32">
                Quản lý hệ thống chất lượng</td>
            <td class="style30">
                Cấu hình hệ thống</td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA1" runat="server" Text="Nhận mẫu">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                <dx:ASPxCheckBox ID="chB1" runat="server" Text="Quản lý thông tin hệ thống đo">
                </dx:ASPxCheckBox>
            </td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC1" runat="server" Text="Tài liệu HTCL">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                <dx:ASPxCheckBox ID="chO1" runat="server" Text="Cấu hình thông số hệ thống">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA2" runat="server" Text="Phân công đo kiểm">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                <dx:ASPxCheckBox ID="chB2" runat="server" Text="Quản lý thông tin thiết bị đo">
                </dx:ASPxCheckBox>
            </td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC2" runat="server" Text="Công văn đến">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                <dx:ASPxCheckBox ID="chO2" runat="server" Text="Phân quyền truy cập">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA3" runat="server" Text="Xác nhận đo kiểm">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                <dx:ASPxCheckBox ID="chB3" runat="server" Text="Quản lý hiệu chuẩn">
                </dx:ASPxCheckBox>
            </td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC3" runat="server" Text="Công văn đi">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                <dx:ASPxCheckBox ID="chO3" runat="server" Text="Đổi mật khẩu">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA4" runat="server" Text="Ban hành kết quả">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                <dx:ASPxCheckBox ID="chB4" runat="server" Text="Quản lý sự cố">
                </dx:ASPxCheckBox>
            </td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC4" runat="server" Text="Tiêu chuẩn">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style36">
                <dx:ASPxCheckBox ID="chA5" runat="server" Text="Phê duyệt kết quả">
                </dx:ASPxCheckBox>
            </td>
            <td class="style37">
                <dx:ASPxCheckBox ID="chB5" runat="server" Text="Bàn giao thiết bị">
                </dx:ASPxCheckBox>
            </td>
            <td class="style38">
                Quản lý nhân sự</td>
            <td class="style39">
                </td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA6" runat="server" Text="Trả kết quả">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                <dx:ASPxCheckBox ID="chB6" runat="server" Text="Tra cứu thông tin thiết bị">
                </dx:ASPxCheckBox>
            </td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC5" runat="server" Text="Tạo thông tin nhân sự">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA7" runat="server" Text="Xuất hóa đơn tài chính">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                &nbsp;</td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC6" runat="server" Text="Tra cứu thông tin nhân sự" 
                    Height="29px">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style40">
                <dx:ASPxCheckBox ID="chA8" runat="server" Text="Tra cứu thông tin">
                </dx:ASPxCheckBox>
            </td>
            <td class="style41">
                </td>
            <td class="style42">
                Quản lý VPP</td>
            <td class="style43">
                </td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA9" runat="server" Height="29px" 
                    Text="Quản lý thông tin khách hàng">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                &nbsp;</td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC7" runat="server" Text="Đặt văn phòng phẩm">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA10" runat="server" Text="Quản lý môi trường phòng đo">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                &nbsp;</td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC7b" runat="server" Text="Quản lý danh mục VPP">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA11" runat="server" Text="Quản lý loại sản phẩm đo">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                &nbsp;</td>
            <td class="style25">
                <dx:ASPxCheckBox ID="chC8" runat="server" Text="Tổng hợp đặt văn phòng phẩm" 
                    CheckState="Unchecked">
                </dx:ASPxCheckBox>
            </td>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style35">
                <dx:ASPxCheckBox ID="chA12" runat="server" Text="Báo cáo hoạt động đo">
                </dx:ASPxCheckBox>
            </td>
            <td class="style29">
                &nbsp;</td>
            <td class="style25">
                &nbsp;</td>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style28" align="center" colspan="4">
                <dx:ASPxButton ID="btUpdate" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    onclick="btUpdate_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
