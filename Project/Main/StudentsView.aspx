<%@ Page Title="" Language="C#" MasterPageFile="~/Main/NavMaster.Master" AutoEventWireup="true" CodeBehind="StudentsView.aspx.cs" Inherits="Project.Main.WebForm2" %>

<%@ Register Src="~/UserControls/Students.ascx" TagPrefix="uc1" TagName="Students" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/StudentsView.css" rel="stylesheet" />
    <title>Students View</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:Students runat="server" id="Students" />
</asp:Content>
