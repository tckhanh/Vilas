<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/CauHinhHT.Master" AutoEventWireup="true" CodeBehind="0-DoiMatKhau.aspx.cs" Inherits="LabManagement.DoiMatKhau" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
.dxgvControl_PlasticBlue,
.dxgvDisabled_PlasticBlue
{
	border: Solid 1px #CCCCCC;
	border-top-style: none;
	font: 9pt Tahoma;
	background-color: #F0F0F0;
	color: #000000;
	cursor: default;
}

.dxgvTable_PlasticBlue
{
    background-color: #F0F0F0;
	border:0;
	border-collapse: separate !important;
	overflow:hidden;
	font: 9pt Tahoma;
	color: #000000;
}
.dxgvHeader_PlasticBlue {
	cursor:pointer;
	white-space:nowrap;
	padding: 7px 6px 7px 6px;
	border: solid 1px #2c4182;
	border-top-style: none;
	background-position:top;
	background-repeat:repeat-x;
	background-color:#415698;
	overflow:hidden;
    font-weight: normal;
    text-align: left;
}

.dxgvFocusedRow_PlasticBlue
{
	background-color: #5066ac;
}
.dxgvCommandColumn_PlasticBlue
{
	padding: 0px 2px 0px 2px;
}
.dxgvDataRow_PlasticBlue
{
	background-color: #FFFFFF;
	color: #000000;
}

.dxgvPagerTopPanel_PlasticBlue,
.dxgvPagerBottomPanel_PlasticBlue
{
	padding: 6px 0;
}

        .style23
    {
        text-align: center;
        height: 23px;
    }
    .style24
    {
        width: 215px;
    }
    .style25
    {
            text-align: center;
            width: 48px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="text-align: center; width: 504px; height: 61px;">
                <br />
                <dx1:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                    Font-Size="X-Large" ForeColor="#CC3300" 
                    Text="ĐỔI MẬT KHẨU">
                </dx1:ASPxLabel>
    </p>
<table class="style19" style="width: 71%; height: 112px">
    <tr>
        <td class="style23" colspan="3">
            <dx:ASPxLabel ID="lbNotification" runat="server" 
                style="color: #CC0000; font-style: italic">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td class="style25">
            &nbsp;</td>
        <td class="style24">
            Nhập mật khẩu hiện tại (*)</td>
        <td>
            <dx:ASPxTextBox ID="txtOldPass" runat="server" Password="True" Width="200px">
            </dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td class="style25">
            &nbsp;</td>
        <td class="style24">
            Nhập mật khẩu mới (*)</td>
        <td>
            <dx:ASPxTextBox ID="txtNewPass" runat="server" Password="True" Width="200px">
            </dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td class="style25">
            &nbsp;</td>
        <td class="style24">
            Xác nhận mật khẩu mới (*)</td>
        <td>
            <dx:ASPxTextBox ID="txtReNewPass" runat="server" Password="True" Width="200px">
            </dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td class="style25">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
&nbsp;&nbsp;
            <dx:ASPxButton ID="btChangePass" runat="server" 
                CssFilePath="~/App_Themes/SoftOrange/{0}/styles.css" CssPostfix="SoftOrange" 
                onclick="btChangePass_Click" 
                SpriteCssFilePath="~/App_Themes/SoftOrange/{0}/sprite.css" Text="Đổi mật khẩu" 
                Width="133px">
            </dx:ASPxButton>
        </td>
    </tr>
</table>
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
<p>
        &nbsp;</p>
<p>
        &nbsp;</p>
    <p>
            &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
