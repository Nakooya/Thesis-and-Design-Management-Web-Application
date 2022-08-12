<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Students.ascx.cs" Inherits="Project.Students" %>

        <h2 style=" font-size: 30px; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; text-align: center;">Students Table</h2>

          <asp:GridView ID="StudentsGridView" CssClass="Table" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentNum" DataSourceID="ShowStudents" Style="margin: 0 auto 0 auto; border:solid; border-width: 0.5px; " CellPadding="4" Height="500px" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="StudentNum" HeaderText="StudentNum" ReadOnly="True" SortExpression="StudentNum" />
                <asp:BoundField DataField="StudentFN" HeaderText="StudentFN" SortExpression="StudentFN" />
                <asp:BoundField DataField="StudentMN" HeaderText="StudentMN" SortExpression="StudentMN" />
                <asp:BoundField DataField="StudentLN" HeaderText="StudentLN" SortExpression="StudentLN" />
                <asp:BoundField DataField="StudentProgram" HeaderText="StudentProgram" SortExpression="StudentProgram" />
                <asp:BoundField DataField="StudentYearLevel" HeaderText="StudentYearLevel" SortExpression="StudentYearLevel" />
                <asp:BoundField DataField="StudentGender" HeaderText="StudentGender" SortExpression="StudentGender" />
                <asp:BoundField DataField="ThesisTopic" HeaderText="ThesisTopic" SortExpression="ThesisTopic" />
                <asp:BoundField DataField="DesignTopic" HeaderText="DesignTopic" SortExpression="DesignTopic" />
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

        <asp:SqlDataSource ID="ShowStudents" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
        <div style="margin: 0 auto 0 auto; text-align: center;">
            
           <p> <asp:Label ID="Status" style="text-align: center; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color: red" runat="server"></asp:Label></p>
            <asp:Button ID="GoToAdd" runat="server" Text="Add Students" OnClick="Button1_Click" style="background-color: #4CAF50; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)"/>
            <asp:Button ID="deleteStudent" runat="server" Text="Delete" OnClick="deleteStudent_Click"  CausesValidation="false" style="background-color: #f44336; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
            <asp:Button ID="updateStudent" runat="server" Text="Update" CausesValidation="false" style="background-color: #008CBA; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" OnClick="updateStudent_Click" />
            
        </div>









