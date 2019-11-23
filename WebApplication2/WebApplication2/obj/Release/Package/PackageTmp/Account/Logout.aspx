<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Logout.aspx.cs" Inherits="WebApplication2.Account.Logout" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-xs-8">
                <h2>Thank you for using our Music Invenory.</h2>
                <h2>We hope to see you soon again.</h2>
            </div>
            <div class="text-right col-sx-4">
                <asp:Image CssClass="goodbyeLogo image-rotate-horizontal1" ID="Image1" runat="server" ImageUrl="~/Image/s-logo.png" />
                <asp:Image CssClass="goodbyeLogo image-rotate-horizontal1" ID="Image2" runat="server" ImageUrl="~/Image/s-logo.png" />
            </div>
        </div>
    </div>

</asp:Content>
