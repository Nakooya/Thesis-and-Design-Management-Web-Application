<%@ Page Title="" Language="C#" MasterPageFile="~/Main/NavMaster.Master" AutoEventWireup="true" CodeBehind="ProfessorsView.aspx.cs" Inherits="Project.Main.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
    
    <title>Professors View</title>
    <link href="../CSS/ProfView.css" rel="stylesheet" />
 
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 style="text-align: center; font-size: 30px; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">Professors</h2>

    <asp:Button ID="Refresh" style="font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; position: relative; left: 20px;" runat="server" Text="Refresh" OnClick="Refresh_Click" />

     <asp:GridView ID="GridView1" CssClass="ProfDetailsView" Height="400px" autopostback="enable" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProfID" DataSourceID="ProfTable" ForeColor="#333333" GridLines="None" style="border: solid;  font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; border-width: 0.5px; margin: 0 auto 0 auto;">
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
    
            <h2 style="text-align: center; padding: 5px 0 2px 0; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color: royalblue">Select a professor to Create, Add or Delete...</h2>

            <asp:DetailsView ID="ProfDetailsView"  style=" width: 500px; height: 150px; margin: 0 auto 0 auto; text-align: center; font-family: 'Trebuchet MS';" runat="server" AutoGenerateRows="False" CellPadding="3" DataKeyNames="ProfID" DataSourceID="DetailsViewProf" GridLines="Vertical" Height="50px" Width="125px" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="ProfID" HeaderText="ProfID" ReadOnly="True" SortExpression="ProfID" />
                    <asp:BoundField DataField="ProfFN" HeaderText="ProfFN" SortExpression="ProfFN" />
                    <asp:BoundField DataField="ProfLN" HeaderText="ProfLN" SortExpression="ProfLN" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            </asp:DetailsView>

            <asp:SqlDataSource ID="DetailsViewProf" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" DeleteCommand="DELETE FROM [Professor] WHERE [ProfID] = @ProfID" InsertCommand="INSERT INTO [Professor] ([ProfID], [ProfFN], [ProfLN]) VALUES (@ProfID, @ProfFN, @ProfLN)" SelectCommand="SELECT * FROM [Professor] WHERE ([ProfID] = @ProfID)" UpdateCommand="UPDATE [Professor] SET [ProfFN] = @ProfFN, [ProfLN] = @ProfLN WHERE [ProfID] = @ProfID">
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
</asp:Content>
