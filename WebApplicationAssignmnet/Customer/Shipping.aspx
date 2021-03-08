<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Shipping.aspx.cs" Inherits="WebApplicationAssignmnet.Shipping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="form1" runat="server" style="display: flex">
        <link href="../lib/css/Shipping.css" rel="stylesheet" />
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
        <div class="container">
            <div class="row justify-content-center">
                <ul class="list-group list-group-horizontal tab">
                    <li class="list-group-item">Cart</li>
                    <li class="list-group-item active" style="z-index: 1">Shipping</li>
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
                                </div>
                                <div class="row" style="display: inline-flex;">
                                    <asp:DropDownList ID="ddlAddress" runat="server" CssClass="dropdownmenu">
                                    </asp:DropDownList>
                                    <asp:Button CssClass="lbl-click btn btn-info" ID="BtnShippingDetails" ClientIDMode="Static" runat="server" Text="Add" />
                                </div>
                                <div class="row d-flex row-click">
                                    <i class="fa  fa-ambulance"></i>Billing to the same address
                                    <asp:CheckBox CssClass="lbl-click" runat="server" ID="chkbox" Checked="true" OnCheckedChanged="Chkbox_CheckedChanged" AutoPostBack="true" />
                                    <asp:TextBox ID="txtBillAdd" runat="server" Placeholder="Billing address" Visible="false" Width="250"></asp:TextBox>
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

                <!-- The Modal -->
                <div id="myModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2>ADD ADDRESS</h2>
                            <span class="close">&times;</span>
                        </div>
                        <div class="modal-body">
                            <asp:Table runat="server">
                                <asp:TableRow>
                                    <asp:TableCell>Address Label :</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtLabel" runat="server" placeholder="Label">
                                        </asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Address 1 :</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtAdd1" runat="server" placeholder="Address 1">
                                        </asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Address 2 :</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtAdd2" runat="server" placeholder="Address 2">
                                        </asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>Address 3 :</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtAdd3" runat="server" placeholder="Address 3">
                                        </asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>PostCode :</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtPostCode" runat="server" placeholder="xxxxx" TextMode="Number">
                                        </asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell>City :</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtCity" runat="server" placeholder="City">
                                        </asp:TextBox>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <asp:TableRow>
                                    <asp:TableCell></asp:TableCell>
                                    <asp:TableCell></asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                            <asp:Button runat="server" ID="BtnAdd" CssClass="btn btn-success" Text="Add" OnClick="BtnAdd_Click" />
                        </div>
                        <div class="modal-footer">
                            <h3>To add your address</h3>
                        </div>
                    </div>
                </div>

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
                                    :
                                <asp:Label ID="lblSubtotal" runat="server" Text="0.00"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <asp:Label ID="lbelDiscount" runat="server" Text="Discount"></asp:Label>
                                </div>
                                <div class="col-sm-6">
                                    : (
                                    <asp:Label ID="lblDiscount" runat="server" Text="0.00"></asp:Label>
                                    )<br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    Shipping
                                </div>
                                <div class="col-sm-6">
                                    : 
                                <asp:Label ID="lblShipping" runat="server" Text="0.00"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    Final Total 
                                </div>
                                <div class="col-sm-6">
                                    :
                                <asp:Label ID="lblFinalTotal" runat="server" Text="0.00"></asp:Label><br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="div-button">
                        <asp:Button ID="btnBack" runat="server" Text="Back to cart" CssClass="btn btn-danger btnBack" PostBackUrl="~/Customer/Cart.aspx" />
                        <asp:Button ID="btnPayment" runat="server" Text="Go payment" CssClass="btn btn-success btnPayment" OnClick="BtnPayment_Click" />
                    </div>
                    <div style="word-wrap: break-word; margin-bottom: 50px;">
                        If you faced any question, kindly read
                    <asp:HyperLink ID="linkFAQ" runat="server" Text="FAQ"></asp:HyperLink>
                        or contact us with 018-888 8300.
                    </div>
                </div>
                <%-- End Order Summary --%>
            </div>
        </div>
    </form>
    <script src="../lib/js/Tools.js"></script>

</asp:Content>

