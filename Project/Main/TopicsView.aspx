<%@ Page Title="" Language="C#" MasterPageFile="~/Main/NavMaster.Master" AutoEventWireup="true" CodeBehind="TopicsView.aspx.cs" Inherits="Project.Main.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>--%>
    <title> Topics View</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="margin: 0 auto 0 auto; text-align: center; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
          <h2 style="font-size: 30pt;">Topics Table</h2>
            <asp:GridView ID="TopicsList" style=" margin: 0 auto 0 auto; border: solid; border-width: 0.5px; width: 1500px; height: 500px;" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ResearchID" DataSourceID="GetTopics" CellPadding="4" GridLines="None" ForeColor="#333333" autopostback="true" >
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
        <p>
          <asp:Label ID="Status" style="color:red;" runat="server" ></asp:Label>
            </p>
        <asp:Button ID="addButton" runat="server" Text="ADD" OnClick="addButton_Click" style="background-color: #4CAF50; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
        <asp:Button ID="deleteButton" runat="server" OnClick="deleteButton_Click" Text="DELETE" style="background-color: #f44336; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)"  />  
        <asp:Button ID="updateButton" runat="server" Text="UPDATE" OnClick="updateButton_Click" style="background-color: #008CBA; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
        </div>

</asp:Content>
