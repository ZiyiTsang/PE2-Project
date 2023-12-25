<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Main.Master" AutoEventWireup="true" CodeBehind="NothingBuy.aspx.cs" Inherits="Power_Store.Page.NothingToBuy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
</asp:Content>
