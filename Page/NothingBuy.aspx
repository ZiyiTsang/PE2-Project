<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NothingBuy.aspx.cs" Inherits="Power_Store.NothingBuy" %>

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
            <a href="/Market.aspx" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">Power Store</span>
            </a>
        </header>
    </div>
    <div class="container">


        <main>

            <section class="py-5 text-center">
                <div class="row py-lg-5">
                    <div class="col-lg-6 col-md-8 mx-auto">
                        <h1 class="fw-light">Oooops!</h1>
                        <p class="lead text-body-secondary">You haven buy anything yet!</p>
                        <p class="lead text-body-secondary">Please select the item to buy in our store!</p>
                        <p>
                            <a href="Market.aspx" class="btn btn-primary my-2">Back</a>
                        </p>
                    </div>
                </div>
            </section>

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
