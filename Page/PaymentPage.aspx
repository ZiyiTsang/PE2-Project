<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentPage.aspx.cs" Inherits="Power_Store.PaymentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>
<body>
    <div class="container">
        <header class="navbar d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom sticky-top">
            <a href="/Page/Market.aspx" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">Power Store</span>
            </a>
        </header>
    </div>
    <div class="container">


        <main>

            <div class="py-2 text-center">
                <asp:Image runat="server" CssClass="d-block mx-auto mb-1" ImageUrl="https://th.bing.com/th/id/OIP.ToIAenyM3a5cJ0Dz-b9t3AHaHa?pid=ImgDet&rs=1" Width="100" Height="100" />
                <h2>Payment Detail</h2>
                <p class="lead">Please follow the guideline carefully below to make the payment.</p>
            </div>

            <hr class="pb-4">

            <div class="order-md-last mx-5 pb-4">
                <h4 class="d-flex justify-content-between align-items-center">
                    <span class="text-primary">Step 1: Check your goods</span>
                    <span class="badge bg-primary rounded-pill">
                        <asp:Label ID="ItemCount" runat="server" Text="0"></asp:Label></span>

                </h4>
                <ul class="list-group">

                    <asp:Repeater ID="paymentRepeater" runat="server">
                        <ItemTemplate>
                            <li class="list-group-item d-flex justify-content-between lh-sm">
                                <div class="row">
                                    <div class="col-1 mx-auto">
                                        <input class="form-check-input" type="checkbox" value="" style="height: 30px; width: 30px;">
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="ItemName" runat="server" Text='<%#Eval("ItemName") %>' CssClass="my-0"></asp:Label>
                                        <br />
                                        <asp:Label ID="ItemDescription" runat="server" Text='<%#Eval("ItemDescription") %>' CssClass="text-body-secondary"></asp:Label>
                                    </div>
                                </div>
                                <span class="text-body-secondary">
                                    <asp:Label ID="ItemPrice" runat="server" Text='<%#Eval("ItemPrice") %>'></asp:Label></span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>


                    <li class="list-group-item d-flex justify-content-between">
                        <span>Total (RM)</span>
                        <asp:Label ID="TotalPrice" runat="server" Text="0" Font-Bold="True"></asp:Label>
                    </li>
                </ul>
            </div>

            <hr class="my-2">


            <div class="my-5 mx-5">
                <h4 class="d-flex justify-content-between align-items-center">
                    <span class="text-primary">Step 2: Payment information</span>

                </h4>
                <form runat="server" class="p-4 p-md-5 border rounded-3 bg-body-tertiary">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="firstName" class="form-label">First name</label>
                            <input type="text" class="form-control" id="firstName" placeholder="">
                        </div>


                        <div class="col-sm-6">
                            <label for="lastName" class="form-label">Last name</label>
                            <input type="text" class="form-control" id="lastName" placeholder="" value="">
                        </div>

                        <div class="col-12">
                            <label for="email" class="form-label">Email</label>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="Username" aria-label="Username" id="email">
                                <span class="input-group-text">@</span>
                                <input type="text" class="form-control" placeholder="Server" aria-label="Server">
                            </div>
                        </div>
                        

                        <div class="col-12">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" placeholder="1234 Main St">
                        </div>

                        <div class="col-12">
                            <label for="address2" class="form-label">Address 2 <span class="text-body-secondary">(Optional)</span></label>
                            <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                        </div>

                        <div class="col-md-5">
                            <label for="country" class="form-label">Country</label>
                            <select class="form-select" id="country">
                                <option value="">Choose...</option>
                                <option>United States</option>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="state" class="form-label">State</label>
                            <select class="form-select" id="state">
                                <option value="">Choose...</option>
                                <option>California</option>
                            </select>
                        </div>

                        <div class="col-md-3">
                            <label for="zip" class="form-label">Zip</label>
                            <input type="text" class="form-control" id="zip" placeholder="">
                        </div>
                    </div>

                    <hr class="my-4">


                    <div class="row">


                        <div class="my-auto col-5">
                            <fieldset>
                                <legend class="col-form-label"><strong>Payment method</strong></legend>
                                <div class="form-check mt-5">
                                    <!--<input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked="">
                                <label class="form-check-label" for="credit">Credit card</label>-->
                                    <asp:RadioButton runat="server" Text="Credit card"  GroupName="payMethod" />
                                </div>
                                <div class="form-check my-2">
                                    <!--<input id="debit" name="paymentMethod" type="radio" class="form-check-input">
                                <label class="form-check-label" for="debit">Debit card</label>-->
                                    <asp:RadioButton runat="server" Text="Debit Card" GroupName="payMethod" />
                                </div>
                                <div class="form-check">
                                    <!--<input id="paypal" name="paymentMethod" type="radio" class="form-check-input">
                                <label class="form-check-label" for="paypal">PayPal</label>-->
                                    <asp:RadioButton runat="server" Text="PayPal" GroupName="payMethod" />
                                </div>
                            </fieldset>
                        </div>

                        <div class="col-7">
                            <div class="row gy-3">
                                <div class="col-md-6">
                                    <label for="cc-name" class="form-label">Name on card</label>
                                    <input type="text" class="form-control" id="cc-name" placeholder="Jason">
                                </div>

                                <div class="col-md-6">
                                    <label for="cc-number" class="form-label">Credit card number</label>
                                    <input type="text" class="form-control" id="cc-number" placeholder="1234567">
                                </div>

                                <div class="col-md-3">
                                    <label for="cc-expiration" class="form-label">Expiration</label>
                                    <input type="text" class="form-control" id="cc-expiration" placeholder="07/22">
                                </div>

                                <div class="col-md-3">
                                    <label for="cc-cvv" class="form-label">CVV</label>
                                    <input type="text" class="form-control" id="cc-cvv" placeholder="728">
                                </div>
                            </div>
                        </div>

                    </div>

                    <hr class="my-4">
                    <div class="form-check mx-auto">
                        <input type="checkbox" />
                        <label class="form-check-label" for="CheckBox2">
                            I confirm that all products are accurate and accurate
                        </label>
                    </div>
                    <div class="form-check mx-auto">
                        <asp:CheckBox ID="Conform2" runat="server" />
                        <label class="form-check-label" for="Conform2">
                            I confirm that all payment information is accurate and accurate
                        </label>2
                    </div>
                    <asp:Button ID="pay_button" runat="server" Text="Pay" type="button" OnClick="Submit_click" CssClass="d-block w-50 btn btn-primary btn-lg mx-auto mt-3" />
                </form>

            </div>

        </main>


    </div>
    <footer class="bg-warning  text-dark text-center ">
        <div class="container">
            <p>
                Copyright © 2023<br />
                Ziyi-CME1909120
            </p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
