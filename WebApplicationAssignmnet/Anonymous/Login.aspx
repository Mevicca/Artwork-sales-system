<%@ Page Language="C#" MasterPageFile="~/WebAnony.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationAssignmnet.Login" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <link href="../lib/css/Login.css" rel="stylesheet" />
   
    <form runat="server">
        <div class="container h-100 d-flex justify-content-center align-items-center">
            <div class="row text-center" style="background-color: #F3E0DC">
                <div class="card">
                    <header class="card-header">
                        <h2 style="float: left; display: flex;">Login</h2>
                        <div style="float: right; display: flex;">
                            <asp:Label runat="server">By : </asp:Label>
                            <asp:DropDownList ID="DropDownListIdentification" runat="server" CssClass="line-input ddl-id" ToolTip="Identification" AutoPostBack="True">
                                <asp:ListItem Value="Customer"></asp:ListItem>
                                <asp:ListItem>Artist</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </header>
                    <article class="card-body" style="padding: 15px 20px;">

                        <table class="tblLogin">
                            <tr>
                                <td class="colIcon"><i class="fa fa-envelope-open-o " aria-hidden="true"></i></td>
                                <td class="colwidth-input">
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
                                <td class="colwidth-input">
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
                                <td style="color: red;">
                                    <asp:CustomValidator ID="CustomValidator" runat="server" ErrorMessage=""></asp:CustomValidator>
                                </td>
                                <td class="colwidth-icon">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkPersistCookie" runat="server" AutoPostBack="false" />
                                    Remember Me ?    
                                </td>
                            </tr>
                            <tr style="padding-bottom: 5px;">
                                <td class="colIcon"></td>
                                <td style="padding-bottom: 5px; white-space: nowrap">
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" ToolTip="Reset"
                                        CssClass="pressed-cancel-button" OnClick="btnReset_Click" CausesValidation="False" UseSubmitBehavior="false" />
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" ToolTip="Login" CssClass="pressed-confirm-button" OnClick="btnlogin_Click" />
                                </td>
                                <td class="colwidth-icon">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </article>
                    <!-- card-body-->
                    <div class="border-top card-body text-center bottom-card">
                        Do not have an account? 
                        <asp:HyperLink runat="server" NavigateUrl="SignUp.aspx">Sign up</asp:HyperLink><br />
                        Forget Password ?
                        <asp:HyperLink runat="server" NavigateUrl="ResetPassword.aspx">Reset</asp:HyperLink>
                    </div>
                </div>
                <!-- card-->
            </div>
            <!-- row-->
        </div>
        <!--container-->
    </form>
</asp:Content>
