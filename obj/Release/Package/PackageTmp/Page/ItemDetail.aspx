<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="ItemDetail.aspx.cs" Inherits="Power_Store.Page.ItemDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <p>ID:<%=item.ItemID%></p>
    <p>Name:<%=item.ItemName%></p>
    <p>Price:<%=item.ItemPrice%></p>
    <p>Description:<%=item.ItemDescription%></p>
    <p>ImagePath:<%=item.ItemImage%></p>


</asp:Content>
