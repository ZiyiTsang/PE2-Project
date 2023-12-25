<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Market.aspx.cs" Inherits="Power_Store.Customer_Market" %>

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
            <div class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">
                  <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2z"/>
                </svg>
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Category</a></li>
                  <asp:CheckBoxList ID="chkCategories" runat="server" RepeatDirection="Vertical">
                    <asp:ListItem Text="Computing" Value="computing" />
                    <asp:ListItem Text="Smart Tech" Value="smartT" />
                    <asp:ListItem Text="Houseware" Value="houseware" />
                    <asp:ListItem Text="Health & Care" Value="H&C" />
                    <asp:ListItem Text="Sports" Value="sport" />
                    <asp:ListItem Text="Toys" Value="toys" />
                  </asp:CheckBoxList>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Price Range</a></li>
                  <asp:CheckBoxList ID="PriceRange" runat="server" RepeatDirection="Vertical">
                    <asp:ListItem Text="under 50" Value="<50" />
                    <asp:ListItem Text="50-100" Value="50-100" />
                    <asp:ListItem Text="above 100" Value=">100" />
                  </asp:CheckBoxList>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
              <asp:Button ID="btnFilter" runat="server" Text="Apply" OnClick="btnFilter_Click" />
            </div>
        <div class="album py-2 bg-body-tertiary">
            
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
        </div>
      </form>
    </main>
</asp:Content>


