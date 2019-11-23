<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenAuthProviders.ascx.cs" Inherits="WebApplication2.Account.OpenAuthProviders" %>

<div id="socialLoginList">
    <h4>Keep track of your favourite music collection.</h4>
    <hr />
    <asp:ListView runat="server" ID="providerDetails" ItemType="System.String"
        SelectMethod="GetProviderNames" ViewStateMode="Disabled">
        <ItemTemplate>
            <p>
                <button type="submit" class="btn btn-default" name="provider" value="<%#: Item %>"
                    title="Log in using your <%#: Item %> account.">
                    <%#: Item %>
                </button>
            </p>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div>
                <p>Personal database for music lovers and collectors.</p>
                <p>Music has the power to bridge cultures and fill the gap between generations. Classical music can soothe the soul and calm a troubled mind. Jazz music can tickle the ears and get a person’s foot tapping to the beat. And many other musical genres and styles have their own unique sounds that speak more eloquently than words can describe.</p>
            </div>
        </EmptyDataTemplate>
    </asp:ListView>
</div>
