<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowTopics.aspx.cs" Inherits="Project.ShowTopics" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <style type="text/css">
        .auto-style1 {
            width: 1080px;
            height: auto;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div style="margin:300px auto 0 auto" class="auto-style1">
            <asp:Label ID="Title" runat="server" Text="Select a Topic.."></asp:Label>
            <br />
            <asp:GridView ID="TopicsList" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ResearchID" DataSourceID="GetTopics" CellPadding="4" GridLines="None" ForeColor="#333333" autopostback="true" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ResearchID" HeaderText="ResearchID" ReadOnly="True" SortExpression="ResearchID" InsertVisible="False" />
                    <asp:BoundField DataField="ResearchTitle" HeaderText="ResearchTitle" SortExpression="ResearchTitle" />
                    <asp:BoundField DataField="ResearchDescription" HeaderText="ResearchDescription" SortExpression="ResearchDescription" />
                    <asp:BoundField DataField="FirstAdviser" HeaderText="FirstAdviser" SortExpression="FirstAdviser" />
                    <asp:BoundField DataField="SecondAdviser" HeaderText="SecondAdviser" SortExpression="SecondAdviser" />
                    <asp:BoundField DataField="ResearchStatus" HeaderText="ResearchStatus" SortExpression="ResearchStatus" />
                    <asp:BoundField DataField="ResearchCategory" HeaderText="ResearchCategory" SortExpression="ResearchCategory" />
                </Columns>
                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <asp:SqlDataSource ID="GetTopics" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT * FROM [ResearchTopic]"></asp:SqlDataSource>
            <asp:Button ID="deleteButton" runat="server" OnClick="deleteButton_Click" Text="DELETE" style="background-color: #f44336; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)"  />
            <asp:Button ID="updateButton" runat="server" Text="UPDATE" OnClick="updateButton_Click" style="background-color: #008CBA; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
            <asp:Button ID="addButton" runat="server" Text="ADD" OnClick="updateButton_Click" style="background-color: #4CAF50; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
            <asp:Label ID="deletelabel" runat="server" Text="Label"></asp:Label>
           
        </div>
    </form>
</body>
</html>
