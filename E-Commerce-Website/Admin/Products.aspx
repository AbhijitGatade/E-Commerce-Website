<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="E_Commerce_Website.Admin.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" class="main">
        <div class="row">
            <div class="col-lg-10">
                <div class="pagetitle">
                    <h1>Products</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Home.aspx">Master</a></li>
                            <li class="breadcrumb-item active">Products</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="col-lg-2">
                <a href="Product.aspx" class="btn btn-outline-primary">+ Product</a>
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
                                                <asp:HyperLink NavigateUrl='<%# "Product.aspx?action=edit&id=" + Eval("Id") %>' CssClass="btn btn-sm btn-primary" runat="server" ID="hlinkEdit"><i class="bi bi-pencil"></i></asp:HyperLink>
                                                <asp:HyperLink onclick="return confirm('Sure to delete?')" NavigateUrl='<%# "Products.aspx?action=delete&id=" + Eval("Id") %>' CssClass="btn btn-sm btn-danger" runat="server" ID="hlinkDelete"><i class="bi bi-trash"></i></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SrNo" HeaderText="No" />
                                        <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ImageUrl='<%# "../" + Eval("ImagePath") %>' runat="server" Height="80px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Name" HeaderText="Name" />
                                        <asp:BoundField DataField="MRP" HeaderText="MRP" />
                                        <asp:BoundField DataField="Price" HeaderText="Price" />
                                        <asp:BoundField DataField="InStock" HeaderText="Stock" />
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
