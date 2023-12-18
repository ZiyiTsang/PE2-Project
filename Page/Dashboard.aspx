<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Power_Store.Page.Dashboard" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <div class="chartjs-size-monitor">
        <div class="chartjs-size-monitor-expand">
            <div class=""></div>
        </div>
        <div class="chartjs-size-monitor-shrink">
            <div class=""></div>
        </div>
    </div>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">History Order trend</h1>
    </div>

    <canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" width="800" height="337" style="display: block; width: 800px; height: 337px;"></canvas>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JsContent" runat="server">
  <script src="..\Scripts\dashboard.js"></script>
</asp:Content>