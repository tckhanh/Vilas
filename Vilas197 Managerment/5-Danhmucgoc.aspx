<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="5-Danhmucgoc.aspx.cs" Inherits="LabManagement.Danhmucgoc" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxLabel 
            ID="ASPxLabel6" runat="server" Text="DANH MỤC GỐC TÀI LIỆU HỆ THỐNG CHẤT LƯỢNG" 
            CssClass="style35" Font-Bold="True" Font-Size="X-Large" 
            ForeColor="#CC3300">
        </dx:ASPxLabel>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </strong>
    </p>
    <br />
    <br />
    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Font-Bold="True" 
        Font-Italic="True" ForeColor="Blue" NavigateUrl="~/5-BanHanhV2.aspx" 
        Text="Cập nhật tài liệu HTCL" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Font-Bold="True" 
        Font-Italic="True" ForeColor="Blue" NavigateUrl="~/5-DanhmucgocRPT.aspx" 
        Text="In danh mục gốc" />
    <br />
    <br />
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
        DataSourceID="SqlDataSource1" ClientInstanceName="grid" 
        KeyFieldName="DocID">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IssueID" VisibleIndex="4" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IssueNo" 
                VisibleIndex="5" SortIndex="2" SortOrder="Descending" 
                Caption="Lần ban hành" Width="50px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="IssueDate" 
                VisibleIndex="6" Caption="Ngày ban hành" Width="100px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="DecisionNo" VisibleIndex="7" 
                Caption="Số quyết định" Width="100px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="DecisionDate" VisibleIndex="8" 
                Caption="Ngày quyết định" Width="100px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="FileName" Visible="False" 
                VisibleIndex="9" Caption="Tên tập tin" Width="100px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="URL" VisibleIndex="10" 
                Caption="Tập tin liên kết" Visible="False">
                <PropertiesHyperLinkEdit TextField="FileName">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn FieldName="DocCode" VisibleIndex="2" SortIndex="1" 
                SortOrder="Ascending" Caption="Mã tài liệu" Width="100px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DocTypeID" Visible="False" 
                VisibleIndex="0" Caption="ID loại tài liệu">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DocTypeName" GroupIndex="0" SortIndex="0" 
                SortOrder="Ascending" VisibleIndex="1" Caption="Loại tài liệu" 
                Width="200px">
                <HeaderStyle Wrap="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ghi chú nội dung thay đổi" 
                FieldName="NotesOfUpdating" VisibleIndex="11" Width="200px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Invalid" 
                VisibleIndex="12" Caption="Hết hiệu lực" Width="50px">
                <PropertiesCheckEdit DisplayTextChecked="Hết hiệu lực" 
                    DisplayTextUnchecked="Còn hiệu lực">
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Tên tài liệu" FieldName="URL" 
                VisibleIndex="3" Width="200px">
                <PropertiesHyperLinkEdit TextField="Title">
                </PropertiesHyperLinkEdit>
                <Settings FilterMode="DisplayText" AutoFilterCondition="Contains" />
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
        <SettingsBehavior AutoExpandAllGroups="True" />
        <SettingsPager ShowDefaultImages="False" ShowSeparators="True">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Tiếp &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Trước">
            </PrevPageButton>
        </SettingsPager>
        <Settings ShowGroupPanel="True" ShowFilterRow="True" ShowFilterRowMenu="True" 
            ShowPreview="True" UseFixedTableLayout="True" />
        <SettingsDetail ShowDetailRow="True" />
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
            <GroupRow Font-Bold="True" Font-Size="Larger" 
                ForeColor="#990000">
            </GroupRow>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
            <GroupPanel Font-Bold="True" Font-Size="Larger" 
                ForeColor="#990000">
            </GroupPanel>
        </Styles>
        <StylesEditors>
            <CalendarHeader Spacing="11px">
            </CalendarHeader>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="GridViewDetail" runat="server" AutoGenerateColumns="False" 
                    CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                    CssPostfix="Office2003Blue" DataSourceID="SqlDataSource2" KeyFieldName="DocID" 
                    onbeforeperformdataselect="GridViewDetail_BeforePerformDataSelect">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="IssueNo" VisibleIndex="2" 
                            Caption="Lần ban hành" Width="50px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="IssueDate" VisibleIndex="5" 
                            Caption="Ngày ban hành" Width="100px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="FileName" Visible="False" 
                            VisibleIndex="7" Caption="Tên tập tin">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="URL" Visible="False" VisibleIndex="10" 
                            Caption="Tập tin liên kết">
                            <PropertiesTextEdit DisplayFormatString="{0}">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataHyperLinkColumn FieldName="URL" VisibleIndex="1" 
                            Caption="Mã tài liệu" Width="100px">
                            <PropertiesHyperLinkEdit TextField="DocCode">
                            </PropertiesHyperLinkEdit>
                        </dx:GridViewDataHyperLinkColumn>
                        <dx:GridViewDataCheckColumn FieldName="Invalid" Visible="False" 
                            VisibleIndex="12" Caption="Hết hiệu lực">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataMemoColumn Caption="Ghi chú nội dung thay đổi" 
                            FieldName="NotesOfUpdating" VisibleIndex="6" Width="400px">
                            <PropertiesMemoEdit>
                                <Style Wrap="True">
                                </Style>
                            </PropertiesMemoEdit>
                        </dx:GridViewDataMemoColumn>
                    </Columns>
                    <SettingsDetail ShowDetailButtons="False" />
                    <Images SpriteCssFilePath="~/App_Themes/Office2003Blue/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/Office2003Blue/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/Office2003Blue/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <ImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/Office2003Blue/Editors/Loading.gif">
                        </LoadingPanel>
                    </ImagesFilterControl>
                    <Styles CssFilePath="~/App_Themes/Office2003Blue/{0}/styles.css" 
                        CssPostfix="Office2003Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="True" 
                            HorizontalAlign="Center" VerticalAlign="Middle">
                        </Header>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
        
        SelectCommand="SELECT IssueID, IssueNo, IssueDate, DecisionNo, DecisionDate, FileName, URL, DocCode, DocTypeID, DocTypeName, Invalid, Title, NotesOfUpdating, DocID FROM Danhmucgoc WHERE (Invalid = @Invalid) ORDER BY DocTypeID, DocCode">
        <SelectParameters>
            <asp:Parameter DefaultValue="False" Name="Invalid" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dbvilas197ConnectionString %>" 
        
        SelectCommand="SELECT IssueID, IssueNo, IssueDate, DecisionNo, DecisionDate, FileName, URL, DocCode, DocTypeID, DocTypeName, Invalid, Title, NotesOfUpdating, DocID FROM Danhmucgoc WHERE (Invalid = @Invalid) AND (DocID = @DocID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="Invalid" Type="Boolean" />
            <asp:SessionParameter DefaultValue="0" Name="DocID" SessionField="DocID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
