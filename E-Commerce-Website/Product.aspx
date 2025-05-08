<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="E_Commerce_Website.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="selling-products" class="product-store bg-light-grey padding-large">
    <div class="container">
        <div class="section-header">
            <h2 class="section-title">
                <asp:Label runat="server" ID="lblProductName"></asp:Label></h2>
                <asp:HiddenField runat="server" ID="hdnId" Value="0" />
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
                        <asp:Button runat="server" ID="btnMinus" OnClientClick="return decreaseQuantity()" Text ="-" />
                        <asp:TextBox runat="server" ReadOnly="true" ID="txtQuantity"></asp:TextBox>
                        <asp:Button runat="server" OnClientClick="return increaseQuantity()" ID="btnAdd" Text ="+" />
                        <asp:Button runat="server" ID="btnAddToCart" OnClientClick="return addToCart()" CssClass="btn btn-outline-success" Text="Add To Cart" />
                            </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </section>

    <script>
        function increaseQuantity() {
            let quantity = parseInt(document.getElementById("<%= txtQuantity.ClientID %>").value);
            quantity = quantity + 1;
            document.getElementById("<%= txtQuantity.ClientID %>").value = quantity;
            return false;
        }

        function decreaseQuantity() {
            let quantity = parseInt(document.getElementById("<%= txtQuantity.ClientID %>").value);
            if (quantity > 1) {
                quantity = quantity - 1;
                document.getElementById("<%= txtQuantity.ClientID %>").value = quantity;
            }
            return false;
        }

        function addToCart() {
            let productid = document.getElementById("<%= hdnId.ClientID %>").value;
            let quantity = document.getElementById("<%= txtQuantity.ClientID %>").value;
            let productids = getCookie("productids");
            let quantities = getCookie("quantities");
            if (productids == null) {
                productids = productid;
                quantities = quantity;
            } else {
                productids += "a" + productid;
                quantities += "a" + quantities;
            }
            setCookie("productids", productids);
            setCookie("quantities", quantities);
            showCount();
            alert("Product added cart");
            return false;
        }
    </script>
</asp:Content>
