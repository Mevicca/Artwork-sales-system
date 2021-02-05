<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationAssignmnet.Login" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="lib/css/Login.css" rel="stylesheet"/>
    <script src="lib/js/Login.js">
        
    </script>

    <div class="container">
        <div class="row justify-content-center" style="background-color: #F3E0DC">
            <div class="col-md-6">
                <div class="card">
                    <header class="card-header">
                        <h2 style="float: left;">Login</h2>
                        <div style="float: right;">
                            <asp:Label runat="server">By : </asp:Label>
                            <asp:DropDownList ID="DropDownListIdentification" runat="server" CssClass="line-input ddl-id" ToolTip="Identification" AutoPostBack="True">
                                <asp:ListItem Value="Customer"></asp:ListItem>
                                <asp:ListItem>Artist</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </header>
                    <article class="card-body" style="padding: 15px 20px;">
                        <div class="table-responsive" style="width: auto">
                            <table class="tblLogin">
                                <tr>
                                    <td class="colIcon"><i class="fa fa-envelope-open-o " aria-hidden="true"></i></td>
                                    <td class="colwidth-240">
                                        <asp:TextBox ID="txtEmail" CssClass="line-input" placeholder="Email Address" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="colwidth-icon"><i class="fa fa-info-circle" title="Enter your email address."></i></td>
                                    <td class="validatorMsg" style='white-space: nowrap;'>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic"
                                            ErrorMessage="Required." />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server"
                                            ControlToValidate="txtEmail"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            SetFocusOnError="true" ErrorMessage="Invalid email."
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="colIcon"><i class="fa fa-lock " aria-hidden="true"></i></td>
                                    <td class="colwidth-240">
                                        <asp:TextBox ID="txtPassword" CssClass="line-input" placeholder="Password" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td class="colwidth-icon"><i class="fa fa-info-circle" title="Enter your password (8-20 char)"></i></td>
                                    <td class="validatorMsg">

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server"
                                            ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"
                                            ErrorMessage="Required." />
                                        <asp:RegularExpressionValidator ID="RegExp1" runat="server"
                                            ErrorMessage="Invalid length."
                                            ControlToValidate="txtPassword"
                                            ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,20}$" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="colIcon">&nbsp;</td>
                                    <td style="color:red;">
                                        <asp:CustomValidator ID="CustomValidator" runat="server" ErrorMessage=""></asp:CustomValidator>
                                    </td>
                                    <td class="colwidth-icon">&nbsp;</td>
                                    <td>

                                        &nbsp;</td>
                                </tr>
                                <tr style="padding-bottom: 5px;">
                                    <td class="colIcon">&nbsp;</td>
                                    <td style="padding-bottom: 5px; white-space: nowrap">
                                        <asp:Button ID="btnReset" runat="server" Text="Reset" ToolTip="Reset"
                                            class="pressed-cancel-button" OnClick="btnReset_Click" CausesValidation="False" UseSubmitBehavior="false" />
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" ToolTip="Login" class="pressed-confirm-button" OnClick="btnlogin_Click" />
                                    </td>
                                    <td class="colwidth-icon">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </article>
                    <!-- card-body-->
                    <div class="border-top card-body text-center bottom-card">Do not have an account? <a href="SignUp.aspx">Sign up</a></div>
                </div>
                <!-- card-->
            </div>
            <!-- col-->

        </div>
        <!-- row-->
    </div>
    <!--container-->
</asp:Content>
