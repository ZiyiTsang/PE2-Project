<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Admin_Orders.aspx.cs" Inherits="Power_Store.Page.Admin_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name"></asp:BoundField>
                    <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name"></asp:BoundField>
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address"></asp:BoundField>
                    <asp:BoundField DataField="country" HeaderText="country" SortExpression="country"></asp:BoundField>
                    <asp:BoundField DataField="time" HeaderText="time" SortExpression="time"></asp:BoundField>
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"></asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
                    </Columns>
            </asp:GridView>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Orders.xml"></asp:XmlDataSource>
        </div>
    </form>
</asp:Content>
