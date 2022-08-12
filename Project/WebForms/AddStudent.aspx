<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="Project.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link href="../CSS/StyleSheet1.css" rel="stylesheet" />
    <title></title>

    <style>
        #AddForm {
           
            /* Rectangle 5 */
            margin: 0 auto 0 auto;
            width: 1080px;
            height: auto;
            left: 344px;
            top: 201px;
            background: #C4C4C4;
            border-radius: 96px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">


          <asp:GridView ID="StudentsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentNum" DataSourceID="ShowStudents" Style="margin: 0 auto 0 auto;" CellPadding="4" ForeColor="#333333" GridLines="None">
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
            <asp:Button ID="deleteStudent" runat="server" Text="Delete" OnClick="deleteStudent_Click" CausesValidation="false" class="btn btn-danger"  />
            <asp:Button ID="updateStudent" runat="server" Text="Update" CausesValidation="false" class="btn btn-success"  />
        </div>
           
        <hr style="width: 1080px; margin:0 auto 0 auto; margin-top: 20px; margin-bottom:20px;" />
        

        <section id="AddForm" style="padding: 20px 0 20px 0">
            <asp:Label ID="Label1" runat="server" Text="Add Student"></asp:Label>

            <p>
                <asp:Label ID="Label2" runat="server" Text="Student Number:"></asp:Label>
                <asp:TextBox ID="StudentNum" runat="server" placeholder="-Student Number-"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StudentNum" ErrorMessage="Enter a student number">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="First Name:"></asp:Label>
                <asp:TextBox ID="FN" runat="server" placeholder="-First Name-"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FN" ErrorMessage="Enter student first name">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label4" runat="server" Text="Middle Name:"></asp:Label>
                <asp:TextBox ID="MN" runat="server" placeholder="-Middle Name-"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label5" runat="server" Text="Last Name:"></asp:Label>
                <asp:TextBox ID="LN" runat="server" placeholder="-Last Name-"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="LN" ErrorMessage="Enter student last name">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label6" runat="server" Text="Program:"></asp:Label>
                <asp:DropDownList ID="Prog" runat="server" DataSourceID="Program" DataTextField="ProgramCode" DataValueField="ProgramCode" OnDataBound="MyListDataBoundProg">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Program" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT [ProgramCode] FROM [Program]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Prog" ErrorMessage="Choose a program">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label7" runat="server" Text="Year Level:"></asp:Label>
                <asp:TextBox ID="YearLevel" runat="server" placeholder="-Year Level-"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="YearLevel" ErrorMessage="Enter student year level">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label8" runat="server" Text="Gender:"></asp:Label>
                <asp:RadioButtonList ID="GenderRBL" runat="server" Style="margin: 0 auto 0 auto;">
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="GenderRBL" ErrorMessage="Choose a gender">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label9" runat="server" Text="Research Category:"></asp:Label>
                <asp:DropDownList ID="ResCateg" runat="server" DataSourceID="ResCategory" DataTextField="CategoryName" DataValueField="CategoryName" OnDataBound="MyListDataBoundCateg" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="ResCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT [CategoryName] FROM [ResearchCategory]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ResCateg" ErrorMessage="Select a category">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label10" runat="server" Text="Topic:"></asp:Label>
                <asp:DropDownList ID="ResTopic" runat="server" DataSourceID="topic" DataTextField="ResearchTitle" DataValueField="ResearchID"  OnDataBound="MylListDataBoundTopic" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="topic" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT [ResearchID], [ResearchTitle] FROM [ResearchTopic] WHERE ([ResearchCategory] = @ResearchCategory)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ResCateg" DefaultValue="NULL" Name="ResearchCategory" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ResTopic" ErrorMessage="Select a topic">*</asp:RequiredFieldValidator>
            </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <asp:Button ID="addButton" runat="server" Text="Add Student" OnClick="addButton_Click" CausesValidatrion="true" class="btn btn-primary" />
            <asp:Button ID="clearForm" runat="server" OnClick="clearForm_Click" Text="Clear" CausesValidation="false" class="btn btn-primary" />
        </section>
        <br />
    </form>
</body>
</html>
