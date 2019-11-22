<%-- 
    Date        Author       Note
    11-8-19     Sam Shayan   Adding Coming soon content
    11-15-19    Sam Shayan   Connecting the database
                             Add Delete Edit Insert buttons
                             using stored procs
    11-22-19     Sam Shayan  Moving the file to Maintenance folder for user login authentication
    
--%>

<%@ Page Title="Artists" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="artist.aspx.cs" Inherits="WebApplication2.Artist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <%-- artist type SQL --%>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
        ConnectionString="<%$ ConnectionStrings:disk_inventoryssConnectionString %>"
        SelectCommand="SELECT [artist_type_id], [artist_type_desc] FROM [ArtistType]"></asp:SqlDataSource>

    <%-- Adding listview to show the data in a table--%>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="artist_id" DataSourceID="SqlDataSource1"
        InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <%-- Delete button --%>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                    <%-- Edit button --%>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-light" />
                </td>
                <td>
                    <%-- Eval for reading --%>
                    <asp:Label ID="artist_first_nameLabel" runat="server" Text='<%# Eval("artist_first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_last_nameLabel" runat="server" Text='<%# Eval("artist_last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_desc") %>' />
                    <%--  </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>--%>
            </tr>
        </AlternatingItemTemplate>
        <%-- Update and cencel buttons, manipulating inputs --%>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-warning" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn" CausesValidation="false" />
                </td>
                <td>
                    <asp:TextBox ID="artist_first_nameTextBox" runat="server" Text='<%# Bind("artist_first_name") %>' />
                    <%-- Adding field validator --%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="artist_first_nameTextBox"
                        DDisplay="Dynamic" CssClass="text-danger" ValidationGroup="editValid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="artist_last_nameTextBox" runat="server" Text='<%# Bind("artist_last_name") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="ddlItemCodes" runat="server" AutoPostBack="False" CausesValidation="True" SelectedValue='<%# Bind("artist_type_id") %>'
                        ValidationGroup="editValid" DataSourceID="SqlDataSource2" DataTextField="artist_type_desc" DataValueField="artist_type_id">
                    </asp:DropDownList>
                </td>
                <%--  <td>
                    <asp:Label ID="artist_idLabel1" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>--%>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-success" ValidationGroup="insertValid" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-secondary" />
                </td>
                <td>
                    <asp:TextBox ID="artist_first_nameTextBox" runat="server" Text='<%# Bind("artist_first_name") %>' />
                    <%-- Adding field validator --%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="artist_first_nameTextBox"
                        ValidationGroup="insertValid" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="artist_last_nameTextBox" runat="server" Text='<%# Bind("artist_last_name") %>' />
                </td>
                <td>
                    <%-- Adding dropdown for artist type --%>
                    <asp:DropDownList ID="ddlItemCodes" runat="server" AutoPostBack="False" CausesValidation="True" SelectedValue='<%# Bind("artist_type_id") %>'
                        ValidationGroup="insertValid" DataSourceID="SqlDataSource2" DataTextField="artist_type_desc" DataValueField="artist_type_id">
                    </asp:DropDownList>
                </td>
                <%--  <td>&nbsp;</td>--%>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-light" />
                </td>
                <td>
                    <asp:Label ID="artist_first_nameLabel" runat="server" Text='<%# Eval("artist_first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_last_nameLabel" runat="server" Text='<%# Eval("artist_last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_desc") %>' />
                </td>
                <%--  <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>--%>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="container">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" class=" table table-bordered table-condensed">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">First Name</th>
                                <th runat="server">Last Name</th>
                                <th runat="server">Artist Type</th>
                                <%--  <th runat="server">artist_id</th>--%>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="artist_first_nameLabel" runat="server" Text='<%# Eval("artist_first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_last_nameLabel" runat="server" Text='<%# Eval("artist_last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_id") %>' />
                </td>
                <td>
                    <asp:Label ID="artist_idLabel" runat="server" Text='<%# Eval("artist_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <%-- Adding Delete Insert Select and Update commands --%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:disk_inventoryssConnectionString %>"
        DeleteCommand="execute sp_DelArtist @artist_id"
        InsertCommand="execute sp_InsArtist @artist_first_name, @artist_type_id, @artist_last_name"
        SelectCommand="SELECT [artist_first_name], [artist_last_name], Artist.artist_type_id, ArtistType.artist_type_desc, [artist_id] FROM        [Artist] 
            JOIN ArtistType 
            on ArtistType.artist_type_id = Artist.artist_type_id
            ORDER BY artist_last_name, artist_first_name"
        UpdateCommand="execute sp_UpdArtist @artist_id, @artist_first_name, @artist_type_id, @artist_last_name">
        <DeleteParameters>
            <asp:Parameter Name="artist_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="artist_first_name" Type="String" />
            <asp:Parameter Name="artist_type_id" Type="Int32" />
            <asp:Parameter Name="artist_last_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="artist_id" Type="Int32" />
            <asp:Parameter Name="artist_first_name" Type="String" />
            <asp:Parameter Name="artist_type_id" Type="Int32" />
            <asp:Parameter Name="artist_last_name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
