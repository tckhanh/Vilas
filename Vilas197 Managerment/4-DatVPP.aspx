<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="4-DatVPP.aspx.cs" Inherits="LabManagement.DatVPP" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style26
        {
            height: 13px;
        }
        .style47
        {
            height: 47px;
        }
    .style48
    {
        width: 563px;
    }
    .style50
    {
        width: 340px;
    }
    .style51
    {
        width: 293px;
    }
    .style52
    {
        width: 238px;
    }
    .style55
    {
        color: #CC3300;
    }
    .style56
    {
        width: 243px;
    }
    .style57
    {
        width: 429px;
    }
    .style58
    {
        width: 83px;
    }
    .style59
    {
        width: 70px;
    }
    .style60
    {
        width: 151px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style19" style="height: 57px; width: 76%">
        <tr>
            <td style="text-align: center" class="style47">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                    Font-Size="X-Large" style="color: #CC3300" Text="ĐẶT VĂN PHÒNG PHẨM">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxLabel ID="lbNotification" runat="server" 
                    style="font-style: italic; color: #CC0000">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
    <table style="width: 87%; height: 306px;">
        <tr>
            <td class="style56" valign="top" align="left">
                <div style="width: 264px">
                    <strong><span class="style55">Danh mục các văn phòng phẩm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;
                    </strong>
                </div>
                <dx:ASPxListBox ID="listStationery" runat="server" 
                    DataSourceID="SqlDataSource_Stationery" Height="259px" TextField="StName" 
                    ValueField="StID" ValueType="System.Int32" Width="353px" 
                    AutoPostBack="True" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" 
                    onselectedindexchanged="listStationery_SelectedIndexChanged" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <Columns>
                        <dx:ListBoxColumn Caption="Tên văn phòng phẩm" FieldName="StName" />
                        <dx:ListBoxColumn Caption="Đơn vị" FieldName="Unit" Width="30px" />
                    </Columns>
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxListBox>
                &nbsp;</td>
            <td valign="top" width="400">
                <table style="height: 55px; width: 553px;">
                    <tr>
                        <td class="style48">
                            <strong>Tháng đặt VPP</strong></td>
                        <td>
                            <dx:ASPxTextBox ID="txtMonth" runat="server" Height="16px" Width="80px" 
                                BackColor="#FFFF99" ReadOnly="True">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style48">
                            Tên văn phòng phẩm (*)</td>
                        <td>
                            <dx:ASPxComboBox ID="cbStationery" runat="server" 
                                DataSourceID="SqlDataSource_Stationery" Height="16px" TextField="StName" 
                                ValueField="StID" ValueType="System.Int32" Width="375px" 
                                AutoPostBack="True" DropDownStyle="DropDown" 
                                IncrementalFilteringMode="Contains" 
                                onselectedindexchanged="cbStationery_SelectedIndexChanged">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style48">
                            Số lượng (*)</td>
                        <td>
                            <dx:ASPxTextBox ID="txtQuantity" runat="server" Height="16px" Width="375px">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style48">
                            Ghi chú</td>
                        <td>
                            <dx:ASPxMemo ID="mmNote" runat="server" Height="114px" Width="374px">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td class="style48">
                            Tình trạng</td>
                        <td class="style26">
                            <dx:ASPxComboBox ID="cbOrderStatus" runat="server" Height="16px" TextField="OrderStName" 
                                ValueField="OrderStID" ValueType="System.Int32" Width="375px" 
                                BackColor="#FFFF99" SelectedIndex="0" 
                                DataSourceID="SqlDataSource_OrderStatus">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="Đã yêu cầu chờ xác nhận" Value="1" />
                                    <dx:ListEditItem Text="Đã nhận" Value="3" />
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                </table>
                <table style="height: 48px; width: 552px">
                    <tr>
                        <td align="center" class="style51" valign="middle">
                            <dx:ASPxButton ID="btRegister" runat="server" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Đăng ký" 
                                onclick="btRegister_Click">
                            </dx:ASPxButton>
                        </td>
                        <td align="center" class="style52">
                            <dx:ASPxButton ID="btUpdate" runat="server" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật" 
                                onclick="btUpdate_Click" Width="100px">
                            </dx:ASPxButton>
                        </td>
                        <td align="center" class="style50">
                            <dx:ASPxButton ID="btDelete" runat="server" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xóa" 
                                onclick="btDelete_Click">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
        </table>
        <table style="width: 81%" width="700">
            <tr>
                <td class="style57">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="True" 
                    Font-Size="Medium" style="color: #CC3300" 
                        Text="Danh sách văn phòng phẩm được đặt trong tháng">
                </dx:ASPxLabel>
                </td>
                <td class="style58">
                            <dx:ASPxComboBox ID="cbMonth" runat="server" AutoPostBack="True" 
                                ValueType="System.Int32" Width="70px">
                                <Items>
                                    <dx:ListEditItem Text="1" Value="1" />
                                    <dx:ListEditItem Text="2" Value="2" />
                                    <dx:ListEditItem Text="3" Value="3" />
                                    <dx:ListEditItem Text="4" Value="4" />
                                    <dx:ListEditItem Text="5" Value="5" />
                                    <dx:ListEditItem Text="6" Value="6" />
                                    <dx:ListEditItem Text="7" Value="7" />
                                    <dx:ListEditItem Text="8" Value="8" />
                                    <dx:ListEditItem Text="9" Value="9" />
                                    <dx:ListEditItem Text="10" Value="10" />
                                    <dx:ListEditItem Text="11" Value="11" />
                                    <dx:ListEditItem Text="12" Value="12" />
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Bold="True" 
                    Font-Size="Medium" style="color: #CC3300" Text="năm">
                </dx:ASPxLabel>
                </td>
                <td class="style59">
                            <dx:ASPxTextBox ID="txtYear" runat="server" Height="16px" Width="60px" 
                                BackColor="#FFFFCC">
                            </dx:ASPxTextBox>
                        </td>
                <td align="center" class="style60" style="text-align: left">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Bold="True" 
                    Font-Size="Medium" style="color: #CC3300" Text="của">
                </dx:ASPxLabel>
            &nbsp;<dx:ASPxLabel ID="lbUsername" runat="server" Font-Bold="True" 
                    Font-Size="Medium" style="color: #000099">
                </dx:ASPxLabel>
                </td>
                <td align="center" style="text-align: center">
                            <dx:ASPxButton ID="btView" runat="server" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xem" onclick="btView_Click">
                            </dx:ASPxButton>
                        </td>
            </tr>
            <tr>
                <td align="center" colspan="6">
                            <dx:ASPxButton ID="btConfirm" runat="server" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xác nhận đã nhận VPP" Width="190px" onclick="btConfirm_Click">
                            </dx:ASPxButton>
                </td>
            </tr>
    </table>
    <p>
<dx:ASPxGridView ID="ASPxGridView" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="SqlDataSource_OrderStationery" KeyFieldName="OrderID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView_CustomCallback" 
            style="margin-right: 0px" 
            oncustomcolumndisplaytext="ASPxGridView_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>

                <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="OrderStID" 
                    ShowInCustomizationForm="True" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="SqlDataSource_OrderStatus" 
                        TextField="OrderStName" ValueField="OrderStID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên văn phòng phẩm" FieldName="StID" 
                    ShowInCustomizationForm="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="SqlDataSource_Stationery" TextField="StName" 
                        ValueField="StID" ValueType="System.Int32">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Quantity"
                    VisibleIndex="3" Caption="Số lượng">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Note" VisibleIndex="4" Caption="Ghi chú">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="OrderID" ShowInCustomizationForm="True" 
                    Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ngày đặt" FieldName="OrderDate" 
                    ShowInCustomizationForm="True" VisibleIndex="2">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="STT" VisibleIndex="0" ReadOnly="True" UnboundType="String" FieldName="STT">
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="Month" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Year" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>

            </Columns>
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
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
        <asp:SqlDataSource ID="SqlDataSource_OrderStationery" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            
            SelectCommand="SELECT * FROM [OrderSt] WHERE (([Month] = @Month) AND ([Year] = @Year)) AND (StaffID=@StaffID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbMonth" DefaultValue="0" Name="Month" 
                    PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="txtYear" DefaultValue="0" Name="Year" 
                    PropertyName="Text" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="StaffID" SessionField="StaffID" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_Stationery" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                    
                    SelectCommand="SELECT * FROM [Stationery] ORDER BY cast([StName] as nvarchar)"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_OrderStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                    
                    SelectCommand="SELECT * FROM [OrderStatus]"></asp:SqlDataSource>
    </p>
    <p>&nbsp;</p>
</asp:Content>
