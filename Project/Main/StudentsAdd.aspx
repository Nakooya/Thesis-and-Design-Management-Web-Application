<%@ Page Title="" Language="C#" MasterPageFile="~/Main/NavMaster.Master" AutoEventWireup="true" CodeBehind="StudentsAdd.aspx.cs" Inherits="Project.Main.WebForm3" %>

<%@ Register Src="~/UserControls/AddStudent.ascx" TagPrefix="uc1" TagName="AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/TextBox.css" rel="stylesheet" />
    <link href="../CSS/StudentsViewAlign.css" rel="stylesheet" />
    <title>Add Students</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:AddStudent runat="server" id="AddStudent" />
</asp:Content>
