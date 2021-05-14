<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="5-DanhmucTieuchuan.aspx.cs" Inherits="LabManagement.DanhmucTieuchuan" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxLabel 
            ID="ASPxLabel6" runat="server" Text="DANH MỤC CÁC TIÊU CHUẨN" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
    <br />
    <br />
    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Font-Bold="True" 
        Font-Italic="False" ForeColor="Blue" NavigateUrl="~/5-Tieuchuan.aspx" 
        Text="Cập nhật Tiêu chuẩn" Font-Size="Small" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
    <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Font-Bold="True" 
        Font-Italic="False" ForeColor="Blue" NavigateUrl="~/5-DanhmucTieuchuanRPT.aspx" 
        Text="In Danh mục Tiêu chuẩn" Font-Size="Small" />
    <br />
    <br />
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDataSource1" ClientInstanceName="grid" 
        KeyFieldName="StdID">
        <Columns>
            <dx:GridViewDataHyperLinkColumn Caption="Mã tiêu chuẩn" FieldName="URL" 
                ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                <PropertiesHyperLinkEdit TextField="StdCode">
                </PropertiesHyperLinkEdit>
                <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn FieldName="StdTitle" 
                VisibleIndex="3" Caption="Tên tiêu chuẩn" Width="200px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewCommandColumn VisibleIndex="0" Width="40px">
                <ClearFilterButton Text="Xóa" Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataComboBoxColumn Caption="Loại tiêu chuẩn" FieldName="StdTypeID" 
                ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                <PropertiesComboBox DataSourceID="SqlDataSource2" TextField="StdTypeName" 
                    ValueField="StdTypeID" ValueType="System.Int32">
                </PropertiesComboBox>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Abstract" VisibleIndex="4" 
                Caption="Ghi chú" Width="300px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FileName" VisibleIndex="5" 
                Caption="Tên tập tin" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="URL" 
                VisibleIndex="6" 
                Caption="Tập tin liên kết" Visible="False">
                <PropertiesTextEdit DisplayFormatString="{0}">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="ValidDate" 
                VisibleIndex="7" Caption="Ngày có hiệu lực" Width="100px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataCheckColumn FieldName="Invalid" 
                VisibleIndex="9" Caption="Hết hiệu lực" Width="70px" Visible="False">
                <PropertiesCheckEdit DisplayTextChecked="Hết hiệu lực" 
                    DisplayTextUnchecked="Còn hiệu lực">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
        </Columns>
        <SettingsPager ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" 
            UseFixedTableLayout="True" />
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
        
        
        
        SelectCommand="SELECT StdID, StdCode, StdTitle, StdTypeID, Abstract, FileName, URL, IssueDate, ValidDate, CreateStaffID, CreateDate, ModifyStaffID, ModifyDate, Invalid, Deleted FROM QS_Standards WHERE (Deleted = @False)">
        <SelectParameters>
            <asp:Parameter DefaultValue="False" Name="False" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
        
        
        SelectCommand="SELECT StdTypeID, StdTypeCode, StdTypeName FROM QS_StandardTypes">
    </asp:SqlDataSource>
</asp:Content>
