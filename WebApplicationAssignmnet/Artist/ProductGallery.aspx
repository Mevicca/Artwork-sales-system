<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="ProductGallery.aspx.cs" Inherits="WebApplicationAssignmnet.ProductGallery" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../lib/css/ProductGallery.css" rel="stylesheet" />

    <form id="form1" runat="server">
        <div class="container">
            <div style="padding: 20px;">
                <table style="width: 100%;">
                    <tr>
                        <td id="add-gallery">
                            <asp:HyperLink ID="addProduct" ClientIDMode="Static" NavigateUrl="AddProduct.aspx" runat="server"><i class="fa fa-plus" id="plus-icon" aria-hidden="true"></i></asp:HyperLink></td>
                        <td></td>
                        <td>
                            <div id="galley-sort-by">
                                Sort By:    
                            <asp:DropDownList ID="ddlSortBy" runat="server">
                                <asp:ListItem>  Date</asp:ListItem>
                                <asp:ListItem>  A to Z</asp:ListItem>
                                <asp:ListItem>  Z to A</asp:ListItem>
                                <asp:ListItem>  Price: Cheap to Expensive</asp:ListItem>
                                <asp:ListItem>  Price: Expensive to Cheap</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                        </td>
                    </tr>

                </table>
                <div id="myBtnContainer">
                    <button class="btn-status active" onclick="filterSelection('all')">Show All</button>
                    <button class="btn-status" onclick="filterSelection('inStock')">In Stock</button>
                    <button class="btn-status" onclick="filterSelection('soldOut')">Sold Out</button>
                </div>

                <div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
                    <asp:DataList ID="ProductGalleryDataList" runat="server" CellPadding="20" DataKeyField="ProductID" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" HorizontalAlign="Center">
                        <ItemTemplate>
                            <table class="content">
                                <tr>
                                    <td class="img" aria-hidden="False">
                                        <div class="viewButton">
                                            <asp:HyperLink ID="view" ClientIDMode="Static" NavigateUrl='<%#"EditProduct.aspx?id="+Eval("ProductID")%>' runat="server">View</asp:HyperLink>
                                        </div>
                                        <asp:ImageButton ID="ProductImage" runat="server" Height="220px" ImageAlign="Middle" ImageUrl='<%# Eval("path1") %>' Width="220px" PostBackUrl='<%#"EditProduct.aspx?id="+Eval("ProductID")%>' />
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
</asp:Content>
