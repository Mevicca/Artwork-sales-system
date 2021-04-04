<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="WishList.aspx.cs" Inherits="WebApplicationAssignmnet.WishList" EnableEventValidation="false" %>
<%@ Register TagPrefix="page" TagName="PageTitle" Src="~/DynamicData/FieldTemplates/PageTitle.ascx" %>

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
            <div class="row" style="display: contents">
                <div class="row" style="margin-left:40%;">
                    <page:pagetitle runat="server" id="title" pageheader="Wish List"></page:pagetitle>
                </div>
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
            <div style="display: block">
                <br />
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="size1of3">
                            <div class="card">
                                <asp:ImageButton runat="server" ImageUrl='<%#Eval("Path1") %>' Width="100%" Height="200px" OnClick="Product_Click" />
                                <asp:HiddenField runat="server" Value='<%# Eval("ProductID")%>' ID="hiddenProduct" />
                                <h4>
                                    <asp:Label runat="server" Font-Italic="true">
                                <%# Eval("ProductName") %>
                                    </asp:Label>
                                </h4>

                                <h7 style="color: gray">
                                    <asp:Label runat="server" Font-Italic="true">
                                <%# "By " + Eval("ArtFullName") %>
                                    </asp:Label>
                                </h7>

                                <h6>
                                    <asp:Label runat="server" Font-Italic="true">
                                <%#Double.Parse(Eval("ProductPrice").ToString()).ToString("C2")%>
                                    </asp:Label>
                                </h6>
                                <p style="margin-bottom: 0px">
                                    <asp:LinkButton runat="server" class="btn btn-primary" Width="100%" CommandArgument='<%#Eval("ProductID")%>'
                                        Style="cursor: pointer" ID="Cart" OnClick="Cart_Click" OnClientClick="return moveMsg();">
                                <i class="fa fa-cart-plus"></i>&nbsp; Add to Cart
                                    </asp:LinkButton>

                                    <asp:LinkButton runat="server" class="btn btn-danger" Width="100%" CommandArgument='<%#Eval("ProductID")%>'
                                        Style="cursor: pointer" ID="Delete" OnClick="Delete_Click" OnClientClick="return confirmMsg()">
                                <i class="fa fa-trash"></i>&nbsp; Remove
                                    </asp:LinkButton>
                                </p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <br style="clear: left;" />
            </div>
        </div>
    </form>
</asp:Content>
