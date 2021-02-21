<%@ Page Language="C#" MasterPageFile="~/WebAnony.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApplicationAssignmnet.CustomerRegister" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <link href="../lib/css/SignUp.css" rel="stylesheet" />

    <form runat="server">
        <div class="container h-100 d-flex justify-content-center align-items-center">
            <div class="row text-center" style="background-color: #F3E0DC">
                <div class="card">
                    <header class="card-header">
                        <h2 style="float: left; display: flex;">Sign up</h2>
                        <div style="float: right; display: flex;">
                            <asp:Label runat="server">By : </asp:Label>
                            <asp:DropDownList ID="DropDownListIdentification" runat="server" CssClass="line-input ddl-id" ToolTip="Identification" AutoPostBack="True">
                                <asp:ListItem Value="Customer"></asp:ListItem>
                                <asp:ListItem>Artist</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </header>
                    <article class="card-body" style="padding: 15px 20px;">
                        <table class="tblCustSignUp">
                            <tr>
                                <td class="colIcon"><i class="fa fa-github" aria-hidden="true"></i></td>
                                <td class="col-width">
                                    <asp:TextBox ID="txtFullName" CssClass="line-input" placeholder="Full Name" runat="server"></asp:TextBox>
                                </td>
                                <td class="colwidth-icon">
                                    <i class="fa fa-info-circle" title="Enter your full name."></i>
                                </td>
                                <td class="validatorMsg">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFullName" runat="server"
                                        ControlToValidate="txtFullName" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Required." />
                                </td>
                            </tr>
                            <tr>
                                <td class="colIcon"><i class="fa fa-envelope-open-o " aria-hidden="true"></i></td>
                                <td class="col-width">
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
                                <td class="colIcon"><i class="fa fa-venus-mars" aria-hidden="true"></i></td>
                                <td class="col-width">
                                    <asp:DropDownList ID="DropDownListGender" runat="server" CssClass="line-input ddl-gender" ToolTip="Gender" AutoPostBack="True">
                                        <asp:ListItem Value="Prefer not to say"></asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="colwidth-icon">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="colIcon"><i class="fa fa-lock " aria-hidden="true"></i></td>
                                <td class="col-width">
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
                                <td class="colIcon"><i class="fa fa-lock" aria-hidden="true"></i></td>
                                <td class="col-width">
                                    <asp:TextBox ID="txtPassword2" CssClass="line-input" placeholder="Re-enter Password" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                                </td>
                                <td class="colwidth-icon"><i class="fa fa-info-circle" title="Re-enter your password (8-20 char)"></i></td>
                                <td class="validatorMsg">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword2" runat="server"
                                        ControlToValidate="txtPassword2" ForeColor="Red" Display="Dynamic"
                                        ErrorMessage="Required." />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                        ErrorMessage="Invalid length."
                                        ControlToValidate="txtPassword"
                                        ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,20}$" />
                                </td>
                            </tr>
                            <tr>
                                <td style="color:red;">
                                    <asp:CompareValidator ID="CompareValidatorPasword" runat="server"
                                        ControlToValidate="txtPassword2"
                                        ControlToCompare="txtPassword"
                                        ErrorMessage="Password does not match." />
                                </td>
                            </tr>
                            <tr style="padding-bottom: 5px;">
                                <td class="colIcon">&nbsp;</td>
                                <td style="padding-bottom: 5px; white-space: nowrap">
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" ToolTip="Reset"
                                        class="pressed-cancel-button" OnClick="btnReset_Click" CausesValidation="False" UseSubmitBehavior="false" />
                                    <asp:Button ID="btnsignin" runat="server" Text="Sign up" ToolTip="Sign up" class="pressed-confirm-button" OnClick="btnsignin_Click" />

                                </td>
                                <td class="colwidth-icon">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </article>
                    <!-- card-body-->
                    <div class="border-top card-body text-center bottom-card">Have an account? <a href="Login.aspx">Log In</a></div>
                </div>
                <!-- card-->
            </div>
            <!-- col-->
        </div>
        <!--container-->
    </form>
</asp:Content>
