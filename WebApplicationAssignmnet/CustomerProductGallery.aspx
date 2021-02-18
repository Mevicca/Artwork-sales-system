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
        <div>

            <div class="navbar">
                <div class="allProductCategory"><asp:HyperLink ID="AllProduct" runat="server" href="localhost/Products?id=@{CategoryID}"> All </asp:HyperLink></div>
                <div class="dropdown">
                    <button class="dropbtn">
                        Painting 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <asp:HyperLink ID="oilPaint" runat="server" href="localhost/Products?id=@{CategoryID}">Oil Paint</asp:HyperLink>
                        <asp:HyperLink ID="ArcylirPaint" runat="server" href="localhost/Products?id=@{CategoryID}">Arcylir Paint</asp:HyperLink>
                        <asp:HyperLink ID="WaterColor" runat="server" href="localhost/Products?id=@{CategoryID}">Water Color</asp:HyperLink>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        Sculpture 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <asp:HyperLink ID="Animals" runat="server" href="localhost/Products?id=@{CategoryID}">Animals</asp:HyperLink>
                        <asp:HyperLink ID="Bronzo" runat="server" href="localhost/Products?id=@{CategoryID}">Bronzo</asp:HyperLink>
                        <asp:HyperLink ID="Wood" runat="server" href="localhost/Products?id=@{CategoryID}">Wood</asp:HyperLink>
                    </div>
                </div>
            </div>

            <div class="galleryContent">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="lblGalleryCategory" runat="server" Font-Size="18pt"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <div id="galley-sort-by">
                                Sort By:    
                            <asp:DropDownList ID="ddlSortBy" runat="server">
                                <asp:ListItem>  New Arrived</asp:ListItem>
                                <asp:ListItem>  A to Z</asp:ListItem>
                                <asp:ListItem>  Z to A</asp:ListItem>
                                <asp:ListItem>  Price: Cheap to Expensive</asp:ListItem>
                                <asp:ListItem>  Price: Expensive to Cheap</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                </table>

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
        </div>
    </form>
    <script src="lib/js/ProductGallery.js"></script>
</body>
</html>
