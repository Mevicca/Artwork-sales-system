<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="WebApplicationAssignmnet.EditProduct" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../lib/css/ArtistProductHandle.css" rel="stylesheet" />

    <script type="text/javascript">
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
                    <h2 class="headerStyle">
                        <asp:Label ID="title" runat="server" Text="View Artwork Details"></asp:Label>
                    </h2>
                </div>
                <hr />
                <br />
                <%--Table content of the details--%>
                <div class="addprodContent">
                    <table id="addProductTb" runat="server" width="100%" cellpadding="10" cellspacing="20" font-size="18px">
                        <tr>
                            <td style="width: 200px;">
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
                            <td style="width: 200px;">
                                <asp:Label ID="name" runat="server" Text="Label">Product Name</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="prodName" class="textField" Text="" runat="server"></asp:TextBox>
                            </td>
                            <td class="validatorMsg"><%--required msg--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorprodName" runat="server"
                                    ControlToValidate="prodName" ForeColor="Red" Display="Dynamic"
                                    ErrorMessage="Required." />
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 200px;">
                                <asp:Label ID="Label7" runat="server" Text="Label">Product Category</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="categoryddl" Style="min-height: 30px;" class="textField" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryDesc" DataValueField="CategoryDesc">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryDesc] FROM [Category]"></asp:SqlDataSource>
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 200px;">
                                <asp:Label ID="desc" runat="server" Text="Label">Product Description</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <textarea id="prodDesc" class="textField" style="min-height: 30px;" cols="20" rows="2" runat="server"></textarea>
                            </td>
                            <td class="validatorMsg"><%--required msg--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="prodDesc" ForeColor="Red" Display="Dynamic"
                                    ErrorMessage="Required." />
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 200px;">
                                <asp:Label ID="price" runat="server" Text="Label">Product Price (RM)</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <input id="prodPrice" class="textField" type="number" max="" min="100" runat="server" />
                            </td>
                            <td class="validatorMsg"><%--required msg--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="prodPrice" ForeColor="Red" Display="Dynamic"
                                    ErrorMessage="Required." />
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 200px;">
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
                            <td style="width: 200px;">
                                <asp:Label ID="qty" runat="server" Text="Label">Quantity</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <input id="quantity" type="number" style="width: 150px" min="1" max="" runat="server" />
                            </td>
                            <td class="validatorMsg"><%--required msg--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ControlToValidate="quantity" ForeColor="Red" Display="Dynamic"
                                    ErrorMessage="Required." />
                            </td>
                        </tr>

                        <tr>
                            <td style="width: 200px;">
                                <asp:Label ID="productImage" runat="server" Text="Label">Product Image</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <%--Display db images--%>
                                <div id="showPreviousImage">
                                    <asp:Image ID="ImgPath1" runat="server" Width="150px" Height="150px" />
                                    <asp:Image ID="ImgPath2" runat="server" Width="150px" Height="150px" />
                                    <asp:Image ID="ImgPath3" runat="server" Width="150px" Height="150px" />
                                </div>
                                <%--Display posted images--%>
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="showImage">
                </div>
                <br />
                <hr />
                <div class="controlbtn">
                    <div>
                        <asp:Button ID="back" CssClass="cancel" ClientIDMode="Static" runat="server" Text="Back" OnClick="back_Click" />
                        <asp:Button ID="cancel" CssClass="cancel" ClientIDMode="Static" runat="server" Text="Cancel" OnClick="cancel_Click" OnClientClick="return confirm('The records are not saved. Are you sure?');" />
                    </div>
                    <div class="twobtn">
                        <asp:HiddenField ID="HiddenProduct" runat="server" />
                        <asp:Button ID="dltProduct" ClientIDMode="Static" runat="server" Text="Deactivate" OnCommand="dltProduct_Click" OnClientClick="return confirm('Are you sure to deactivate this artwork?');" />
                        <asp:Button ID="edit" CssClass="confrim" ClientIDMode="Static" runat="server" Text="Edit" OnClick="edit_Click" />
                        <asp:Button ID="save" CssClass="confrim" ClientIDMode="Static" runat="server" Text="Save" OnClick="save_Click" OnClientClick="return confirm('Are you sure to edit this artwork?');" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
