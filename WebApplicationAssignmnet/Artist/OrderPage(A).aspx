<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="OrderPage(A).aspx.cs" Inherits="WebApplicationAssignmnet.OrderPage_A_" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../lib/css/OrderPage(A).css" rel="stylesheet" />
    <script src="../lib/js/OrderPage(A).js"></script>
    <form id="form1" runat="server">
        <div class="container" style="background-color: white">
            <div class="row" style="width: 100%; display: contents">
                <h1 class="float-left headerStyle" style="margin-top: 10px; margin-left: 5px;"><strong>Sales Order</strong></h1>
                <div class="sort float-right galley-sort-by">
                    <div class="sort">
                        <a>Sort By :</a>
                        <asp:DropDownList ID="ddlSortBy" AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged" runat="server">
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
                        <th>Customer Name</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>&nbsp</th>
                    </tr>
                </thead>

                <tbody>
                    <asp:Repeater ID="order" runat="server">
                        <ItemTemplate>

                            <tr style="text-align: center">
                                <td>
                                    <asp:Label ID="LblOrderID" runat="server" Text='<%# Eval("SalesID") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LblOrderDate" runat="server" Text='<%# Eval("OrderTime") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LblCustname" runat="server" Text='<%# Eval("CustFullName") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LblTotalPrice" runat="server" Text='<%#"RM " +Eval("FinalTotal") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LblStatus" runat="server" Text='<%# Eval("DeliveryStatus") %>'></asp:Label>
                                </td>
                                <td style="text-align: center">
                                    <asp:LinkButton runat="server" class="btn btn-outline-primary" Style="cursor: pointer" PostBackUrl='<%#"~/Artist/OrderDetails.aspx?id="+Eval("SalesID")%>'>
                        <i class="fa fa-search"></i>&nbsp; View Details
                    </asp:LinkButton>
                                    &nbsp;
                   </td>
                            </tr>

                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

    </form>

</asp:Content>
