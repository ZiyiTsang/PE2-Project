<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Power_Store.Page.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Power Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
</head>

<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-body text-center">
                <h5 class="card-title fw-bold">Welcome to Power Store</h5>
                <hr class="my-4">

                <form runat="server" id="loginForm">

                    <div class="text-center mb-2">
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger fw-bold"></asp:Label>
                    </div>

                    <!-- Username Row -->
                    <div class="mb-2 row justify-content-center">
                        <label for="txtUsername" class="col-sm-4 col-form-label fw-bold">Username:</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="txtUsername_label" CssClass="form-control" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>

                    <!-- Password Row -->
                    <div class="mb-2 row justify-content-center">
                        <asp:Label ID="label_password" runat="server" CssClass="col-sm-4 col-form-label fw-bold">Password:</asp:Label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>

                        </div>
                    </div>

                    <!-- User Type Row -->
                    <div class="mb-2 row justify-content-center">
                        <asp:Label ID="lblUserType" runat="server" CssClass="col-sm-4 col-form-label fw-bold">User Type:</asp:Label>
                        <div class="col-sm-4">
                            <asp:DropDownList ID="ddlUserType" CssClass="form-select" runat="server">
                                <asp:ListItem Text="Customer" Value="customer" />
                                <asp:ListItem Text="Admin" Value="admin" />
                            </asp:DropDownList>
                            <asp:TextBox ID="psdAgain" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:Label ID="role_display" CssClass="form-control" runat="server" Visible="false"></asp:Label>
                        </div>
                    </div>

                    <div class="text-center mt-3">
                        <asp:HyperLink ID="register_link" runat="server" ForeColor="#FF6600" Text="Register Here" NavigateUrl="LoginPage.aspx?state=register">Register Here</asp:HyperLink>
                        <asp:HyperLink ID="login_link" runat="server" ForeColor="#FF6600" Text="Register Here" NavigateUrl="LoginPage.aspx?state=login">Login Here</asp:HyperLink>
                    </div>
                    <div class="text-center mb-3">
    <asp:HyperLink ID="Back" runat="server" ForeColor="#FF6600" Text="Register Here" NavigateUrl="Market.aspx">Back to Market</asp:HyperLink>
   
</div>

                    <!-- Submit Button Row -->
                    <div class="mb-2 row justify-content-center">
                        <div class="col-sm-4">
                            <asp:Button ID="btnSubmit" Text="Login" CssClass="btn btn-primary fw-bold" runat="server" OnClick="btnSubmit_Click" />
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</body>
</html>
