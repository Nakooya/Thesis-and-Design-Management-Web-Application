<%@ Page Title="" Language="C#" MasterPageFile="~/Main/NavMaster.Master" AutoEventWireup="true" CodeBehind="StudentsUpdate.aspx.cs" Inherits="Project.Main.WebForm6" %>

<%@ Register Src="~/UserControls/UpdateStudent.ascx" TagPrefix="uc1" TagName="UpdateStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/TextBox.css" rel="stylesheet" />
    <title>Update Students</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    


    <section id="AddForm" style="padding: 20px 0 20px 0; text-align: center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;">
        <h2> Update Student Form</h2>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Student Number:"></asp:Label>
                <asp:TextBox ID="StudentNum" runat="server" placeholder="-Student Number-" ReadOnly="true"></asp:TextBox>
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
        <asp:Label ID="Label1" runat="server" Text="Thesis Topic: "></asp:Label>
        <asp:DropDownList ID="ThesisTopicDL" runat="server" DataSourceID="ThesisList" DataTextField="ResearchTitle" DataValueField="ResearchID" OnDataBound="MyListDataBoundThesis" ></asp:DropDownList>
      
             <asp:SqlDataSource ID="ThesisList" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT [ResearchID], [ResearchTitle] FROM [ResearchTopic] WHERE ([ResearchCategory] = @ResearchCategory)">
                 <SelectParameters>
                     <asp:Parameter DefaultValue="Thesis" Name="ResearchCategory" Type="String" />
                 </SelectParameters>
        </asp:SqlDataSource>
      
             <br />
      
             <asp:Label ID="Label9" runat="server" Text="Design Topic: "></asp:Label>
        <asp:DropDownList ID="DesignTopicDL" runat="server" DataSourceID="DesignList" DataTextField="ResearchTitle" DataValueField="ResearchID" OnDataBound="MyListDataBoundDesign"></asp:DropDownList>
      

            <asp:SqlDataSource ID="DesignList" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT [ResearchID], [ResearchTitle] FROM [ResearchTopic] WHERE ([ResearchCategory] = @ResearchCategory)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Design" Name="ResearchCategory" Type="String" />
                </SelectParameters>
        </asp:SqlDataSource>
      

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    

        </section>

    <div id="buttons" style=" text-align:center;" >
        <asp:Button ID="UpdateButton" runat="server" OnClick="UpdateButton_Click" Text="Update" style="background-color: #008CBA; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
<asp:Button ID="cancelBtn" runat="server" Text="Cancel" CausesValidation="false" OnClick="cancelBtn_Click" style="background-color: #f44336; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
        </div>






    </asp:Content>
