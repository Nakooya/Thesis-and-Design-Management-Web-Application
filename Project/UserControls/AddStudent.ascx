<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.ascx.cs" Inherits="Project.UserControls.AddStudent" %>
   <asp:Button ID="Back" runat="server" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; position: relative; left: 20px; top: 20px;" Text="Return" CssClass="back" OnClick="Back_Click" CausesValidation="false" />
<section id="AddForm" style="padding: 20px 0 20px 0; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
        <h2>  Add Student Form</h2>
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
                <asp:SqlDataSource ID="topic" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT [ResearchID], [ResearchTitle] FROM [ResearchTopic] WHERE ([ResearchCategory] = @ResearchCategory) ORDER BY [ResearchTitle]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ResCateg" DefaultValue="null" Name="ResearchCategory" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ResTopic" ErrorMessage="Select a topic">*</asp:RequiredFieldValidator>
            </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <asp:Button ID="addButton" runat="server" Text="Add Student" OnClick="addButton_Click" CausesValidatrion="true" class="btn btn-primary" style="background-color: #4CAF50; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
            <asp:Button ID="clearForm" runat="server" OnClick="clearForm_Click" Text="Clear Form" CausesValidation="false" class="btn btn-primary" style="background-color: #008CBA; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)"/>
        </section>