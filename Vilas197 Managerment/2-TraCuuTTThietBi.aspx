<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyThietBi.Master" AutoEventWireup="true" CodeBehind="2-TraCuuTTThietBi.aspx.cs" Inherits="LabManagement.TraCuuTTThietBi" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style65
        {
            height: 26px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="height: 54px; width: 69%">
        <tr>
            <td style="text-align: center" valign="top" class="style65">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="X-Large" 
                    ForeColor="#CC3300" style="font-weight: 700" 
                    Text="TRA CỨU THÔNG TIN THIẾT BỊ">
                </dx:ASPxLabel>
            </td>
        </tr>
        </table>
            <table class="style19" style="width: 69%">
                <tr>
                    <td align="center">
                        <dx:ASPxButton ID="btSaveExcel" runat="server" 
                            CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                            onclick="btSaveExcel_Click" 
                            SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" 
                            Text="Xuất ra file Excel" Width="176px">
                        </dx:ASPxButton>
                    </td>
                </tr>
    </table>
    <br />
            <dx:ASPxGridView ID="grid" runat="server" 
        AutoGenerateColumns="False" ClientInstanceName="grid3"
            DataSourceID="SqlDataSource_CalibrationAll" 
    KeyFieldName="TestSysID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView3_CustomCallback" 
        style="margin-right: 0px" 
        oncustomcolumndisplaytext="ASPxGridView3_CustomColumnDisplayText" 
        onhtmlrowprepared="ASPxGridView3_HtmlRowPrepared">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid3.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" Width="50px" ShowEditButton="True">
                    <%--<EditButton Visible="True" Text="Chi tiết">
                    </EditButton>
                    <UpdateButton Text=" "></UpdateButton>
                    <ClearFilterButton Visible="True" Text="Xóa lọc">
                    </ClearFilterButton>
                    <CancelButton Text="Thoát"></CancelButton>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                    VisibleIndex="1" Width="40px">
                    <EditFormSettings Visible="False" />
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Hệ thống đo" FieldName="TestSysID" 
                    VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystem" 
                        TextField="TestSysName" ValueField="TestSysID" ValueType="System.Int32" 
                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="3" 
                    Caption="Ký hiệu">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Mã hệ thống" FieldName="TestSysNo" 
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Số giấy hiệu chuẩn" FieldName="CalibNo" 
                    ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Đơn vị hiệu chuẩn" FieldName="CalibFrom" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Ngày hiệu chuẩn" FieldName="CalibDate" 
                    VisibleIndex="7" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày hết hiệu chuẩn" FieldName="EndValidDate" 
                    VisibleIndex="8">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataMemoColumn Caption="Ghi chú" FieldName="CalibNote" Visible="False" 
                    VisibleIndex="13">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn FieldName="DayLeft" VisibleIndex="9" 
                    Caption="Số ngày còn hiệu lực" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="CalibStatus" 
                    ReadOnly="True" VisibleIndex="10">
                    <PropertiesComboBox ValueType="System.Int32">
                        <Items>
                            <dx:ListEditItem Text="Hết hạn hiệu chuẩn" Value="0" />
                            <dx:ListEditItem Text="Sắp hết hạn hiệu chuẩn" Value="1" />
                            <dx:ListEditItem Text="Còn hạn hiệu chuẩn" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Tình trạng đăng ký" 
                    FieldName="Register" VisibleIndex="11">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Không đăng ký" Value="0" />
                            <dx:ListEditItem Text="Có đăng ký" Value="1" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="CalibID" VisibleIndex="12" 
                    Visible="False">
                </dx:GridViewDataTextColumn>

            </Columns>
            <SettingsPager Summary-Text="">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
                <Settings ShowFilterRow="True" />
             <SettingsText ConfirmDelete="Bạn có muốn xóa thông tin về mẫu đo này không" />
                <SettingsDetail ShowDetailRow="True" ExportMode="All" />
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
                <Templates>
                    <DetailRow>
                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" 
                            ClientInstanceName="grid" CssFilePath="~/App_Themes/Youthful/{0}/styles.css" 
                            CssPostfix="Youthful" DataSourceID="SqlDataSource1" EnableCallBacks="False" 
                            KeyFieldName="AccID" 
                            onbeforeperformdataselect="ASPxGridView2_BeforePerformDataSelect" 
                            oncustomcolumndisplaytext="ASPxGridView2_CustomColumnDisplayText" 
                            style="margin-right: 0px" 
                            onhtmlrowprepared="ASPxGridView2_HtmlRowPrepared">
                            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0">
                                    <%--<EditButton Text="Chi tiết" Visible="True">
                                    </EditButton>
                                    <UpdateButton Text=" ">
                                    </UpdateButton>
                                    <CancelButton Text="Thoát">
                                    </CancelButton>
                                    <ClearFilterButton Text="Xóa lọc">
                                    </ClearFilterButton>--%>
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                                    VisibleIndex="1" Width="50px">
                                    <EditFormSettings Visible="False" />
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Hệ thống đo" FieldName="TestSysID" 
                                    Visible="False" VisibleIndex="3">
                                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSystem" 
                                        DropDownStyle="DropDown" IncrementalFilteringMode="Contains" 
                                        TextField="TestSysName" ValueField="TestSysID" ValueType="System.Int32">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn Caption="Mã thiết bị" FieldName="AccNo" 
                                    VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Tên thiết bị" FieldName="AccName" 
                                    VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Ký hiệu" FieldName="Model" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Serial Number" FieldName="SN" 
                                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Hãng sản xuất" FieldName="Manufacturer" 
                                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Nơi sản xuất" FieldName="CountryID" 
                                    Visible="False" VisibleIndex="9">
                                    <PropertiesComboBox DataSourceID="SqlDataSourceCountry" TextField="CountryName" 
                                        ValueField="CountryID" ValueType="System.Int32">
                                    </PropertiesComboBox>
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="AccTypeID" 
                                    Visible="False" VisibleIndex="14">
                                    <PropertiesComboBox DataSourceID="SqlDataSource_AccType" 
                                        TextField="AccTypeName" ValueField="AccTypeID" ValueType="System.String">
                                    </PropertiesComboBox>
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn Caption="Năm sản xuất" FieldName="MadeYear" 
                                    Visible="False" VisibleIndex="10">
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn Caption="Ngày nhận" FieldName="ReceiveDate" 
                                    Visible="False" VisibleIndex="11">
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataMemoColumn Caption="Thông tin bổ sung" FieldName="History" 
                                    Visible="False" VisibleIndex="17">
                                    <PropertiesMemoEdit Height="150px">
                                    </PropertiesMemoEdit>
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataMemoColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Trạng thái" FieldName="StatusID" 
                                    VisibleIndex="16">
                                    <PropertiesComboBox DataSourceID="SqlDataSource_TestSysStatus" 
                                        TextField="TestSysStatusName" ValueField="TestSysStatusID" 
                                        ValueType="System.Int32">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Tình trạng" FieldName="Hold" 
                                    VisibleIndex="15">
                                    <PropertiesComboBox DataSourceID="SqlDataSource_AccHoldStatus" 
                                        TextField="AccHoldName" ValueField="AccHoldID" ValueType="System.Int32">
                                    </PropertiesComboBox>
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Thân máy hay phụ kiện" FieldName="Body" 
                                    Visible="False" VisibleIndex="12">
                                    <PropertiesComboBox ValueType="System.String">
                                        <Items>
                                            <dx:ListEditItem Text="Phụ kiện" Value="0" />
                                            <dx:ListEditItem Text="Thân máy" Value="1" />
                                        </Items>
                                    </PropertiesComboBox>
                                    <EditFormSettings Visible="True" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="Thành phần" FieldName="MainAcc" 
                                    VisibleIndex="13">
                                    <PropertiesComboBox ValueType="System.String">
                                        <Items>
                                            <dx:ListEditItem Text="Thành phần phụ" Value="0" />
                                            <dx:ListEditItem Text="Thành phần chính" Value="1" />
                                        </Items>
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                            </Columns>
                            <SettingsPager PageSize="20" Summary-Text="">
                                <NextPageButton Text="Tiếp">
                                </NextPageButton>
                                <PrevPageButton Text="Trước">
                                </PrevPageButton>
                                <Summary Text="Trang {0}/{1} ({2} Hồ sơ)" />
                            </SettingsPager>
                            <SettingsText ConfirmDelete="Bạn có muốn xóa thông tin về mẫu đo này không" />
                            <SettingsLoadingPanel Text="" />
                            <Images SpriteCssFilePath="~/App_Themes/Youthful/{0}/sprite.css">
                                <LoadingPanelOnStatusBar Url="~/App_Themes/Youthful/GridView/gvLoadingOnStatusBar.gif">
                                </LoadingPanelOnStatusBar>
                                <LoadingPanel Url="~/App_Themes/Youthful/GridView/Loading.gif">
                                </LoadingPanel>
                            </Images>
                            <ImagesFilterControl>
                                <LoadingPanel Url="~/App_Themes/Youthful/Editors/Loading.gif">
                                </LoadingPanel>
                            </ImagesFilterControl>
                            <Styles CssFilePath="~/App_Themes/Youthful/{0}/styles.css" 
                                CssPostfix="Youthful">
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <StylesEditors>
                                <CalendarHeader Spacing="8px">
                                </CalendarHeader>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dx:ASPxGridView>
                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource_CalibrationAll" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_mang %>" 
        
        
        
        
        
    
        SelectCommand="SELECT TestSysID, TestSysNo, TestSysName, Model, Manufacturer, CountryID, MadeYear, ReceiveDate, History, StatusID, SourceID, FieldID, TestSpec, Valid, Register, (SELECT Ca.CalibID FROM Calibration AS Ca INNER JOIN TestSystem ON Ca.TestSysID = TestSystem.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration WHERE (TestSysID = Ca.TestSysID))) AND (Ca.TestSysID = TestSys.TestSysID)) AS CalibID, (SELECT Ca.CalibNo FROM Calibration AS Ca INNER JOIN TestSystem AS TestSystem_7 ON Ca.TestSysID = TestSystem_7.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration AS Calibration_7 WHERE (TestSysID = Ca.TestSysID))) AND (Ca.TestSysID = TestSys.TestSysID)) AS CalibNo, (SELECT Ca.CalibFrom FROM Calibration AS Ca INNER JOIN TestSystem AS TestSystem_6 ON Ca.TestSysID = TestSystem_6.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration AS Calibration_6 WHERE (TestSysID = Ca.TestSysID))) AND (Ca.TestSysID = TestSys.TestSysID)) AS CalibFrom, (SELECT Ca.CalibDate FROM Calibration AS Ca INNER JOIN TestSystem AS TestSystem_5 ON Ca.TestSysID = TestSystem_5.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration AS Calibration_5 WHERE (TestSysID = Ca.TestSysID))) AND (Ca.TestSysID = TestSys.TestSysID)) AS CalibDate, (SELECT Ca.EndValidDate FROM Calibration AS Ca INNER JOIN TestSystem AS TestSystem_4 ON Ca.TestSysID = TestSystem_4.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration AS Calibration_4 WHERE (TestSysID = Ca.TestSysID))) AND (Ca.TestSysID = TestSys.TestSysID)) AS EndValidDate, (SELECT Ca.Note FROM Calibration AS Ca INNER JOIN TestSystem AS TestSystem_3 ON Ca.TestSysID = TestSystem_3.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration AS Calibration_3 WHERE (TestSysID = Ca.TestSysID))) AND (Ca.TestSysID = TestSys.TestSysID)) AS CalibNote, (SELECT DATEDIFF(DAY, GETDATE(), Ca.EndValidDate) AS DayLeft FROM Calibration AS Ca INNER JOIN TestSystem AS TestSystem_2 ON Ca.TestSysID = TestSystem_2.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration AS Calibration_2 WHERE (TestSysID = Ca.TestSysID))) AND (Ca.TestSysID = TestSys.TestSysID)) AS DayLeft, (SELECT CASE WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 180 THEN 2 WHEN (DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 180 AND DATEDIFF(DAY , GETDATE() , EndValidDate) &gt; 0) THEN 1 WHEN DATEDIFF(DAY , GETDATE() , EndValidDate) &lt; 0 THEN 0 END AS Status FROM Calibration AS Ca INNER JOIN TestSystem AS TestSystem_1 ON Ca.TestSysID = TestSystem_1.TestSysID WHERE (Ca.EndValidDate = (SELECT MAX(EndValidDate) AS Expr1 FROM Calibration AS Calibration_1 WHERE (TestSysID = Ca.TestSysID))) AND (Ca.TestSysID = TestSys.TestSysID)) AS CalibStatus FROM TestSystem AS TestSys ORDER BY Register DESC, TestSysNo">
    </asp:SqlDataSource>
    <dx:ASPxGridViewExporter ID="exporter" runat="server">
    </dx:ASPxGridViewExporter>
    <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                SelectCommand="SELECT AccID, TestSysID, AccNo, AccName, Model, SN, Manufacturer, CountryID, AccTypeID, MadeYear, ReceiveDate, History, StatusID, Hold, Body, MainAcc, Valid FROM TestAccessory WHERE (TestSysID = @TestSysID)" 
                DeleteCommand="DELETE FROM [TestAccessory] WHERE [AccID] = @AccID" 
                InsertCommand="INSERT INTO [TestAccessory] ([TestSysID], [AccNo], [AccName], [Model], [SN], [Manufacturer], [CountryID], [AccTypeID], [MadeYear], [ReceiveDate], [History], [StatusID], [Hold], [Body], [MainAcc], [Valid]) VALUES (@TestSysID, @AccNo, @AccName, @Model, @SN, @Manufacturer, @CountryID, @AccTypeID, @MadeYear, @ReceiveDate, @History, @StatusID, @Hold, @Body, @MainAcc, @Valid)" 
                
                UpdateCommand="UPDATE [TestAccessory] SET [TestSysID] = @TestSysID, [AccNo] = @AccNo, [AccName] = @AccName, [Model] = @Model, [SN] = @SN, [Manufacturer] = @Manufacturer, [CountryID] = @CountryID, [AccTypeID] = @AccTypeID, [MadeYear] = @MadeYear, [ReceiveDate] = @ReceiveDate, [History] = @History, [StatusID] = @StatusID, [Hold] = @Hold, [Body] = @Body, [MainAcc] = @MainAcc, [Valid] = @Valid WHERE [AccID] = @AccID">
                <DeleteParameters>
                    <asp:Parameter Name="AccID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TestSysID" Type="Int32" />
                    <asp:Parameter Name="AccNo" Type="String" />
                    <asp:Parameter Name="AccName" Type="String" />
                    <asp:Parameter Name="Model" Type="String" />
                    <asp:Parameter Name="SN" Type="String" />
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="CountryID" Type="Int32" />
                    <asp:Parameter Name="AccTypeID" Type="Int32" />
                    <asp:Parameter Name="MadeYear" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ReceiveDate" />
                    <asp:Parameter Name="History" Type="String" />
                    <asp:Parameter Name="StatusID" Type="Int32" />
                    <asp:Parameter Name="Hold" Type="Int32" />
                    <asp:Parameter Name="Body" Type="Int32" />
                    <asp:Parameter Name="MainAcc" Type="Int32" />
                    <asp:Parameter Name="Valid" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="TestSysID" SessionField="TestSysID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TestSysID" Type="Int32" />
                    <asp:Parameter Name="AccNo" Type="String" />
                    <asp:Parameter Name="AccName" Type="String" />
                    <asp:Parameter Name="Model" Type="String" />
                    <asp:Parameter Name="SN" Type="String" />
                    <asp:Parameter Name="Manufacturer" Type="String" />
                    <asp:Parameter Name="CountryID" Type="Int32" />
                    <asp:Parameter Name="AccTypeID" Type="Int32" />
                    <asp:Parameter Name="MadeYear" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="ReceiveDate" />
                    <asp:Parameter Name="History" Type="String" />
                    <asp:Parameter Name="StatusID" Type="Int32" />
                    <asp:Parameter Name="Hold" Type="Int32" />
                    <asp:Parameter Name="Body" Type="Int32" />
                    <asp:Parameter Name="MainAcc" Type="Int32" />
                    <asp:Parameter Name="Valid" Type="Int32" />
                    <asp:Parameter Name="AccID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
    
    </p>
<p>
  
        <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            SelectCommand="SELECT * FROM [Country]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestSysStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestSysStatus]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestSystem" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestSystem]"></asp:SqlDataSource>
                     
        <asp:SqlDataSource ID="SqlDataSource_TestSystemSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestSystemSource]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_TestField" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [TestField]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_AccType" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [AccType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource_AccHoldStatus" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            SelectCommand="SELECT * FROM [AccHoldStatus]"></asp:SqlDataSource>
</p>
                     
    <br />
                     
    </asp:Content>
