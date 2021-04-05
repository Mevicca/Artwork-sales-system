<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApplicationAssignmnet.AddProduct" %>

<%@ Register TagPrefix="page" TagName="PageTitle" Src="~/DynamicData/FieldTemplates/PageTitle.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../lib/css/ArtistProductHandle.css" rel="stylesheet" />
    <script src="../lib/js/addProduct.js"></script>
    <link href="../lib/sweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="../lib/sweetAlert/sweetalert.js"></script>
    <script>
        function successalert(stitle, stext) {
            swal({
                title: stitle,
                text: stext,
                type: 'success'
            });
        }
        function failalert(ftitle, ftext) {
            swal({
                title: ftitle,
                text: ftext,
                type: 'error'
            });
        }
        $(function () {
            $("[id*=FileImageUpload]").change(function () {
                if (typeof (FileReader) != "undefined") {
                    var dvPreview = $("#showImage");
                    dvPreview.html("");
                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    $($(this)[0].files).each(function () {
                        var file = $(this);
                        if (regex.test(file[0].name.toLowerCase())) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                var img = $("<img />");
                                img.attr("style", "height:100px;width: 100px");
                                img.attr("src", e.target.result);
                                dvPreview.append(img);
                            }
                            reader.readAsDataURL(file[0]);
                        } else {
                            alert(file[0].name + " is not a valid image file.");
                            dvPreview.html("");
                            return false;
                        }
                    });
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            });
        });
    </script>
    <form id="form1" method="post" enctype="multipart/form-data" runat="server">
        <div class="container">
            <%--Title--ADD NEW ARTWORK--%>
            <div class="addProd">

                <div class="row">
                    <page:PageTitle runat="server" ID="title" PageHeader="Add New Artwork"></page:PageTitle>
                </div>
                <hr />
                <br />
                <div class="addprodContent">
                    <%--Table content details--%>
                    <table id="addProductTb" runat="server" width="100%" cellpadding="10" cellspacing="20" font-size="18px">
                        <tr>
                            <td style="width: 200px;">
                                <asp:Label ID="name" runat="server" Text="Label">Product Name</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="prodName" class="textField" runat="server"></asp:TextBox>
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
                                <asp:DropDownList ID="categoryddl" class="textField" Style="min-height: 30px;" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryDesc" DataValueField="CategoryDesc">
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
                                <textarea id="prodDesc" class="textField" maxlength="50" style="min-height: 35px; max-height: 50px" cols="20" rows="2" runat="server"></textarea>
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
                                <input id="releasedDate" style="width: 150px" type="date" runat="server" />
                            </td>
                            <td class="validatorMsg"><%--required msg--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ControlToValidate="releasedDate" ForeColor="Red" Display="Dynamic"
                                    ErrorMessage="Required." />
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
                                <asp:FileUpload ID="FileImageUpload" runat="server" AllowMultiple="true" />
                            </td>
                        </tr>
                    </table>
                </div>
                <%--Display posted images--%>
                <div id="showImage">
                </div>
                <br />
                <hr />
                <div class="controlbtn">
                    <div>
                        <asp:Button ID="resetCancelBtn" CssClass="cancel" ClientIDMode="Static" runat="server" Text="Cancel" CausesValidation="false" OnClick="backBtn_Click" OnClientClick="return confirm('The records are not saved. Are you sure?');" />
                    </div>
                    <div class="twobtn">
                        <asp:Button ID="addSaveProductbtn" CssClass="confrim" ClientIDMode="Static" runat="server" Text="Add" OnClick="addSaveProductbtn_Click" OnClientClick="return confirm('Are you sure you want to add new Artwork?');" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
