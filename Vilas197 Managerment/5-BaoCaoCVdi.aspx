<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="5-BaoCaoCVdi.aspx.cs" Inherits="LabManagement.BaoCaoCVdi" %>
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
            height: 297px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style19" style="width: 77%; height: 51px">
        <tr>
            <td class="style23" style="text-align: center">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                    Font-Size="X-Large" ForeColor="#CC3300" 
                    Text="BÁO CÁO THỐNG KÊ CÔNG VĂN ĐI">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>

        <table class="style19" style="height: 108px; width: 67%">
            <tr>
                <td colspan="4" class="style28">
                    &nbsp;</td>
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
    <p>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" 
            style="color: #CC3300; font-size: medium; font-weight: 700" 
            Text="Số liệu tổng hợp tình hình Công văn đi và đến">
        </dx:ASPxLabel>
    </p>
        <table class="style19" style="height: 334px; width: 99%">
            <tr>
                <td class="style34">
    <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" 
        DataSourceID="ASPxPivotGrid2" SeriesDataMember="Series" SideBySideEqualBarWidth="True" 
                        Height="200px" Width="300px">
        <diagramserializable>
            <cc1:XYDiagram>
                <axisx visibleinpanesserializable="-1">
                    <label staggered="True" />
                    <range sidemarginsenabled="True" />
                </axisx>
                <axisy visibleinpanesserializable="-1">
                    <range sidemarginsenabled="True" />
                </axisy>
            </cc1:XYDiagram>
        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
            MaxVerticalPercentage="30"></legend>

<SeriesTemplate argumentdatamember="Arguments" valuedatamembersserializable="Values"><ViewSerializable>

<cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView></ViewSerializable>
<LabelSerializable>

<cc1:SideBySideBarSeriesLabel LineVisible="True" ResolveOverlappingMode="Default"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle></cc1:SideBySideBarSeriesLabel></LabelSerializable>
<PointOptionsSerializable>

<cc1:PointOptions></cc1:PointOptions></PointOptionsSerializable>
<LegendPointOptionsSerializable>

<cc1:PointOptions></cc1:PointOptions></LegendPointOptionsSerializable>
</SeriesTemplate>
        <titles>
            <cc1:ChartTitle Text="Đồ thị thống kê số công văn đi" 
                Font="Tahoma, 13pt, style=Bold" />
        </titles>
    </dxchartsui:WebChartControl>
                </td>
                <td class="style34">
    <dxchartsui:WebChartControl ID="WebChartControl5" runat="server" 
        DataSourceID="ASPxPivotGrid3" Height="200px" Width="300px" SeriesDataMember="Series" 
                        SideBySideEqualBarWidth="True">
        <diagramserializable>
            <cc1:XYDiagram>
                <axisx visibleinpanesserializable="-1">
                    <label staggered="True" />
                    <range sidemarginsenabled="True" />
                </axisx>
                <axisy visibleinpanesserializable="-1">
                    <range sidemarginsenabled="True" />
                </axisy>
            </cc1:XYDiagram>
        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
            MaxVerticalPercentage="30"></legend>

<SeriesTemplate argumentdatamember="Arguments" valuedatamembersserializable="Values"><ViewSerializable>

<cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView></ViewSerializable>
<LabelSerializable>

<cc1:SideBySideBarSeriesLabel LineVisible="True" ResolveOverlappingMode="Default"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle></cc1:SideBySideBarSeriesLabel></LabelSerializable>
<PointOptionsSerializable>

<cc1:PointOptions></cc1:PointOptions></PointOptionsSerializable>
<LegendPointOptionsSerializable>

<cc1:PointOptions></cc1:PointOptions></LegendPointOptionsSerializable>
</SeriesTemplate>
        <titles>
            <cc1:ChartTitle Text="Đồ thị thống kê số công văn đến" 
                Font="Tahoma, 13pt, style=Bold" />
        </titles>
    </dxchartsui:WebChartControl>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxPivotGrid ID="ASPxPivotGrid2" runat="server" ClientIDMode="AutoID" 
                        DataSourceID="SqlDataSourceCVDi">
                        <Fields>
                            <dx:PivotGridField ID="fieldOfficeName" Area="RowArea" AreaIndex="0" 
                                Caption="Đơn vị nhận CV" FieldName="OfficeName">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDocCatName" Area="ColumnArea" AreaIndex="0" 
                                Caption="Loại CV" FieldName="DocCatName">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDocYear" Area="RowArea" AreaIndex="0" Caption="Năm" 
                                FieldName="DocYear" Visible="False">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDocID" Area="DataArea" AreaIndex="0" 
                                Caption="Công văn" FieldName="DocID">
                            </dx:PivotGridField>
                        </Fields>
                        <OptionsView ShowColumnGrandTotalHeader="False" ShowColumnGrandTotals="False" 
                            ShowRowGrandTotalHeader="False" ShowRowGrandTotals="False" />
                        <OptionsChartDataSource FieldValuesProvideMode="DisplayText" 
                            ProvideColumnGrandTotals="False" ProvideRowGrandTotals="False" />
                    </dx:ASPxPivotGrid>
                </td>
                <td>
                    <dx:ASPxPivotGrid ID="ASPxPivotGrid3" runat="server" ClientIDMode="AutoID" 
                        DataSourceID="SqlDataSourceCVDen">
                        <Fields>
                            <dx:PivotGridField ID="fieldOfficeName0" Area="RowArea" AreaIndex="0" 
                                Caption="Đơn vị nhận CV" FieldName="OfficeName">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDocCatName0" Area="ColumnArea" AreaIndex="0" 
                                Caption="Loại CV" FieldName="DocCatName">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDocYear0" Area="RowArea" AreaIndex="0" 
                                Caption="Năm" FieldName="DocYear" Visible="False">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDocID0" Area="DataArea" AreaIndex="0" 
                                Caption="Công văn" FieldName="DocID">
                            </dx:PivotGridField>
                        </Fields>
                        <OptionsView ShowColumnGrandTotalHeader="False" ShowColumnGrandTotals="False" 
                            ShowRowGrandTotalHeader="False" ShowRowGrandTotals="False" />
                        <OptionsChartDataSource FieldValuesProvideMode="DisplayText" 
                            ProvideColumnGrandTotals="False" ProvideRowGrandTotals="False" />
                    </dx:ASPxPivotGrid>
                </td>
            </tr>
            <tr>
                <td>
        <asp:SqlDataSource ID="SqlDataSourceCVDi" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
                        SelectCommand="SELECT QS_Offices.OfficeName, QS_DocCategories.DocCatName, YEAR(QS_DocOuts.DocDate) AS DocYear, MONTH(QS_DocOuts.DocDate) AS DocMonth, QS_DocOuts.DocID FROM QS_DocOuts INNER JOIN QS_DocCategories ON QS_DocOuts.DocCatID = QS_DocCategories.DocCatID INNER JOIN QS_Offices ON QS_DocOuts.OfficeID = QS_Offices.OfficeID WHERE (QS_DocCategories.Invalid = 0) AND (QS_DocOuts.Deleted = 0)">
        </asp:SqlDataSource>
    
                </td>
                <td>
        <asp:SqlDataSource ID="SqlDataSourceCVDen" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
                        SelectCommand="SELECT QS_Offices.OfficeName, QS_DocCategories.DocCatName, YEAR(QS_DocIns.DocDate) AS DocYear, MONTH(QS_DocIns.DocDate) AS DocMonth, QS_DocIns.DocID FROM QS_DocIns INNER JOIN QS_DocCategories ON QS_DocIns.DocCatID = QS_DocCategories.DocCatID INNER JOIN QS_Offices ON QS_DocIns.OfficeID = QS_Offices.OfficeID WHERE (QS_DocCategories.Invalid = 0) AND (QS_DocIns.Deleted = 0)">
        </asp:SqlDataSource>
    
                </td>
            </tr>
    </table>
    <br />
    
        <br />
    <table class="style19" style="height: 334px; width: 99%">
        <tr>
            <td class="style34">
                <dxchartsui:WebChartControl ID="WebChartControl6" runat="server" 
                    DataSourceID="SqlDataSourceCVDi0" Height="200px" Width="300px">
                    <diagramserializable>
                        <cc1:SimpleDiagram3D RotationMatrixSerializable="1;0;0;0;0;0.5;-0.866025403784439;0;0;0.866025403784439;0.5;0;0;0;0;1">
                        </cc1:SimpleDiagram3D>
                    </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                    <legend direction="BottomToTop" equallyspaceditems="False"></legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="OfficeName" Name="Series 1" 
                            SynchronizePointOptions="False" ValueDataMembersSerializable="CountDoc">
                            <viewserializable>
                                <cc1:Pie3DSeriesView>
                                </cc1:Pie3DSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:Pie3DSeriesLabel LineVisible="True">
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                </cc1:Pie3DSeriesLabel>
                            </labelserializable>
                            <pointoptionsserializable>
                                <cc1:PiePointOptions>
                                </cc1:PiePointOptions>
                            </pointoptionsserializable>
                            <legendpointoptionsserializable>
                                <cc1:PiePointOptions PointView="Argument">
                                    <valuenumericoptions format="Percent" precision="0" />
                                </cc1:PiePointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate argumentdatamember="OfficeName" 
                        valuedatamembersserializable="CountDoc">
                        <viewserializable>
                            <cc1:Pie3DSeriesView>
                            </cc1:Pie3DSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:Pie3DSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                            </cc1:Pie3DSeriesLabel>
                        </labelserializable>
                        <pointoptionsserializable>
                            <cc1:PiePointOptions>
                                <valuenumericoptions format="Percent" precision="0" />
                            </cc1:PiePointOptions>
                        </pointoptionsserializable>
                        <legendpointoptionsserializable>
                            <cc1:PiePointOptions>
                                <valuenumericoptions format="Percent" precision="0" />
                            </cc1:PiePointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Font="Tahoma, 14pt, style=Bold" 
                            Text="Thống kê loại công văn đi" />
                    </titles>
                </dxchartsui:WebChartControl>
            </td>
            <td class="style34">
                <dxchartsui:WebChartControl ID="WebChartControl7" runat="server" 
                    DataSourceID="SqlDataSourceCVDen0" Height="200px" Width="300px">
                    <diagramserializable>
                        <cc1:SimpleDiagram3D RotationMatrixSerializable="1;0;0;0;0;0.5;-0.866025403784439;0;0;0.866025403784439;0.5;0;0;0;0;1">
                        </cc1:SimpleDiagram3D>
                    </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                    <legend direction="BottomToTop" equallyspaceditems="False"></legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="OfficeName" Name="Series 1" 
                            SynchronizePointOptions="False" ValueDataMembersSerializable="CountDoc">
                            <viewserializable>
                                <cc1:Pie3DSeriesView>
                                </cc1:Pie3DSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:Pie3DSeriesLabel LineVisible="True">
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                </cc1:Pie3DSeriesLabel>
                            </labelserializable>
                            <pointoptionsserializable>
                                <cc1:PiePointOptions>
                                </cc1:PiePointOptions>
                            </pointoptionsserializable>
                            <legendpointoptionsserializable>
                                <cc1:PiePointOptions PointView="Argument">
                                    <valuenumericoptions format="Percent" precision="0" />
                                </cc1:PiePointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate argumentdatamember="OfficeName" 
                        valuedatamembersserializable="CountDoc">
                        <viewserializable>
                            <cc1:Pie3DSeriesView>
                            </cc1:Pie3DSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:Pie3DSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                            </cc1:Pie3DSeriesLabel>
                        </labelserializable>
                        <pointoptionsserializable>
                            <cc1:PiePointOptions>
                                <valuenumericoptions format="Percent" precision="0" />
                            </cc1:PiePointOptions>
                        </pointoptionsserializable>
                        <legendpointoptionsserializable>
                            <cc1:PiePointOptions>
                                <valuenumericoptions format="Percent" precision="0" />
                            </cc1:PiePointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Font="Tahoma, 14pt, style=Bold" 
                            Text="Thống kê loại công văn đi" />
                    </titles>
                </dxchartsui:WebChartControl>
            </td>
        </tr>
        <tr>
            <td>
        <asp:SqlDataSource ID="SqlDataSourceCVDi0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
                    SelectCommand="SELECT QS_Offices.OfficeName, COUNT(QS_DocOuts.DocID) AS CountDoc FROM QS_DocOuts INNER JOIN QS_Offices ON QS_DocOuts.OfficeID = QS_Offices.OfficeID WHERE (QS_DocOuts.Deleted = 0) AND (QS_DocOuts.Invalid = 0) GROUP BY QS_Offices.OfficeName">
        </asp:SqlDataSource>
    
            </td>
            <td>
        <asp:SqlDataSource ID="SqlDataSourceCVDen0" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
                    SelectCommand="SELECT QS_Offices.OfficeName, COUNT(QS_DocIns.DocID) AS CountDoc FROM QS_DocIns INNER JOIN QS_Offices ON QS_DocIns.OfficeID = QS_Offices.OfficeID WHERE (QS_DocIns.Deleted = 0) AND (QS_DocIns.Invalid = 0) GROUP BY QS_Offices.OfficeName">
        </asp:SqlDataSource>
    
            </td>
        </tr>
    </table>
    <br />
    
    
    </asp:Content>
