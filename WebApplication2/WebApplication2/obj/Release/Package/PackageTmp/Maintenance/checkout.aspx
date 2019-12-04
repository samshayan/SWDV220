<%-- 
    Date        Author      Note
    12-4-19     Sam Shayan  Adding checkout page
--%>

<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="WebApplication2.Maintenance.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <p>
        Select a disk:
    </p>
    <p>
        <%-- Dropdown list for disks --%>
        <asp:DropDownList ID="DropDownList1" Style="width: 200px;" runat="server" DataSourceID="SqlDataSource1" DataTextField="disk_name"
            DataValueField="disk_id" OnDataBound="ddl_DataBound" CausesValidation="true">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Please choose a disk" ControlToValidate="DropDownList1"
            Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        <%-- Data source for disk dropdown --%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:disk_inventoryssConnectionString %>"
            SelectCommand="SELECT [disk_id], [disk_name] FROM [Disk] WHERE ([status_id] = @status_id) order by disk_name">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="status_id" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    &nbsp;
    <p>
        Select a borrower:
    </p>
    <p>
        <%-- Dropdown list for borrower --%>

        <asp:DropDownList Style="width: 200px;" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name"
            DataValueField="borrower_id" OnDataBound="ddl_DataBound1" CausesValidation="true">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please choose a borrower" ControlToValidate="DropDownList2"
            Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
   

        <%-- Data source for disk borrower --%>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:disk_inventoryssConnectionString %>"
            SelectCommand="SELECT [borrower_id], [borrower_last_name] +', '+ [borrower_first_name] as Name FROM [Borrower] order by [borrower_last_name]">
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        Select a data:
    </p>
    <p>
        <%-- Textbox for date entry --%>
        <asp:TextBox Style="width: 200px;" ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please choose a date" ControlToValidate="TextBox1"
            CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

             <asp:CompareValidator ID="CompareTodayValidator" Operator="LessThanEqual" Type="Date" ControlToValidate="TextBox1" ErrorMessage="Please choose valid date" Display="Dynamic" CssClass="text-danger"
            runat="server" />

    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <%-- Button to submit entires --%>
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Checkout" OnClick="Button1_Click" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>


</asp:Content>
