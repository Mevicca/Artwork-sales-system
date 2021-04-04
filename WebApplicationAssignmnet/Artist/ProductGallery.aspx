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
                            <asp:DropDownList ID="ddlSortBy" AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged" runat="server">
                                <asp:ListItem>Date</asp:ListItem>
                                <asp:ListItem>Name : A to Z</asp:ListItem>
                                <asp:ListItem>Name : Z to A</asp:ListItem>
                                <asp:ListItem>Price: Cheap to Expensive</asp:ListItem>
                                <asp:ListItem>Price: Expensive to Cheap</asp:ListItem>
                            </asp:DropDownList>
                            </div>
                        </td>
                    </tr>

                </table>
                <div id="myBtnContainer" style="margin-bottom: 50px;">
                    <asp:Button ID="all" class="btn-status" Text="Show All" runat="server" OnClick="status_Click" />
                    <asp:Button ID="instock" class="btn-status" Text="In Stock" runat="server" OnClick="status_Click" />
                    <asp:Button ID="soldout" class="btn-status" Text="Sold Out" runat="server" OnClick="status_Click" />
                    <asp:Button ID="inactive" class="btn-status" Text="Inactive" runat="server" OnClick="status_Click" />
                </div>

                <div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
                    <asp:DataList ID="ProductGalleryDataList" runat="server" DataKeyField="ProductID" RepeatColumns="4" RepeatDirection="Horizontal"
                        HorizontalAlign="Center" CellPadding="10" CellSpacing="1" AllowPaging="true" PageSize="10" CssClass="alignText">
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
                                        <asp:Label ID="Quantity" runat="server" Text='<%#
                                             (Boolean.Parse(Eval("IsActive").ToString()) == false) ? "Inactive" :  (Int32.Parse(Eval("Quantity").ToString()) > 0) ?"In Stock" : "Sold Out"
                                            %>' Font-Size="18px" ForeColor="Black"></asp:Label>
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
                                <asp:Button ID="Button1" runat="server" Font-Bold="true" Text="First" OnClick="Button1_Click" /></td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Font-Bold="true" Text="Previous" OnClick="Button2_Click" /></td>
                            <td>
                                <asp:Button ID="Button3" runat="server" Font-Bold="true" Text="Next" OnClick="Button3_Click" /></td>
                            <td>
                                <asp:Button ID="Button4" runat="server" Font-Bold="true" Text="Last" OnClick="Button4_Click" /></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</asp:Content>