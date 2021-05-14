<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CauHinhHT.Master" AutoEventWireup="true" CodeBehind="0-CauhinhHT.aspx.cs" Inherits="LabManagement._0_CauhinhHT" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .dxgvControl_PlasticBlue,
        .dxgvDisabled_PlasticBlue {
            border: Solid 1px #CCCCCC;
            border-top-style: none;
            font: 9pt Tahoma;
            background-color: #F0F0F0;
            color: #000000;
            cursor: default;
        }

        .dxgvTable_PlasticBlue {
            background-color: #F0F0F0;
            border: 0;
            border-collapse: separate !important;
            overflow: hidden;
            font: 9pt Tahoma;
            color: #000000;
        }

        .dxgvHeader_PlasticBlue {
            cursor: pointer;
            white-space: nowrap;
            padding: 7px 6px 7px 6px;
            border: solid 1px #2c4182;
            border-top-style: none;
            background-position: top;
            background-repeat: repeat-x;
            background-color: #415698;
            overflow: hidden;
            font-weight: normal;
            text-align: left;
        }

        .dxgvFocusedRow_PlasticBlue {
            background-color: #5066ac;
        }

        .dxgvCommandColumn_PlasticBlue {
            padding: 0px 2px 0px 2px;
        }

        .dxgvDataRow_PlasticBlue {
            background-color: #FFFFFF;
            color: #000000;
        }

        .dxgvPagerTopPanel_PlasticBlue,
        .dxgvPagerBottomPanel_PlasticBlue {
            padding: 6px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="text-align: center; width: 777px;">
        <dx1:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True"
            Font-Size="X-Large" ForeColor="#CC3300"
            Text="CẤU HÌNH CÁC THÔNG SỐ HỆ THỐNG">
        </dx1:ASPxLabel>
    </p>
    <p>
        <dx1:ASPxLabel ID="ASPxLabel4" runat="server"
            Style="color: #CC3300; font-size: medium; font-weight: 700"
            Text="Thông tin đánh số văn bản">
        </dx1:ASPxLabel>
    </p>
    <p>
        <dx:ASPxGridView ID="ASPxGridView3" runat="server"
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="Number" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
            KeyFieldName="ID">

            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }"></ClientSideEvents>

            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

            <SettingsEditing Mode="Inline" />

            <SettingsText ConfirmDelete="Bạn c&#243; muốn x&#243;a th&#244;ng tin về mẫu đo n&#224;y kh&#244;ng"></SettingsText>

            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />

            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Sửa đổi">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="ClearFilterButton" Text="Xóa lọc">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="UpdateButton" Text="Cập nhật">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="CancelButton" Text="Thoát">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>--%>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="RequestNo" VisibleIndex="1"
                    Caption="Số phiếu yêu cầu đo kiểm hiện tại" Width="100px">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BillNo" VisibleIndex="2"
                    Caption="Số phiếu thu hiện tại" Width="100px">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TestNo" VisibleIndex="3"
                    Caption="Số kết quả đo hiện tại" Width="100px">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Year" VisibleIndex="4"
                    Caption="Hậu tố năm" Width="100px">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="YearFull" VisibleIndex="5"
                    Caption="Năm hiện tại" Width="100px">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HandoverNo" VisibleIndex="8"
                    Caption="Số phiếu bàn giao thiết bị hiện tại" Width="100px">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>


            <SettingsPager Summary-Text="" ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;"></NextPageButton>
                <PrevPageButton Text="&lt; Prev"></PrevPageButton>
                <Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>

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
        <asp:LinqDataSource ID="Number" runat="server"
            ContextTypeName="LabManagement.LINQ.LabdataDataContext" EnableDelete="True"
            EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Numbers">
        </asp:LinqDataSource>
    </p>
    <p>
        <dx1:ASPxLabel ID="ASPxLabel5" runat="server"
            Style="color: #CC3300; font-size: medium; font-weight: 700"
            Text="Thông tin lấy số Công văn đi và đến">
        </dx1:ASPxLabel>
        <dx:ASPxGridView ID="ASPxGridView4" runat="server"
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="Number0" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
            KeyFieldName="Year">

            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }"></ClientSideEvents>

            <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

            <SettingsEditing Mode="Inline" />

            <SettingsText ConfirmDelete="Bạn có muốn xóa thông tin này không"></SettingsText>

            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />

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
                        <dx:GridViewCommandColumnCustomButton ID="ClearFilterButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="CancelButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>--%>                    
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Year" VisibleIndex="1"
                    Caption="Năm">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocNoIn" VisibleIndex="2"
                    Caption="Số CV đến">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocNoOut" VisibleIndex="3"
                    Caption="Số CV đi">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>


            <SettingsPager Summary-Text="" ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;"></NextPageButton>
                <PrevPageButton Text="&lt; Prev"></PrevPageButton>
                <Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>

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
        <asp:LinqDataSource ID="Number0" runat="server"
            ContextTypeName="LabManagement.QSDataContext" EnableDelete="True"
            EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="QS_Options">
        </asp:LinqDataSource>
    </p>
    <p>
        <dx1:ASPxLabel ID="ASPxLabel6" runat="server"
            Style="color: #CC3300; font-size: medium; font-weight: 700"
            Text="Thông tin co quan gui nhan cong van">
        </dx1:ASPxLabel>
    </p>
    <dx:ASPxGridView ID="ASPxGridView5" runat="server"
        AutoGenerateColumns="False" ClientInstanceName="grid1"
        DataSourceID="Number1" EnableCallBacks="False"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
        KeyFieldName="OfficeID">

        <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }"></ClientSideEvents>

        <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

        <SettingsEditing Mode="Inline" />

        <SettingsText ConfirmDelete="Bạn có muốn xóa thông tin này không"></SettingsText>

        <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />

        <Columns>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                <%--<CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="NewButton" Text="Tạo mới">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="DeleteButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Chi tiết">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="UpdateButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="ClearFilterButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton ID="CancelButton" Text=" ">
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>--%>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="OfficeID" VisibleIndex="1"
                ReadOnly="True" ShowInCustomizationForm="True" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OfficeCode" VisibleIndex="2"
                ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="OfficeName" VisibleIndex="3"
                ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
        </Columns>


        <SettingsPager Summary-Text="" ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;"></NextPageButton>
            <PrevPageButton Text="&lt; Prev"></PrevPageButton>
            <Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
        </SettingsPager>

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
    <asp:LinqDataSource ID="Number1" runat="server"
        ContextTypeName="LabManagement.QSDataContext" EnableDelete="True"
        EnableInsert="True" EnableUpdate="True" EntityTypeName=""
        TableName="QS_Offices">
    </asp:LinqDataSource>
    <p>
        <dx1:ASPxLabel ID="ASPxLabel2" runat="server"
            Style="color: #CC3300; font-size: medium; font-weight: 700"
            Text="Danh sách quốc gia">
        </dx1:ASPxLabel>
    </p>
    <p>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server"
            AutoGenerateColumns="False" ClientInstanceName="grid1"
            DataSourceID="Contry" KeyFieldName="CountryID" EnableCallBacks="False"
            OnCustomColumnDisplayText="ASPxGridView1_CustomColumnDisplayText"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">

            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }"></ClientSideEvents>

            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True"
                AllowSelectSingleRowOnly="True" ConfirmDelete="True"></SettingsBehavior>

            <SettingsText ConfirmDelete="Bạn c&#243; muốn x&#243;a th&#244;ng tin về mẫu đo n&#224;y kh&#244;ng"></SettingsText>

            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />

            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="3">
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
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tên nước" FieldName="CountryID"
                    ReadOnly="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="Contry" DropDownStyle="DropDown"
                        IncrementalFilteringMode="Contains" TextField="CountryName"
                        ValueField="CountryID" ValueType="System.Int32">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="STT" VisibleIndex="0" Caption="STT"
                    UnboundType="Integer" Width="20px">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tên nước" FieldName="CountryName"
                    ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
            </Columns>

            <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="true" AllowFocusedRow="true" />

            <SettingsPager Summary-Text="" ShowDefaultImages="False">
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;"></NextPageButton>
                <PrevPageButton Text="&lt; Prev"></PrevPageButton>
                <Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
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
        <asp:LinqDataSource ID="Contry" runat="server"
            ContextTypeName="LabManagement.LINQ.LabdataDataContext" EnableDelete="True"
            EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Countries">
        </asp:LinqDataSource>
    </p>
    <p>
        <dx1:ASPxLabel ID="ASPxLabel3" runat="server"
            Style="color: #CC3300; font-size: medium; font-weight: 700"
            Text="Danh sách các tỉnh thành phố">
        </dx1:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <dx:ASPxGridView ID="ASPxGridView2" runat="server"
        AutoGenerateColumns="False" ClientInstanceName="grid1"
        DataSourceID="Province" KeyFieldName="ProvinceID" EnableCallBacks="False"
        OnCustomColumnDisplayText="ASPxGridView2_CustomColumnDisplayText"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
        CssPostfix="PlasticBlue">

        <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }"></ClientSideEvents>

        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True"
            AllowSelectSingleRowOnly="True" ConfirmDelete="True"></SettingsBehavior>

        <SettingsText ConfirmDelete="Bạn c&#243; muốn x&#243;a th&#244;ng tin về mẫu đo n&#224;y kh&#244;ng"></SettingsText>

        <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid1.PerformCallback(s.GetFocusedRowIndex());
              }" />

        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="3">
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
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tỉnh/Thành phố" FieldName="ProvinceID"
                VisibleIndex="2">
                <PropertiesComboBox DataSourceID="Province" DropDownStyle="DropDown"
                    IncrementalFilteringMode="Contains" TextField="Province1"
                    ValueField="ProvinceID" ValueType="System.Int32">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Province1"
                VisibleIndex="1" Visible="False" Caption="Tỉnh/Thành phố"
                ShowInCustomizationForm="True">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="STT" FieldName="STT"
                VisibleIndex="0" ShowInCustomizationForm="True" UnboundType="Integer"
                Width="20px">
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                </CellStyle>
            </dx:GridViewDataTextColumn>
        </Columns>

        <SettingsBehavior AllowSelectByRowClick="true" AllowSelectSingleRowOnly="true" ConfirmDelete="true" AllowFocusedRow="true" />

        <SettingsPager Summary-Text="" ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;"></NextPageButton>
            <PrevPageButton Text="&lt; Prev"></PrevPageButton>
            <Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
        </SettingsPager>
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
    <asp:LinqDataSource ID="Province" runat="server"
        ContextTypeName="LabManagement.LINQ.LabdataDataContext" EnableDelete="True"
        EnableInsert="True" EnableUpdate="True" EntityTypeName=""
        TableName="Provinces">
    </asp:LinqDataSource>
    <p>
        &nbsp;
    </p>
</asp:Content>
