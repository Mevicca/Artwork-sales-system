<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="WebApplicationAssignmnet.WishList" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="lib/css/WishList.css" rel="stylesheet" />
    <link href="lib/css/Login.css" rel="stylesheet" />
    <script src="lib/js/WishList.js"></script>
    <form id="form1" runat="server">
        <h1><strong>Wish List</strong></h1>
        <div class="sort">
            <a>Sort By :</a>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Selected="True">Name</asp:ListItem>
                <asp:ListItem>Artist Name</asp:ListItem>
                <asp:ListItem>Price</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />

        <div class="container bg-white containerSize" style="min-height: 250px;">
            <div class="row">
                <div class=" col-sm-2" style="text-align: center">
                    
                    <img src="assets/Acrylic/carlos pun B&L.jpg" style="width: 132px; height: 178px; margin-top: 40px;margin-left:50px" />
                </div>
                <div class="col-sm-6" style="margin-left: 50px">
                    <h5 style="margin-top: 50px">Name :</h5>
                    <hr />
                    <h5>Artist Name: </h5>
                    <hr />
                    <h5>Price: </h5>
                    <hr />
                </div>

                <div class="col-sm-2" style="text-align: center; margin-top: 70px; margin-left:60px">
                    <asp:LinkButton  runat="server" class="btn btn-outline-primary" style="cursor: pointer">
                        <i class="fa fa-cart-plus"></i>&nbsp; Add to Cart
                    </asp:LinkButton>
                    <br />
                    <br />
                    <asp:LinkButton  runat="server" class="btn btn-outline-danger" style="cursor: pointer" OnClientClick="deleteItems();return false;">
                        <i class="fa fa-trash"></i>&nbsp; Remove
                    </asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="container bg-white containerSize" style="min-height: 250px;">
            <div class="row">
                <div class=" col-sm-2" style="text-align: center">
                    <img src="assets/Acrylic/carlos pun DD.jpg" style="width: 132px; height: 178px; margin-top: 40px;margin-left:50px" />
                </div>
                <div class="col-sm-6" style="margin-left: 50px">
                    <h5 style="margin-top: 50px">Name :</h5>
                    <hr />
                    <h5>Artist Name: </h5>
                    <hr />
                    <h5>Price: </h5>
                    <hr />
                </div>

                <div class="col-sm-2" style="text-align: center; margin-top: 70px; margin-left:60px">
                    <asp:LinkButton  runat="server" class="btn btn-outline-primary" style="cursor: pointer">
                        <i class="fa fa-cart-plus"></i>&nbsp; Add to Cart
                    </asp:LinkButton>
                    <br />
                    <br />
                    <asp:LinkButton  runat="server" class="btn btn-outline-danger" style="cursor: pointer" OnClientClick="deleteItems();return false;">
                        <i class="fa fa-trash"></i>&nbsp; Remove
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
