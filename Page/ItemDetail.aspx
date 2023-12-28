<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="ItemDetail.aspx.cs" Inherits="Power_Store.Page.ItemDetail" %>

       
        <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div align="center">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="ProductId" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="container">
                    <div class="row">
                        <div class="col-12-lg mt-2">
                            <div class="card" style="width:28rem;">
                                 <asp:Image ID="Image1" runat="server" CssClass="bd-placeholder-img card-img-top" Width="100%" Height="225%" ImageUrl='<%#Eval("ItemImage") %>' />
                                
                                <div class="'card-body bg-dark">
                                     <asp:Label ID="ItemName" runat="server" Text='<%#Eval("ItemName") %>' Font-Bold="True" Font-Size="Larger"></asp:Label>
                                     <br />
                                     <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                     <br />
                                    <asp:Label ID="ItemPrice" runat="server" Text='<%#"RM" + Eval("ItemPrice") %>' CssClass="text-body-secondary"></asp:Label>
                                    </br>
                                   <asp:Button ID="AddToCart" runat="server" Text="Add to cart" type="button" OnClick="Buy_click" CommandArgument='<%#Bind("ItemID")%>' CssClass="btn btn-sm btn-outline-secondary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

        </asp:DataList>

    </div>


</asp:Content>
   
   

