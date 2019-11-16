<%-- 
    Date        Author      Note
    11-8-19     Sam Shayan  Adding Coming soon content
    11-15-19    Sam Shayan  Connecting the database
                            Add Delete Edit Insert buttons
                            using stored procs
    
--%>

<%@ Page Title="Disks" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="disk.aspx.cs" Inherits="WebApplication2.Disk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Adding listview to show the data in a table--%>
    <br />
    <br />

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="disk_id"
        InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-light" />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_release_dateLabel" runat="server" Text='<%# Eval("disk_release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
                <%--  <td>
                            <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                        </td>--%>
            </tr>
        </AlternatingItemTemplate>
        <%-- Update and cencel buttons, manipulating inputs --%>

        <EditItemTemplate>
            <tr style="">
                <td class="container">
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-warning " />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn" CausesValidation="false" />
                </td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                    <%-- Adding field validator --%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ControlToValidate="disk_nameTextBox"
                        ValidationGroup="editValid" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="disk_release_dateTextBox" runat="server" Text='<%# Bind("disk_release_date") %>' />
                    <%-- Adding field and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ValidationGroup="editValid"
                        ControlToValidate="disk_release_dateTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*Invalid date" ValidationGroup="editValid" Type="Date"
                        MaximumValue="12/31/9999" MinimumValue="01/01/0001" ControlToValidate="disk_release_dateTextBox" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' />
                    <%-- Adding field and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ValidationGroup="editValid"
                        ControlToValidate="genre_idTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="*Invalid ID" ControlToValidate="genre_idTextBox" MaximumValue="5"
                        MinimumValue="1" ValidationGroup="editValid" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' />
                    <%-- Adding field and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ValidationGroup="editValid"
                        ControlToValidate="status_idTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="*Invalid ID" ControlToValidate="status_idTextBox" MaximumValue="4"
                        MinimumValue="1" ValidationGroup="editValid" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                </td>
                <td>
                    <asp:TextBox ID="disk_type_idTextBox" runat="server" Text='<%# Bind("disk_type_id") %>' />
                    <%-- Adding field and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required" ValidationGroup="editValid"
                        ControlToValidate="disk_type_idTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="*Invalid ID" ControlToValidate="disk_type_idTextBox"
                        MaximumValue="5" MinimumValue="1" ValidationGroup="editValid" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                </td>
                <%-- <td>
                            <asp:Label ID="disk_idLabel1" runat="server" Text='<%# Eval("disk_id") %>' />
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
                <td class="container">

                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-success" ValidationGroup="insertValid" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-secondary" />
                </td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                    <%-- Adding field validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid"
                        ControlToValidate="disk_nameTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="disk_release_dateTextBox" runat="server" Text='<%# Bind("disk_release_date") %>' />
                    <%-- Adding field and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid"
                        ControlToValidate="disk_release_dateTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="*Invalid date" ValidationGroup="insertValid" Type="Date"
                        MaximumValue="12/31/9999" MinimumValue="01/01/0001" ControlToValidate="disk_release_dateTextBox" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>

                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' />
                    <%-- Adding field and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid"
                        ControlToValidate="genre_idTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="*Invalid ID" ControlToValidate="genre_idTextBox" MaximumValue="5"
                        MinimumValue="1" ValidationGroup="insertValid" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                    <%-- Adding user-friendly help message --%>
                    <br />
                    Please insert:<br />
                    1: Classical Rock<br />
                    2: Country<br />
                    3: Jass<br />
                    4: AltRock<br />
                    5: Metal
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' />
                    <%-- Adding field and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid"
                        ControlToValidate="status_idTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="*Invalid ID" ControlToValidate="status_idTextBox" MaximumValue="4"
                        MinimumValue="1" ValidationGroup="insertValid" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                    <%-- Adding user-friendly help message --%>
                    <br />
                    Please insert:<br />
                    1: Available<br />
                    2: On loan<br />
                    3: Damage<br />
                    4: Missing
                </td>
                <td>
                    <asp:TextBox ID="disk_type_idTextBox" runat="server" Text='<%# Bind("disk_type_id") %>' />
                    <%-- Adding field and range validator--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid"
                        ControlToValidate="disk_type_idTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="*Invalid ID" ControlToValidate="disk_type_idTextBox"
                        MaximumValue="5" MinimumValue="1" ValidationGroup="insertValid" Display="Dynamic" CssClass="text-danger"></asp:RangeValidator>
                    <%-- Adding user-friendly help message --%>
                    <br />
                    Please insert:<br />
                    1: CD<br />
                    2: Vinyl<br />
                    3: 8-Track<br />
                    4: Cassette<br />
                    5: DVD
                </td>
                <%--<td>&nbsp;</td>--%>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-light" />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_release_dateLabel" runat="server" Text='<%# Eval("disk_release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
                <%-- <td>
                            <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
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
                                <th runat="server">Disk Name</th>
                                <th runat="server">Release Date</th>
                                <th runat="server">Genre</th>
                                <th runat="server">Status</th>
                                <th runat="server">Disk Type</th>
                                <%-- <th runat="server">disk_id</th>--%>
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
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_release_dateLabel" runat="server" Text='<%# Eval("disk_release_date") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
                <%--<td>
                            <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                        </td>--%>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <%-- Adding Delete Insert Select and Update commands --%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:disk_inventoryssConnectionString %>"
        DeleteCommand="execute sp_DelDisk @disk_id"
        InsertCommand="execute sp_InsDisk @disk_name, @disk_release_date, @genre_id, @status_id, @disk_type_id"
        SelectCommand="SELECT [disk_name], convert(varchar(10), disk_release_date, 120) as disk_release_date, [genre_id], [status_id], [disk_type_id], [disk_id] FROM [Disk] ORDER BY [disk_name]"
        UpdateCommand="execute sp_UpdDisk @disk_id, @disk_name,@disk_release_date,  @genre_id, @status_id, @disk_type_id">
        <DeleteParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="disk_release_date" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter DbType="Date" Name="disk_release_date" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />

        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
