<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="LabManagement.Test"%>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>







<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 83%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxDateEdit ID="d1" runat="server" AutoPostBack="True">
        </dx:ASPxDateEdit>
        <br />
        <dx:ASPxDateEdit ID="d2" runat="server" AutoPostBack="True">
        </dx:ASPxDateEdit>
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" KeyFieldName="EquTypeID">
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="NumOfRequest" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EquTypeID" ReadOnly="True" 
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EquTypeName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumOfRequest" ReadOnly="True" 
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumOfRequestNonIssue" ReadOnly="True" 
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumOfTestReport" ReadOnly="True" 
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SumPrice" ReadOnly="True" 
                    VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFooter="True" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_mang %>" SelectCommand="SELECT        EquTypeID, EquTypeName,
                             (SELECT        COUNT(Request.RequestID) AS NumofRequest
                               FROM            Request INNER JOIN
                                                         EquipmentType AS EquipmentType1 ON Request.EquTypeID = EquipmentType1.EquTypeID
                               WHERE        (EquipmentType.EquTypeID = Request.EquTypeID) AND (Request.ReceiveDate &gt;= @BD) AND (Request.ReceiveDate &lt;= @ED)
                               GROUP BY EquipmentType1.EquTypeID) AS NumOfRequest,
                             (SELECT        COUNT(Request_3.RequestID) AS NumofRequest
                               FROM            Request AS Request_3 INNER JOIN
                                                         EquipmentType AS EquipmentType4 ON Request_3.EquTypeID = EquipmentType4.EquTypeID
                               WHERE        (EquipmentType.EquTypeID = Request_3.EquTypeID) AND (Request_3.StatusID = 6 OR
                                                         Request_3.StatusID = 7) AND (Request_3.ReceiveDate &gt;= @BD) AND (Request_3.ReceiveDate &lt;= @ED)
                               GROUP BY EquipmentType4.EquTypeID) AS NumOfRequestNonIssue,
                             (SELECT        COUNT(TestReport.AssignmentID) AS NumOfTestReport
                               FROM            Request AS Request_2 INNER JOIN
                                                         EquipmentType AS EquipmentType2 ON Request_2.EquTypeID = EquipmentType2.EquTypeID INNER JOIN
                                                         Assignment ON Request_2.RequestID = Assignment.AssignmentID INNER JOIN
                                                         TestReport ON Assignment.AssignmentID = TestReport.AssignmentID
                               WHERE        (EquipmentType.EquTypeID = Request_2.EquTypeID) AND (TestReport.TestReportIssueDate &gt;= @BD) AND (TestReport.TestReportIssueDate &lt;= @ED)
                               GROUP BY EquipmentType2.EquTypeID) AS NumOfTestReport,
                             (SELECT        SUM(EquipmentType3.Price) AS NumOfTestReport
                               FROM            Request AS Request_1 INNER JOIN
                                                         EquipmentType AS EquipmentType3 ON Request_1.EquTypeID = EquipmentType3.EquTypeID INNER JOIN
                                                         Assignment AS Assignment_1 ON Request_1.RequestID = Assignment_1.AssignmentID INNER JOIN
                                                         TestReport AS TestReport_1 ON Assignment_1.AssignmentID = TestReport_1.AssignmentID
                               WHERE        (EquipmentType.EquTypeID = Request_1.EquTypeID) AND (TestReport_1.TestReportIssueDate &gt;= @BD) AND (TestReport_1.TestReportIssueDate &lt;= @ED)
                               GROUP BY EquipmentType3.EquTypeID) AS SumPrice
FROM            EquipmentType AS EquipmentType">
            <SelectParameters>
                <asp:ControlParameter ControlID="d1" DefaultValue="" Name="BD" Type="DateTime" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="d2" DefaultValue="" Name="ED" Type="DateTime" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <br />
        <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" 
            ShowProgressPanel="True">
        </dx:ASPxUploadControl>
        <dx:ASPxDockZone ID="ASPxDockZone1" runat="server" Orientation="Horizontal">
        </dx:ASPxDockZone>
        <br />
        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Height="103px" Width="527px">
            <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">&nbsp;
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxMemo ID="ASPxMemo4" runat="server" Height="71px" Width="170px">
                </dx:ASPxMemo>
            </td>
            <td>
                <dx:ASPxMemo ID="ASPxMemo3" runat="server" Height="71px" Width="170px">
                </dx:ASPxMemo>
            </td>
            <td>
                <dx:ASPxMemo ID="ASPxMemo1" runat="server" Height="71px" Width="170px">
                </dx:ASPxMemo>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxPanel>
        <br />
        <dx:ASPxButton ID="ASPxButton1" runat="server" onclick="ASPxButton1_Click" 
            Text="ASPxButton">
        </dx:ASPxButton>
        <br />
    
    </div>
    </form>
</body>
</html>
