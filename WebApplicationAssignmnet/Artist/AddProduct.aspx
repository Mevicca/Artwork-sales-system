<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="WebApplicationAssignmnet.AddProduct" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="../lib/css/ArtistProductHandle.css" rel="stylesheet" />
    <script src="../lib/js/addProduct.js"></script>

    <form id="form1" method="post" enctype="multipart/form-data" runat="server">
        <div class="container">
            <%--Title--ADD NEW ARTWORK--%>
            <div class="addProd">
                <div class="addprodTitle">
                    <h2 class="headerStyle">Add New Artwork</h2>
                </div>
                <hr />
                <br />
                <div class="addprodContent">
                    <%--Table content details--%>
                    <table ID="addProductTb" runat="server" Width="100%" CellPadding="10" CellSpacing="20" Font-Size="18px">
                        <tr>
                            <td style="width:200px;">
                                <asp:Label ID="name" runat="server" Text="Label">Product Name</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Label">:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="prodName" class="textField" runat="server"></asp:TextBox>
                            </td>
                            <td class="validatorMsg"> <%--required msg--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorprodName" runat="server"
                                        ControlToValidate="prodName" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Required." />
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
                                <asp:DropDownList ID="categoryddl" class="textField" Height="35px" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryDesc" DataValueField="CategoryDesc">
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
                                <textarea id="prodDesc" class="textField" maxlength="50" style="min-height:35px; max-height:50px" cols="20" rows="2" runat="server"></textarea>
                            </td>
                            <td class="validatorMsg"> <%--required msg--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="prodDesc" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Required." />
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
                            <td class="validatorMsg"> <%--required msg--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="prodPrice" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Required." />
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
                                <input id="releasedDate" style="width: 25%" type="date" runat="server" />
                            </td>
                            <td class="validatorMsg"> <%--required msg--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="releasedDate" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Required." />
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
                                <input id="quantity" type="number" style="width: 25%" min="1" max="" runat="server" />
                            </td>
                            <td class="validatorMsg"> <%--required msg--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                        ControlToValidate="quantity" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Required." />
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
                                <input id="FileImageUpload" class="textField" style="width:50px;" type="file" multiple="multiple" name="FileImageUpload" accept="image/*" runat="server"/>
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
                    <asp:Button ID="resetCancelBtn" ClientIDMode="Static" runat="server" Text="BACK" CausesValidation="false" OnClick="backBtn_Click" OnClientClick="return confirm('The records are not saved. Are you sure?');"/>
                    </div>
                    <div class="twobtn">
                    <asp:Button ID="addSaveProductbtn" ClientIDMode="Static" runat="server" Text="ADD" OnClick="addSaveProductbtn_Click" OnClientClick="return confirm('Are you sure you want to add new Artwork?');"/>
                </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
