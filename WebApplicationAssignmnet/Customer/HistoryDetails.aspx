<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="HistoryDetails.aspx.cs" Inherits="WebApplicationAssignmnet.HistoryDetails" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="../lib/css/OrderHistoryDetails.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="container bg-white containerSize" style="max-width: 700px; border-radius: 10px; margin-top: 30px; margin-bottom: 30px">
            <div class="row">
                <div class="col-sm-6">
                    <h5 style="margin-top: 10px"><strong>Your Information</strong></h5>
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <h6><i class="fa fa-user"></i>&nbsp Receiver Name :</h6>
                </div>
                <div class="col-sm-3">
                    <h6>
                        <asp:Label ID="LblCustName" runat="server"></asp:Label></h6>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <h6><i class="fa fa-phone"></i>&nbsp Contact Number :</h6>
                </div>
                <div class="col-sm-3">
                    <h6>
                        <asp:Label ID="LblPhNum" runat="server"></asp:Label></h6>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <h6><i class="fa fa-map-marker"></i>&nbsp Delivery Adress : </h6>
                </div>
                <div class="col-sm-8">
                    <h6>
                        <asp:Label ID="LblDelAdd" runat="server"></asp:Label></h6>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-sm-6">
                    <h5><strong>Product Details</strong></h5>
                    <br />
                </div>
            </div>

            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-sm-2" style="text-align: right; margin-left: 30px">
                            <asp:ImageButton ID="ImgPath" Width="66px" Height="89px" runat="server" ImageUrl= <%# Eval("path1") %>/>
                        </div>

                        <div class="col-sm-2" style="text-align: right">
                            <h6>Name : </h6>
                        </div>

                        <div class="col-sm-6">
                            <h6>
                                <asp:Label ID="LblProductName" runat="server"> <%# Eval("ProductName") %></asp:Label></h6>
                            <h6 style="text-align: right; margin-left: 90px">x
                                <asp:Label ID="LblQuantity" runat="server"> <%# Eval("quantity") %></asp:Label></h6>
                            <h6 style="text-align: right; margin-left: 90px; color: red"><strong>RM&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                <asp:Label ID="LblPrice" runat="server"><%# String.Format("{0:#,##0.00}",Eval("ProductPrice")) %></asp:Label></strong></h6>
                            <br />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <hr />

            <div class="row">
                <div class="col-sm-4" style="margin-left: 50px">
                    <h6>Sub Total &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:</h6>
                    <h6>Shipping Fee &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:</h6>
                    <h6>Voucher Applied &nbsp:</h6>
                    <h6><strong>Total &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp:</strong></h6>
                </div>

                <div class="col-sm-2" style="text-align: right; margin-left: 125px">
                    <h6>&nbsp&nbsp RM</h6>
                    <h6>&nbsp&nbsp RM</h6>
                    <h6>- RM</h6>
                    <h6 style="color: red"><strong>&nbsp&nbsp RM</strong></h6>
                </div>

                <div class="col-sm-2">
                    <h6>
                        <asp:Label ID="LblSubTtl" runat="server"></asp:Label></h6>
                    <h6><asp:Label ID="LblShipFee" runat="server"></asp:Label></h6>
                    <h6>
                        <asp:Label ID="LblDisc" runat="server"></asp:Label></h6>
                    <h6 style="color: red"><strong>
                        <asp:Label ID="LblFinalTtl" runat="server"> </asp:Label></strong></h6>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-sm-6">
                    <h5><strong>Payment Method</strong></h5>
                    <h6 style="margin-left: 50px"><i class="fa fa-globe"></i>&nbsp <asp:Label runat="server" ID="paymentMethod"></asp:Label></h6>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-sm-6">
                    <h5><strong>Shipping Details</strong></h5>
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-4" style="margin-left: 50px">
                    <h6><strong>Order ID</strong></h6>
                    <h6>Payment Time</h6>
                    <h6>Delivery status</h6>
                </div>

                <div class="col-sm-4" style="margin-left: 90px; text-align: right">
                    <h6><strong>
                        <asp:Label ID="LblOrderId" runat="server"></asp:Label></strong></h6>
                    <h6>
                        <asp:Label ID="LblPaymentTime" runat="server"></asp:Label></h6>
                    <h6>
                        <asp:Label ID="LblOrderStatus" runat="server"></asp:Label></h6>
                </div>
            </div>

            <hr />

            <%--<div class="row">
                <div class="col-sm-6">
                    <h5><strong>Rate</strong></h5>
                    <br />
                </div>
            </div>--%>

           <%-- <div class="row" style="margin-left: 230px">
                <div class="col-sm-1">
                    <h5><i class="fa fa-star checked"></i></h5>
                </div>
                <div class="col-sm-1">
                    <h5><i class="fa fa-star checked"></i></h5>
                </div>
                <div class="col-sm-1">
                    <h5><i class="fa fa-star checked"></i></h5>
                </div>
                <div class="col-sm-1">
                    <h5><i class="fa fa-star "></i></h5>
                </div>
                <div class="col-sm-1">
                    <h5><i class="fa fa-star "></i></h5>
                    <br />
                </div>

            </div>--%>

            <div class="row float-right" style="margin-right: 5px;">
                <asp:Button runat="server" CssClass="btn btn-danger" Text="Back" PostBackUrl="~/Customer/OrderHistory.aspx" />
            </div>
            <br />
            <br />
        </div>

    </form>
</asp:Content>
