<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Power_Store.Page.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <br />
        <br />
        <div class="py-4 text-center">
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
                                <div class="col-2">
                                    <input class="form-check-input cart_item_checkbox" type="checkbox" value="" style="height: 30px; width: 30px;" checked onclick="calculateTotalPrice()">
                                </div>
                                <div class="col-10">
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
                    <span class="">Total (RM)</span>
                    <asp:Label ID="TotalPrice" runat="server" Text="0" Font-Bold="True" CssClass=""></asp:Label>
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
                        <asp:TextBox ID="firstName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>


                    <div class="col-sm-6">
                        <label for="lastName" class="form-label">Last name</label>
                        <asp:TextBox ID="lastName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-12">
                        <label for="email" class="form-label">Email</label>
                        <div class="input-group mb-3">

                            <asp:TextBox ID="emailFirst" runat="server" CssClass="form-control"></asp:TextBox>
                            <span class="input-group-text">@</span>
                            <asp:TextBox ID="emailServer" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>


                    <div class="col-12">
                        <label for="address" class="form-label">Address</label>
                        <asp:TextBox ID="address1" runat="server" CssClass="form-control" Text="1234 Main St"></asp:TextBox>
                    </div>

                    <div class="col-12">
                        <label for="address2" class="form-label">Address 2 <span class="text-body-secondary">(Optional)</span></label>
                        <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">
                    </div>

                    <div class="col-md-9">
                        <label for="country" class="form-label">Country</label>

                        <asp:DropDownList ID="country1" runat="server" CssClass="form-select">
                            <asp:ListItem Text="United States" Value="United States"></asp:ListItem>
                            <asp:ListItem Text="Malaysia" Value="Malaysia"></asp:ListItem>
                            <asp:ListItem>China</asp:ListItem>
                            <asp:ListItem>Chinese Hong Kong</asp:ListItem>
                            <asp:ListItem>Canada</asp:ListItem>
                            <asp:ListItem>Mexico</asp:ListItem>
                        </asp:DropDownList>
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
                                <asp:RadioButton runat="server" Text="Credit card" GroupName="payMethod" />
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
                    </label>
                    2
                </div>
                <asp:Button ID="pay_button" runat="server" Text="Pay" type="button" OnClick="Submit_click" CssClass="d-block w-50 btn btn-primary btn-lg mx-auto mt-3" />
            </form>

        </div>

    </main>
</asp:Content>

