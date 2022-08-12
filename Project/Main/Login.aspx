<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="..\images\Mapúa_University_logo.png" type="image/png" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="../CSS/Login.css" rel="stylesheet" />
    <title>Thesis Design Management System</title>
</head>
<body>
    <form id="form1" runat="server">

        <header>
            <img class="mapualogo pos" src="../images/Logo.png" alt="Mapua Logo"/>
            <h1>Mapua University</h1>
            <h2>EECE Department</h2>
            <h2>Thesis Design Management System</h2>
        </header>

        <section class="SigninForm">
            <div class="login-form">
                <div class="avatar ">
                    <img src="../images/avatar.png" alt="Avatar"/>
                </div>
                <div class="form-group">
                <h2 class="text-center">Administrator Login</h2>
                    <div class="validator">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </div>
                        <asp:RequiredFieldValidator ID="usernameValidator" runat="server" ControlToValidate="loginUsername" ErrorMessage="Please enter username">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="loginUsername" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ControlToValidate="loginPassword" ErrorMessage="Please enter password">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="loginPassword" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="submitButton" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Sign In" OnClick="submitButton_Click" />
                </div>
            

                <p class="text-center small">Don't have an account? <a href="#">Request for access here!</a></p>
            </div>

        </section>
    </form>
</body>
</html>
