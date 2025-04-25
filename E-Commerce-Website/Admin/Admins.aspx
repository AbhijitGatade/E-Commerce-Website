<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Admins.aspx.cs" Inherits="E_Commerce_Website.Admin.Admins" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Admins</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Home.aspx">Master</a></li>
                    <li class="breadcrumb-item active">Admins</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section dashboard">
            <div class="row">
                <div class="card">
                    <div class="card-body">
                        <div class="row m-2">
                            <div class="col-lg-4">
                                Name*
                            <asp:TextBox runat="server" ID="txtName" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" Font-Size="Small" ID="validateName" ControlToValidate="txtName" runat="server" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4">
                                Username*
                <asp:TextBox runat="server" ID="txtUsername" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" Font-Size="Small" ID="validateUsername" ControlToValidate="txtUsername" runat="server" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4">
                                Password*
                <asp:TextBox runat="server" ID="txtPasssword" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" Font-Size="Small" ID="validatePassword" ControlToValidate="txtPasssword" runat="server" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-4 mt-2">
                                <asp:Button runat="server" OnClick="btnSave_Click" CssClass="btn btn-outline-primary" ID="btnSave" Text="Save" />
                                <asp:Button runat="server" CssClass="btn btn-outline-danger" ID="btnCancel" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12 m-2">
                            <asp:GridView ID="gvData" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <asp:HyperLink CssClass="btn btn-sm btn-primary" runat="server" ID="hlinkEdit"><i class="bi bi-pencil"></i></asp:HyperLink>
                                            <asp:HyperLink CssClass="btn btn-sm btn-danger" runat="server" ID="hlinkDelete"><i class="bi bi-trash"></i></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SrNo" HeaderText="No" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                    <asp:BoundField DataField="Username" HeaderText="Username" />
                                    <asp:BoundField DataField="Password" HeaderText="Password" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
