<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-QuanLyMoiTruong.aspx.cs" Inherits="LabManagement.QuanLyMoiTruong" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style23
        {
            height: 53px;
        }
        .style25
        {
            width: 100px;
            text-align: left;
            color: #003366;
            font-weight: bold;
            height: 2px;
        }
        .style27
        {
            width: 173px;
            color: #003366;
            height: 46px;
        }
        .style28
        {
            width: 179px;
            font-weight: bold;
            color: #003366;
            height: 2px;
        }
        .style34
        {
            height: 46px;
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
        }
        .style40
        {
            width: 75px;
            text-align: center;
            height: 2px;
        }
        .style41
        {
            width: 85px;
            height: 2px;
        }
        .style42
        {
            color: #003366;
            font-weight: bold;
            height: 2px;
            width: 111px;
        }
        .style44
        {
            width: 75px;
            text-align: center;
            height: 8px;
        }
        .style45
        {
            width: 100px;
            text-align: left;
            color: #003366;
            font-weight: bold;
            height: 8px;
        }
        .style46
        {
            width: 179px;
            font-weight: bold;
            color: #003366;
            height: 8px;
        }
        .style47
        {
            width: 85px;
            height: 8px;
        }
        .style48
        {
            color: #003366;
            font-weight: bold;
            height: 8px;
            width: 111px;
        }
        .style49
        {
            width: 173px;
            color: #003366;
            height: 2px;
        }
        .style50
        {
            width: 173px;
            color: #003366;
            height: 8px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style19" style="height: 54px; width: 66%">
        <tr>
            <td style="text-align: center" valign="top" class="style23">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="X-Large" 
                    ForeColor="#CC3300" style="font-weight: 700" Text="QUẢN LÝ MÔI TRƯỜNG PHÒNG ĐO">
                </dx:ASPxLabel>
            </td>
        </tr>
        </table>
    <table class="style19" style="height: 56px; width: 70%">
        <tr>
            <td class="style27">
                <strong>Ngày theo dõi</strong></td>
            <td class="style34" colspan="5">
                <dx:ASPxDateEdit ID="dtdate" runat="server" BackColor="#FFCCCC" Height="24px" AutoPostBack=true 
                    Font-Size="Medium" ondatechanged="dtdate_DateChanged">
                    <CalendarProperties TodayButtonText="Hôm Nay" ClearButtonText="Xóa">
                    </CalendarProperties>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style50" bgcolor="#FFFF99">
                <strong>Nhiệt độ buổi sáng</strong></td>
            <td class="style44" bgcolor="#FFFF99">
                <dx:ASPxTextBox ID="txttMor" runat="server" Width="50px">
                </dx:ASPxTextBox>
            </td>
            <td class="style45" bgcolor="#FFFF99">
                độ C</td>
            <td class="style46" bgcolor="#99CCFF">
                <strong>Nhiệt độ buổi chiều</strong></td>
            <td bgcolor="#99CCFF" class="style47">
                <dx:ASPxTextBox ID="txttAf" runat="server" Width="50px">
                </dx:ASPxTextBox>
            </td>
            <td bgcolor="#99CCFF" class="style48">
                độ C</td>
        </tr>
        <tr>
            <td class="style49" bgcolor="#FFFF99">
                <strong>Độ ẩm buổi sáng</strong></td>
            <td class="style40" bgcolor="#FFFF99">
                <dx:ASPxTextBox ID="txthMor" runat="server" Width="50px">
                </dx:ASPxTextBox>
            </td>
            <td class="style25" bgcolor="#FFFF99">
                %</td>
            <td class="style28" bgcolor="#99CCFF">
                Độ ẩm buổi chiều</td>
            <td bgcolor="#99CCFF" class="style41">
                <dx:ASPxTextBox ID="txthAf" runat="server" Width="50px">
                </dx:ASPxTextBox>
            </td>
            <td bgcolor="#99CCFF" class="style42">
                %</td>
        </tr>
        <tr>
            <td class="style39" align="center" bgcolor="#FFFF99" colspan="3">
                <dx:ASPxButton ID="btUpdateMor" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    Height="16px" onclick="btUpdateMor_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật" 
                    Width="160px">
                </dx:ASPxButton>
            </td>
            <td class="style38" align="center" bgcolor="#99CCFF" colspan="3">
                <dx:ASPxButton ID="btUpdateAft" runat="server" 
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                    Height="16px" onclick="btUpdateAft_Click" 
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật" 
                    Width="160px">
                </dx:ASPxButton>
            </td>
        </tr>
        </table>
    <p style="text-align: left">
        <dx:ASPxLabel ID="lbNotifi" runat="server" 
            style="font-style: italic; color: #FF0000; font-weight: 700">
        </dx:ASPxLabel>
    </p>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="LinqDataSourceEnvironment" 
        KeyFieldName="ID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView1_CustomCallback">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
                <Columns>
                    <dx:GridViewDataDateColumn Caption="Ngày" FieldName="date" 
                        ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                            <CalendarProperties TodayButtonText="Hôm nay" ClearButtonText="Xóa">
                            </CalendarProperties>
                        </PropertiesDateEdit>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Nhiệt độ buổi sáng" FieldName="tMor" 
                        ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Độ ẩm buổi sáng" FieldName="hMor" 
                        ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Nhiệt độ buối chiều" FieldName="tAft" 
                        ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Độ ẩm buổi chiều" FieldName="hAft" 
                        ShowInCustomizationForm="True" VisibleIndex="7" Width="80px">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Nhân viên theo dõi buổi sáng" 
                        FieldName="StaffMor" ShowInCustomizationForm="True" VisibleIndex="2" 
                        Width="100px">
                        <PropertiesComboBox DataSourceID="SqlDataSourceStaff" DropDownStyle="DropDown" 
                            IncrementalFilteringMode="Contains" TextField="StaffFistName" 
                            ValueField="StaffID" ValueType="System.String">
                        </PropertiesComboBox>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Nhân viên theo dõi buổi chiều" 
                        FieldName="StaffAft" ShowInCustomizationForm="True" VisibleIndex="5" 
                        Width="100px">
                        <PropertiesComboBox DataSourceID="SqlDataSourceStaff" DropDownStyle="DropDown" 
                            IncrementalFilteringMode="Contains" TextField="StaffFistName" 
                            ValueField="StaffID" ValueType="System.String">
                        </PropertiesComboBox>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    </dx:GridViewDataComboBoxColumn>
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
            <asp:LinqDataSource ID="LinqDataSourceEnvironment" runat="server" 
        ContextTypeName="LabManagement.LINQ.LabdataDataContext" EntityTypeName="" 
        TableName="Environments" EnableUpdate="True" OrderBy="date desc">
    </asp:LinqDataSource>
         <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            
        SelectCommand="SELECT StaffID, StaffFistName, StaffLastName, StaffFullName, PhoneNo, HomeAddress, HomePhone, Email, BeginDate, EndDate, Department, WorkHistory, TrainHistory, Username, Password, StaffImg FROM Staff ORDER BY CONVERT (nvarchar(500), StaffFistName)">
        </asp:SqlDataSource>
             
    </asp:Content>
