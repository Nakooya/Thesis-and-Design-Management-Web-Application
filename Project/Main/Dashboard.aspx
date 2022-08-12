<%@ Page Title="" Language="C#" MasterPageFile="~/Main/NavMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project.Main.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/DashCards.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="TopicCard">
        <div id="topic">
            <asp:Label ID="TopicCounter" runat="server" Text="0"></asp:Label>
        </div>
        <h2 style="color: black; font-size: 17px;">Currently Registered Topics</h2>
    </section>

    <section id="StudentCard">
        <div id="student">
            <asp:Label ID="StudentCounter" runat="server" Text="0"></asp:Label>
        </div>
        <h2 style="color: black; font-size: 17px;">Currently Registered Students </h2>
    </section>

    
        <asp:GridView ID="UserGV" runat="server" style="position: relative; left: 400px; top: -280px; text-align:center; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; width: 300px; height: 100px; border: solid; border-width: 1.5px;" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Users" ForeColor="#333333" GridLines="None" DataKeyNames="Username">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" ReadOnly="True" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT [Username], [Password] FROM [Users]"></asp:SqlDataSource>

        <asp:DetailsView ID="DetailsView1" runat="server" style="border: solid; border-width: 1.5px; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; text-align:center; position:relative; left: 400px; top: -150px;" Height="100px" Width="200px" AutoGenerateRows="False" DataSourceID="UsersDV" DataKeyNames="Username" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" ReadOnly="True" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:CommandField ShowEditButton="True" ShowInsertButton="True" ShowDeleteButton="True" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="UsersDV" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE ([Username] = @Username)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Users] WHERE [Username] = @original_Username AND [Password] = @original_Password" InsertCommand="INSERT INTO [Users] ([Username], [Password]) VALUES (@Username, @Password)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Users] SET [Password] = @Password WHERE [Username] = @original_Username AND [Password] = @original_Password">
            <DeleteParameters>
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Username" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="UserGV" DefaultValue="null" Name="Username" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="original_Username" Type="String" />
                <asp:Parameter Name="original_Password" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    

</asp:Content>
