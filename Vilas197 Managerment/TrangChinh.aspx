<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyMau.Master" AutoEventWireup="true" CodeBehind="TrangChinh.aspx.cs" Inherits="LabManagement.TrangChinh" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="#CC3300" 
            Text="Danh sách các yêu cầu đo kiểm được phân công cho">
                </dx:ASPxLabel>
    &nbsp;<dx:ASPxLabel ID="lblUsername" runat="server" Font-Italic="True" Font-Size="Medium" 
                    ForeColor="#003366" Font-Bold="True">
                </dx:ASPxLabel>
    &nbsp;
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="#CC3300" 
            Text="chờ xác nhận">
                </dx:ASPxLabel>
    </p>
    
    <p>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="SqlDataSourceAssignInfo" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="AssignmentID" 
                oncustomcallback="ASPxGridView1_CustomCallback" 
                    onhtmlrowprepared="ASPxGridView1_HtmlRowPrepared" Width="1000px">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="RequestID" Visible=false
                    VisibleIndex="1" ReadOnly="True">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RequestNo" VisibleIndex="2" 
                    Caption="Số phiếu">
                     <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên công ty" FieldName="CompanyID" 
                    VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="SqlDataSourceCompany" TextField="CompanyName" 
                        ValueField="CompanyID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Loại thiết bị" FieldName="EquTypeID" 
                    VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="SqlDataSourceEquipment" 
                        TextField="EquTypeName" ValueField="EquTypeID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Model" VisibleIndex="5" Caption="Ký hiệu">
                <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Manufacturer" VisibleIndex="6" 
                    Caption="Hãng sản xuất">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serial_Imei" VisibleIndex="7" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ReceiveDate" VisibleIndex="8" 
                    Caption="Ngày nhận mẫu" Visible=false>
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AppointmentDate" VisibleIndex="9" 
                    Caption="Ngày trả dự kiến">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="AssignDate" VisibleIndex="10" 
                    Caption="Ngày phân công">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffID" VisibleIndex="11" 
                    Visible=false >
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AssignStaffName" Caption="Người phân công"
                    VisibleIndex="12">
                    <EditFormSettings Visible="False"/>
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff1ID" VisibleIndex="13" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TestStaff1ID" 
                    caption="Nhân viên đo 1" VisibleIndex="22" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn FieldName="TestStaff2ID" VisibleIndex="15" 
                    Visible=false>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TestStaff2ID" 
                    caption="Nhân viên đo 2" VisibleIndex="22" 
                    ShowInCustomizationForm="True">
                     <PropertiesComboBox    ValueType="System.String" DataSourceID="SqlDataSourceStaff" 
                        TextField= "StaffFistName" ValueField="StaffID">
                     </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="StatusName" VisibleIndex="17" 
                    Caption="Ghi chú" Visible=false>
                </dx:GridViewDataTextColumn>

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
            <asp:SqlDataSource ID="SqlDataSourceAssignInfo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:db_mang %>"                    
                
                SelectCommand="SELECT Request.RequestID, Request.RequestNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.Manufacturer, Request.Serial_Imei, Request.ReceiveDate, Request.AppointmentDate, Assignment.AssignDate, AssignStaff.StaffID AS AssignStaffID, AssignStaff.StaffFistName AS AssignStaffName, TestStaff1.StaffID AS TestStaff1ID, TestStaff1.StaffFistName AS Test1StaffName, TestStaff2.StaffID AS TestStaff2ID, TestStaff2.StaffFistName AS Test2StaffName, RequestStatus.StatusName, Assignment.AssignmentID, Assignment.TestStaffID1, Assignment.TestStaffID2, Assignment.AssignNote, Request.CompanyID, Request.EquTypeID FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff) AS AssignStaff ON Assignment.AssignStaffID = AssignStaff.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_2) AS TestStaff1 ON Assignment.TestStaffID1 = TestStaff1.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_1) AS TestStaff2 ON Assignment.TestStaffID2 = TestStaff2.StaffID INNER JOIN Company ON Request.CompanyID = Company.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID INNER JOIN RequestStatus ON Request.StatusID = RequestStatus.StatusID WHERE (RequestStatus.StatusID = 2) AND (TestStaff1.StaffID = @TestStaff1ID) OR (RequestStatus.StatusID = 2) AND (TestStaff2.StaffID = @TestStaff1ID) ORDER BY Assignment.AssignDate DESC"           
                
                
                DeleteCommand="DELETE FROM Assignment WHERE (AssignmentID = @AssignmentID)">
                <DeleteParameters>
                    <asp:Parameter Name="AssignmentID" Type="Int32"/>
                </DeleteParameters>
                
                <SelectParameters>
                    <asp:SessionParameter Name="TestStaff1ID" SessionField="StaffID" />
                </SelectParameters>
                
            </asp:SqlDataSource>
    
    </p>
    <p>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="#CC3300" 
            Text="Danh sách các yêu cầu đo kiểm được phân công cho">
                </dx:ASPxLabel>
                <dx:ASPxLabel ID="lblUsername1" runat="server" Font-Italic="True" Font-Size="Medium" 
                    ForeColor="#003366" Font-Bold="True">
                </dx:ASPxLabel>
    &nbsp;
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Bold="True" 
                    Font-Size="Medium" ForeColor="#CC3300" 
            Text="đang xử lý">
                </dx:ASPxLabel>
    </p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid2"
            DataSourceID="SqlDataSourceAssignInfo1" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                KeyFieldName="AssignmentID" 
                oncustomcallback="ASPxGridView2_CustomCallback" 
        onhtmlrowprepared="ASPxGridView2_HtmlRowPrepared" Width="1000px">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
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
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="DeleteButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Sửa đổi">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="UpdateButton" Text=" ">
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
                
        
        
        
        
        SelectCommand="SELECT Request.RequestID, Request.RequestNo, Company.CompanyName, EquipmentType.EquTypeName, Request.Model, Request.Manufacturer, Request.Serial_Imei, Request.ReceiveDate, Request.AppointmentDate, Assignment.AssignDate, AssignStaff.StaffID AS AssignStaffID, AssignStaff.StaffFistName AS AssignStaffName, TestStaff1.StaffID AS TestStaff1ID, TestStaff1.StaffFistName AS Test1StaffName, TestStaff2.StaffID AS TestStaff2ID, TestStaff2.StaffFistName AS Test2StaffName, RequestStatus.StatusName, Assignment.AssignmentID, Assignment.TestStaffID1, Assignment.TestStaffID2, Assignment.AssignNote, Request.ConfirmDate, Request.RecheckStatusID, Request.StatusID, Request.ReceiveStaffID FROM Request INNER JOIN Assignment ON Request.RequestID = Assignment.AssignmentID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff) AS AssignStaff ON Assignment.AssignStaffID = AssignStaff.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_2) AS TestStaff1 ON Assignment.TestStaffID1 = TestStaff1.StaffID INNER JOIN (SELECT StaffID, StaffFistName FROM Staff AS Staff_1) AS TestStaff2 ON Assignment.TestStaffID2 = TestStaff2.StaffID INNER JOIN Company ON Request.CompanyID = Company.CompanyID INNER JOIN EquipmentType ON Request.EquTypeID = EquipmentType.EquTypeID INNER JOIN Province ON Company.ProvinceID = Province.ProvinceID INNER JOIN RequestStatus ON Request.StatusID = RequestStatus.StatusID WHERE (RequestStatus.StatusID = 3) AND (TestStaff1.StaffID = @StaffID) AND (Request.RecheckStatusID IS NULL OR Request.RecheckStatusID = 4) OR (RequestStatus.StatusID = 3) AND (TestStaff2.StaffID = @StaffID) AND (Request.RecheckStatusID IS NULL OR Request.RecheckStatusID = 4) OR (TestStaff1.StaffID = @StaffID) AND (Request.RecheckStatusID = 1 OR Request.RecheckStatusID = 3) OR (TestStaff2.StaffID = @StaffID) AND (Request.RecheckStatusID = 1 OR Request.RecheckStatusID = 3) ORDER BY Request.RecheckStatusID DESC, Assignment.AssignDate DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="StaffID" SessionField="StaffID" />
                </SelectParameters>              
            </asp:SqlDataSource>

         <asp:SqlDataSource ID="SqlDataSourceStaff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            
            
            
            SelectCommand="SELECT * FROM [Staff] ORDER BY CONVERT (nvarchar(500), StaffFistName)">
        </asp:SqlDataSource>
                      
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
                      
        <asp:SqlDataSource ID="SqlDataSourceRequestSt" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            
            SelectCommand="SELECT * FROM [RequestStatus]">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSourceRecheckSt" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>"      
            
            SelectCommand="SELECT * FROM [RecheckStatus]">
        </asp:SqlDataSource>

    <br />
                      
    </asp:Content>
