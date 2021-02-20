<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Shipping.aspx.cs" Inherits="WebApplicationAssignmnet.Shipping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <script type="text/javascript">
        function failalert(ftitle, ftext) {
            swal({
                title: ftitle,
                text: ftext,
                type: 'error'
            });
        }
        function successalert(stitle, stext) {
            swal({
                title: stitle,
                text: stext,
                type: 'success'
            });
        }
    </script>
    <form id="form1" runat="server" style="display:flex">
        <link href="lib/css/Shipping.css" rel="stylesheet" />
        <div class="container">
            <div class="row justify-content-center">
                <ul class="list-group list-group-horizontal tab">
                    <li class="list-group-item active">Shipping</li>
                    <li class="list-group-item">Payment</li>
                </ul>
            </div>

            <div class="row">
                <%--Shipping details--%>
                <div class="col-8 pull-left cart">
                    <div class="shipping-details">
                        <div class="cart-body">
                            <div class="container" style="margin-left: 5px;">
                                <div class="row">
                                    <h3>Shipping</h3>
                                </div>
                                <div class="row d-flex row-click">
                                    <i class="fa fa-address-card"></i>
                                    <asp:Label runat="server" Text="Shipping details"></asp:Label>
                                    <asp:HyperLink CssClass="lbl-click" ID="linkShippingDetails" runat="server" NavigateUrl="#">Add</asp:HyperLink>
                                </div>
                                <div class="row">
                                    <asp:DropDownList ID="ddlAddress" runat="server" CssClass="dropdownmenu">
                                    </asp:DropDownList>
                                </div>
                                <div class="row d-flex row-click">
                                    <i class="fa  fa-ambulance"></i>Billing to the same address
                                    <asp:CheckBox CssClass="lbl-click" runat="server" ID="chkbox" Checked="true" />
                                </div>
                                <div class="row">
                                    <i class="fa  fa-archive"></i>
                                    Billing email address
                                </div>
                                <div class="row">
                                    <asp:TextBox ID="txtEmailAdd" runat="server" placeholder="Email address" CssClass="line-input" Width="250"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                                        ControlToValidate="txtEmailAdd"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        SetFocusOnError="true" ErrorMessage="Invalid email."
                                        ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                                <div class="row">
                                    <i class="fa fa-ship"></i>
                                    Select Shipping Companies
                                    <asp:TextBox runat="server" ID="txtDeliveryCompany" Text="" CssClass="line-input txtDeliveryCompany" Enabled="FALSE" ClientIDMode="Static"></asp:TextBox>
                                    <div class="slidegallery">
                                        <asp:Repeater ID="RepeaterDeliveryCompany" runat="server" DataSourceID="SqlDataSource2">
                                            <ItemTemplate>
                                                <asp:ImageButton runat="server" CommandArgument='<%#Eval("Delivery_Company").ToString()%>'
                                                    Width="110px" Height="60px" OnClick="Delivery_Click" ImageUrl='<%#Eval("ImagePath").ToString()%>' />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <%-- Add the slide show garelly --%>
                                </div>
                                <div class="row" style="display: block;">
                                    <i class="fa  fa-th-list"></i>
                                    Select Shipping method
                                    <br />
                                    <%-- Using db to show the radio button --%>

                                    <asp:RadioButtonList runat="server" ID="radioListMethod" AutoPostBack="True" OnSelectedIndexChanged="RadioListMethod_SelectedIndexChanged">
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--End shipping details--%>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT Delivery_Company, ImagePath FROM DeliveryMethod WHERE (isActive = @isActive)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="isActive" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <%-- Order Summary --%>
                <div class="col-4 order-summary">
                    <div class="card">
                        <div class="card-header">
                            <strong>Order Summary</strong>
                        </div>
                        <div class="card-body" style="padding: 15px 20px; width: auto">
                            <%-- Product --%>
                            <asp:Repeater ID="repeaterProducts" runat="server">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-4">
                                            <asp:ImageButton runat="server" Width="80px" Height="80px" ImageUrl='<%#Eval("imagePath").ToString()%>' />
                                        </div>
                                        <div class="col-8" style="align-content: center">
                                            <asp:Label runat="server" Text='<%#Eval("productName")%>'></asp:Label><br />
                                            <asp:Label runat="server" Text='<%#"RM " + Eval("productPrice")%>'></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <div class="row justify-content-between coupon">
                                <asp:TextBox ID="txtCoupon" runat="server" CssClass="line-input" Placeholder="Coupon" Width="120px"></asp:TextBox>
                                <asp:Button ID="btnApply" runat="server" CssClass="btn btn-outline-info" Text="Apply" OnClick="BtnApply_Click" />
                            </div>
                        </div>
                        <div class="border-top card-body bottom-card">
                            <div class="row">
                                <div class="col-sm-6">
                                    Subtotal
                                </div>
                                <div class="col-sm-6">
                                    : RM
                                <asp:Label ID="lblSubtotal" runat="server" Text="0.00"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <asp:Label ID="lbelDiscount" runat="server" Text="Discount"></asp:Label>
                                </div>
                                <div class="col-sm-6">
                                    : ( RM
                                    <asp:Label ID="lblDiscount" runat="server" Text="0.00"></asp:Label>
                                    )<br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    Shipping
                                </div>
                                <div class="col-sm-6">
                                    : RM
                                <asp:Label ID="lblShipping" runat="server" Text="0.00"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    Final Total 
                                </div>
                                <div class="col-sm-6">
                                    : RM
                                <asp:Label ID="lblFinalTotal" runat="server" Text="0.00"></asp:Label><br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="div-button">
                        <asp:Button ID="btnBack" runat="server" Text="Back to cart" CssClass="btn btn-danger btnBack" />
                        <asp:Button ID="btnPayment" runat="server" Text="Go payment" CssClass="btn btn-success btnPayment" OnClick="BtnPayment_Click" />
                    </div>
                    <div style="word-wrap: break-word; margin-bottom:50px;">
                        If you faced any question, kindly read
                    <asp:HyperLink ID="linkFAQ" runat="server" Text="FAQ"></asp:HyperLink>
                        or contact us with 018-888 8300.
                    </div>
                </div>
                <%-- End Order Summary --%>
            </div>
        </div>
    </form>
</asp:Content>

