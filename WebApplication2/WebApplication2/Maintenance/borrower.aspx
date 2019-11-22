<%-- 
    Date        Author      Note
    11-8-19     Sam Shayan   Adding textboxes and validators
    11-15-19    Sam Shayan   Connecting the database
                             Add Delete Edit Insert buttons
                             using stored procs
    11-22-19     Sam Shayan  Moving the file to Maintenance folder for user login authentication
    
    --%>

<%@ Page Title="Borrowers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="borrower.aspx.cs" Inherits="WebApplication2.Borrower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

   <br />
   <br />
    <%-- Adding listview to show the data in a table--%>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="borrower_id" DataSourceID="SqlDataSource1" 
        InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-light"/>
                </td>
            <%--    <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="borrower_first_nameLabel" runat="server" Text='<%# Eval("borrower_first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_last_nameLabel" runat="server" Text='<%# Eval("borrower_last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_phoneLabel" runat="server" Text='<%# Eval("borrower_phone") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <%-- Update and cencel buttons, manipulating inputs --%>

        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-warning" ValidationGroup="editValid" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn" CausesValidation="false"/>
                </td>
            <%--    <td>
                    <asp:Label ID="borrower_idLabel1" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>--%>
                <td>
                    <asp:TextBox ID="borrower_first_nameTextBox" runat="server" Text='<%# Bind("borrower_first_name") %>' />
                    <%-- Adding field validator --%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ValidationGroup="editValid" ControlToValidate="borrower_first_nameTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrower_last_nameTextBox" runat="server" Text='<%# Bind("borrower_last_name") %>' />
                    <%-- Adding field validator --%>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ValidationGroup="editValid" ControlToValidate="borrower_last_nameTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrower_phoneTextBox" runat="server" Text='<%# Bind("borrower_phone") %>' />
                    <%-- Adding field validator and regex for S phone number --%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ValidationGroup="editValid" ControlToValidate="borrower_phoneTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Example 999-999-9999" ValidationGroup="editValid" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ControlToValidate="borrower_phoneTextBox" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                </td>
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
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" CssClass="btn btn-success" ValidationGroup="insertValid"/>
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CssClass="btn btn-secondary"/>
                </td>
              <%--  <td>&nbsp;</td>--%>
                <td>
                    <asp:TextBox ID="borrower_first_nameTextBox" runat="server" Text='<%# Bind("borrower_first_name") %>' />
                    <%-- Adding field validator --%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid" ControlToValidate="borrower_first_nameTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrower_last_nameTextBox" runat="server" Text='<%# Bind("borrower_last_name") %>' />
                    <%-- Adding field validator --%>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid" ControlToValidate="borrower_last_nameTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="borrower_phoneTextBox" runat="server" Text='<%# Bind("borrower_phone") %>' />
                    <%-- Adding field validator and regex for S phone number --%>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required" ValidationGroup="insertValid" ControlToValidate="borrower_phoneTextBox" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Example 999-999-9999" ValidationGroup="insertValid" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ControlToValidate="borrower_phoneTextBox" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"/>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-light"/>
                </td>
              <%--  <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="borrower_first_nameLabel" runat="server" Text='<%# Eval("borrower_first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_last_nameLabel" runat="server" Text='<%# Eval("borrower_last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_phoneLabel" runat="server" Text='<%# Eval("borrower_phone") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="container">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" class=" table table-bordered table-condensed">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                              <%--  <th runat="server">borrower_id</th>--%>
                                <th runat="server">First Name</th>
                                <th runat="server">Last Name</th>
                                <th runat="server">Phone Number</th>
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
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn text-center" />
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
            <%--    <td>
                    <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="borrower_first_nameLabel" runat="server" Text='<%# Eval("borrower_first_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_last_nameLabel" runat="server" Text='<%# Eval("borrower_last_name") %>' />
                </td>
                <td>
                    <asp:Label ID="borrower_phoneLabel" runat="server" Text='<%# Eval("borrower_phone") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
        <%-- Adding Delete Insert Select and Update commands --%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryssConnectionString %>" 
        DeleteCommand="execute sp_DelBorrower @borrower_id" 
        InsertCommand="execute sp_InsBorrower @borrower_first_name, @borrower_phone, @borrower_last_name" 
        SelectCommand="SELECT [borrower_id], [borrower_first_name], [borrower_last_name], [borrower_phone]  FROM [Borrower] ORDER BY [borrower_last_name], [borrower_first_name]" 
        UpdateCommand="execute sp_UpdBorrower @borrower_id, @borrower_first_name, @borrower_phone, @borrower_last_name">
        <DeleteParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="borrower_first_name" Type="String" />
            <asp:Parameter Name="borrower_last_name" Type="String" />
            <asp:Parameter Name="borrower_phone" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
            <asp:Parameter Name="borrower_first_name" Type="String" />
             <asp:Parameter Name="borrower_phone" Type="String" />
            <asp:Parameter Name="borrower_last_name" Type="String" />

        </UpdateParameters>
    </asp:SqlDataSource>

   
</asp:Content>
