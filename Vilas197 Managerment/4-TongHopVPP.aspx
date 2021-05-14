<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="4-TongHopVPP.aspx.cs" Inherits="LabManagement.TongHopVPP" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style24
        {
            width: 155px;
        }
        .style25
        {
            width: 185px;
            height: 13px;
        }
        .style26
        {
            height: 13px;
        }
        .style29
        {
            width: 177px;
            }
        .style31
        {
            text-align: center;
            color: #FF6600;
            height: 25px;
        }
        .style36
        {
            width: 394px;
            font-size: medium;
        }
        .style37
        {
            width: 64px;
        }
        .style38
        {
            width: 38px;
        }
        .style39
        {
            width: 34px;
        }
        .style40
        {
            width: 154px;
        }
        .style47
        {
            height: 47px;
        }
        .style49
        {
            color: #000099;
        }
        .style51
        {
            width: 185px;
        }
        .style52
        {
            width: 413px;
        }
        .style53
        {
            width: 537px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style19" style="height: 57px; width: 76%">
        <tr>
            <td style="text-align: center" class="style47">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                    Font-Size="X-Large" style="color: #CC3300" 
                    Text="QUẢN LÝ ĐẶT VĂN PHÒNG PHẨM">
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
    <table>
        <tr>
            <td valign="top" class="style52">
                <div class="style31">
                    <strong>Danh mục các văn phòng phẩm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </strong>
                </div>
                <dx:ASPxListBox ID="listStationery" runat="server" 
                    DataSourceID="SqlDataSource_OrderStationery" Height="259px" TextField="StName" 
                    ValueField="OrderID" ValueType="System.Int32" Width="141px" 
                    AutoPostBack="True" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" 
                    onselectedindexchanged="listStationery_SelectedIndexChanged" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <Columns>
                        <dx:ListBoxColumn Caption="Văn phòng phẩm" FieldName="StName" Width="220px" />
                        <dx:ListBoxColumn Caption="Số lượng" FieldName="Quantity" Width="60px" />
                        <dx:ListBoxColumn Caption="Trạng thái" FieldName="OrderStName" Width="130px" />
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
            <td valign="top" class="style53">
                <table>
                    <tr>
                        <td class="style51">
                            <strong>Tháng đặt VPP</strong></td>
                        <td>
                            <dx:ASPxComboBox ID="cbMonth" runat="server" AutoPostBack="True" 
                                BackColor="#FFFF99" Height="16px" 
                                onselectedindexchanged="cbMonth_SelectedIndexChanged" ValueType="System.Int32" 
                                Width="80px">
                                <Items>
                                    <dx:ListEditItem Text="01" Value="1" />
                                    <dx:ListEditItem Text="02" Value="2" />
                                    <dx:ListEditItem Text="03" Value="3" />
                                    <dx:ListEditItem Text="04" Value="4" />
                                    <dx:ListEditItem Text="05" Value="5" />
                                    <dx:ListEditItem Text="06" Value="6" />
                                    <dx:ListEditItem Text="07" Value="7" />
                                    <dx:ListEditItem Text="08" Value="8" />
                                    <dx:ListEditItem Text="09" Value="9" />
                                    <dx:ListEditItem Text="10" Value="10" />
                                    <dx:ListEditItem Text="11" Value="11" />
                                    <dx:ListEditItem Text="12" Value="12" />
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                        <td class="style49">
                            <strong>Năm</strong></td>
                        <td>
                            <dx:ASPxTextBox ID="txtYear1" runat="server" Height="16px" Width="80px" 
                                BackColor="#FFFF99">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td class="style51">
                            Nhân viên</td>
                        <td>
                            <dx:ASPxComboBox ID="cbStaff" runat="server" 
                                DataSourceID="SqlDataSource_Staff" Height="16px" TextField="StaffFullName" 
                                ValueField="StaffID" ValueType="System.String" Width="300px" 
                                AutoPostBack="True" onselectedindexchanged="cbStaff_SelectedIndexChanged">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style51">
                            Tên văn phòng phẩm (*)</td>
                        <td>
                            <dx:ASPxComboBox ID="cbStationery" runat="server" 
                                DataSourceID="SqlDataSource_Stationery" Height="16px" TextField="StName" 
                                ValueField="StID" ValueType="System.Int32" Width="300px">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style51">
                            Số lượng (*)</td>
                        <td>
                            <dx:ASPxTextBox ID="txtQuantity" runat="server" Height="16px" Width="300px">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style51">
                            Ghi chú</td>
                        <td>
                            <dx:ASPxMemo ID="mmNote" runat="server" Height="114px" Width="300px">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td class="style25">
                            Tình trạng</td>
                        <td class="style26">
                            <dx:ASPxComboBox ID="cbOrderStatus" runat="server" Height="16px" TextField="OrderStName" 
                                ValueField="OrderStID" ValueType="System.Int32" Width="300px" 
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
                <table style="width: 91%; height: 63px;">
                    <tr>
                        <td align="center" class="style29" valign="middle">
                            &nbsp;</td>
                        <td align="center" class="style24">
                            <dx:ASPxButton ID="btUpdate" runat="server" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Cập nhật" 
                                onclick="btUpdate_Click">
                            </dx:ASPxButton>
                        </td>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
        </table>
        <table>
            <tr>
                <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="True" 
                    Font-Size="Medium" style="color: #CC3300" 
                        Text="Xác nhận toàn bộ thông tin đặt VPP trong tháng">
                </dx:ASPxLabel>
                </td>
                <td class="style39">
                            <dx:ASPxComboBox ID="cbMonth2" runat="server" AutoPostBack="True" 
                                BackColor="#FFFF99" Height="16px" 
                                onselectedindexchanged="cbMonth_SelectedIndexChanged" ValueType="System.Int32" 
                                Width="80px">
                                <Items>
                                    <dx:ListEditItem Text="01" Value="1" />
                                    <dx:ListEditItem Text="02" Value="2" />
                                    <dx:ListEditItem Text="03" Value="3" />
                                    <dx:ListEditItem Text="04" Value="4" />
                                    <dx:ListEditItem Text="05" Value="5" />
                                    <dx:ListEditItem Text="06" Value="6" />
                                    <dx:ListEditItem Text="07" Value="7" />
                                    <dx:ListEditItem Text="08" Value="8" />
                                    <dx:ListEditItem Text="09" Value="9" />
                                    <dx:ListEditItem Text="10" Value="10" />
                                    <dx:ListEditItem Text="11" Value="11" />
                                    <dx:ListEditItem Text="12" Value="12" />
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                <td class="style38">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Bold="True" 
                    Font-Size="Medium" style="color: #CC3300" Text="năm">
                </dx:ASPxLabel>
                </td>
                <td class="style37">
                            <dx:ASPxTextBox ID="txtYear" runat="server" Height="16px" Width="60px" 
                                BackColor="#FFFFCC">
                            </dx:ASPxTextBox>
                        </td>
                <td align="center" class="style40" style="text-align: left">
                            <dx:ASPxButton ID="btConfirm" runat="server" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xác nhận đã nhận VPP" Width="190px" onclick="btConfirm_Click">
                            </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td class="style36" align="center">
                            <dx:ASPxButton ID="btExportToExcel" runat="server" 
                                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                        Text="Xuất ra file excel" Width="190px" onclick="btExportToExcel_Click">
                            </dx:ASPxButton>
                </td>
                <td class="style39">
                            &nbsp;</td>
                <td class="style38">
                    &nbsp;</td>
                <td class="style37">
                            &nbsp;</td>
                <td align="center" class="style40" style="text-align: left">
                            &nbsp;</td>
            </tr>
            </table>
    <p>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" 
            DataSourceID="SqlDataSource_OrderStDetail" 
            onfieldvaluedisplaytext="ASPxPivotGrid1_FieldValueDisplayText">
            <Fields>
                <dx:PivotGridField ID="fieldStaffFistName" Area="ColumnArea" AreaIndex="0" 
                    Caption="Tên Nhân viên" FieldName="StaffFistName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStName" Area="RowArea" AreaIndex="2" 
                    Caption="Văn phòng phẩm" FieldName="StName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldQuantity" Area="DataArea" AreaIndex="0" 
                    Caption="Số lượng" FieldName="Quantity">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMonth" Area="RowArea" AreaIndex="1" Caption="Tháng" 
                    FieldName="Month" SortOrder="Descending">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldYear" Area="RowArea" AreaIndex="0" Caption="Năm" 
                    FieldName="Year" SortOrder="Descending">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNote" AreaIndex="0" Caption="Ghi chú" 
                    FieldName="Note" GrandTotalText="Tổng cộng" Options-ShowCustomTotals="False" 
                    Options-ShowGrandTotal="False" Options-ShowTotals="False" SummaryType="Max" 
                    TotalsVisibility="None">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOrderStName" AreaIndex="1" Caption="Trạng thái" 
                    FieldName="OrderStName" Options-ShowCustomTotals="False" 
                    Options-ShowGrandTotal="False" Options-ShowTotals="False" 
                    SummaryType="Max" Area="DataArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUnit" Area="RowArea" AreaIndex="3" 
                    Caption="Đơn vị tính" FieldName="Unit">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                    <ValueStyle HorizontalAlign="Center">
                    </ValueStyle>
                </dx:PivotGridField>
            </Fields>
            <OptionsView ShowColumnTotals="False" />
            <OptionsPager ShowDefaultImages="False">
                <NextPageButton Text="Tiếp &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Trước">
                </PrevPageButton>
                <Summary AllPagesText="Trang: {0} - {1} ({2}  Hồ sơ)" 
                    Text="Trang {0}/{1} ({2} Hồ sơ)" />
            </OptionsPager>
            <OptionsLoadingPanel>
                <Image Url="~/App_Themes/PlasticBlue/PivotGrid/Loading.gif">
                </Image>
            </OptionsLoadingPanel>
            <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                <CustomizationFieldsBackground Url="~/App_Themes/PlasticBlue/PivotGrid/pgCustomizationFormBackground.gif">
                </CustomizationFieldsBackground>
                <LoadingPanel Url="~/App_Themes/PlasticBlue/PivotGrid/Loading.gif">
                </LoadingPanel>
            </Images>
            <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue">
                <MenuStyle GutterWidth="0px" />
                <CustomizationFieldsCloseButtonStyle>
                    <Paddings Padding="0px" />
                </CustomizationFieldsCloseButtonStyle>
            </Styles>
        </dx:ASPxPivotGrid>
        <asp:SqlDataSource ID="SqlDataSource_OrderStDetail" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            SelectCommand="SELECT OrderSt.OrderID, Staff.StaffFistName, Stationery.StName, OrderSt.Quantity, OrderSt.Month, OrderSt.Year, OrderSt.Note, OrderSt.Invalid, OrderSt.OrderDate, OrderStatus.OrderStName, Stationery.Unit FROM Staff INNER JOIN OrderSt ON Staff.StaffID = OrderSt.StaffID INNER JOIN Stationery ON OrderSt.StID = Stationery.StID INNER JOIN OrderStatus ON OrderSt.OrderStID = OrderStatus.OrderStID">
        </asp:SqlDataSource>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
            ASPxPivotGridID="ASPxPivotGrid1">
        </dx:ASPxPivotGridExporter>
        <asp:SqlDataSource ID="SqlDataSource_Staff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [Staff]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_OrderStationery" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            
            
            SelectCommand="SELECT OrderSt.OrderID, OrderSt.StaffID, OrderSt.StID, OrderSt.Quantity, OrderSt.Month, OrderSt.Year, OrderSt.Note, OrderSt.OrderStID, OrderSt.Invalid, OrderSt.OrderDate, Stationery.StName, OrderStatus.OrderStName FROM OrderSt INNER JOIN Stationery ON OrderSt.StID = Stationery.StID INNER JOIN OrderStatus ON OrderSt.OrderStID = OrderStatus.OrderStID WHERE (OrderSt.Month = @Month) AND (OrderSt.Year = @Year) AND (OrderSt.StaffID = @StaffID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbMonth" DefaultValue="0" Name="Month" 
                    PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="txtYear1" DefaultValue="0" Name="Year" 
                    PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="cbStaff" DefaultValue="0" Name="StaffID" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_Stationery" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                    
                    SelectCommand="SELECT * FROM [Stationery] ORDER BY cast([StName] as nvarchar)"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_OrderStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                    
                    SelectCommand="SELECT * FROM [OrderStatus]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>
