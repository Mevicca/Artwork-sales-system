<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="WebApplicationAssignmnet.WishList" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="../lib/css/WishList.css" rel="stylesheet" />
    <script type="text/javascript">
        function successalert(stitle, stext) {
            swal({
                title: stitle,
                text: stext,
                type: 'success'
            });
        }
        function failalert(ftitle, ftext) {
            swal({
                title: ftitle,
                text: ftext,
                type: 'error'
            });
        }
        function confirmMsg() {
            return confirm("Delete it ?");
        }
        function moveMsg() {
            return confirm("Move to Cart?");
        }
    </script>
    <form id="form1" runat="server">
        <div class="container" style="background-color: white">
            <div class="row" style="width: 100%; display: contents">
                <h1 class="float-left headerStyle" style="margin-top: 10px"><strong>Wish List</strong></h1>
                <div class="sort float-right galley-sort-by">
                    <a>Sort By :</a>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Selected="True">Name</asp:ListItem>
                        <asp:ListItem>Artist Name</asp:ListItem>
                        <asp:ListItem>Price</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />

            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <div class="card" style="width: 100%">
                        <div class="row">
                            <div class=" col-sm-2" style="text-align: center">
                                <asp:ImageButton runat="server" ImageUrl='<%#Eval("Path1") %>' Width="132" Height="178" CssClass="Imgbtn" />
                            </div>
                            <div class="col-sm-6" style="margin-top: 35px; margin-left: 20px;">
                                <h5>
                                    <asp:Label runat="server" Font-Italic="true">
                                        <%# Eval("ProductName") %></asp:Label>
                                </h5>
                                <hr />
                                <h5>
                                    <asp:Label runat="server" Font-Italic="true">
                                        <%# "By " + Eval("ArtFullName") %>
                                    </asp:Label>
                                </h5>
                                <hr />
                                <h5>
                                    <asp:Label runat="server" Font-Italic="true">
                                    <%#Double.Parse(Eval("ProductPrice").ToString()).ToString("C2")%>
                                    </asp:Label>
                                </h5>
                                <hr />
                            </div>

                            <div class="col-sm-2" style="text-align: center; margin: auto">
                                <asp:LinkButton runat="server" class="btn btn-outline-primary" CommandArgument='<%#Eval("ProductID")%>'
                                    Style="cursor: pointer" ID="Cart" OnClick="Cart_Click" OnClientClick="return moveMsg();">
                        <i class="fa fa-cart-plus"></i>&nbsp; Add to Cart
                    </asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton runat="server" class="btn btn-outline-danger" CommandArgument='<%#Eval("ProductID")%>'
                                    Style="cursor: pointer" ID="Delete" OnClick="Delete_Click" OnClientClick="return confirmMsg()">
                        <i class="fa fa-trash"></i>&nbsp; Remove
                    </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</asp:Content>