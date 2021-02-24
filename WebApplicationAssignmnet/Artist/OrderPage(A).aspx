<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="OrderPage(A).aspx.cs" Inherits="WebApplicationAssignmnet.OrderPage_A_" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../lib/css/OrderPage(A).css" rel="stylesheet" />
    <script src="../lib/js/OrderPage(A).js"></script>
    <form id="form1" runat="server">
        <div class="container" style="background-color: white">
            <div class="row" style="width: 100%; display: contents">
                <h1 class="float-left headerStyle" style="margin-top: 10px;margin-left:5px;"><strong>Sales Order</strong></h1>
                <div class="sort float-right galley-sort-by">
                    <div class="sort">
                        <a>Sort By :</a>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Selected="True">Date</asp:ListItem>
                            <asp:ListItem>Total Price</asp:ListItem>
                            <asp:ListItem>Customer Name</asp:ListItem>
                            <asp:ListItem>Order ID</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <br />

            <table class="table table-striped">
                <thead>
                    <tr style="text-align: center">
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Release Date</th>
                        <th>Customer Name</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>&nbsp</th>
                    </tr>
                </thead>

                <tbody>
                    <tr style="text-align: center">
                        <td>O1001</td>
                        <td>12/02/2021</td>
                        <td>22/02/2021</td>
                        <td>Tay</td>
                        <td>RM 2022</td>
                        <td>Shipping</td>
                        <td style="text-align: center">
                            <asp:LinkButton runat="server" class="btn btn-outline-primary" Style="cursor: pointer" PostBackUrl="~/Artist/OrderDetails.aspx">
                        <i class="fa fa-search"></i>&nbsp; View Details
                    </asp:LinkButton>
                            &nbsp;
                   
                            <asp:LinkButton runat="server" class="btn btn-outline-danger" Style="cursor: pointer" OnClientClick="comfirmMsg();return false;">
                        <i class="fa fa-trash"></i>&nbsp; Cancel Order
                    </asp:LinkButton>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td>O1002</td>
                        <td>13/12/2021</td>
                        <td></td>
                        <td>Mak</td>
                        <td>RM 2023</td>
                        <td>To Ship</td>
                        <td style="text-align: center">
                            <asp:LinkButton runat="server" class="btn btn-outline-primary" Style="cursor: pointer" PostBackUrl="~/Artist/OrderDetails.aspx">
                        <i class="fa fa-search"></i>&nbsp; View Details
                    </asp:LinkButton>
                            &nbsp;
                   
                            <asp:LinkButton runat="server" class="btn btn-outline-danger" Style="cursor: pointer" OnClientClick="comfirmMsg();return false;">
                        <i class="fa fa-trash"></i>&nbsp; Cancel Order
                    </asp:LinkButton>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </form>

</asp:Content>
