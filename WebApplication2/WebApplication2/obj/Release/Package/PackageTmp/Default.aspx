<%-- 
    Date    Author      Note
    11-8-19 Sam Shayan  Modifying content of home page
    
    --%>
<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">

        <p class="whiteText text-uppercase">Disk inventory</p>
        <p class="lead whiteText">Disk inventory for Artists, Disks and Borrowers.</p>
        <p>
            <%-- Adding github for easier access --%>
            <a class="btn btn-primary" href="https://github.com/samshayan/SWDV220" target="_blank">Github &raquo;</a>
        </p>
    </div>


    <div class="row">
        <div class="col-md-4">
            <h2>Artists</h2>
            <p>
                Add artists information here 
            </p>
            <p>
                <a class="btn btn-default" href="Artist">Click here &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Disks</h2>
            <p>
                Add disks information here
            </p>
            <p>
                <a class="btn btn-default" href="Disk">Click here &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Borrower</h2>
            <p>
                Add borrowers information here
            </p>
            <p>
                <a class="btn btn-default" href="Borrower">Click here &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
