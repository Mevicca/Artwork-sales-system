<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="WebApplicationAssignmnet.EditProduct" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../lib/css/ArtistProductHandle.css" rel="stylesheet" />
    
    <script>
        $(function () {
            $("#FileImageUpload").change(function () {
                $('#showPreviousImage').css("display", "none");

                var previewimages = $("#showImage");
                previewimages.html("");

                $($(this)[0].files).each(function () {
                    var file = $(this);
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        var img = $("<img />");
                        img.attr("style", "height:150px; width:150px;");
                        img.attr("src", e.target.result);
                        previewimages.append(img);
                    }
                    reader.readAsDataURL(file[0]);
                });
            });
        });
        
    </script>

    <form id="form1" method="post" enctype="multipart/form-data" runat="server">
        <div class="container">
            <div class="addProd">
                <%--Title--EDIT ARTWORK DETAILS--%>
                <div class="addprodTitle">
                    <h3>Edit Artwork Details</h3>
                    <asp:HyperLink NavigateUrl="ProductGallery.aspx" runat="server">
                        <i class="fa fa-trash-o" id="dltProduct" aria-hidden="true"></i>
                    </asp:HyperLink>
                </div>
                <hr />
                <br />
                <%--Table content of the details--%>
                <div class="addprodContent">
                    <asp:Table ID="addProductTb" runat="server" Width="100%" CellPadding="10" CellSpacing="20" Font-Size="18px">
                        <asp:TableRow>
                            <asp:TableCell Width="200px">
                                <asp:Label ID="Label9" runat="server" Text="Label">Product ID</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="Label10" runat="server" Text="">:</asp:Label>
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:Label ID="productID" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>

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
                                <asp:TextBox ID="releasedDate" TextMode="Date" Width="150px" AutoPostBack="true" Enabled="false" runat="server"></asp:TextBox>
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
                                <input id="quantity" type="number" style="width: 20%; min-width:150px;" runat="server" />
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
                                <input id="FileImageUpload" class="textField" type="file" multiple="multiple" name="FileImageUpload" accept="image/*"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </div>
                <%--Display db images--%>
                <div id="showPreviousImage">
                    <asp:Image ID="ImgPath1" runat="server" Width="150px" Height="150px"/>
                    <asp:Image ID="ImgPath2" runat="server" Width="150px" Height="150px"/>
                    <asp:Image ID="ImgPath3" runat="server" Width="150px" Height="150px"/>
                </div>
                <%--Display posted images--%>
                <div id="showImage">
                    </div>
                <br />
                <hr />
                <div class="controlbtn">
                    <asp:Button ID="resetCancelBtn" ClientIDMode="Static" runat="server" Text="CANCEL" PostBackUrl="ProductGallery.aspx" />
                    <asp:Button ID="addSaveProductbtn" ClientIDMode="Static" runat="server" Text="SAVE" PostBackUrl="ProductGallery.aspx" />
                </div>
            </div>
        </div>
    </form>

</asp:Content>