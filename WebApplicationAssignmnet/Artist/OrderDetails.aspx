<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="WebApplicationAssignmnet.OrderDetails" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../lib/css/OrderHistoryDetails.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <div class="container bg-white containerSize" style="max-width: 700px; border-radius: 10px; margin-top: 30px; margin-bottom: 30px">
            <div class="row">
                <div class="col-sm-6">
                    <h5 style="margin-top: 10px"><strong>Customer Information</strong></h5>
                    <br />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <h6><i class="fa fa-user"></i>&nbsp Customer Name :</h6>
                </div>
                <div class="col-sm-3">
                    <h6>Chen Teng Siang</h6>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <h6><i class="fa fa-phone"></i>&nbsp Contact Number :</h6>
                </div>
                <div class="col-sm-3">
                    <h6>013-5223809</h6>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <h6><i class="fa fa-map-marker"></i>&nbsp Delivery Adress : </h6>
                </div>
                <div class="col-sm-8">
                    <h6>1A-17-05, Iconic Skies, Halaman Relau, 11900 Relau, Penang</h6>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-sm-6">
                    <h5><strong>Product Details</strong></h5>
                    <br />
                </div>
            </div>

            <div class="row">
                <div class="col-sm-2" style="text-align: right; margin-left: 30px">
                    <img src="../assets/Acrylic/carlos pun B&L.jpg" style="width: 66px; height: 89px;" />
                </div>

                <div class="col-sm-2" style="text-align: right">
                    <h6>Name :</h6>
                </div>

                <div class="col-sm-6">
                    <h6>Bug Bunny & Lola in Love</h6>
                    <h6 style="text-align: right; margin-left: 90px">x 1</h6>
                    <h6 style="text-align: right; margin-left: 90px; color: red"><strong>RM&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 24,950.00</strong></h6>
                    <br />
                </div>


                <div class="col-sm-2" style="text-align: right; margin-left: 30px">
                    <img src="../assets/Acrylic/carlos pun DD.jpg" style="width: 66px; height: 89px;" />
                </div>

                <div class="col-sm-2" style="text-align: right">
                    <h6>Name :</h6>
                </div>

                <div class="col-sm-6">
                    <h6>Mc Duck Success Treasure Hunt</h6>
                    <h6 style="text-align: right; margin-left: 90px">x 1</h6>
                    <h6 style="text-align: right; margin-left: 90px; color: red"><strong>RM&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 33,250.00</strong></h6>
                    <br />
                </div>
            </div>

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
                    <h6>58,200.00</h6>
                    <h6>&nbsp&nbsp&nbsp&nbsp&nbsp 14.20</h6>
                    <h6>&nbsp&nbsp&nbsp&nbsp 100.00</h6>
                    <h6 style="color: red"><strong>58,114.20</strong></h6>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-sm-6">
                    <h5><strong>Payment Method</strong></h5>
                    <h6 style="margin-left: 50px"><i class="fa fa-globe"></i>&nbsp Online Banking (FPX)</h6>
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
                    <h6>Ship Time</h6>
                    <h6>Delivered Time</h6>
                </div>

                <div class="col-sm-4" style="margin-left: 90px; text-align: right">
                    <h6><strong>O1001</strong></h6>
                    <h6>09/02/2021 12:30</h6>
                    <h6>-</h6>
                    <h6></h6>
                </div>
            </div>

            <hr />

            <div class="row">
                <div class="col-sm-6">
                    <h5><strong>Rate</strong></h5>
                    <br />
                </div>
            </div>

            <div class="row" style="margin-left: 230px">
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

            </div>
            <div class="row float-right" style="margin-right: 5px;">
                <asp:Button runat="server" CssClass="btn btn-danger" Text="Back" PostBackUrl="~/Artist/OrderPage(A).aspx" />
            </div>
            <br />
            <br />
        </div>
    </form>
</asp:Content>
