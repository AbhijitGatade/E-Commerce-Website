<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="E_Commerce_Website.Admin.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" class="main">
    <div class="pagetitle">
        <h1>Product</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Home.aspx">Master</a></li>
                <li class="breadcrumb-item"><a href="Products.aspx">Products</a></li>
                <li class="breadcrumb-item active">Product</li>
            </ol>
        </nav>
    </div>
    <!-- End Page Title -->
    <section class="section dashboard">
        <div class="row">
            <div class="card">
                <div class="card-body">
                    <div class="row m-2">
                        <div class="col-lg-12">
                            <asp:Label runat="server" ID="lblMessage" ForeColor="Red"></asp:Label>
                        </div>
                        <div class="col-lg-4">
                            Category*
                            <asp:DropDownList CssClass="form-control" runat="server" ID="ddlCategory"></asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" Font-Size="Small" ID="validateCategory" ControlToValidate="ddlCategory" runat="server" ErrorMessage="Category is required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-lg-4">
                            Name*
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" Font-Size="Small" ID="validateName" ControlToValidate="txtName" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                        </div>
                        <div class="col-lg-4">
                            Sr No*
                            <asp:TextBox runat="server" TextMode="Number" ID="txtSrNo" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" Font-Size="Small" ID="validateSrNo" ControlToValidate="txtSrNo" runat="server" ErrorMessage="Sr No is required"></asp:RequiredFieldValidator>
                            <asp:RangeValidator runat="server" Font-Size="Small" Display="Dynamic" Type="Integer" ForeColor="red" MinimumValue="1" MaximumValue="100" ID="validateRangeSrNo" ControlToValidate="txtSrNo" ErrorMessage="Sr No range between 1-100"></asp:RangeValidator>
                        </div>
                        <div class="col-lg-4">
                        MRP*
                        <asp:TextBox runat="server" TextMode="Number" ID="txtMRP" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" Font-Size="Small" ID="RequiredFieldValidator1" ControlToValidate="txtMRP" runat="server" ErrorMessage="MRP is required"></asp:RequiredFieldValidator>    
                        </div>
                        <div class="col-lg-4">
                        Price*
                        <asp:TextBox runat="server" TextMode="Number" ID="txtPrice" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" Font-Size="Small" ID="RequiredFieldValidator2" ControlToValidate="txtPrice" runat="server" ErrorMessage="Price is required"></asp:RequiredFieldValidator>    
                        </div>
                        <div class="col-lg-4">
                            In Stock*
                            <asp:RadioButtonList RepeatDirection="Horizontal" ID="rbtnlInstock" runat="server">
                                <asp:ListItem Value="Yes" Selected="True">Yes</asp:ListItem>
                                <asp:ListItem Value="No">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="col-lg-12">
                            Description*
                            <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescription" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" Font-Size="Small" ID="RequiredFieldValidator3" ControlToValidate="txtDescription" runat="server" ErrorMessage="Description is required"></asp:RequiredFieldValidator>    
                        </div>
                        <div class="col-lg-12">
                            Image*<br />
                            <asp:FileUpload accept="image/*" runat="server" ID="fuImage" />
                        </div>

                        <div class="col-lg-4 mt-2">
                            <asp:Button runat="server" OnClick="btnSave_Click" CssClass="btn btn-outline-primary" ID="btnSave" Text="Save" />
                            <a class="btn btn-outline-danger" href="Products.aspx">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
    </section>
</main>
</asp:Content>
