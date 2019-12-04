<%-- 
    Date        Author      Note
    12-02-19    Sam Shayan  Adding avaialbe disk page
--%>

<%@ Page Title="availableDisk" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="availableDisk.aspx.cs"
    Inherits="WebApplication2.Borrower" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="status_descLabel" runat="server" Text='<%# Eval("status_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_descLabel" runat="server" Text='<%# Eval("disk_type_desc") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="status_descTextBox" runat="server" Text='<%# Bind("status_desc") %>' />
                </td>
                <td>
                    <asp:TextBox ID="disk_type_descTextBox" runat="server" Text='<%# Bind("disk_type_desc") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server"
                style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="status_descTextBox" runat="server" Text='<%# Bind("status_desc") %>' />
                </td>
                <td>
                    <asp:TextBox ID="disk_type_descTextBox" runat="server" Text='<%# Bind("disk_type_desc") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="status_descLabel" runat="server" Text='<%# Eval("status_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_descLabel" runat="server" Text='<%# Eval("disk_type_desc") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="container">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" class=" table table-bordered table-condensed">
                            <tr runat="server" style="">
                                <th runat="server">Disk Name</th>
                                <th runat="server">Status</th>
                                <th runat="server">Disk Type</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server"
                        style="">
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
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="status_descLabel" runat="server" Text='<%# Eval("status_desc") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_descLabel" runat="server" Text='<%# Eval("disk_type_desc") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:disk_inventoryssConnectionString %>"
        SelectCommand="SELECT Disk.disk_name, Status.status_desc, DiskType.disk_type_desc
                        FROM Disk
                         JOIN DiskType ON DiskType.disk_type_id= Disk.disk_type_id
                         JOIN Status ON Status.status_id= Disk.status_id
                         Where Disk.status_id = 1;"></asp:SqlDataSource>
    <br />
</asp:Content>

