<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="E_Commerce_Website.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="selling-products" class="product-store bg-light-grey padding-large">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">
                    <asp:Label runat="server" ID="lblCategoryName"></asp:Label></h2>
            </div>
            <div class="tab-content">
                <div id="all" class="active">
                    <div class="row d-flex flex-wrap">
                        <asp:Repeater ID="rptProducts" runat="server">
                            <ItemTemplate>
                                <div class="product-item col-lg-3 col-md-6 col-sm-6">
                                    <div class="image-holder">
                                        <a href="Product.aspx?Id=<%# Eval("Id") %>">
                                        <img src="<%# Eval("ImagePath") %>" alt="<%# Eval("Name") %>" class="product-image">
                                            </a>
                                    </div>
                                    <div class="product-detail">
                                        <h3 class="product-title">
                                            <a href="Product.aspx?Id=<%# Eval("Id") %>"><%# Eval("Name") %></a>
                                        </h3>
                                        <div class="item-price text-primary">&#8377;<%# Eval("Price") %>/-<del>(&#8377;<%# Eval("MRP") %>)</del></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>



                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
