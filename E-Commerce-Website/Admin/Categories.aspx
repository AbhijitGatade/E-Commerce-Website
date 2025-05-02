<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="E_Commerce_Website.Admin.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Categories</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Home.aspx">Master</a></li>
                    <li class="breadcrumb-item active">Categories</li>
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
                            <div class="col-lg-8">
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

                            <div class="col-lg-4 mt-2">
                                <asp:Button runat="server" OnClick="btnSave_Click" CssClass="btn btn-outline-primary" ID="btnSave" Text="Save" />
                                <a class="btn btn-outline-danger" href="Categories.aspx">Cancel</a>
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
                                            <asp:HyperLink NavigateUrl='<%# "Categories.aspx?action=edit&id=" + Eval("Id") %>' CssClass="btn btn-sm btn-primary" runat="server" ID="hlinkEdit"><i class="bi bi-pencil"></i></asp:HyperLink>
                                            <asp:HyperLink onclick="return confirm('Sure to delete?')" NavigateUrl='<%# "Categories.aspx?action=delete&id=" + Eval("Id") %>' CssClass="btn btn-sm btn-danger" runat="server" ID="hlinkDelete"><i class="bi bi-trash"></i></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SrNo" HeaderText="No" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
