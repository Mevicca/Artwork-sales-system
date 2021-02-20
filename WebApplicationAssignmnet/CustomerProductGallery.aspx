<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ProductGallery.aspx.cs" Inherits="WebApplicationAssignmnet.ProductGallery" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="lib/css/ProductGallery.css" rel="stylesheet" />

    <form id="form1" runat="server">
        <div class="container">

            <div class="navbar-gallery">
                <div class="allProductCategory">
                    <asp:HyperLink ID="AllProduct" ClientIDMode="Static" NavigateUrl='<%#"Product.aspx?id="+Eval("CategoryID")%>' Style="color: white;" runat="server" > All </asp:HyperLink>
                </div>
                <div class="dropdown-category">
                    <button class="dropbtn">
                        Painting 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-category-content">
                        <asp:HyperLink ID="oilPaint" NavigateUrl='<%#"Product.aspx?id="+Eval("CategoryID")%>' runat="server">Oil Paint</asp:HyperLink>
                        <asp:HyperLink ID="ArcylirPaint" NavigateUrl='<%#"Product.aspx?id="+Eval("CategoryID")%>' runat="server">Arcylir Paint</asp:HyperLink>
                        <asp:HyperLink ID="WaterColor" NavigateUrl='<%#"Product.aspx?id="+Eval("CategoryID")%>' runat="server">Water Color</asp:HyperLink>
                    </div>
                </div>
                <div class="dropdown-category">
                    <button class="dropbtn">
                        Sculpture 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-category-content">
                        <asp:HyperLink ID="Animals" NavigateUrl='<%#"Product.aspx?id="+Eval("CategoryID")%>' runat="server">Animals</asp:HyperLink>
                        <asp:HyperLink ID="Bronzo" NavigateUrl='<%#"Product.aspx?id="+Eval("CategoryID")%>' runat="server">Bronzo</asp:HyperLink>
                        <asp:HyperLink ID="Wood" NavigateUrl='<%#"Product.aspx?id="+Eval("CategoryID")%>' runat="server">Wood</asp:HyperLink>
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
                                        <div class="viewButton">
                                            <asp:HyperLink ID="view" ClientIDMode="Static" NavigateUrl='<%#"Product.aspx?id="+Eval("ProductID")%>' runat="server">View</asp:HyperLink>
                                        </div>
                                        <asp:ImageButton ID="ProductImage" runat="server" Height="220px" ImageAlign="Middle" ImageUrl='<%# Eval("path1") %>' Width="220px" PostBackUrl='<%#"ViewProduct.aspx?id="+Eval("ProductID")%>'/>
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
