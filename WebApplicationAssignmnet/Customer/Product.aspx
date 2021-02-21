<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="WebApplicationAssignmnet.ProductPage" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <form id="form1" runat="server">
        <link href="../lib/css/ProductPage.css" rel="stylesheet" />
        <script src="../lib/js/ProductPage.js"></script>
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
        </script>
        <div class="container bg-white">
            <div class="row">
                <div class="col-6 pull-left">
                    <div style="display: flex; margin-left: 40px;">
                        <div class="col-sm-1" style="text-align: right; padding-top: 12em">
                            <div class="prevIcon">
                                <i class="fa fa-angle-left fa-2x" onclick="plusDivs(-1)"></i>
                            </div>
                        </div>
                        <div class="col-sm-7" style="text-align: center; margin: 5px 5px; padding: 0px;">
                            <div class="slides">
                                <div class="img-magnifier-container">
                                    <asp:Image ID="ImgSlides1" ClientIDMod="static" runat="server" CssClass="slidesImg ImgSlides1" ImageUrl='<%#Eval("Path1")%>' />
                                    <asp:Image ID="ImgSlides2" ClientIDMod="static" runat="server" CssClass="slidesImg ImgSlides2" ImageUrl='<%#Eval("Path2")%>' />
                                    <asp:Image ID="ImgSlides3" ClientIDMod="static" runat="server" CssClass="slidesImg ImgSlides3" ImageUrl='<%#Eval("Path3")%>' />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-1" style="text-align: left; padding-top: 12em">
                            <div class="nextIcon">
                                <i class="fa fa-angle-right fa-2x" onclick="plusDivs(1)"></i>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-1"></div>
                        <div class="col-sm-7" style="text-align: center; display: inline;">
                            <asp:ImageButton ID="ImgPath1" CssClass="images zoom" runat="server"/>
                            <asp:ImageButton ID="ImgPath2" CssClass="images zoom" runat="server"/>
                            <asp:ImageButton ID="ImgPath3" CssClass="images zoom" runat="server"/>
                        </div>
                        <div class="col-sm-1"></div>
                    </div>
                </div>
                <div class="col-6 pull-right">
                    <div class="card">
                        <div class="card-body">
                            <div class="col-sm-6 details-card" style="margin-bottom: 20px;">
                                <div class="row" style="margin-bottom: 5px;">
                                    <asp:Label ID="LblProductName" CssClass="product" runat="server" Font-Bold="true" ForeColor="Brown" Font-Italic="true"></asp:Label>
                                </div>
                                <div class="row" style="font-size: large;">
                                    <i class="fa fa-user-secret"></i>
                                    <asp:HyperLink  ID="LinkArtistName" runat="server"></asp:HyperLink>
                                    <i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i><i class="fa fa-star checked"></i>
                                </div>
                                <div class="row" style="font-size: large;">
                                    <i class="fa fa-money"></i>
                                    <asp:Label ID="LblPrice" runat="server"></asp:Label>
                                </div>
                                <div class="row" style="font-size: large;">
                                    <i class="fa fa-calendar-minus-o"></i>
                                    <asp:Label ID="LblDate" runat="server"></asp:Label>
                                </div>

                                <div class="row" style="font-size: large;">
                                    <i class="fa fa-map-o"></i>
                                    <asp:Label ID="LblDesc" runat="server"></asp:Label>
                                </div>

                                <div class="row" style="margin-top: 10px; display: flex;">
                                    <div class="col-sm-4">
                                        <div class="row">
                                            <i class="fa fa-motorcycle"></i>
                                        </div>
                                        <div class="row" style="text-align: center">
                                            <asp:Label runat="server">Gurantee Delivered</asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-sm-1"></div>
                                    <div class="col-sm-4">
                                        <div class="row">
                                            <i class="fa fa-thumbs-up"></i>
                                        </div>
                                        <div class="row" style="text-align: center">
                                            <asp:Label runat="server">Quality Artwork</asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="margin-top: 30px;">
                                <asp:LinkButton runat="server" CssClass="btn btn-outline-primary" ID="CartBtn" ClientIDMode="Static" OnClick="CartBtn_Click">
                                <i class="fa fa-cart-plus">&nbsp</i>Add to Cart
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="btn btn-outline-danger" ID="WishBtn" ClientIDMode="Static" OnClick="WishBtn_Click">
                                <i class="fa fa-heart" id="wishL">&nbsp</i>Wishlist
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <hr / style="border-width:2px;">
            <div class="row" >
                <div class=" col" style="margin-top: 5px;min-height:160px">
                    <h5 style="margin-left: 50px; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; color:brown">Suggested For You :</h5>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Tayy.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT TOP 10 * FROM PRODUCTS WHERE QUANTITY &gt; 0"></asp:SqlDataSource>
                    <div class="row" style="margin-left: 50px; margin-top:10px;"> 
                        <asp:Repeater ID="rptSuggest" runat="server" DataSourceID="SqlDataSource2">
                            <ItemTemplate>
                                <asp:ImageButton ID="Suggestion" class="zoom" ImageUrl='<%#Eval("path1") %>' PostBackUrl='<%#"Product.aspx?id=" + Eval("ProductID") %>' CssClass="suggestionList" runat="server"></asp:ImageButton>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
