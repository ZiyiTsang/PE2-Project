<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="ItemDetail.aspx.cs" Inherits="Power_Store.Page.ItemDetail" %>

        <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div align="center">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductId" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="container">
                    <div class="row">
                        <div class="col-12-lg mt-2">
                            <div class="card" style="width:28rem;">
                                <asp:Image CssClass="card-img-yop" IF="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>'
                                    AlternateText="Product Image" />
                                <div class="'card-body bg-dark">
                                    <h5 class="card-title text-white"><%# Eval("Name") %></h5>
                                    <h6 class="card-title text-white"><%# Eval("Price") %></h6>
                                    <p class="card-title text-white"><%# Eval("Description") %></p>
                                    <asp: Button CssClass="btn btn-primary" ID="Button1" runat="server" Text="Add to the cart" CommandArgument='<%# Eval("Item") %>'
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductId" QueryStringField="id" Type="Int32" />
        </SelectParameters>

    </div>

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
   

