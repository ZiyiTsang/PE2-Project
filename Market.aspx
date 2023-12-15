<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Market.aspx.cs" Inherits="Power_Store.Market" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script>
    function showDialog() {
        alert("Customer service is not online！");
    }
    </script>
</head>
<body>
    <header class="navbar d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom fixed-top">
        <a href="/Market.aspx" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            <svg class="bi me-2" width="40" height="32">
                <use xlink:href="#bootstrap"></use></svg>
            <span class="fs-4">Power Store</span>
        </a>

        <ul class="nav nav-pills mx-3">
            <li class="nav-item"><a href="PaymentPage.aspx" class="nav-link active" aria-current="page">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
                </svg>
                Cart
            </a></li>
        </ul>
        
    </header>
   
    

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

        <div class="album py-2 bg-body-tertiary">
            <form runat="server">
                <div class="container">
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                        <asp:Repeater ID="repeat_view_product" runat="server">
                            <ItemTemplate>
                                <div class="col">
                                    <div class="card shadow-sm">
                                        <asp:Image ID="Image1" runat="server" CssClass="bd-placeholder-img card-img-top" Width="100%" Height="225%" ImageUrl='<%#Eval("ItemImage") %>' />
                                        <div class="card-body">
                                            <div class="my-1">
                                                <asp:Label ID="ItemName" runat="server" Text='<%#Eval("ItemName") %>' Font-Bold="True" Font-Size="Larger"></asp:Label>
                                                <br />
                                                <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>'></asp:Label>
                                                <br />
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mt-4">
                                                <asp:Button ID="AddToCart" runat="server" Text="Add to cart" type="button" OnClick="Buy_click" CommandArgument='<%#Bind("ItemID")%>' CssClass="btn btn-sm btn-outline-secondary" />
                                                <asp:Label ID="ItemPrice" runat="server" Text='<%#"RM" + Eval("ItemPrice") %>' CssClass="text-body-secondary"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>

                        </asp:Repeater>
                    </div>
                </div>
            </form>

        </div>
        <footer class="bg-warning  text-dark text-center ">
            <div class="container">
                <p>
                    Copyright © 2023<br />
                    Ziyi-CME1909120
                </p>
            </div>
        </footer>

    </main>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
