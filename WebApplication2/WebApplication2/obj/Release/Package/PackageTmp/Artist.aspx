
<%-- 
    Date        Author      Note
    11-8-19     Sam Shayan  Adding Coming soon content
    11-15-19    Sam Shayan  Connecting the database
                            Add Delete Edit Insert buttons
                            using stored procs
    
    --%>
<%@ Page Title="Artists" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Artist.aspx.cs" Inherits="WebApplication2.Artist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
    <%-- Adding listview to show the data in a table--%>
    <br />
    <br />

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="artist_id" DataSourceID="SqlDataSource1" 
        InsertItemPosition="LastItem">
        <AlternatingItemTemplate >
            <tr style="" >
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
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_id") %>' />
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
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-warning"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn" CausesValidation="false"/>
                </td>
                <td>
                    <asp:TextBox ID="artist_first_nameTextBox" runat="server" Text='<%# Bind("artist_first_name") %>' />
                    <%-- Adding field validator --%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="artist_first_nameTextBox" DDisplay="Dynamic" CssClass="text-danger" ValidationGroup="editValid"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="artist_last_nameTextBox" runat="server" Text='<%# Bind("artist_last_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artist_type_idTextBox" runat="server" Text='<%# Bind("artist_type_id") %>' />
                    <%-- Adding field validator and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ValidationGroup="editValid" ControlToValidate="artist_type_idTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*Invalid ID" Type="Integer" MinimumValue="1" MaximumValue="2" ControlToValidate="artist_type_idTextBox" ValidationGroup="editValid" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
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
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-secondary"/>
                </td>
                <td>
                    <asp:TextBox ID="artist_first_nameTextBox" runat="server" Text='<%# Bind("artist_first_name") %>' />
                    <%-- Adding field validator --%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ControlToValidate="artist_first_nameTextBox" ValidationGroup="insertValid" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="artist_last_nameTextBox" runat="server" Text='<%# Bind("artist_last_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="artist_type_idTextBox" runat="server" Text='<%# Bind("artist_type_id") %>' ControlToValidate="artist_type_idTextBox" /> 
                    <%-- Adding field validator and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid" ControlToValidate="artist_type_idTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                      <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*Must be 1 or 2" Type="Integer" MinimumValue="1" MaximumValue="2" ControlToValidate="artist_type_idTextBox" ValidationGroup="insertValid" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                    <%-- Adding user-friendly help message --%>
                    <br />Plase insert: </br>
                    1: Solo<br />
                    2: Band
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
                    <asp:Label ID="artist_type_idLabel" runat="server" Text='<%# Eval("artist_type_id") %>' />
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
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"  ButtonCssClass="btn" />
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
        SelectCommand="SELECT [artist_first_name], [artist_last_name], [artist_type_id], [artist_id] FROM [Artist] ORDER BY artist_last_name, artist_first_name" 
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
