<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="CustomerProductGallery.aspx.cs" Inherits="WebApplicationAssignmnet.CustomerProductGallery" %>

<%@ Register TagPrefix="page" TagName="PageTitle" Src="~/DynamicData/FieldTemplates/PageTitle.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="../lib/css/ProductGallery.css" rel="stylesheet" />

    <form id="form1" runat="server">
        <div class="navbar-gallery">
            <div class="dropdown-category">
                <asp:Button ID="all" runat="server" CssClass="dropbtn" OnClick="Category_Click" Text="All" />
            </div>
            <div class="dropdown-category">
                <asp:Button ID="paintingTab" CssClass="dropbtn" runat="server" Enabled="false" Text="Painting" />
                <div class="dropdown-category-content">
                    <asp:Button ID="oilpaint" runat="server" CssClass="categorybtn" OnClick="Category_Click" Text="Oil Paint" />
                    <asp:Button ID="arcylirpaint" runat="server" CssClass="categorybtn" OnClick="Category_Click" Text="Arcylir Paint" />
                    <asp:Button ID="watercolor" runat="server" CssClass="categorybtn" OnClick="Category_Click" Text="Water Color" />
                </div>
            </div>
            <div class="dropdown-category">
                <asp:Button ID="sculptureTab" CssClass="dropbtn" runat="server" Enabled="false" Text="Sculpture" />
                <div class="dropdown-category-content">
                    <asp:Button ID="animals" runat="server" CssClass="categorybtn" OnClick="Category_Click" Text="Animals" />
                    <asp:Button ID="bronzo" runat="server" CssClass="categorybtn" OnClick="Category_Click" Text="Bronzo" />
                    <asp:Button ID="wood" runat="server" CssClass="categorybtn" OnClick="Category_Click" Text="Wood" />
                </div>
            </div>
        </div>
        <div style="margin-left: 42%">
            <page:PageTitle runat="server" ID="title" PageHeader="Product Gallery"></page:PageTitle>
        </div>
        <div class="container">
            <div class="galleryContent">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="lblGalleryCategory" runat="server" Font-Size="18pt"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <div id="galley-sort-by">
                                Sort By:    
                           
                                <asp:DropDownList ID="ddlSortBy" AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged" runat="server">
                                    <asp:ListItem Selected="True">New Arrived</asp:ListItem>
                                    <asp:ListItem>Name : A to Z</asp:ListItem>
                                    <asp:ListItem>Name : Z to A</asp:ListItem>
                                    <asp:ListItem>Price: Cheap to Expensive</asp:ListItem>
                                    <asp:ListItem>Price: Expensive to Cheap</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                </table>

                <div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE QUANITTY > 0"></asp:SqlDataSource>
                    <asp:DataList ID="ProductGalleryDataList" runat="server" CellPadding="20" DataKeyField="ProductID" RepeatColumns="4" RepeatDirection="Horizontal" HorizontalAlign="Center" CssClass="alignText">
                        <ItemTemplate>
                            <table class="content">
                                <tr>
                                    <td class="img" aria-hidden="False">
                                        <div class="viewButton">

                                            <asp:HyperLink ID="view" ClientIDMode="Static" NavigateUrl='<%#"Product.aspx?id="+Eval("ProductID")%>' runat="server">View</asp:HyperLink>
                                        </div>
                                        <asp:ImageButton ID="ProductImage" runat="server" Height="220px" ImageAlign="Middle" ImageUrl='<%# Eval("path1") %>' Width="220px" PostBackUrl='<%#"ViewProduct.aspx?id="+Eval("ProductID")%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="prodName">
                                        <asp:Label ID="ProductName" runat="server" Text='<%# Eval("ProductName") %>' Font-Bold="True" Font-Size="20px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="qty">
                                        <asp:Label ID="Quantity" runat="server" Text="In Stock" Font-Size="18px" ForeColor="#33CC33"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="prodPrice">RM
                                       
                                        <asp:Label ID="ProductPrice" runat="server" Text='<%# String.Format("{0:n}",Eval("ProductPrice")) %>' Font-Size="18px"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>

                    <table id="Paging" style="display: flex; justify-content: center; margin-top: 30px; margin-bottom: 10px;" runat="server">
                        <tr>
                            <td>
                                <asp:Button ID="Button1" CssClass="pagingbtn" runat="server" Font-Bold="true" Text="First" OnClick="Button1_Click" /></td>
                            <td>
                                <asp:Button ID="Button2" CssClass="pagingbtn" runat="server" Font-Bold="true" Text="Previous" OnClick="Button2_Click" /></td>
                            <td>
                                <asp:Button ID="Button3" CssClass="pagingbtn" runat="server" Font-Bold="true" Text="Next" OnClick="Button3_Click" /></td>
                            <td>
                                <asp:Button ID="Button4" CssClass="pagingbtn" runat="server" Font-Bold="true" Text="Last" OnClick="Button4_Click" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
