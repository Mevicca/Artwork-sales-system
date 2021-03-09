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
                    <h2 class="headerStyle">Edit Artwork Details</h2>
                </div>
                <hr />
                <br />
                <%--Table content of the details--%>
                <div class="addprodContent">
                    <table ID="addProductTb" runat="server" Width="100%" CellPadding="10" CellSpacing="20" Font-Size="18px">
                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="Label9" runat="server" Text="Label">Product ID</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="">:</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="productID" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="name" runat="server" Text="Label">Product Name</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="prodName" class="textField" Text="" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="Label7" runat="server" Text="Label">Product Category</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="categoryddl" style="min-height:30px;" class="textField" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryDesc" DataValueField="CategoryDesc">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryDesc] FROM [Category]"></asp:SqlDataSource>
                            </td>
                        </tr>

                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="desc" runat="server" Text="Label">Product Description</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <textarea id="prodDesc" class="textField" style="min-height:30px;" cols="20" rows="2" runat="server"></textarea>
                            </td>
                        </tr>

                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="price" runat="server" Text="Label">Product Price (RM)</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <input id="prodPrice" class="textField" type="number" max="" min="100" runat="server" />
                            </td>
                        </tr>

                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="date" runat="server" Text="Label">Released Date</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="releasedDate" TextMode="Date" Width="150px" AutoPostBack="true" Enabled="false" runat="server"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="qty" runat="server" Text="Label">Quantity</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <input id="quantity" type="number" style="width: 20%" min="1" max="" runat="server" />
                            </td>
                        </tr>

                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="productImage" runat="server" Text="Label">Product Image</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <input id="FileImageUpload" class="textField" type="file" multiple="multiple" name="FileImageUpload" accept="image/*"/>
                            </td>
                        </tr>
                    </table>
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
                    <div>
                         <asp:Button ID="resetCancelBtn" ClientIDMode="Static" runat="server" Text="CANCEL" OnClick="resetCancelBtn_Click" OnClientClick="return confirm('The records are not saved. Are you sure?');" />
                    </div>
                     <div class="twobtn">
                        <asp:HiddenField ID="HiddenProduct" runat="server"/>
                        <asp:Button ID="dltProduct" ClientIDMode="Static" runat="server" Text="DELETE" OnCommand="dltProduct_Click" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                        <asp:Button ID="addSaveProductbtn" ClientIDMode="Static" runat="server" Text="SAVE" OnClick="addSaveProductbtn_Click" OnClientClick="return confirm('Are you sure you want to edit this record?');"/>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>