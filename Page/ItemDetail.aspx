<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="ItemDetail.aspx.cs" Inherits="Power_Store.Page.ItemDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <main>
            <section class="pt-5 text-center container">
                <form runat="server">
                    <div class="row py-lg-5">
                        <div class="col-lg-6 col-md-8 mx-auto">
                            <div class="card-body bg-grey">
                                <asp:Image ID="ItemImg" runat="server" CssClass="d-block mx-auto mb-1" Width="100" Height="100" />
                                <asp:Label ID="ItemName" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
                                <br />
                                <asp:Label ID="ItemDescription" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="ItemPrice" runat="server" CssClass="text-body-secondary"></asp:Label>
                                <br />
                                <asp:Button ID="AddToCart" runat="server" Text="Add to cart" type="button" OnClick="Buy_click" CssClass="btn btn-sm btn-outline-secondary" />
                            </div>
                        </div>
                    </div>
                </form>
            </section>
        </main>
    </div>
</asp:Content>
   
   

