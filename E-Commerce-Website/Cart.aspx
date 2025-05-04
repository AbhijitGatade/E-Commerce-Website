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
                     <asp:GridView runat="server" ID="gvData" AutoGenerateColumns="false">
                         <Columns>
                             <asp:ButtonField DataTextField="" HeaderText="Sr No" />
                             <asp:ButtonField DataTextField="" HeaderText="Image" />
                             <asp:ButtonField DataTextField="" HeaderText="Name" />
                             <asp:ButtonField DataTextField="" HeaderText="Quantity" />
                             <asp:ButtonField DataTextField="" HeaderText="Price" />
                             <asp:ButtonField DataTextField="" HeaderText="Total" />
                             <asp:TemplateField HeaderText="Action">
                                 <ItemTemplate>
                                     <asp:LinkButton CssClass="btn btn-sm btn-danger" runat="server" ID="lbtnRemove">Remove</asp:LinkButton>
                                 </ItemTemplate>
                             </asp:TemplateField>
                         </Columns>
                     </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        </section>

</asp:Content>
