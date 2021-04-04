<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="WebApplicationAssignmnet.OrderHistory" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="../lib/css/OrderPage(A).css" rel="stylesheet" />
    <script src="../lib/js/OrderPage(A).js"></script>
    <form id="form1" runat="server">
        <div class="container" style="background-color: white">
            <div class="row" style="width: 100%; display: contents">
                <h1 class="float-left headerStyle" style="margin-top: 10px; margin-left: 5px;"><strong>Order History</strong></h1>
                <div class="sort float-right galley-sort-by">
                    <div class="sort">
                        <a>Sort By :</a>
                        <asp:DropDownList ID="ddlSortBy" AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged" runat="server">
                            <asp:ListItem Selected="True">Date</asp:ListItem>
                            <asp:ListItem>Total Price</asp:ListItem>
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
                        <th>Update Date</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>&nbsp</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="orderHistory" runat="server" OnItemDataBound="orderHistory_ItemDataBound">
                        <ItemTemplate>
                            <tr style="text-align: center">
                                <td>
                                    <asp:Label ID="LblOrderID" runat="server" Text='<%# Eval("SalesID") %>'></asp:Label>

                                </td>
                                <td>

                                    <asp:Label ID="LblOrderDate" runat="server" Text='<%# Eval("OrderTime") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LblUpdateDate" runat="server" Text='<%# Eval("UpdateAt") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LblTotalPrice" runat="server" Text='<%#"RM " +Eval("FinalTotal") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="LblStatus" runat="server" Text='<%# Eval("DeliveryStatus") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" class="btn btn-outline-primary" Style="cursor: pointer" PostBackUrl='<%#"~/Customer/HistoryDetails.aspx?id="+Eval("SalesID")%>'>
                        <i class="fa fa-search"></i>&nbsp; View Details
                                    </asp:LinkButton>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:LinkButton ID="btnCancel" runat="server" class="btn btn-outline-danger" CommandName ="Cancel" CommandArgument=<%# Eval("SalesID") %>
                                        Style="cursor: pointer" OnCommand="btnCancel_Click" OnClientClick="return confirmMsg();">
                        <i class="fa fa-trash"></i>&nbsp; Cancel Order
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </form>
    <script>
        function confirmMsg() {
            return confirm('Are you confirm to cancel order?');
        }
    </script>
</asp:Content>

