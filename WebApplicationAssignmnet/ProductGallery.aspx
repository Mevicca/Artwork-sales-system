<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductGallery.aspx.cs" Inherits="WebApplicationAssignmnet.ProductGallery" %>

<!DOCTYPE html>

<link href="lib/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="lib/css/Tools.css" rel="stylesheet" />
<link href="lib/css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<link href="lib/css/ProductGallery.css" rel="stylesheet" />


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 20px;">
            <table style="width: 100%;">
                <tr>
                    <td id="add-gallery">
                        <asp:HyperLink ID="addProduct" href="https://localhost:44384/AddProduct.aspx" runat="server"><i class="fa fa-plus" id="plus-icon" aria-hidden="true"></i></asp:HyperLink></td>
                    <td></td>
                    <td>
                        <div id="galley-sort-by">
                            Sort By:    
                            <asp:DropDownList ID="ddlSortBy" runat="server">
                                <asp:ListItem>  Date</asp:ListItem>
                                <asp:ListItem>  A to Z</asp:ListItem>
                                <asp:ListItem>  Z to A</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>

            </table>
            <div id="myBtnContainer">
                <button class="btn active" onclick="filterSelection('all')">Show All</button>
                <button class="btn" onclick="filterSelection('inStock')">In Stock</button>
                <button class="btn" onclick="filterSelection('soldOut')">Sold Out</button>
            </div>

            <div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
                <asp:DataList ID="ProductGalleryDataList" runat="server" CellPadding="20" DataKeyField="ProductID" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" HorizontalAlign="Center">
                    <ItemTemplate>
                        <table class="content">
                            <tr>
                                <td class="img" aria-hidden="False">
                                    <div class="viewButton">View</div>
                                    <asp:ImageButton ID="ProductImage" runat="server" Height="220px" ImageAlign="Middle" ImageUrl='<%# Eval("path1") %>' Width="220px" href="localhost/Products?id=@{CategoryID}" />
                                </td>
                            </tr>
                            <tr>
                                <td class="prodName">
                                    <asp:Label ID="ProductName" runat="server" Text='<%# Eval("ProductName") %>' Font-Bold="True" Font-Size="20px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="qty">
                                    <asp:Label ID="Quantity" runat="server" Text='<%# Eval("Quantity") %>' Font-Size="18px" ForeColor="#33CC33"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="prodPrice">RM
                                        <asp:Label ID="ProductPrice" runat="server" Text='<%# Eval("ProductPrice", "{0:0.00}") %>' Font-Size="18px"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>

        </div>
    </form>
    <script src="lib/js/ProductGallery.js"></script>
</body>
</html>
