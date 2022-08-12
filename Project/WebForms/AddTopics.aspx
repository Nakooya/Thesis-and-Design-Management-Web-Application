<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTopics.aspx.cs" Inherits="Project.AddTopics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link href="../CSS/StyleSheet1.css" rel="stylesheet" />
    <style>
        #AddForm {
            margin: 0 auto 0 auto;
            width: 1080px;
            height: auto;  
            background: #C4C4C4;
            border-radius: 96px;
            padding: 10px 0 10px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section id="AddForm" >
            <div>
                <asp:Label ID="Label1" runat="server" Text="Add Topic"></asp:Label>
            </div>
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
                <asp:Button ID="AddButton" runat="server" OnClick="AddButton_Click" Text="Add Topic" class="btn btn-primary" />
                <asp:Button ID="ClearThisForm" runat="server" OnClick="ClearThisForm_Click" Text="Clear Form" CausesValidation="false" class="btn btn-danger" />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" CausesValidation="false" />
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
            </p>
        </section>
    </form>
</body>
</html>
