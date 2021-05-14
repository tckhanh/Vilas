<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="4-BaoCaoDotXuat.aspx.cs" Inherits="LabManagement.BaoCaoDotXuat" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<%@ Register assembly="DevExpress.XtraCharts.v20.1.Web, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


.dxeButtonEdit
{
    background-color: white;
    border: solid 1px #9F9F9F;
    width: 170px;
}
        .style23
        {
            font-size: x-large;
            color: #FF6600;
        }
        .style28
        {
            color: #003399;
            height: 2px;
        }
        .style29
        {
            color: #000099;
        }
        .style30
        {
            width: 227px;
            height: 4px;
        }
        .style31
        {
            color: #000099;
            height: 4px;
            width: 103px;
        }
        .style32
        {
            height: 4px;
        }
        .style33
        {
            color: #000099;
            height: 4px;
            width: 107px;
        }
        .style34
        {
            width: 329px;
        }
        .style35
        {
            width: 73px;
        }
        .style36
        {
            width: 272px;
        }
        .style37
        {
            color: #CC3300;
            font-size: medium;
            font-family: Tahoma;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style19" style="width: 77%; height: 51px">
        <tr>
            <td class="style23" style="text-align: center">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                    Font-Size="X-Large" ForeColor="#CC3300" 
                    Text="BÁO CÁO HOẠT ĐỘNG ĐO KIỂM">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>

        <table class="style19" style="height: 108px; width: 67%">
            <tr>
                <td colspan="4" class="style28">
                    <strong>Báo cáo tình hình đo kiểm của phòng thử nghiệm VILAS197</strong></td>
            </tr>
            <tr>
                <td class="style33">
                    <strong>Từ ngày</strong></td>
                <td class="style30">
    
        <dx:ASPxDateEdit ID="d1" runat="server" AutoPostBack="True" BackColor="#FFCC99" 
                        ondatechanged="d1_DateChanged">
            <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
            </CalendarProperties>
        </dx:ASPxDateEdit>
                </td>
                <td class="style31">
                    <strong>Đến ngày</strong></td>
                <td class="style32">
        <dx:ASPxDateEdit ID="d2" runat="server" AutoPostBack="True" BackColor="#FFCC99" 
                        ondatechanged="d2_DateChanged">
            <CalendarProperties ClearButtonText="Xóa" TodayButtonText="Hôm nay">
            </CalendarProperties>
        </dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td class="style29" align="center" colspan="4">
                    <dx:ASPxButton ID="btPrint" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="In Báo Cáo" 
                        Width="150px">
                        <ClientSideEvents Click="function (s, e) {window.open('ReportForm/TestingActivityReport.aspx', '_blank')}" />
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    <table style="width: 111%; height: 116px;">
        <tr>
            <td class="style34">
                &nbsp;</td>
            <td class="style35">
                &nbsp;</td>
            <td class="style36">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style34">
                Tổng số phiếu yêu cầu đo kiểm</td>
            <td class="style35">
                <dx:ASPxLabel ID="lbSumRequest" runat="server" 
                    style="font-family: 'Times New Roman'; font-size: 11pt" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
            <td class="style36">
                Tổng số phiếu không ban hành kết quả</td>
            <td>
                <dx:ASPxLabel ID="lbSumNonIssue" runat="server" 
                    style="font-size: 11pt; font-family: 'Times New Roman'" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style34">
                Tổng số phiếu đã ban hành kết quả</td>
            <td class="style35">
                <dx:ASPxLabel ID="lbSumIssue" runat="server" 
                    style="font-family: 'Times New Roman'; font-size: 11pt" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
            <td class="style36">
                Tổng số phiếu ban hành KQ đúng hạn</td>
            <td>
                <dx:ASPxLabel ID="lbSumTestReportInTime" runat="server" 
                    style="font-size: 11pt; font-family: 'Times New Roman'" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style34">
                Tổng số phiếu ban hành kết quả trễ hạn</td>
            <td class="style35">
                <dx:ASPxLabel ID="lbSumTestReportOverTime" runat="server" 
                    style="font-size: 11pt; font-family: 'Times New Roman'" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
            <td class="style36">
                Tổng số yêu cầu đang tiến hành đo kiểm</td>
            <td>
                <dx:ASPxLabel ID="lbSumRequestInProcess" runat="server" 
                    style="font-size: 11pt; font-family: 'Times New Roman'" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style34">
                Tổng số phiếu đang tiến hành đo kiểm tồn quá hạn</td>
            <td class="style35">
                <dx:ASPxLabel ID="lbSumRequestInProcessOverTime" runat="server" 
                    style="font-size: 11pt; font-family: 'Times New Roman'" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
            <td class="style36">
                Tổng số phí đo thu được</td>
            <td>
                <dx:ASPxLabel ID="lbSumPrice" runat="server" 
                    style="font-size: 11pt; font-family: 'Times New Roman'" Text="ASPxLabel">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
    <p>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" 
            style="color: #CC3300; font-size: medium; font-weight: 700" 
            Text="Số liệu tổng hợp tình hình hoạt động">
        </dx:ASPxLabel>
    </p>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" KeyFieldName="EquTypeID" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        oncustomcolumndisplaytext="ASPxGridView1_CustomColumnDisplayText" 
        onsummarydisplaytext="ASPxGridView1_SummaryDisplayText">

<Settings ShowFooter="True"></Settings>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Tổng cộng" FieldName="EquTypeID" 
                    ShowInColumn="Tên sản phẩm đo" ShowInGroupFooterColumn="Tên sản phẩm đo" 
                    SummaryType="Count" />
                <dx:ASPxSummaryItem FieldName="NumOfRequest" SummaryType="Sum" 
                    DisplayFormat="###,###,###,###,0" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0" 
                    FieldName="NumOfRequestNonIssue" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0" 
                    FieldName="NumOfTestReport" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0 VNĐ" FieldName="SumPrice" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0" 
                    FieldName="NumofRequestHasContract" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0" 
                    FieldName="NumOfRequestNonIssueHasContract" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0" 
                    FieldName="NumOfTestReportHasContract" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0 VNĐ" 
                    FieldName="SumPriceHasContract" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EquTypeID" ReadOnly="True" 
                    VisibleIndex="0" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="STT" VisibleIndex="1" Caption="STT" 
                    UnboundType="Integer">
                </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="EquTypeName" VisibleIndex="2" Caption="Tên sản phẩm đo">
    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Không có hợp đồng nguyên tắc" VisibleIndex="3">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="NumOfRequest" 
                            ReadOnly="True" VisibleIndex="0" Width="60px">
                            <HeaderStyle Wrap="True" HorizontalAlign="Center" />
                            <CellStyle BackColor="#FFFFCC" HorizontalAlign="Center" VerticalAlign="Middle">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Số phiếu không ban hành KQ" 
                            FieldName="NumOfRequestNonIssue" ReadOnly="True" VisibleIndex="1" 
                            Width="60px">
                            <HeaderStyle Wrap="True" HorizontalAlign="Center" />
                            <CellStyle BackColor="#FFFFCC" HorizontalAlign="Center" VerticalAlign="Middle">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Số kết quả" FieldName="NumOfTestReport" 
                            ReadOnly="True" VisibleIndex="2" Width="60px">
                            <HeaderStyle Wrap="True" HorizontalAlign="Center" />
                            <CellStyle BackColor="#FFFFCC" HorizontalAlign="Center" VerticalAlign="Middle">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Tổng phí đo" FieldName="SumPrice" 
                            ReadOnly="True" VisibleIndex="3" Width="100px">
                            <PropertiesTextEdit DisplayFormatString="###,###,###,###,0 VNĐ">
                            </PropertiesTextEdit>
                            <HeaderStyle Wrap="True" HorizontalAlign="Center" />
                            <CellStyle BackColor="#FFFFCC">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Có hợp đồng nguyên tắc" 
                    ShowInCustomizationForm="True" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Số phiếu" 
                            FieldName="NumofRequestHasContract" ShowInCustomizationForm="True" 
                            VisibleIndex="0" Width="60px">
                            <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                            <CellStyle Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Số phiếu không ban hành KQ" 
                            FieldName="NumOfRequestNonIssueHasContract" ShowInCustomizationForm="True" 
                            VisibleIndex="1" Width="60px">
                            <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                            <CellStyle Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Số kết quả" 
                            FieldName="NumOfTestReportHasContract" ShowInCustomizationForm="True" 
                            VisibleIndex="2" Width="60px">
                            <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                            <CellStyle Wrap="True" HorizontalAlign="Center" VerticalAlign="Middle">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Tổng phí đo" 
                            FieldName="SumPriceHasContract" ShowInCustomizationForm="True" VisibleIndex="3" 
                            Width="100px">
                            <PropertiesTextEdit DisplayFormatString="###,###,###,###,0 VNĐ">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                            <CellStyle Wrap="True">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewBandColumn>
            </Columns>
            <SettingsPager ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Tiếp &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Trước">
                </PrevPageButton>
                <Summary Text="Trang {0}/{1} ({2} Hồ sơ)" />
            </SettingsPager>

            <Settings ShowFooter="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        SelectCommand="SELECT EquTypeID, EquTypeName, (SELECT COUNT(Request.RequestID) AS NumofRequest FROM Request INNER JOIN EquipmentType AS EquipmentType1 ON Request.EquTypeID = EquipmentType1.EquTypeID WHERE (EquipmentType.EquTypeID = Request.EquTypeID) AND (Request.ReceiveDate &gt;= @BD) AND (Request.ReceiveDate &lt;= @ED) AND (Request.ContractNo IS NULL OR Request.ContractNo = ' ') GROUP BY EquipmentType1.EquTypeID) AS NumOfRequest, (SELECT COUNT(Request_3.RequestID) AS NumOfRequestNonIssue FROM Request AS Request_3 INNER JOIN EquipmentType AS EquipmentType4 ON Request_3.EquTypeID = EquipmentType4.EquTypeID WHERE (EquipmentType.EquTypeID = Request_3.EquTypeID) AND (Request_3.StatusID = 6 OR Request_3.StatusID = 7) AND (Request_3.ReceiveDate &gt;= @BD) AND (Request_3.ReceiveDate &lt;= @ED) AND (Request_3.ContractNo IS NULL OR Request_3.ContractNo = ' ') GROUP BY EquipmentType4.EquTypeID) AS NumOfRequestNonIssue, (SELECT COUNT(TestReport.AssignmentID) AS NumOfTestReport FROM Request AS Request_2 INNER JOIN EquipmentType AS EquipmentType2 ON Request_2.EquTypeID = EquipmentType2.EquTypeID INNER JOIN Assignment ON Request_2.RequestID = Assignment.AssignmentID INNER JOIN TestReport ON Assignment.AssignmentID = TestReport.AssignmentID WHERE (EquipmentType.EquTypeID = Request_2.EquTypeID) AND (TestReport.TestReportIssueDate &gt;= @BD) AND (TestReport.TestReportIssueDate &lt;= @ED) AND (Request_2.ContractNo IS NULL OR Request_2.ContractNo = ' ') GROUP BY EquipmentType2.EquTypeID) AS NumOfTestReport, (SELECT SUM(EquipmentType3.Price) AS SumPrice FROM Request AS Request_1 INNER JOIN EquipmentType AS EquipmentType3 ON Request_1.EquTypeID = EquipmentType3.EquTypeID INNER JOIN Assignment AS Assignment_1 ON Request_1.RequestID = Assignment_1.AssignmentID INNER JOIN TestReport AS TestReport_1 ON Assignment_1.AssignmentID = TestReport_1.AssignmentID WHERE (EquipmentType.EquTypeID = Request_1.EquTypeID) AND (TestReport_1.TestReportIssueDate &gt;= @BD) AND (TestReport_1.TestReportIssueDate &lt;= @ED) AND (Request_1.ContractNo IS NULL OR Request_1.ContractNo = ' ') GROUP BY EquipmentType3.EquTypeID) AS SumPrice, (SELECT COUNT(Request_4.RequestID) AS NumofRequestHasContract FROM Request AS Request_4 INNER JOIN EquipmentType AS EquipmentType4 ON Request_4.EquTypeID = EquipmentType4.EquTypeID WHERE (EquipmentType.EquTypeID = Request_4.EquTypeID) AND (Request_4.ReceiveDate &gt;= @BD) AND (Request_4.ReceiveDate &lt;= @ED) AND (Request_4.ContractNo IS NOT NULL) AND (Request_4.ContractNo &lt;&gt; ' ') GROUP BY EquipmentType4.EquTypeID) AS NumofRequestHasContract, (SELECT COUNT(Request_5.RequestID) AS NumOfRequestNonIssueHasContract FROM Request AS Request_5 INNER JOIN EquipmentType AS EquipmentType5 ON Request_5.EquTypeID = EquipmentType5.EquTypeID WHERE (EquipmentType.EquTypeID = Request_5.EquTypeID) AND (Request_5.StatusID = 6 OR Request_5.StatusID = 7) AND (Request_5.ReceiveDate &gt;= @BD) AND (Request_5.ReceiveDate &lt;= @ED) AND (Request_5.ContractNo IS NOT NULL) AND (Request_5.ContractNo &lt;&gt; ' ') GROUP BY EquipmentType5.EquTypeID) AS NumOfRequestNonIssueHasContract, (SELECT COUNT(TestReport_2.AssignmentID) AS NumOfTestReportHasContract FROM Request AS Request_6 INNER JOIN EquipmentType AS EquipmentType6 ON Request_6.EquTypeID = EquipmentType6.EquTypeID INNER JOIN Assignment AS Assignment_2 ON Request_6.RequestID = Assignment_2.AssignmentID INNER JOIN TestReport AS TestReport_2 ON Assignment_2.AssignmentID = TestReport_2.AssignmentID WHERE (EquipmentType.EquTypeID = Request_6.EquTypeID) AND (TestReport_2.TestReportIssueDate &gt;= @BD) AND (TestReport_2.TestReportIssueDate &lt;= @ED) AND (Request_6.ContractNo IS NOT NULL) AND (Request_6.ContractNo &lt;&gt; ' ') GROUP BY EquipmentType6.EquTypeID) AS NumOfTestReportHasContract, (SELECT SUM(EquipmentType7.Price) AS SumPriceHasContract FROM Request AS Request_7 INNER JOIN EquipmentType AS EquipmentType7 ON Request_7.EquTypeID = EquipmentType7.EquTypeID INNER JOIN Assignment AS Assignment_7 ON Request_7.RequestID = Assignment_7.AssignmentID INNER JOIN TestReport AS TestReport_7 ON Assignment_7.AssignmentID = TestReport_7.AssignmentID WHERE (EquipmentType.EquTypeID = Request_7.EquTypeID) AND (TestReport_7.TestReportIssueDate &gt;= @BD) AND (TestReport_7.TestReportIssueDate &lt;= @ED) AND (Request_7.ContractNo IS NOT NULL) AND (Request_7.ContractNo &lt;&gt; ' ') GROUP BY EquipmentType7.EquTypeID) AS SumPriceHasContract FROM EquipmentType AS EquipmentType">
            <SelectParameters>
                <asp:ControlParameter ControlID="d1" DefaultValue="" Name="BD" Type="DateTime" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="d2" DefaultValue="" Name="ED" Type="DateTime" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource5" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        oncustomcolumndisplaytext="ASPxGridView2_CustomColumnDisplayText" 
        onsummarydisplaytext="ASPxGridView2_SummaryDisplayText">

            <Settings ShowFooter="True" />
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Tổng cộng" FieldName="EquTypeID" 
                    ShowInColumn="Tên sản phẩm đo" ShowInGroupFooterColumn="Tên sản phẩm đo" 
                    SummaryType="Count" />
                <dx:ASPxSummaryItem FieldName="SumRequestInProCessOverTime" SummaryType="Sum" 
                    DisplayFormat="###,###,###,###,0" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0" 
                    FieldName="SumTestReportInTime" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0" 
                    FieldName="SumRequestInProCess" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="###,###,###,###,0" 
                    FieldName="SumTestReportOverTime" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                    VisibleIndex="0">
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tên sản phẩm đo" FieldName="EquTypeName" 
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số kết quả ban hành đúng hạn" 
                    FieldName="SumTestReportInTime" ReadOnly="True" VisibleIndex="2" 
                    Width="100px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                    <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số kết quả ban hành trễ hạn" 
                    FieldName="SumTestReportOverTime" ReadOnly="True" VisibleIndex="3" 
                    Width="100px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                    <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu yêu cầu đang tiến hành đo kiểm" 
                    FieldName="SumRequestInProCess" VisibleIndex="4" Width="120px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                    <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số phiếu yêu cầu đo kiểm tồn quá hạn" 
                    FieldName="SumRequestInProCessOverTime" ReadOnly="True" 
                    ShowInCustomizationForm="True" VisibleIndex="5" Width="120px">
                    <HeaderStyle Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                    <FooterCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Tiếp &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Trước">
                </PrevPageButton>
                <Summary Text="Trang {0}/{1} ({2} Hồ sơ)" />
            </SettingsPager>

<Settings ShowFooter="True"></Settings>
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
            

    
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        SelectCommand="SELECT EquTypeName, (SELECT COUNT(TestReport1.AssignmentID) AS SumTestReportInTime FROM Request AS Request1 INNER JOIN Assignment AS Assignment1 ON Request1.RequestID = Assignment1.AssignmentID INNER JOIN TestReport AS TestReport1 ON Assignment1.AssignmentID = TestReport1.AssignmentID INNER JOIN EquipmentType AS EquipmentType1 ON Request1.EquTypeID = EquipmentType1.EquTypeID WHERE (DATEDIFF(DAY, TestReport1.TestReportIssueDate, Request1.AppointmentDate) &gt;= 0) AND (EquipmentType.EquTypeID = EquipmentType1.EquTypeID) AND (TestReport1.TestReportIssueDate &gt;= @BD) AND (TestReport1.TestReportIssueDate &lt;= @ED) GROUP BY EquipmentType1.EquTypeID) AS SumTestReportInTime, (SELECT COUNT(TestReport2.AssignmentID) AS SumTestReportOverTime FROM Request AS Request2 INNER JOIN Assignment AS Assignment2 ON Request2.RequestID = Assignment2.AssignmentID INNER JOIN TestReport AS TestReport2 ON Assignment2.AssignmentID = TestReport2.AssignmentID INNER JOIN EquipmentType AS EquipmentType2 ON Request2.EquTypeID = EquipmentType2.EquTypeID WHERE (DATEDIFF(DAY, TestReport2.TestReportIssueDate, Request2.AppointmentDate) &lt; 0) AND (EquipmentType.EquTypeID = EquipmentType2.EquTypeID) AND (TestReport2.TestReportIssueDate &gt;= @BD) AND (TestReport2.TestReportIssueDate &lt;= @ED) GROUP BY EquipmentType2.EquTypeID) AS SumTestReportOverTime, (SELECT COUNT(Request3.RequestID) AS SumRequestInProCessOverTime FROM Request AS Request3 INNER JOIN EquipmentType AS EquipmentType3 ON Request3.EquTypeID = EquipmentType3.EquTypeID WHERE (DATEDIFF(DAY, GETDATE(), Request3.AppointmentDate) &lt; 0) AND (Request3.StatusID = 1 OR Request3.StatusID = 2 OR Request3.StatusID = 3) AND (EquipmentType.EquTypeID = EquipmentType3.EquTypeID) AND (Request3.ReceiveDate &gt;= @BD) AND (Request3.ReceiveDate &lt;= @ED) GROUP BY EquipmentType3.EquTypeID) AS SumRequestInProCessOverTime, (SELECT COUNT(Request4.RequestID) AS SumRequestInProCess FROM Request AS Request4 INNER JOIN EquipmentType AS EquipmentType4 ON Request4.EquTypeID = EquipmentType4.EquTypeID WHERE (Request4.StatusID = 1 OR Request4.StatusID = 2 OR Request4.StatusID = 3) AND (EquipmentType.EquTypeID = EquipmentType4.EquTypeID) AND (Request4.ReceiveDate &gt;= @BD) AND (Request4.ReceiveDate &lt;= @ED) GROUP BY EquipmentType4.EquTypeID) AS SumRequestInProCess FROM EquipmentType">
            <SelectParameters>
                <asp:ControlParameter ControlID="d1" DefaultValue="" Name="BD" Type="DateTime" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="d2" DefaultValue="" Name="ED" Type="DateTime" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    <br />
    <dx:ASPxLabel ID="ASPxLabel3" runat="server" 
        style="color: #CC3300; font-size: medium; font-weight: 700" 
        Text="Đồ thị tình hình đo kiểm">
    </dx:ASPxLabel>
    <br />
    
        <br />
    <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" 
        DataSourceID="SqlDataSource2" Height="400px" Width="500px">
        <diagramserializable>
            <cc1:XYDiagram>
                <axisx visibleinpanesserializable="-1">
                    <label angle="45" Font="Times New Roman, 10pt" />
                    <range sidemarginsenabled="True" />
                </axisx>
                <axisy visibleinpanesserializable="-1">
                    <range sidemarginsenabled="True" />
                <numericoptions format="Number" /></axisy>
            </cc1:XYDiagram>
        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside"></legend>

        <seriesserializable>
            <cc1:Series ArgumentDataMember="GroupEquName" Name="Không hợp đồng nguyên tắc" 
                ValueDataMembersSerializable="NumOfRequest">
                <viewserializable>
                    <cc1:SideBySideBarSeriesView>
                    </cc1:SideBySideBarSeriesView>
                </viewserializable>
                <labelserializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                    </cc1:SideBySideBarSeriesLabel>
                </labelserializable>
                <pointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </pointoptionsserializable>
                <legendpointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </legendpointoptionsserializable>
            </cc1:Series>
            <cc1:Series ArgumentDataMember="GroupEquName" Name="Có hợp đồng nguyên tắc" 
                ValueDataMembersSerializable="NumofRequestHasContract">
                <viewserializable>
                    <cc1:SideBySideBarSeriesView>
                    </cc1:SideBySideBarSeriesView>
                </viewserializable>
                <labelserializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                    </cc1:SideBySideBarSeriesLabel>
                </labelserializable>
                <pointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </pointoptionsserializable>
                <legendpointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </legendpointoptionsserializable>
            </cc1:Series>
        </seriesserializable>

<SeriesTemplate><ViewSerializable>
<cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
</ViewSerializable>
<LabelSerializable>
<cc1:SideBySideBarSeriesLabel LineVisible="True">
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
<PointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</PointOptionsSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>
        <titles>
            <cc1:ChartTitle Text="Đồ thị số yêu cầu đo kiểm" />
        </titles>
    </dxchartsui:WebChartControl>
    &nbsp;<dxchartsui:WebChartControl ID="WebChartControl2" runat="server" 
        DataSourceID="SqlDataSource3" Height="400px" Width="500px">
        <diagramserializable>
            <cc1:XYDiagram>
                <axisx visibleinpanesserializable="-1">
                    <label angle="45" Font="Times New Roman, 10pt" />
                    <range sidemarginsenabled="True" />
                </axisx>
                <axisy visibleinpanesserializable="-1">
                    <range sidemarginsenabled="True" />
                <numericoptions format="Number" precision="0" /></axisy>
            </cc1:XYDiagram>
        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside"></legend>

        <seriesserializable>
            <cc1:Series ArgumentDataMember="GroupEquName" Name="Không hợp đồng nguyên tắc" 
                ValueDataMembersSerializable="SumPrice">
                <viewserializable>
                    <cc1:SideBySideBarSeriesView>
                    </cc1:SideBySideBarSeriesView>
                </viewserializable>
                <labelserializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True" LineColor="255, 255, 255" 
                    ResolveOverlappingMode="Default">
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                    </cc1:SideBySideBarSeriesLabel>
                </labelserializable>
                <pointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </pointoptionsserializable>
                <legendpointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </legendpointoptionsserializable>
            </cc1:Series>
            <cc1:Series ArgumentDataMember="GroupEquName" Name="Có hợp đồng nguyên tắc" 
                ValueDataMembersSerializable="SumPriceHasContract">
                <viewserializable>
                    <cc1:SideBySideBarSeriesView>
                    </cc1:SideBySideBarSeriesView>
                </viewserializable>
                <labelserializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True" 
                    ResolveOverlappingMode="HideOverlapped">
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                    </cc1:SideBySideBarSeriesLabel>
                </labelserializable>
                <pointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </pointoptionsserializable>
                <legendpointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </legendpointoptionsserializable>
            </cc1:Series>
        </seriesserializable>

<SeriesTemplate><ViewSerializable>
<cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
</ViewSerializable>
<LabelSerializable>
<cc1:SideBySideBarSeriesLabel LineVisible="True">
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
<PointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</PointOptionsSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>
        <titles>
            <cc1:ChartTitle Text="Đồ thị doanh thu lệ phí đo kiểm" />
        </titles>
    </dxchartsui:WebChartControl>
    &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        SelectCommand="SELECT GroupEquName, GroupEquID, (SELECT COUNT(Request1.RequestID) AS NumofRequest FROM Request AS Request1 INNER JOIN EquipmentType AS EquipmentType1 ON Request1.EquTypeID = EquipmentType1.EquTypeID AND Request1.EquTypeID = EquipmentType1.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment1 ON EquipmentType1.GroupID = GroupEquipment1.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType1.GroupID) AND (Request1.ReceiveDate &gt;= @BD) AND (Request1.ReceiveDate &lt;= @ED) AND (Request1.ContractNo IS NULL OR Request1.ContractNo = ' ') GROUP BY GroupEquipment1.GroupEquID) AS NumOfRequest, (SELECT COUNT(Request_2.RequestID) AS NumOfRequestNonIssue FROM Request AS Request_2 INNER JOIN EquipmentType AS EquipmentType2 ON Request_2.EquTypeID = EquipmentType2.EquTypeID AND Request_2.EquTypeID = EquipmentType2.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment_2 ON EquipmentType2.GroupID = GroupEquipment_2.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType2.GroupID) AND (Request_2.StatusID = 6 OR Request_2.StatusID = 7) AND (Request_2.ReceiveDate &gt;= @BD) AND (Request_2.ReceiveDate &lt;= @ED) AND (Request_2.ContractNo IS NULL OR Request_2.ContractNo = ' ') GROUP BY GroupEquipment_2.GroupEquID) AS NumOfRequestNonIssue, (SELECT COUNT(TestReport.AssignmentID) AS NumOfTestReport FROM Request AS Request_3 INNER JOIN EquipmentType AS EquipmentType3 ON Request_3.EquTypeID = EquipmentType3.EquTypeID AND Request_3.EquTypeID = EquipmentType3.EquTypeID INNER JOIN Assignment ON Request_3.RequestID = Assignment.AssignmentID INNER JOIN TestReport ON Assignment.AssignmentID = TestReport.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_3 ON EquipmentType3.GroupID = GroupEquipment_3.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType3.GroupID) AND (TestReport.TestReportIssueDate &gt;= @BD) AND (TestReport.TestReportIssueDate &lt;= @ED) AND (Request_3.ContractNo IS NULL OR Request_3.ContractNo = ' ') GROUP BY GroupEquipment_3.GroupEquID) AS NumOfTestReport, (SELECT SUM(EquipmentType4.Price) AS SumPrice FROM Request AS Request_4 INNER JOIN EquipmentType AS EquipmentType4 ON Request_4.EquTypeID = EquipmentType4.EquTypeID AND Request_4.EquTypeID = EquipmentType4.EquTypeID INNER JOIN Assignment AS Assignment_4 ON Request_4.RequestID = Assignment_4.AssignmentID INNER JOIN TestReport AS TestReport_4 ON Assignment_4.AssignmentID = TestReport_4.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_4 ON EquipmentType4.GroupID = GroupEquipment_4.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType4.GroupID) AND (TestReport_4.TestReportIssueDate &gt;= @BD) AND (TestReport_4.TestReportIssueDate &lt;= @ED) AND (Request_4.ContractNo IS NULL OR Request_4.ContractNo = ' ') GROUP BY GroupEquipment_4.GroupEquID) AS SumPrice, (SELECT COUNT(Request_5.RequestID) AS NumofRequestHasContract FROM Request AS Request_5 INNER JOIN EquipmentType AS EquipmentType5 ON Request_5.EquTypeID = EquipmentType5.EquTypeID AND Request_5.EquTypeID = EquipmentType5.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment_5 ON EquipmentType5.GroupID = GroupEquipment_5.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType5.GroupID) AND (Request_5.ReceiveDate &gt;= @BD) AND (Request_5.ReceiveDate &lt;= @ED) AND (Request_5.ContractNo IS NOT NULL) AND (Request_5.ContractNo &lt;&gt; ' ') GROUP BY GroupEquipment_5.GroupEquID) AS NumofRequestHasContract, (SELECT COUNT(Request_6.RequestID) AS NumOfRequestNonIssueHasContract FROM Request AS Request_6 INNER JOIN EquipmentType AS EquipmentType6 ON Request_6.EquTypeID = EquipmentType6.EquTypeID AND Request_6.EquTypeID = EquipmentType6.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment_6 ON EquipmentType6.GroupID = GroupEquipment_6.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType6.GroupID) AND (Request_6.StatusID = 6 OR Request_6.StatusID = 7) AND (Request_6.ReceiveDate &gt;= @BD) AND (Request_6.ReceiveDate &lt;= @ED) AND (Request_6.ContractNo IS NOT NULL) AND (Request_6.ContractNo &lt;&gt; ' ') GROUP BY GroupEquipment_6.GroupEquID) AS NumOfRequestNonIssueHasContract, (SELECT COUNT(TestReport_7.AssignmentID) AS NumOfTestReportHasContract FROM Request AS Request_7 INNER JOIN EquipmentType AS EquipmentType7 ON Request_7.EquTypeID = EquipmentType7.EquTypeID AND Request_7.EquTypeID = EquipmentType7.EquTypeID INNER JOIN Assignment AS Assignment_7 ON Request_7.RequestID = Assignment_7.AssignmentID INNER JOIN TestReport AS TestReport_7 ON Assignment_7.AssignmentID = TestReport_7.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_7 ON EquipmentType7.GroupID = GroupEquipment_7.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType7.GroupID) AND (TestReport_7.TestReportIssueDate &gt;= @BD) AND (TestReport_7.TestReportIssueDate &lt;= @ED) AND (Request_7.ContractNo IS NOT NULL) AND (Request_7.ContractNo &lt;&gt; ' ') GROUP BY GroupEquipment_7.GroupEquID) AS NumOfTestReportHasContract, (SELECT SUM(EquipmentType8.Price) AS SumPriceHasContract FROM Request AS Request_8 INNER JOIN EquipmentType AS EquipmentType8 ON Request_8.EquTypeID = EquipmentType8.EquTypeID AND Request_8.EquTypeID = EquipmentType8.EquTypeID INNER JOIN Assignment AS Assignment_8 ON Request_8.RequestID = Assignment_8.AssignmentID INNER JOIN TestReport AS TestReport_8 ON Assignment_8.AssignmentID = TestReport_8.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_8 ON EquipmentType8.GroupID = GroupEquipment_8.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType8.GroupID) AND (TestReport_8.TestReportIssueDate &gt;= @BD) AND (TestReport_8.TestReportIssueDate &lt;= @ED) AND (Request_8.ContractNo IS NOT NULL) AND (Request_8.ContractNo &lt;&gt; ' ') GROUP BY GroupEquipment_8.GroupEquID) AS SumPriceHasContract FROM GroupEquipment WHERE ((SELECT COUNT(Request1.RequestID) AS NumofRequest FROM Request AS Request1 INNER JOIN EquipmentType AS EquipmentType1 ON Request1.EquTypeID = EquipmentType1.EquTypeID AND Request1.EquTypeID = EquipmentType1.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment1 ON EquipmentType1.GroupID = GroupEquipment1.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType1.GroupID) AND (Request1.ReceiveDate &gt;= @BD) AND (Request1.ReceiveDate &lt;= @ED) AND (Request1.ContractNo IS NULL OR Request1.ContractNo = ' ') GROUP BY GroupEquipment1.GroupEquID) IS NOT NULL) ORDER BY NumOfRequest DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="d1" DefaultValue="" Name="BD" Type="DateTime" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="d2" DefaultValue="" Name="ED" Type="DateTime" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        SelectCommand="SELECT GroupEquName, GroupEquID, (SELECT COUNT(Request1.RequestID) AS NumofRequest FROM Request AS Request1 INNER JOIN EquipmentType AS EquipmentType1 ON Request1.EquTypeID = EquipmentType1.EquTypeID AND Request1.EquTypeID = EquipmentType1.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment1 ON EquipmentType1.GroupID = GroupEquipment1.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType1.GroupID) AND (Request1.ReceiveDate &gt;= @BD) AND (Request1.ReceiveDate &lt;= @ED) AND (Request1.ContractNo IS NULL OR Request1.ContractNo = ' ') GROUP BY GroupEquipment1.GroupEquID) AS NumOfRequest, (SELECT COUNT(Request_2.RequestID) AS NumOfRequestNonIssue FROM Request AS Request_2 INNER JOIN EquipmentType AS EquipmentType2 ON Request_2.EquTypeID = EquipmentType2.EquTypeID AND Request_2.EquTypeID = EquipmentType2.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment_2 ON EquipmentType2.GroupID = GroupEquipment_2.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType2.GroupID) AND (Request_2.StatusID = 6 OR Request_2.StatusID = 7) AND (Request_2.ReceiveDate &gt;= @BD) AND (Request_2.ReceiveDate &lt;= @ED) AND (Request_2.ContractNo IS NULL OR Request_2.ContractNo = ' ') GROUP BY GroupEquipment_2.GroupEquID) AS NumOfRequestNonIssue, (SELECT COUNT(TestReport.AssignmentID) AS NumOfTestReport FROM Request AS Request_3 INNER JOIN EquipmentType AS EquipmentType3 ON Request_3.EquTypeID = EquipmentType3.EquTypeID AND Request_3.EquTypeID = EquipmentType3.EquTypeID INNER JOIN Assignment ON Request_3.RequestID = Assignment.AssignmentID INNER JOIN TestReport ON Assignment.AssignmentID = TestReport.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_3 ON EquipmentType3.GroupID = GroupEquipment_3.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType3.GroupID) AND (TestReport.TestReportIssueDate &gt;= @BD) AND (TestReport.TestReportIssueDate &lt;= @ED) AND (Request_3.ContractNo IS NULL OR Request_3.ContractNo = ' ') GROUP BY GroupEquipment_3.GroupEquID) AS NumOfTestReport, (SELECT SUM(EquipmentType4.Price) AS SumPrice FROM Request AS Request_4 INNER JOIN EquipmentType AS EquipmentType4 ON Request_4.EquTypeID = EquipmentType4.EquTypeID AND Request_4.EquTypeID = EquipmentType4.EquTypeID INNER JOIN Assignment AS Assignment_4 ON Request_4.RequestID = Assignment_4.AssignmentID INNER JOIN TestReport AS TestReport_4 ON Assignment_4.AssignmentID = TestReport_4.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_4 ON EquipmentType4.GroupID = GroupEquipment_4.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType4.GroupID) AND (TestReport_4.TestReportIssueDate &gt;= @BD) AND (TestReport_4.TestReportIssueDate &lt;= @ED) AND (Request_4.ContractNo IS NULL OR Request_4.ContractNo = ' ') GROUP BY GroupEquipment_4.GroupEquID) AS SumPrice, (SELECT COUNT(Request_5.RequestID) AS NumofRequestHasContract FROM Request AS Request_5 INNER JOIN EquipmentType AS EquipmentType5 ON Request_5.EquTypeID = EquipmentType5.EquTypeID AND Request_5.EquTypeID = EquipmentType5.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment_5 ON EquipmentType5.GroupID = GroupEquipment_5.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType5.GroupID) AND (Request_5.ReceiveDate &gt;= @BD) AND (Request_5.ReceiveDate &lt;= @ED) AND (Request_5.ContractNo IS NOT NULL) AND (Request_5.ContractNo &lt;&gt; ' ') GROUP BY GroupEquipment_5.GroupEquID) AS NumofRequestHasContract, (SELECT COUNT(Request_6.RequestID) AS NumOfRequestNonIssueHasContract FROM Request AS Request_6 INNER JOIN EquipmentType AS EquipmentType6 ON Request_6.EquTypeID = EquipmentType6.EquTypeID AND Request_6.EquTypeID = EquipmentType6.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment_6 ON EquipmentType6.GroupID = GroupEquipment_6.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType6.GroupID) AND (Request_6.StatusID = 6 OR Request_6.StatusID = 7) AND (Request_6.ReceiveDate &gt;= @BD) AND (Request_6.ReceiveDate &lt;= @ED) AND (Request_6.ContractNo IS NOT NULL) AND (Request_6.ContractNo &lt;&gt; ' ') GROUP BY GroupEquipment_6.GroupEquID) AS NumOfRequestNonIssueHasContract, (SELECT COUNT(TestReport_7.AssignmentID) AS NumOfTestReportHasContract FROM Request AS Request_7 INNER JOIN EquipmentType AS EquipmentType7 ON Request_7.EquTypeID = EquipmentType7.EquTypeID AND Request_7.EquTypeID = EquipmentType7.EquTypeID INNER JOIN Assignment AS Assignment_7 ON Request_7.RequestID = Assignment_7.AssignmentID INNER JOIN TestReport AS TestReport_7 ON Assignment_7.AssignmentID = TestReport_7.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_7 ON EquipmentType7.GroupID = GroupEquipment_7.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType7.GroupID) AND (TestReport_7.TestReportIssueDate &gt;= @BD) AND (TestReport_7.TestReportIssueDate &lt;= @ED) AND (Request_7.ContractNo IS NOT NULL) AND (Request_7.ContractNo &lt;&gt; ' ') GROUP BY GroupEquipment_7.GroupEquID) AS NumOfTestReportHasContract, (SELECT SUM(EquipmentType8.Price) AS SumPriceHasContract FROM Request AS Request_8 INNER JOIN EquipmentType AS EquipmentType8 ON Request_8.EquTypeID = EquipmentType8.EquTypeID AND Request_8.EquTypeID = EquipmentType8.EquTypeID INNER JOIN Assignment AS Assignment_8 ON Request_8.RequestID = Assignment_8.AssignmentID INNER JOIN TestReport AS TestReport_8 ON Assignment_8.AssignmentID = TestReport_8.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_8 ON EquipmentType8.GroupID = GroupEquipment_8.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType8.GroupID) AND (TestReport_8.TestReportIssueDate &gt;= @BD) AND (TestReport_8.TestReportIssueDate &lt;= @ED) AND (Request_8.ContractNo IS NOT NULL) AND (Request_8.ContractNo &lt;&gt; ' ') GROUP BY GroupEquipment_8.GroupEquID) AS SumPriceHasContract FROM GroupEquipment WHERE ((SELECT SUM(EquipmentType4.Price) AS SumPrice FROM Request AS Request_4 INNER JOIN EquipmentType AS EquipmentType4 ON Request_4.EquTypeID = EquipmentType4.EquTypeID AND Request_4.EquTypeID = EquipmentType4.EquTypeID INNER JOIN Assignment AS Assignment_4 ON Request_4.RequestID = Assignment_4.AssignmentID INNER JOIN TestReport AS TestReport_4 ON Assignment_4.AssignmentID = TestReport_4.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_4 ON EquipmentType4.GroupID = GroupEquipment_4.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType4.GroupID) AND (TestReport_4.TestReportIssueDate &gt;= @BD) AND (TestReport_4.TestReportIssueDate &lt;= @ED) AND (Request_4.ContractNo IS NULL OR Request_4.ContractNo = ' ') GROUP BY GroupEquipment_4.GroupEquID) IS NOT NULL) ORDER BY SumPrice DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="d1" DefaultValue="" Name="BD" Type="DateTime" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="d2" DefaultValue="" Name="ED" Type="DateTime" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    <dxchartsui:WebChartControl ID="WebChartControl3" runat="server" 
        DataSourceID="SqlDataSource4" Height="400px" Width="500px" 
        AppearanceName="Pastel Kit">
        <diagramserializable>
            <cc1:SimpleDiagram>
            </cc1:SimpleDiagram>
        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
            Direction="RightToLeft" EquallySpacedItems="False" Font="Times New Roman, 10pt"></legend>

        <seriesserializable>
            <cc1:Series ArgumentDataMember="GroupEquName" Name="Series 1" 
                ValueDataMembersSerializable="NumOfRequest" 
                SynchronizePointOptions="False">
                <viewserializable>
                    
                <cc1:PieSeriesView RuntimeExploding="False"></cc1:PieSeriesView></viewserializable>
                <labelserializable>
                    
                <cc1:PieSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle></cc1:PieSeriesLabel></labelserializable>
                <pointoptionsserializable>
                    
                <cc1:PiePointOptions><valuenumericoptions format="Percent" precision="0" /></cc1:PiePointOptions></pointoptionsserializable>
                <legendpointoptionsserializable>
                    
                <cc1:PiePointOptions PointView="Argument"><valuenumericoptions format="Percent" 
                        precision="0" /></cc1:PiePointOptions></legendpointoptionsserializable>
            </cc1:Series>
        </seriesserializable>

<SeriesTemplate argumentdatamember="GroupEquName" 
            valuedatamembersserializable="NumOfRequest"><ViewSerializable>

<cc1:PieSeriesView RuntimeExploding="False"></cc1:PieSeriesView></ViewSerializable>
<LabelSerializable>

<cc1:PieSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle></cc1:PieSeriesLabel></LabelSerializable>
<PointOptionsSerializable>

<cc1:PiePointOptions></cc1:PiePointOptions></PointOptionsSerializable>
<LegendPointOptionsSerializable>

<cc1:PiePointOptions></cc1:PiePointOptions></LegendPointOptionsSerializable>
</SeriesTemplate>
        <titles>
            <cc1:ChartTitle Text="Biểu đồ phân bố mẫu sản phẩm đo" />
        </titles>
    </dxchartsui:WebChartControl>
    &nbsp;<dxchartsui:WebChartControl ID="WebChartControl4" runat="server" 
        DataSourceID="SqlDataSource4" Height="400px" Width="500px" 
        AppearanceName="Pastel Kit">
        <diagramserializable>
            <cc1:SimpleDiagram>
            </cc1:SimpleDiagram>
        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
            Direction="RightToLeft" EquallySpacedItems="False" Font="Times New Roman, 10pt"></legend>

        <seriesserializable>
            <cc1:Series ArgumentDataMember="GroupEquName" Name="Series 1" 
                ValueDataMembersSerializable="SumPrice" SynchronizePointOptions="False">
                <viewserializable>
                    
                <cc1:PieSeriesView RuntimeExploding="False"></cc1:PieSeriesView></viewserializable>
                <labelserializable>
                    
                <cc1:PieSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle></cc1:PieSeriesLabel></labelserializable>
                <pointoptionsserializable>
                    
                <cc1:PiePointOptions><valuenumericoptions format="Percent" precision="0" /></cc1:PiePointOptions></pointoptionsserializable>
                <legendpointoptionsserializable>
                    
                <cc1:PiePointOptions PointView="Argument"><valuenumericoptions format="Percent" 
                        precision="0" /></cc1:PiePointOptions></legendpointoptionsserializable>
            </cc1:Series>
        </seriesserializable>

<SeriesTemplate argumentdatamember="GroupEquName" 
            valuedatamembersserializable="NumOfRequest"><ViewSerializable>

<cc1:PieSeriesView RuntimeExploding="False"></cc1:PieSeriesView></ViewSerializable>
<LabelSerializable>

<cc1:PieSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle></cc1:PieSeriesLabel></LabelSerializable>
<PointOptionsSerializable>

<cc1:PiePointOptions></cc1:PiePointOptions></PointOptionsSerializable>
<LegendPointOptionsSerializable>

<cc1:PiePointOptions></cc1:PiePointOptions></LegendPointOptionsSerializable>
</SeriesTemplate>
        <titles>
            <cc1:ChartTitle Text="Biểu đồ phân bố lệ phí đo kiểm" />
        </titles>
    </dxchartsui:WebChartControl>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        
        SelectCommand="SELECT GroupEquName, GroupEquID, (SELECT COUNT(Request1.RequestID) AS NumofRequest FROM Request AS Request1 INNER JOIN EquipmentType AS EquipmentType1 ON Request1.EquTypeID = EquipmentType1.EquTypeID AND Request1.EquTypeID = EquipmentType1.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment1 ON EquipmentType1.GroupID = GroupEquipment1.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType1.GroupID) AND (Request1.ReceiveDate &gt;= @BD) AND (Request1.ReceiveDate &lt;= @ED) GROUP BY GroupEquipment1.GroupEquID) AS NumOfRequest, (SELECT COUNT(Request_2.RequestID) AS NumOfRequestNonIssue FROM Request AS Request_2 INNER JOIN EquipmentType AS EquipmentType2 ON Request_2.EquTypeID = EquipmentType2.EquTypeID AND Request_2.EquTypeID = EquipmentType2.EquTypeID INNER JOIN GroupEquipment AS GroupEquipment_2 ON EquipmentType2.GroupID = GroupEquipment_2.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType2.GroupID) AND (Request_2.StatusID = 6 OR Request_2.StatusID = 7) AND (Request_2.ReceiveDate &gt;= @BD) AND (Request_2.ReceiveDate &lt;= @ED) GROUP BY GroupEquipment_2.GroupEquID) AS NumOfRequestNonIssue, (SELECT COUNT(TestReport.AssignmentID) AS NumOfTestReport FROM Request AS Request_3 INNER JOIN EquipmentType AS EquipmentType3 ON Request_3.EquTypeID = EquipmentType3.EquTypeID AND Request_3.EquTypeID = EquipmentType3.EquTypeID INNER JOIN Assignment ON Request_3.RequestID = Assignment.AssignmentID INNER JOIN TestReport ON Assignment.AssignmentID = TestReport.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_3 ON EquipmentType3.GroupID = GroupEquipment_3.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType3.GroupID) AND (TestReport.TestReportIssueDate &gt;= @BD) AND (TestReport.TestReportIssueDate &lt;= @ED) GROUP BY GroupEquipment_3.GroupEquID) AS NumOfTestReport, (SELECT SUM(EquipmentType4.Price) AS SumPrice FROM Request AS Request_4 INNER JOIN EquipmentType AS EquipmentType4 ON Request_4.EquTypeID = EquipmentType4.EquTypeID AND Request_4.EquTypeID = EquipmentType4.EquTypeID INNER JOIN Assignment AS Assignment_4 ON Request_4.RequestID = Assignment_4.AssignmentID INNER JOIN TestReport AS TestReport_4 ON Assignment_4.AssignmentID = TestReport_4.AssignmentID INNER JOIN GroupEquipment AS GroupEquipment_4 ON EquipmentType4.GroupID = GroupEquipment_4.GroupEquID WHERE (GroupEquipment.GroupEquID = EquipmentType4.GroupID) AND (TestReport_4.TestReportIssueDate &gt;= @BD) AND (TestReport_4.TestReportIssueDate &lt;= @ED) GROUP BY GroupEquipment_4.GroupEquID) AS SumPrice FROM GroupEquipment">
            <SelectParameters>
                <asp:ControlParameter ControlID="d1" DefaultValue="" Name="BD" Type="DateTime" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="d2" DefaultValue="" Name="ED" Type="DateTime" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    

<p>
    <dx:ASPxLabel ID="ASPxLabel4" runat="server" 
        style="color: #CC3300; font-size: medium; font-weight: 700" 
        
        Text="Danh sách các kết quả đo kiểm ban hành trễ hạn">
    </dx:ASPxLabel>
    </p>
            <p>

            <dx1:ASPxGridView ID="ASPxGridView3" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid3"
            DataSourceID="SqlDataSourceAssignInfo1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="RequestID" 
                    oncustomcolumndisplaytext="ASPxGridView3_CustomColumnDisplayText">
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
                    <dx:GridViewDataTextColumn FieldName="RequestID" ReadOnly="True" 
                        Visible="False" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                        VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="RequestNo" 
                        VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số hợp đồng" FieldName="ContractNo" 
                        VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số phiếu thu" FieldName="BillNo" 
                        Visible="False" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số kết quả đo" FieldName="TestReportNo" 
                        VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Tên công ty" FieldName="CompanyName" 
                        VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Loại thiết bị" FieldName="EquTypeName" 
                        VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="Model" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày trả KQ dự kiến" 
                        FieldName="AppointmentDate" VisibleIndex="9">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày ban hành KQ" 
                        FieldName="TestReportIssueDate" VisibleIndex="10">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="TestReportDateDiff" ReadOnly="True" 
                        Visible="False" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                </Columns>
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
            </dx1:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSourceAssignInfo1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>"                    
                
        
        
                    
                    
                    
                    
                    
                    
                    
                    SelectCommand="SELECT Request.RequestID, Request.RequestNo, Request.ContractNo, Request.BillNo, TestReport.TestReportNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.AppointmentDate, TestReport.TestReportIssueDate, DATEDIFF(DAY, TestReport.TestReportIssueDate, Request.AppointmentDate) AS TestReportDateDiff FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN TestReport ON Assignment.AssignmentID = TestReport.AssignmentID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Company ON Request.CompanyID = Company.CompanyID AND Request.CompanyID = Company.CompanyID WHERE (TestReport.TestReportIssueDate &lt;= @ED AND TestReport.TestReportIssueDate &gt;= @BD) AND (DATEDIFF(DAY, TestReport.TestReportIssueDate, Request.AppointmentDate) &lt; 0)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="d2" Name="ED" PropertyName="Value" />
                    <asp:ControlParameter ControlID="d1" Name="BD" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>

    </p>
    <p>

    <dx:ASPxLabel ID="ASPxLabel5" runat="server" 
        style="color: #CC3300; font-size: medium; font-weight: 700" 
        
        Text="Danh sách các yêu cầu đo kiểm còn tồn quá hạn xử lý">
    </dx:ASPxLabel>

    </p>

            <dx1:ASPxGridView ID="ASPxGridView4" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid4"
            DataSourceID="SqlDataSourceAssignInfo2" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="RequestID" 
        oncustomcolumndisplaytext="ASPxGridView4_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid4.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="RequestID" ReadOnly="True" 
                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" 
                        ShowInCustomizationForm="True" UnboundType="Integer" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="RequestNo" 
                        ShowInCustomizationForm="True" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số hợp đồng" FieldName="ContractNo" 
                        ShowInCustomizationForm="True" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số phiếu thu" FieldName="BillNo" 
                        ShowInCustomizationForm="True" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Tên công ty" FieldName="CompanyName" 
                        ShowInCustomizationForm="True" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Loại thiết bị" FieldName="EquTypeName" 
                        ShowInCustomizationForm="True" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="Model" 
                        ShowInCustomizationForm="True" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày trả KQ dự kiến" 
                        FieldName="AppointmentDate" ShowInCustomizationForm="True" VisibleIndex="8">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Trạng thái" FieldName="StatusName" 
                        VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="StatusID" ShowInCustomizationForm="True" 
                        Visible="False" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RequestDateDiff" 
                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                </Columns>
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
            </dx1:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSourceAssignInfo2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>"                    
                
        
        
                    
                    
                    
                    
                    
                    
                    
                    
        SelectCommand="SELECT Request.RequestID, Request.RequestNo, Request.ContractNo, Request.BillNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.AppointmentDate, Request.StatusID, DATEDIFF(DAY, GETDATE(), Request.AppointmentDate) AS RequestDateDiff, RequestStatus.StatusName FROM Request INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Company ON Request.CompanyID = Company.CompanyID AND Request.CompanyID = Company.CompanyID INNER JOIN RequestStatus ON Request.StatusID = RequestStatus.StatusID WHERE (Request.StatusID = 1 OR Request.StatusID = 2 OR Request.StatusID = 3) AND (DATEDIFF(DAY, GETDATE(), Request.AppointmentDate) &lt; 0) AND (Request.AppointmentDate &gt;= @BD) AND (Request.AppointmentDate &lt;= @ED)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="d1" Name="BD" PropertyName="Value" />
                    <asp:ControlParameter ControlID="d2" Name="ED" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>

    <br />
    <span class="style37"><strong>Bảng kê thu tiền Đo kiểm Bảng kê thu tiền Đo kiểm<br />
    <br />
                    <dx:ASPxButton ID="btExportExcelMoney" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xuất ra file Excel" 
                        Width="150px" onclick="btExportExcelMoney_Click">                     
                    </dx:ASPxButton>

    <br />
    </strong></span>

            <dx1:ASPxGridView ID="ASPxGridView6" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid6"
            DataSourceID="SqlDataSourceAssignInfo3" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="RequestID" 
        oncustomcolumndisplaytext="ASPxGridView4_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid6.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="Tổng phí đo thu được" FieldName="RequestID" 
                        ShowInColumn="Loại thiết bị" SummaryType="Count" />
                    <dx:ASPxSummaryItem DisplayFormat="#,##" FieldName="Price" SummaryType="Sum" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="RequestID" ReadOnly="True" 
                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" 
                        ShowInCustomizationForm="True" UnboundType="Integer" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số phiếu" FieldName="RequestNo" 
                        ShowInCustomizationForm="True" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số hợp đồng" FieldName="ContractNo" 
                        ShowInCustomizationForm="True" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Số phiếu thu" FieldName="BillNo" 
                        ShowInCustomizationForm="True" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Tên công ty" FieldName="CompanyID" 
                        ShowInCustomizationForm="True" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName" 
                            ValueField="CompanyID" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="Loại thiết bị" FieldName="EquipmentTypeDetail" 
                        ShowInCustomizationForm="True" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="Model" 
                        ShowInCustomizationForm="True" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Phí đo kiểm" FieldName="Price" 
                        ShowInCustomizationForm="True" VisibleIndex="8">
                        <PropertiesTextEdit DisplayFormatString="#,##">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Ngày ban hành KQ" 
                        FieldName="TestRPIssueDate" ShowInCustomizationForm="True" 
                        VisibleIndex="9">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Người liên hệ" FieldName="ContactID" 
                        ShowInCustomizationForm="True" VisibleIndex="11">
                        <PropertiesComboBox DataSourceID="SqlDataSourceContact" TextField="FullName" 
                            ValueField="ContactID" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="ReportNo" ShowInCustomizationForm="True" 
                        VisibleIndex="10" Caption="Số kết quả">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="ĐT liên hệ" FieldName="ContactID" 
                        ShowInCustomizationForm="True" VisibleIndex="12">
                        <PropertiesComboBox DataSourceID="SqlDataSourceContact" 
                            TextField="ContactPhone" ValueField="ContactID" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
             <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly=true ConfirmDelete=true AllowFocusedRow=true />
                <Settings ShowFooter="True" />
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
            <asp:SqlDataSource ID="SqlDataSourceAssignInfo3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>"                    
                
        
        
                    
                    
                    
                    
                    
                    
                    
                    
        
        SelectCommand="SELECT RequestID, RequestNo, ContractNo, BillNo, BillDate, CompanyID, ContactID, EquTypeID, EquTypeName, Model, Manufacturer, MadeInID, Serial_Imei, Standards, TestMethod, Accessories, ReceiveDate, ReceiveStaffID, AppointmentDate, ReturnStaffID, ReturnDate, StatusID, Note, HoldEquip, ConfirmDate, InternalNote, StaffIDNonIssue, (SELECT TestReportNo FROM TestReport WHERE (AssignmentID = Request.RequestID)) AS ReportNo, (SELECT TestReportIssueDate FROM TestReport AS TestReport_1 WHERE (AssignmentID = Request.RequestID)) AS TestRPIssueDate, (SELECT Kind FROM TestReport AS TestReport_2 WHERE (AssignmentID = Request.RequestID)) AS TestReportKind, (SELECT ReturnRPDate FROM TestReport AS TestReport_3 WHERE (AssignmentID = Request.RequestID)) AS ReturnRPDate, (SELECT ReturnStaffID FROM TestReport AS TestReport_4 WHERE (AssignmentID = Request.RequestID)) AS ReturnRPStaffID, (SELECT ReturnRBDate FROM TestReport AS TestReport_5 WHERE (AssignmentID = Request.RequestID)) AS ReturnRBDate, (SELECT ReturnRBStaffID FROM TestReport AS TestReport_6 WHERE (AssignmentID = Request.RequestID)) AS ReturnRBStaffID, (SELECT RedBillID FROM TestReport AS TestReport_7 WHERE (AssignmentID = Request.RequestID)) AS RedBillID, (SELECT HoldRedBill FROM TestReport AS TestReport_8 WHERE (AssignmentID = Request.RequestID)) AS HoldRedBill, (SELECT ApproveDate FROM TestReport AS TestReport_9 WHERE (AssignmentID = Request.RequestID)) AS ApproveDate, (SELECT Price FROM EquipmentType WHERE (EquTypeID = Request.EquTypeID)) AS Price, (SELECT EquTypeName FROM EquipmentType AS EquipmentType_1 WHERE (EquTypeID = Request.EquTypeID)) AS EquipmentTypeDetail, NonIssueDate, StaffIDApprove, ApproveNonIssueDate FROM Request WHERE (StatusID = 5) AND ((SELECT TestReportIssueDate FROM TestReport AS TestReport_1 WHERE (AssignmentID = Request.RequestID)) &gt;= @BD) AND ((SELECT TestReportIssueDate FROM TestReport AS TestReport_1 WHERE (AssignmentID = Request.RequestID)) &lt;= @ED) ORDER BY CompanyID, RequestNo">
                <SelectParameters>
                    <asp:ControlParameter ControlID="d1" Name="BD" PropertyName="Value" />
                    <asp:ControlParameter ControlID="d2" Name="ED" PropertyName="Value" />
                </SelectParameters>
            </asp:SqlDataSource>

    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" 
        FileName="Money Summary" GridViewID="ASPxGridView6" PaperKind="A4" 
        Landscape="True" LeftMargin="3" RightMargin="3" TopMargin="3">
    </dx:ASPxGridViewExporter>

    <br />

    <br />

    <dx:ASPxLabel ID="ASPxLabel6" runat="server" 
        style="color: #CC3300; font-size: medium; font-weight: 700" 
        
        Text="Tổng hợp yêu cầu đo kiểm theo khách hàng">
    </dx:ASPxLabel>

    <br />

    <br />
                    <dx:ASPxButton ID="btExportExcel" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xuất ra file Excel" 
                        Width="150px" onclick="btExportExcel_Click">                     
                    </dx:ASPxButton>

    <br />
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" 
        DataSourceID="SqlDataSource_PivotGridSumCom" 
        onfieldvaluedisplaytext="ASPxPivotGrid1_FieldValueDisplayText">
        <Fields>
            <dx:PivotGridField ID="fieldCompanyName" Area="RowArea" AreaIndex="2" 
                Caption="Công ty" FieldName="CompanyName">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldGroupEquName" Area="ColumnArea" AreaIndex="0" 
                Caption="Loại sản phẩm" FieldName="GroupEquName">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldRequestID" Area="DataArea" AreaIndex="0" 
                Caption="Số yêu cầu đo" FieldName="RequestID" SummaryType="Count">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldReceiveDateYear" AreaIndex="0" Caption="Năm" 
                FieldName="ReceiveDate.Year" Area="RowArea">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldReceiveDateMonth" AreaIndex="1" Caption="Tháng" 
                FieldName="ReceiveDate.Month" Area="RowArea">
            </dx:PivotGridField>
        </Fields>
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
    <asp:SqlDataSource ID="SqlDataSource_PivotGridSumCom" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        SelectCommand="SELECT Company.CompanyName, Company.CompanyID, Request.ReceiveDate, Request.RequestID, GroupEquipment.GroupEquName FROM Company INNER JOIN Request ON Company.CompanyID = Request.CompanyID AND Company.CompanyID = Request.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN GroupEquipment ON EquipmentType.GroupID = GroupEquipment.GroupEquID WHERE (Request.ReceiveDate &gt;= @d1) AND (Request.ReceiveDate &lt;= @d2)">
        <SelectParameters>
            <asp:ControlParameter ControlID="d1" Name="d1" PropertyName="Value" />
            <asp:ControlParameter ControlID="d2" Name="d2" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>

    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="ASPxPivotGrid1">
    </dx:ASPxPivotGridExporter>

    <br />

    <dx:ASPxLabel ID="ASPxLabel7" runat="server" 
        style="color: #CC3300; font-size: medium; font-weight: 700" 
        
        Text="Tổng hợp theo dõi môi trường phòng đo">
    </dx:ASPxLabel>

    <br />
    <br />
                    <dx:ASPxButton ID="btExportExcelEnv" runat="server" 
                        CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                        SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Xuất ra file Excel" 
                        Width="150px" onclick="btExportExcelEnv_Click">                     
                    </dx:ASPxButton>

    <br />
            <dx1:ASPxGridView ID="ASPxGridView5" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSource_Environment" 
        KeyFieldName="ID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
        CssPostfix="PlasticBlue">
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
                    <dx:GridViewDataDateColumn Caption="Ngày" FieldName="date" VisibleIndex="1">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Nhiệt độ buổi sáng" FieldName="tMor" 
                        VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Độ ẩm buổi sáng" FieldName="hMor" 
                        VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Nhiệt độ buổi chiều" FieldName="tAft" 
                        VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Độ ẩm buổi chiều" FieldName="hAft" 
                        VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Nhân viên theo dõi buổi sáng" 
                        FieldName="StaffMor" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                            ValueField="StaffID" ValueType="System.String">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="Nhân viên theo dõi buổi chiều" 
                        FieldName="StaffAft" VisibleIndex="5">
                        <PropertiesComboBox DataSourceID="SqlDataSourceStaff" TextField="StaffFistName" 
                            ValueField="StaffID" ValueType="System.String">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
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
            </dx1:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource_Environment" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        SelectCommand="SELECT * FROM [Environment] WHERE (([date] &gt;= @date) AND ([date] &lt;= @date2)) ORDER BY [date] DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="d1" DbType="Date" Name="date" 
                        PropertyName="Value" />
                    <asp:ControlParameter ControlID="d2" DbType="Date" Name="date2" 
                        PropertyName="Value" />
                </SelectParameters>
    </asp:SqlDataSource>

    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
        FileName="Environment Summary" GridViewID="ASPxGridView5" PaperKind="A4">
    </dx:ASPxGridViewExporter>

    <br />

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
        <asp:SqlDataSource ID="SqlDataSourceRedBill" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            
            SelectCommand="SELECT * FROM [RedBill] ORDER BY [RedBillNo] DESC">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceRequestStSuccsess" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            
            
            SelectCommand="SELECT * FROM [RequestStatus] WHERE (([StatusID] = 5) OR ([StatusID] = 7))">
        </asp:SqlDataSource>
</p>
    
    
    </asp:Content>
