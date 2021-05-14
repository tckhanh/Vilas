<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="1-QuanLyTTKH.aspx.cs" Inherits="LabManagement.QuanLyTTKH" %>

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
            width: 111px;
        }

        .style24 {
        }

        .style32 {
            width: 802px;
            font-size: medium;
        }

        .style33 {
            width: 189px;
        }

        .style35 {
            color: #CC3300;
            font-size: x-large;
            width: 100%;
        }

        .style53 {
            width: 71%;
            height: 47px;
        }

        .style54 {
            font-size: x-large;
            color: #CC3300;
        }

        .style58 {
            width: 71%;
            height: 22px;
        }

        .style59 {
            width: 259px;
            height: 53px;
        }

        .style60 {
            height: 53px;
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
                        Text="QUẢN LÝ THÔNG TIN KHÁCH HÀNG">
                    </dx:ASPxLabel>
                </strong>
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
            <td class="style33">Mã KH</td>
            <td colspan="3" id="txtCompanyName">
                <dx:ASPxTextBox ID="txtCompanyID" runat="server" Width="120px"
                    Height="21px" BackColor="#FFCCFF">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Tên công ty (*)</td>
            <td colspan="3" id="txtCompanyName">
                <dx:ASPxTextBox ID="txtCompanyName" runat="server" Width="540px"
                    Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Tên gọi tắt</td>
            <td colspan="3" id="txtCompanyName">
                <dx:ASPxTextBox ID="txtFastCompanyName" runat="server" Width="540px"
                    Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Địa Chỉ</td>
            <td colspan="3">
                <dx:ASPxTextBox ID="txtAddress" runat="server" Width="540px" Height="21px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style33">Tỉnh/Thành phố</td>
            <td class="style24" colspan="3">
                <strong>
                    <dx:ASPxComboBox ID="cbProvince" runat="server" AutoPostBack="True" EnableIncrementalFiltering="True"
                        DataSourceID="SqlDataSourceProvince"
                        ValueType="System.Int32" Width="197px" ValueField="ProvinceID"
                        TextField="Province"
                        OnSelectedIndexChanged="cbcompanyname2_SelectedIndexChanged"
                        IncrementalFilteringMode="Contains" DropDownStyle="DropDown">
                    </dx:ASPxComboBox>
                </strong>
            </td>
        </tr>
        <tr>
            <td class="style33">Số Điện thoại</td>
            <td class="style24">
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
            <td class="style33">Mã số thuế</td>
            <td class="style24">
                <dx:ASPxTextBox ID="txttaxid" runat="server" Width="198px" Height="20px">
                </dx:ASPxTextBox>
            </td>
        </tr>
    </table>
    <table class="style58">
        <tr>
            <td align="center" class="style60">
                <dx:ASPxButton ID="btSave" runat="server"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Lưu"
                    OnClick="btSave_Click">
                </dx:ASPxButton>
            </td>
            <td align="center" class="style59">
                <dx:ASPxButton ID="btDelete" runat="server"
                    CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange"
                    SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa"
                    OnClick="btDelete_Click">
                </dx:ASPxButton>
            </td>
            <td align="center" class="style59">
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
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="style19"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Danh sách người liên hệ">
            </dx:ASPxLabel>
        </strong>
    </p>
    <p>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server"
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="LinqDataSourceContact" KeyFieldName="ContactID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
            OnCustomCallback="ASPxGridView2_CustomCallback">
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
                <dx:GridViewCommandColumn VisibleIndex="0" ShowNewButtonInHeader="True">
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text="Tạo mới">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="DeleteButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Sửa đổi">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="UpdateButton" Text="Cập nhật">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="ClearFilterButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="CancelButton" Text="Thoát">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CompanyID" VisibleIndex="3" Caption="Tên Công ty"
                    Width="300px">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName"
                        ValueField="CompanyID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" Visible="False" Caption="Tên"
                    VisibleIndex="4">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="5" Caption="Họ"
                    Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FullName" VisibleIndex="2" Width="200px" Caption="Họ và tên">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ContactPhone" VisibleIndex="6" Caption="Điện thoại">
                </dx:GridViewDataTextColumn>
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
        <asp:LinqDataSource ID="LinqDataSourceContact" runat="server"
            ContextTypeName="LabManagement.LINQ.LabdataDataContext" EntityTypeName=""
            TableName="Contacts" Where="CompanyID == @CompanyID" EnableInsert="True"
            EnableUpdate="True" EnableDelete="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="txtCompanyID" DefaultValue="0"
                    Name="CompanyID" PropertyName="Text" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </p>
    <p>
        <strong>
            <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="style19"
                Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                Text="Danh sách khách hàng">
            </dx:ASPxLabel>
            &nbsp;</strong>
    </p>
    <p>
        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid2"
            DataSourceID="LinqDataSourceCompany" KeyFieldName="CompanyID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
            OnCustomCallback="ASPxGridView2_CustomCallback">
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
                <dx:GridViewCommandColumn VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True">
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
                <dx:GridViewDataComboBoxColumn Caption="Tên Công ty" FieldName="CompanyID"
                    ReadOnly="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LinqDataSourceCompany"
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains"
                        TextField="CompanyName" ValueField="CompanyID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="CompanyName" Caption="Tên Công ty"
                    VisibleIndex="2" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FastCompanyName" Caption="Tên gọi tắt"
                    VisibleIndex="3" Visible="false">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Address"
                    VisibleIndex="4" Caption="Địa chỉ">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tỉnh/TP" FieldName="ProvinceID"
                    ShowInCustomizationForm="True" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="SqlDataSourceProvince" TextField="Province"
                        ValueField="ProvinceID" ValueType="System.String">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="PhoneNo" VisibleIndex="6"
                    Caption="Điện thoại">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FaxNo" VisibleIndex="7" Caption="Fax">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TaxCode" VisibleIndex="8" Visible="false"
                    Caption="Mã số thuế">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Invalid" VisibleIndex="9" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Contract" VisibleIndex="10" Visible="false">
                </dx:GridViewDataTextColumn>
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
        <asp:LinqDataSource ID="LinqDataSourceCompany" runat="server"
            ContextTypeName="LabManagement.LINQ.LabdataDataContext" EntityTypeName=""
            TableName="Companies" OrderBy="CompanyID desc"
            EnableUpdate="True" Where="Invalid == @Invalid">
            <WhereParameters>
                <asp:Parameter DefaultValue="0" Name="Invalid" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

        <strong>
            <asp:SqlDataSource ID="SqlDataSourceProvince" runat="server"
                ConnectionString="<%$ ConnectionStrings:db_mang %>"
                SelectCommand="SELECT * FROM [Province]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server"
                ConnectionString="<%$ ConnectionStrings:db_mang %>"
                SelectCommand="SELECT * FROM [Company] WHERE ([CompanyID] = @CompanyID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCompanyID" DefaultValue="0"
                        Name="CompanyID" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </strong>

    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
</asp:Content>
