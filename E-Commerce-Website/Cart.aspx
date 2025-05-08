<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="E_Commerce_Website.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="selling-products" class="product-store bg-light-grey padding-large">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Cart</h2>
            </div>
            <div class="tab-content">
                <div id="all" class="active">
                    <div class="row d-flex flex-wrap">
                        <div class="col-lg-12">
                            <asp:GridView CssClass="table table-bordered table-striped" runat="server" ID="gvData" AutoGenerateColumns="false" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image runat="server" ID="imgProduct" ImageUrl='<%# Eval("ImagePath") %>' Height="80px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:ButtonField DataTextField="Name" HeaderText="Name" />
                                    <asp:ButtonField DataTextField="Quantity" HeaderText="Quantity" />
                                    <asp:ButtonField DataTextField="Price" HeaderText="Price" />
                                    <asp:ButtonField DataTextField="Total" HeaderText="Total" />
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton CssClass="btn btn-sm btn-danger" runat="server" ID="lbtnRemove">Remove</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="col-lg-12">
                            <asp:Button runat="server" ID="btnClearCart" Text="Clear Cart" OnClick="btnClearCart_Click" OnClientClick="return confirm('Sure to clear cart?')" />
                            <asp:HyperLink runat="server" ID="hlnkGotoCheckout" Text="Checkout" CssClass="btn btn-success" NavigateUrl="~/Checkout.aspx"></asp:HyperLink>

                            <asp:Panel runat="server" ID="pnlNoProduct">
                                <asp:Label runat="server" ID="lblMessage" Text="No products in cart"></asp:Label>
                                <br />
                                <asp:HyperLink NavigateUrl="~/Products.aspx" CssClass="btn btn-warning" runat="server" ID="hlnkGotoProducts">Continue Shopping</asp:HyperLink>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
