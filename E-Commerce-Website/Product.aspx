<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="E_Commerce_Website.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="selling-products" class="product-store bg-light-grey padding-large">
    <div class="container">
        <div class="section-header">
            <h2 class="section-title">
                <asp:Label runat="server" ID="lblProductName"></asp:Label></h2>
        </div>
        <div class="tab-content">
            <div id="all" class="active">
                <div class="row d-flex flex-wrap">
                    <div class="col-lg-6">
                        <asp:Image runat="server" CssClass="img-fluid" ID="imgProduct" />
                    </div>
                    <div class="col-lg-6">
                        <asp:Label Font-Size="Large" Font-Bold="true" runat="server" ID="lblName"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="lblCategory"></asp:Label>
                        <br />
                        <b>In Stock: </b><asp:Label runat="server" id="lblInStock"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="lblPrice"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="lblDescription"></asp:Label>
                        <br />
                        <asp:Panel runat="server" ID="pnlCart">
                        <asp:Button runat="server" ID="btnMinus" Text ="-" />
                        <asp:TextBox runat="server" ID="txtQuantity"></asp:TextBox>
                        <asp:Button runat="server" ID="btnAdd" Text ="+" />
                        <asp:Button runat="server" id="btnAddToCart" CssClass="btn btn-outline-success" Text="Add To Cart" />
                            </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </section>
</asp:Content>
