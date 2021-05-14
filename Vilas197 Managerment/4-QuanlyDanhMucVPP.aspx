<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/QuanLyHTCL.Master" AutoEventWireup="true" CodeBehind="4-QuanlyDanhMucVPP.aspx.cs" Inherits="LabManagement.QuanlyDanhMucVPP" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style47
        {
            height: 47px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style19" style="height: 57px; width: 67%">
        <tr>
            <td style="text-align: center" class="style47">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                    Font-Size="X-Large" style="color: #CC3300" 
                    Text="QUẢN LÝ DANH MỤC VĂN PHÒNG PHẨM">
                </dx:ASPxLabel>
            </td>
        </tr>
        </table>
    <p>
<dx:ASPxGridView ID="ASPxGridView" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
            DataSourceID="SqlDataSource_Stationery" KeyFieldName="StID" EnableCallBacks="False"
            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                oncustomcallback="ASPxGridView_CustomCallback" 
            style="margin-right: 0px" 
            oncustomcolumndisplaytext="ASPxGridView_CustomColumnDisplayText">
            <ClientSideEvents RowDblClick="function(s, e) 
              {
                grid.PerformCallback(s.GetFocusedRowIndex());
              }" />
            <SettingsPager Summary-Text="" PageSize="20">
              <NextPageButton Text="Tiếp"></NextPageButton>
              <PrevPageButton Text="Trước"></PrevPageButton>

<Summary Text="Trang {0}/{1} ({2} Hồ sơ)"></Summary>
            </SettingsPager>
             <Columns>
                 <dx:GridViewCommandColumn VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True">
                     <%--<EditButton Visible="True" Text="Sửa">
                     </EditButton>
                     <NewButton Visible="True" Text="Tạo mới">
                     </NewButton>
                     <DeleteButton Visible="True" Text="Xóa">
                     </DeleteButton>
                     <UpdateButton Text="Cập nhật"></UpdateButton>
                     <CancelButton Text="Thoát"></CancelButton>
                     <ClearFilterButton Visible="True" Text="Bỏ lọc">
                     </ClearFilterButton>--%>
                 </dx:GridViewCommandColumn>
                 <dx:GridViewDataTextColumn Caption="STT" FieldName="STT" UnboundType="Integer" 
                     VisibleIndex="1">
                     <EditFormSettings Visible="False" />
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="StID" ReadOnly="True" Visible="False" 
                     VisibleIndex="2">
                     <EditFormSettings Visible="False" />
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Tên văn phòng phẩm" FieldName="StName" 
                     VisibleIndex="3">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Đơn vị" FieldName="Unit" 
                     VisibleIndex="4">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Giá tiền" FieldName="Price" 
                     ShowInCustomizationForm="True" VisibleIndex="5">
                     <PropertiesTextEdit DisplayFormatString="###,###,###,###">
                     </PropertiesTextEdit>
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataMemoColumn Caption="Ghi chú" FieldName="Note" VisibleIndex="6">
                     <PropertiesMemoEdit Height="100px">
                     </PropertiesMemoEdit>
                 </dx:GridViewDataMemoColumn>
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
            </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource_Stationery" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_mang %>" 
                    
                    
            SelectCommand="SELECT * FROM [Stationery] ORDER BY cast([StName] as nvarchar)" 
            DeleteCommand="DELETE FROM [Stationery] WHERE [StID] = @StID" 
            InsertCommand="INSERT INTO [Stationery] ([StName], [Price], [Note],[Unit]) VALUES (@StName, @Price, @Note,@Unit)" 
            
            UpdateCommand="UPDATE [Stationery] SET [StName] = @StName, [Price] = @Price, [Note] = @Note,[Unit]=@Unit WHERE [StID] = @StID">
                    <DeleteParameters>
                        <asp:Parameter Name="StID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="StName" Type="String" />
                        <asp:Parameter Name="Price" Type="Single" />
                        <asp:Parameter Name="Note" Type="String" />
                        <asp:Parameter Name="Unit" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="StName" Type="String" />
                        <asp:Parameter Name="Price" Type="Single" />
                        <asp:Parameter Name="Note" Type="String" />
                        <asp:Parameter Name="Unit" />
                        <asp:Parameter Name="StID" Type="Int32" />
                    </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>&nbsp;</p>
</asp:Content>
