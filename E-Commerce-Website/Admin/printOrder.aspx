<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="printOrder.aspx.cs" Inherits="E_Commerce_Website.Admin.printOrder" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" class="main">
        <div class="row">
            <div class="col-lg-12">
                <div class="pagetitle">
                    <h1>Print Order</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Home.aspx">Master</a></li>
                            <li class="breadcrumb-item active">Print Order</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <!-- End Page Title -->
        <section class="section dashboard">
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 m-2">
                                <rsweb:ReportViewer runat="server" ID="rptInvoice" Height="800px" Width="600px"></rsweb:ReportViewer>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

