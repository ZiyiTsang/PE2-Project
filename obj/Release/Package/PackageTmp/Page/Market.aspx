﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Market.aspx.cs" Inherits="Power_Store.Customer_Market" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="pt-5 text-center container">
            <div class="row py-lg-5">
                <div class="col-lg-6 col-md-8 mx-auto">
                    <asp:Image runat="server" CssClass="d-block mx-auto mb-1" ImageUrl="https://img.tukuppt.com/png_preview/00/58/74/39imAuixZR.jpg!/fw/780" Width="100" Height="100" />
                    <h1 class="fw-light">Power Store</h1>
                    <p class="lead text-body-secondary">Welcome to this magical store where you can purchase anything you want! No matter what you need, we can fulfill your wishes.</p>
                    <p>
                        <button class="btn btn-primary my-2" onclick="showDialog()">Contact For Support</button>
                    </p>
                </div>
            </div>
        </section>
        <form runat="server">

            <div class="album py-2 bg-body-tertiary">

                <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <asp:Repeater ID="repeat_view_product" runat="server">
                            <ItemTemplate>
                                <div class="col">
                                    <div class="card shadow-sm">
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Page/ItemDetail.aspx?good_id=" + Eval("ItemID") %>'>
                                            <asp:Image ID="Image1" runat="server" CssClass="bd-placeholder-img card-img-top" ImageUrl='<%# Eval("ItemImage") %>' />
                                        </asp:HyperLink>
                                        <div class="card-body">
                                            <div class="my-1 d-flex justify-content-between align-items-center">
                                                <div class="text-center ">
                                                    <asp:Label ID="ItemName" runat="server" Text='<%#Eval("ItemName") %>' Font-Bold="True" Font-Size="Larger"></asp:Label>
                                                </div>
                                                <div class="text-body-secondary">
                                                    <asp:Label ID="ItemPrice" runat="server" Text='<%#"RM" + Eval("ItemPrice") %>'></asp:Label>
                                                </div>
                                            </div>

                                            <div class="my-2 ">
                                                <asp:Button ID="AddToCart" runat="server" Text="Add to cart" type="button" OnClick="Buy_click" CommandArgument='<%#Bind("ItemID")%>' CssClass="btn btn-sm btn-outline-primary" />
                                                
                                                    <asp:Button ID="Button1" runat="server" Text="Detail" type="button" OnClick="detail_click" CommandArgument='<%#Bind("ItemID")%>' CssClass="btn btn-sm btn-outline-warning" />
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>

                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </form>
    </main>
</asp:Content>


