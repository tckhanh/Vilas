<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="3-TraCuuTTNhanSu.aspx.cs" Inherits="LabManagement.TraCuuTTNhanSu" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.dxeTextBoxSys, .dxeMemoSys
{
    border-collapse:separate!important;
}

.dxeEditAreaSys
{
	width: 100%;
}

.dxeEditAreaSys, .dxeEditAreaNotStrechSys
{
	border: 0px!important;
	padding: 0px;
}
        .style23
        {
            width: 100%;
            font-size: 0;
        }
    .dxeBase
{
    font-family: Tahoma;
    font-size: 9pt;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="text-align: center; width: 801px">
                <dx1:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                    Font-Size="X-Large" ForeColor="#CC3300" 
                    Text="TRA CỨU THÔNG TIN NHÂN SỰ">
                </dx1:ASPxLabel>
        <br />
    </p>
    <p>
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" 
            AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="SqlDataSource_Staff" KeyFieldName="StaffID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView2_CustomCallback" 
            oncustomcolumndisplaytext="ASPxGridView2_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="1" 
                    Width="50px" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True">
                    <%--<EditButton Visible="True" Text="Chi tiết">
                    </EditButton>
                    <NewButton Text="Tạo mới">
                    </NewButton>
                    <DeleteButton Text="Xóa">
                    </DeleteButton>
                    <UpdateButton Text=" "></UpdateButton>
                    <CancelButton Text="Thoát"></CancelButton>
                    <ClearFilterButton Text="Bỏ lọc" Visible="True"></ClearFilterButton>--%>
                </dx:GridViewCommandColumn>
<dx:GridViewDataTextColumn FieldName="StaffID" VisibleIndex="0" ReadOnly="True" Visible="False">
</dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="STT" 
                    VisibleIndex="2" Caption="STT" ShowInCustomizationForm="True" 
                    UnboundType="Integer" Width="30px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StaffNo" VisibleIndex="3" 
                    Caption="Mã nhân viên">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataComboBoxColumn Caption="Họ và tên" FieldName="StaffID" 
                    VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="SqlDataSource_Staff" DropDownStyle="DropDown" 
                        IncrementalFilteringMode="Contains" TextField="StaffFullName" 
                        ValueField="StaffID" ValueType="System.String">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>

<dx:GridViewDataTextColumn FieldName="StaffFullName" VisibleIndex="7" Caption="Họ và tên" 
                    Visible="False">
    <EditFormSettings Visible="True" />
    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="12" Caption="Số CMND" Visible="False">
    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="PhoneNo" VisibleIndex="11" Caption="Điện thoại di động">
    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HomeAddress" VisibleIndex="13" 
                    Caption="Địa chỉ nhà" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HomePhone"  VisibleIndex="14" 
                    Caption="Điện thoại nhà" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="15" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="BeginDate" VisibleIndex="16" 
                    Caption="Ngày bắt đầu công tác" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="EndDate" VisibleIndex="17" 
                    Caption="Ngày kết thúc công tác" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Ngày sinh" FieldName="BirthDate" 
                    VisibleIndex="8">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataDateColumn>
<dx:GridViewDataTextColumn FieldName="Department" ShowInCustomizationForm="True" 
                    VisibleIndex="9" Caption="Phòng ban">
    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Position" VisibleIndex="10" 
                    Caption="Chức vụ">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="Lịch sử công tác" FieldName="WorkHistory" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn Caption="Quá trình đào tạo" FieldName="TrainHistory" 
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="22">
                    <PropertiesMemoEdit Height="100px">
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tình trạng công tác" 
                    FieldName="InWorking" VisibleIndex="23">
                    <PropertiesComboBox ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Ngưng công tác" Value="0" />
                            <dx:ListEditItem Text="Còn công tác" Value="1" />
                        </Items>
                    </PropertiesComboBox>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </dx:GridViewDataComboBoxColumn>

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
            <asp:SqlDataSource ID="SqlDataSource_Staff" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" 
            DeleteCommand="DELETE FROM [Staff] WHERE [StaffID] = @StaffID
DELETE FROM [AccessRight] WHERE [StaffID] = @StaffID" InsertCommand="INSERT INTO [Staff] ([StaffID], [StaffNo], [StaffFistName], [StaffLastName], [StaffFullName], [ID], [PhoneNo], [HomeAddress], [HomePhone], [Email], [BeginDate], [EndDate], [Department], [Position], [WorkHistory], [TrainHistory], [Username], [Password], [InWorking], [Enable],[BirthDate]) VALUES (@StaffNo, @StaffNo, @StaffFistName, @StaffLastName, @StaffFullName, @ID, @PhoneNo, @HomeAddress, @HomePhone, @Email, @BeginDate, @EndDate, @Department, @Position, @WorkHistory, @TrainHistory, @Username, @Password, @InWorking, @Enable,@BirthDate)
INSERT INTO [AccessRight] ([StaffID]) VALUES (@StaffNo)" 
            SelectCommand="SELECT StaffID, StaffNo, StaffFistName, StaffLastName, StaffFullName, ID, PhoneNo, HomeAddress, HomePhone, Email, BirthDate, BeginDate, EndDate, Department, Position, WorkHistory, TrainHistory, Username, Password, StaffImg, InWorking, Enable FROM Staff ORDER BY InWorking DESC, CAST(StaffFistName AS Nvarchar)" 
            
            
                UpdateCommand="UPDATE [Staff] SET [StaffNo] = @StaffNo, [StaffFistName] = @StaffFistName, [StaffLastName] = @StaffLastName, [StaffFullName] = @StaffFullName, [ID] = @ID, [PhoneNo] = @PhoneNo, [HomeAddress] = @HomeAddress, [HomePhone] = @HomePhone, [Email] = @Email, [BeginDate] = @BeginDate, [EndDate] = @EndDate, [Department] = @Department, [Position] = @Position, [WorkHistory] = @WorkHistory, [TrainHistory] = @TrainHistory, [Username] = @Username, [Password] = @Password,[InWorking] = @InWorking, [Enable] = @Enable,[BirthDate]=@BirthDate WHERE [StaffID] = @StaffID">
                <DeleteParameters>
                    <asp:Parameter Name="StaffID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="StaffNo" Type="String" />
                    <asp:Parameter Name="StaffFistName" Type="String" />
                    <asp:Parameter Name="StaffLastName" Type="String" />
                    <asp:Parameter Name="StaffFullName" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="PhoneNo" Type="String" />
                    <asp:Parameter Name="HomeAddress" Type="String" />
                    <asp:Parameter Name="HomePhone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter DbType="Date" Name="BeginDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                    <asp:Parameter Name="Department" Type="String" />
                    <asp:Parameter Name="Position" Type="String" />
                    <asp:Parameter Name="WorkHistory" Type="String" />
                    <asp:Parameter Name="TrainHistory" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="InWorking" Type="Int32" />
                    <asp:Parameter Name="Enable" Type="Int32" />
                    <asp:Parameter Name="BirthDate" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="StaffNo" Type="String" />
                    <asp:Parameter Name="StaffFistName" Type="String" />
                    <asp:Parameter Name="StaffLastName" Type="String" />
                    <asp:Parameter Name="StaffFullName" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="PhoneNo" Type="String" />
                    <asp:Parameter Name="HomeAddress" Type="String" />
                    <asp:Parameter Name="HomePhone" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter DbType="Date" Name="BeginDate" />
                    <asp:Parameter DbType="Date" Name="EndDate" />
                    <asp:Parameter Name="Department" Type="String" />
                    <asp:Parameter Name="Position" Type="String" />
                    <asp:Parameter Name="WorkHistory" Type="String" />
                    <asp:Parameter Name="TrainHistory" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="InWorking" Type="Int32" />
                    <asp:Parameter Name="Enable" Type="Int32" />
                    <asp:Parameter Name="BirthDate" />
                    <asp:Parameter Name="StaffID" Type="String" />
                </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
