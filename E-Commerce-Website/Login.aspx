<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Commerce_Website.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="selling-products" class="product-store bg-light-grey padding-large">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">User Login</h2>
                <asp:Label runat="server" ID="lblMessage" ForeColor="Red"></asp:Label>
            </div>
            <div class="tab-content">
                <div id="all" class="active">
                    <div class="row d-flex flex-wrap">
                        <div class="col-lg-6">
                            <h2>Login</h2>
                            <div class="mb-1">
                                <label for="email" class="form-label">Email address</label>
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-1">
                                <label for="password" class="form-label">Password</label>
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-primary w-100" />
                            <p class="text-center mt-3"><a href="#">Forgot password?</a></p>
                        </div>
                        <div class="col-lg-6">
                            <h2>Register</h2>
                            <div class="mb-1">
                                <label for="email" class="form-label">Name</label>
                                <asp:TextBox runat="server" ID="txtRegName" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-1">
                                <label for="email" class="form-label">Email address</label>
                                <asp:TextBox runat="server" ID="txtRegEmail" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-1">
                                <label for="email" class="form-label">Mobile No</label>
                                <asp:TextBox runat="server" ID="txtRegMobileNo" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-1">
                                <label for="password" class="form-label">Password</label>
                                <asp:TextBox runat="server" ID="txtRegPassword" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-1">
                                <label for="password" class="form-label">Confirm Password</label>
                                <asp:TextBox runat="server" ID="txtRegConfirmRegister" TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:Button runat="server" OnClick="btnRegister_Click" ID="btnRegister" Text="Register" CssClass="btn btn-primary w-100" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
