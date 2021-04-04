<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebApplicationAssignmnet.Cart" %>

<%@ Register TagPrefix="page" TagName="PageTitle" Src="~/DynamicData/FieldTemplates/PageTitle.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="../lib/css/Cart.css" rel="stylesheet" />
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
            return confirm("Move to Wish list ?");
        }
    </script>
    <form id="form1" runat="server">
        <div class="container" style="background-color: white;">
            <div class="row" style="width: 100%; display: table">
                <div class="row justify-content-center">
                    <ul class="list-group list-group-horizontal tab">
                        <li class="list-group-item active" style="z-index: 1">Cart</li>
                        <li class="list-group-item">Shipping</li>
                        <li class="list-group-item" style="padding-bottom: 0px;">Payment</li>
                    </ul>
                </div>

            </div>

            <div class="row">
                <div style="margin-left: 10px;">
                    <page:PageTitle runat="server" ID="title" PageHeader="My Cart"></page:PageTitle>
                </div>
                <div class="pull-left col-8">
                    <div class="sort float-right galley-sort-by">
                        <a>Sort By :</a>
                        <asp:DropDownList ID="DropDownListSort" runat="server" OnSelectedIndexChanged="DropDownListSort_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Selected="True" Value="p.ProductName">Name</asp:ListItem>
                            <asp:ListItem Value="ar.ArtFullName">Artist Name</asp:ListItem>
                            <asp:ListItem Value="p.ProductPrice">Price</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="pull-left col-8">
                </div>
            </div>
            <div class="row">
                <div class="pull-left col-8">
                    <asp:Label ID="LblNone" runat="server" Text="Empty in cart." ForeColor="DarkRed" Font-Size="Larger" Visible="false"></asp:Label>
                    <asp:Repeater ID="RptProducts" runat="server">
                        <ItemTemplate>
                            <div class="row" style="justify-content: center;">
                                <div class="card" style="min-width: 680px">
                                    <div class="row cart-line" style="align-items: center;">
                                        <div class="col-2" style="text-align: center; margin-top: 5px; margin-left: 8px;">
                                            <asp:ImageButton runat="server" ImageUrl='<%#Eval("Path1") %>' Width="90" Height="100" CssClass="Imgbtn" PostBackUrl='<%#"Product.aspx?id=" + Eval("ProductID") %>' />
                                        </div>
                                        <div class="col-6">
                                            <asp:Label runat="server" Font-Italic="true" Font-Bold="true">
                                        <%# Eval("ProductName") %></asp:Label>
                                            <asp:Label runat="server" Font-Italic="true" Font-Size="Small">
                                        <%# "produced by " + Eval("ArtFullName") %>
                                            </asp:Label>
                                            <br />
                                            <div style="display: inline-flex;">
                                                <asp:Button ID="MinusProduct" runat="server" CssClass="btn btn-outline-danger" Text="-" Font-Size="Small" Width="28" Height="29" Enabled='<%#((int)Eval("Quantity")) == 1 ? false : true%>' CommandArgument='<%#Eval("ProductID") %>' CommandName="Minus" OnCommand="NoProduct_Click" />
                                                <asp:TextBox ID="txtQuantity" ClientIDMode="Static" runat="server" Text='<%#Eval("Quantity") %>' Enabled="false" Width="30" Height="30">
                                                </asp:TextBox>
                                                <asp:Button ID="PlusProduct" runat="server" CssClass="btn btn-outline-success" Text="+" Width="28" Height="29" Font-Size="Small" Enabled='<%#((int)Eval("productMax")) == 1 ? true : false %>' CommandArgument='<%#Eval("ProductID") %>' CommandName="Add" OnCommand="NoProduct_Click" />
                                            </div>
                                            <br />

                                            <asp:Label runat="server" Font-Size="Larger">
                                    <%#Double.Parse(Eval("ProductPrice").ToString()).ToString("C2")%>
                                            </asp:Label>

                                        </div>
                                        <div class="col-3" style="text-align: center; justify-content: center;">
                                            <asp:LinkButton runat="server" class="btn btn-outline-primary btn-move" CommandArgument='<%#Eval("ProductID")%>'
                                                Style="cursor: pointer" ID="Wish" OnClick="Wish_Click" OnClientClick="return moveMsg();" ClientIDMode="Static">
                        <i class="fa fa-cart-plus"></i>&nbsp; Move to wishlist
                                            </asp:LinkButton>
                                            <asp:LinkButton runat="server" class="btn btn-outline-danger btn-rem" CommandArgument='<%#Eval("ProductID")%>'
                                                Style="cursor: pointer" ID="Delete" OnClick="Delete_Click" OnClientClick="return confirmMsg();" ClientIDMode="Static">
                        <i class="fa fa-trash"></i>&nbsp; Remove
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
                <div class="pull-right col-4">
                    <div class="row" style="display: contents; right: 0px; width: 90%;">
                        <div class="card float-right" style="width: 90%; margin-bottom: 20px; margin-top: 20px; border: 0px; margin-right: 20px;">
                            <div class="card-header">
                                Summary
                            </div>

                            <div class="card-body" style="padding: 15px 20px; width: auto">
                                <div class="row" style="margin-bottom: 20px; color: crimson;">
                                    <div class="col">
                                        Total 
                                    </div>
                                    <div class="col">
                                        : 
                            <asp:Label ID="lblTotal" runat="server" Text="0.00"></asp:Label><br />
                                    </div>
                                </div>

                            </div>
                            <div class="border-top card-body bottom-card">
                                <asp:Button runat="server" ID="LblCheckout" Text="Check out" CssClass="float-right btn btn-success" OnClick="LblCheckout_Click" OWidth="125" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
