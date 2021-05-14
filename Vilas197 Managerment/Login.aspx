<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LabManagement.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 316px;
            margin-bottom: 9px;
        }
        .style2
        {
            height: 194px;
            text-align: center;
        }
        .style3
        {
            width: 100%;
            text-align: center;
            height: 18px;
            margin-bottom: 9px;
        }
        .style4
        {
            font-size: xx-large;
            color: #FFFF00;
        }
        .style5
        {
            width: 33%;
        }
        .style10
        {
            height: 27px;
        }
        .style9
        {
            color: #FFFF00;
            font-size: large;
        }
        .style12
        {
            width: 175px;
            height: 15px;
        }
        .style14
        {
            width: 175px;
            height: 4px;
        }
        .style15
        {
            width: 175px;
        }
        .style18
        {
            width: 130px;
        }
    </style>
</head>
<body style="height: 359px">
    <form id="form1" runat="server">
    <div style="height: 277px">
    
        <table class="style1">
            <tr>
                <td bgcolor="#003366" class="style3" 
                    style="text-align: center; vertical-align: middle">
                    <asp:Image ID="Image1" runat="server" ImageAlign="Left" 
                        ImageUrl="~/Images/vilas197logo.png" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <span class="style4"><strong>&nbsp;HỆ THỐNG QUẢN TRỊ PHÒNG ĐO</strong></span><strong><br 
                        class="style4" />
                    </strong><span class="style4"><strong>LAB MANAGEMENT</strong></span></td>
            </tr>
            <tr>
                <td class="style2" style="vertical-align: middle; text-align: center">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <table align="center" class="style5" 
                        
                        style="border: thin solid #996600; vertical-align: middle; text-align: center; height: 159px;">
                        <tr>
                            <td align="center" bgcolor="#003366" class="style10" colspan="2" 
                                style="border: thin solid #996633" valign="middle">
                                <span class="style9"><strong>ĐĂNG</strong></span> <span class="style9"><strong>
                                NHẬP</strong></span></td>
                        </tr>
                        <tr>
                            <td align="center" class="style18" valign="middle">
                                Tên Đăng Nhập</td>
                            <td align="center" class="style12" valign="middle">
                                <asp:TextBox ID="txtusername" runat="server" Width="185px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style18" valign="middle">
                                Mật Khẩu</td>
                            <td align="center" class="style14" valign="middle">
                                <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Width="185px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style18" valign="middle">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td align="center" class="style15" valign="middle">
                                <asp:Button ID="btlogin" runat="server" onclick="Button1_Click" 
                                    Text="Đăng Nhập" />
                                <br />
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" 
                                    
                                    
                                    style="font-style: italic; text-decoration: underline; color: #0033CC; text-align: right">Quên mật khẩu</asp:HyperLink>
                                <br />
                                <asp:Label ID="lbfail" runat="server" Font-Italic="True" ForeColor="#CC0000"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
