<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="5-DanhmucCVden.aspx.cs" Inherits="LabManagement.DanhmucCVden" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<dx:ASPxLabel 
            ID="ASPxLabel6" runat="server" Text="DANH MỤC CÔNG VĂN ĐẾN" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
    <br />
    <br />
    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Font-Bold="True" 
        Font-Italic="False" ForeColor="Blue" NavigateUrl="~/5-Congvanden.aspx" 
        Text="Cập nhật Công văn đến" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Font-Bold="True" 
        Font-Italic="False" ForeColor="Blue" NavigateUrl="~/5-DanhmucCVdenRPT.aspx" 
        Text="In danh mục Công văn đến" />
    <br />
    <br />
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDataSource1" ClientInstanceName="grid" 
        KeyFieldName="DocID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="SeriNo" 
                VisibleIndex="1" 
                Caption="Số CV đến" ShowInCustomizationForm="True" Width="70px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Số công văn" FieldName="DocNo" 
                VisibleIndex="4" Width="100px">
                <PropertiesTextEdit DisplayFormatString="{0}">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày công văn" FieldName="DocDate" 
                ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Đơn vị ban hành" FieldName="OfficeID" 
                VisibleIndex="6" Width="100px">
                <PropertiesComboBox DataSourceID="SqlDataSourceOffice" TextField="OfficeName" 
                    ValueField="OfficeID" ValueType="System.Int32">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="About" VisibleIndex="7" 
                Caption="Trích yếu" Width="300px" ShowInCustomizationForm="True">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Ngày CV đến" FieldName="InDate" 
                ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="FileName" VisibleIndex="8" 
                Visible="False" Caption="Tên tập tin" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Tập tin" FieldName="URL" 
                VisibleIndex="9" Width="100px">
                <PropertiesHyperLinkEdit Text="File đính kèm">
                    <Style Font-Bold="True">
                    </Style>
                </PropertiesHyperLinkEdit>
                <Settings AutoFilterCondition="Contains" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataCheckColumn FieldName="Invalid" 
                VisibleIndex="10" Caption="Hết hiệu lực" ShowInCustomizationForm="True" 
                Width="70px" Visible="False">
                <PropertiesCheckEdit DisplayTextChecked="Hết hiệu lực" 
                    DisplayTextUnchecked="Còn hiệu lực">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="DocYear" VisibleIndex="0" 
                Caption="Năm" GroupIndex="0" ReadOnly="True" 
                ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Loại CV" FieldName="DocCatID" 
                VisibleIndex="3" Width="100px">
                <PropertiesComboBox DataSourceID="SqlDataSource2" TextField="DocCatName" 
                    ValueField="DocCatID" ValueType="System.Int32">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior AutoExpandAllGroups="True" />
        <SettingsPager ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>
        <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterRowMenu="True" 
            ShowFooter="True" UseFixedTableLayout="True" />
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
            <Header ImageSpacing="10px" SortingImageSpacing="10px" Font-Bold="True" 
                HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True">
            </Header>
            <GroupRow Font-Bold="True" Font-Size="Medium" ForeColor="#CC3300">
            </GroupRow>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
            <GroupPanel Font-Bold="False">
            </GroupPanel>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dx:ASPxGridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
        
        
        
        
        
        SelectCommand="SELECT YEAR(InDate) AS DocYear, QS_DocIns.* FROM QS_DocIns WHERE (Invalid = @Invalid) AND (Deleted = @Deleted)">
        <SelectParameters>
            <asp:Parameter DefaultValue="False" Name="Invalid" />
            <asp:Parameter DefaultValue="False" Name="Deleted" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
        SelectCommand="SELECT [DocCatID], [DocCatName], [DocCatCode] FROM [QS_DocCategories]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceOffice" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
        SelectCommand="SELECT * FROM [QS_Offices]">
    </asp:SqlDataSource>
</asp:Content>
