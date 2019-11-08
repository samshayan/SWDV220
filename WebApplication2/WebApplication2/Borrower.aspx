﻿<%-- 
    Date    Author      Note
    11-8-19 Sam Shayan  Adding textboxes and validators
    
    --%>

<%@ Page Title="Borrowers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Borrower.aspx.cs" Inherits="WebApplication2.Borrower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <%-- Textbox for first name  --%>
    <br /><br /> First name: <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
    <%-- field validator for input --%>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field Validator" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
    <br /><br />
    <%-- Textbox for last name  --%>
    Last Name: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <%-- field validator for input --%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field Validator" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
    <br /><br />
    <%-- Textbox for phone  --%>
    Phone:&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <%-- regex to validate phone number --%>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Use this format:  999-999-9999" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" Display="Dynamic"></asp:RegularExpressionValidator>
    <%-- field validator for input --%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field Validator" ControlToValidate="TextBox3" ForeColor="Red" Display="Dynamic" ></asp:RequiredFieldValidator>
    <br /><br />

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <%-- Adding a button --%>
    <asp:Button ID="Button1" runat="server" Text="Add to the Database" OnClick="Button1_Click" CssClass="btn btn-primary" /><br /><br />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
