﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Admin_Orders.aspx.cs" Inherits="Power_Store.Page.Admin_Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />


<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h1 class="h2">Order Details</h1>
</div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" CssClass="table table-striped">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name"></asp:BoundField>
                <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name"></asp:BoundField>
                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address"></asp:BoundField>
                <asp:BoundField DataField="country" HeaderText="Country" SortExpression="country"></asp:BoundField>
                <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time"></asp:BoundField>
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price"></asp:BoundField>
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:Button ID="btnAction" runat="server" Text="Delete" OnClick="Delete_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

        </asp:GridView>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Orders.xml"></asp:XmlDataSource>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="JsContent" runat="server">
   

</asp:Content>

