<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="E_Commerce_Website.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="selling-products" class="product-store bg-light-grey padding-large">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Checkout</h2>
            </div>
            <div class="tab-content">
                <div id="all" class="active">
                    <div class="row d-flex flex-wrap">
                        <div class="col-lg-6">
                            <h2>Address</h2>
                            <div class="mb-1">
                                <label for="email" class="form-label">Name</label>
                                <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-1">
                                <label for="email" class="form-label">Address</label>
                                <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-1">
                                <label for="email" class="form-label">Landmark</label>
                                <asp:TextBox runat="server" ID="txtLandmark" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-1">
                                <label for="password" class="form-label">City</label>
                                <asp:TextBox runat="server" ID="txtCity" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="mb-1">
                                <label for="password" class="form-label">State</label>
                                <asp:DropDownList runat="server" ID="ddlState">
                                    <asp:ListItem Value="Maharashtra">Maharashtra</asp:ListItem>
                                    <asp:ListItem Value="Karnataka">Karnataka</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="mb-1">
                                <label for="password" class="form-label">Pincode</label>
                                <asp:TextBox runat="server" ID="txtPincode" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <asp:GridView runat="server" ID="gvData" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:ButtonField DataTextField="" HeaderText="Sr No" />
                                    <asp:ButtonField DataTextField="" HeaderText="Image" />
                                    <asp:ButtonField DataTextField="" HeaderText="Name" />
                                    <asp:ButtonField DataTextField="" HeaderText="Quantity" />
                                    <asp:ButtonField DataTextField="" HeaderText="Price" />
                                    <asp:ButtonField DataTextField="" HeaderText="Total" />
                                </Columns>
                            </asp:GridView>
                            <asp:Button runat="server" ID="btnPlaceorder" Text="Place Order" CssClass="btn btn-outline-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
