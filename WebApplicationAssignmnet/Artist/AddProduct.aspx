<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApplicationAssignmnet.AddProduct" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../lib/css/ArtistProductHandle.css" rel="stylesheet" />
    <script src="../lib/js/addProduct.js"></script>

    <form id="form1" method="post" enctype="multipart/form-data" runat="server">
        <div class="container">
            <%--Title--ADD NEW ARKWORK--%>
            <div class="addProd">
                <div class="addprodTitle">
                    <h2 class="headerStyle">Add New Artwork</h2>
                </div>
                <hr />
                <br />
                <div class="addprodContent">
                    <%--Table content details--%>
                    <asp:Table ID="addProductTb" runat="server" Width="100%" CellPadding="10" CellSpacing="20" Font-Size="18px">
                        <asp:TableRow>
                            <asp:TableCell Width="200px">
                                <asp:Label ID="name" runat="server" Text="Label">Product Name</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label1" runat="server" Text="Label">:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="prodName" class="textField" runat="server"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Width="200px">
                                <asp:Label ID="Label7" runat="server" Text="Label">Product Category</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label8" runat="server" Text="Label">:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="categoryddl" class="textField" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryDesc" DataValueField="CategoryDesc">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryDesc] FROM [Category]"></asp:SqlDataSource>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Width="200px">
                                <asp:Label ID="desc" runat="server" Text="Label">Product Description</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label2" runat="server" Text="Label">:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <textarea id="prodDesc" class="textField" cols="20" rows="2" runat="server"></textarea>
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Width="200px">
                                <asp:Label ID="price" runat="server" Text="Label">Product Price (RM)</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label3" runat="server" Text="Label">:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <input id="prodPrice" class="textField" type="number" runat="server" />
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Width="200px">
                                <asp:Label ID="date" runat="server" Text="Label">Released Date</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label4" runat="server" Text="Label">:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <input id="releasedDate" style="width: 20%" type="date" runat="server" />
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Width="200px">
                                <asp:Label ID="qty" runat="server" Text="Label">Quantity</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label5" runat="server" Text="Label">:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <input id="quantity" type="number" style="width: 20%" runat="server" />
                            </asp:TableCell>
                        </asp:TableRow>

                        <asp:TableRow>
                            <asp:TableCell Width="200px">
                                <asp:Label ID="productImage" runat="server" Text="Label">Product Image</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label6" runat="server" Text="Label">:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <input id="FileImageUpload" class="textField" type="file" multiple="multiple" name="FileImageUpload" accept="image/*" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
                <%--Display posted images--%>
                <div id="showImage">
                </div>
                <br />
                <hr />
                <div class="controlbtn">
                    <div>
                    <asp:Button ID="backBtn" ClientIDMode="Static" runat="server" Text="BACK" PostBackUrl="ProductGallery.aspx" />
                    </div>
                    <div class="twobtn">
                    <input id="resetCancelBtn" type="reset" value="RESET" />
                    <asp:Button ID="addSaveProductbtn" ClientIDMode="Static" runat="server" Text="ADD" PostBackUrl="ProductGallery.aspx" />
                </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
