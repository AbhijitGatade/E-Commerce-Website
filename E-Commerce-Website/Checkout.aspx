<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="E_Commerce_Website.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <section id="selling-products" class="product-store bg-light-grey padding-large">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Checkout</h2>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="hdnOrderId" Value="0" />
                        <asp:Button Style="display: none;" runat="server" Text="" OnClick="btnMarkPaid_Click" ID="btnMarkPaid" />
                    </ContentTemplate>
                </asp:UpdatePanel>

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
                            <asp:Label runat="server" ID="lblMessage" ForeColor="Red"></asp:Label><br />
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
                                </Columns>
                            </asp:GridView>
                            <b>Total:</b>
                            <asp:Label runat="server" ID="lblTotal"></asp:Label>
                            <asp:Button runat="server" OnClick="btnPlaceorder_Click" ID="btnPlaceorder" Text="Place Order" CssClass="btn btn-outline-primary" />
                            <asp:Button Visible="false" OnClientClick="return startPayment()" runat="server" ID="btnMakePayment" Text="Make Payment" CssClass="btn btn-warning" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        var options = {
            "key": "rzp_live_D1UAvgPpiDhQ6M", // From Razorpay Dashboard
            "amount": "200", // In paise
            "currency": "INR",
            "name": "DYP A Division",
            "description": "Order Payment",
            "handler": function (response) {
                // Send response.razorpay_payment_id to your server for verification
                //alert("Payment successful: " + response.razorpay_payment_id);
                //Call btn Click event
                __doPostBack('<%= btnMarkPaid.UniqueID %>', '');
            },
            "theme": {
                "color": "#3399cc"
            }
        };
        var rzp1 = new Razorpay(options);
        // 🔴 Handle payment failure
        rzp1.on('payment.failed', function (response) {
            alert("Payment Failed");
        });

        function startPayment() {
            rzp1.open();
            return false;
        }

    </script>
</asp:Content>
