<%@ Page Title="" Language="C#" MasterPageFile="~/WebForms/App.Master" AutoEventWireup="true" CodeBehind="M-AddProf.aspx.cs" Inherits="Project.WebForms.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="AddForm"">
         <h2>Professor Table</h2>
            <asp:GridView ID="GridView1" style="margin: 0 auto 0 auto;" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProfID" DataSourceID="ProfTable" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="ProfID" HeaderText="ProfID" ReadOnly="True" SortExpression="ProfID" />
                    <asp:BoundField DataField="ProfFN" HeaderText="ProfFN" SortExpression="ProfFN" />
                    <asp:BoundField DataField="ProfLN" HeaderText="ProfLN" SortExpression="ProfLN" />
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
            <asp:SqlDataSource ID="ProfTable" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT * FROM [Professor]"></asp:SqlDataSource>
         <h2>Add, Delete, or Update a Professor</h2>
            <asp:DetailsView ID="DetailsView1" runat="server" style="margin: 0 auto 0 auto;" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ProfID" DataSourceID="DetailsViewProf" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="ProfID" HeaderText="ProfID" ReadOnly="True" SortExpression="ProfID" />
                    <asp:BoundField DataField="ProfFN" HeaderText="ProfFN" SortExpression="ProfFN" />
                    <asp:BoundField DataField="ProfLN" HeaderText="ProfLN" SortExpression="ProfLN" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:DetailsView>
         
            <asp:SqlDataSource ID="DetailsViewProf" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" DeleteCommand="DELETE FROM [Professor] WHERE [ProfID] = @ProfID" InsertCommand="INSERT INTO [Professor] ([ProfID], [ProfFN], [ProfLN]) VALUES (@ProfID, @ProfFN, @ProfLN)" SelectCommand="SELECT * FROM [Professor] WHERE ([ProfID] = @ProfID)" UpdateCommand="UPDATE [Professor] SET [ProfFN] = @ProfFN, [ProfLN] = @ProfLN WHERE [ProfID] = @ProfID" >
                <DeleteParameters>
                    <asp:Parameter Name="ProfID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProfID" Type="String" />
                    <asp:Parameter Name="ProfFN" Type="String" />
                    <asp:Parameter Name="ProfLN" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="NULL" Name="ProfID" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProfFN" Type="String" />
                    <asp:Parameter Name="ProfLN" Type="String" />
                    <asp:Parameter Name="ProfID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </section>
</asp:Content>

