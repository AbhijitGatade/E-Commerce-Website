<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="E_Commerce_Website.Admin.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" class="main">
        <div class="row">
            <div class="col-lg-12">
                <div class="pagetitle">
                    <h1>Orders</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Home.aspx">Master</a></li>
                            <li class="breadcrumb-item active">Orders</li>
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
                                <asp:GridView ID="gvData" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>
                                                <asp:HyperLink NavigateUrl='<%# "printOrder.aspx?id=" + Eval("Id") %>' CssClass="btn btn-sm btn-primary" runat="server" ID="hlinkEdit"><i class="bi bi-printer"></i></asp:HyperLink>                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Name" HeaderText="Name" />
                                        <asp:BoundField DataField="Total" HeaderText="Total" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

