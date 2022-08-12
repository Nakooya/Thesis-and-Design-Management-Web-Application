<%@ Page Title="" Language="C#" MasterPageFile="~/Main/NavMaster.Master" AutoEventWireup="true" CodeBehind="TopicsAdd.aspx.cs" Inherits="Project.Main.WebForm5" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/TextBox.css" rel="stylesheet" />
    <title>Add Topicss</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Button ID="Back" runat="server" style="font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; position:relative; left: 20px; top: 20px;" Text="Return" OnClick="Back_Click" CausesValidation="false" />
        <section id="AddForm" style="text-align:center; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;" >
            <h2 style="font-size: 30px;">Add Topic Form</h2>
            <p>
                <asp:Label ID="Label2" runat="server" Text="Title:"></asp:Label>
                <asp:TextBox ID="TitleTB" runat="server" placeholder="-Thesis Title-"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TitleTB" ErrorMessage="Enter a title">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" Text="Description:"></asp:Label>
                <asp:TextBox ID="DescTB" runat="server" placeholder="-Description-"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="Label4" runat="server" Text="First Adviser:"></asp:Label>
                <asp:DropDownList ID="FirstAd" runat="server" DataTextField="ProfName" DataValueField="ProfID" OnDataBound="MyListDataBoundFirstAd" DataSourceID="Advisers" class="btn btn-secondary dropdown-toggle">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Advisers" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="GetAdviser" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FirstAd" ErrorMessage="First adviser is required">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label5" runat="server" Text="Second Adviser:"></asp:Label>
                <asp:DropDownList ID="SecondAd" runat="server" DataTextField="ProfName" DataValueField="ProfID" OnDataBound="MyListDataBoundSecondAd" DataSourceID="Advisers" class="btn btn-secondary dropdown-toggle">
                </asp:DropDownList>
                <asp:CheckBox ID="SecondAdCB" runat="server" OnCheckedChanged="SecondAdCB_CheckedChanged" Text="Input second adviser?" AutoPostBack="true" />
            </p>
            <p>
                <asp:Label ID="Label6" runat="server" Text="Research Status:"></asp:Label>
                <asp:DropDownList ID="ResStat" runat="server" DataTextField="StatusName" DataValueField="StatusName" OnDataBound="MyListDataBoundStatus" DataSourceID="Status" class="btn btn-secondary dropdown-toggle">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Status" runat="server" ConnectionString="<%$ ConnectionStrings:ThesisDesignStudentsManagementConnectionString %>" SelectCommand="SELECT [StatusName] FROM [ResStatus]"></asp:SqlDataSource>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ResStat" ErrorMessage="Select a sesearch status">*</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Label7" runat="server" Text="Research Category:"></asp:Label>
                <asp:RadioButtonList ID="Category" runat="server" Style="margin: 0 auto 0 auto;">
                    <asp:ListItem>Thesis</asp:ListItem>
                    <asp:ListItem>Design</asp:ListItem>
                </asp:RadioButtonList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select a research category" ControlToValidate="Category">*</asp:RequiredFieldValidator>
            </p>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <p>
                <asp:Button ID="AddButton" runat="server" OnClick="AddButton_Click" Text="Add Topic" style="background-color: #4CAF50; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />
                <asp:Button ID="ClearThisForm" runat="server" OnClick="ClearThisForm_Click" Text="Clear Form" CausesValidation="false" class="btn btn-danger" style="background-color: #008CBA; font-size: 16px; padding: 10px 24px; border-radius: 8px; box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" />

            </p>
        </section>
    

</asp:Content>
