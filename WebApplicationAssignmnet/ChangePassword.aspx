<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebApplicationAssignmnet.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <link href="lib/css/CustomerProfile.css" rel="stylesheet" />
        <div class="container h-100 d-flex justify-content-center align-items-center">
            <div class="tab">
                <asp:HyperLink ID="AccSet" runat="server" CssClass="exBtn" >General Account Settings</asp:HyperLink>
                <button class="tablinks">Security Settings</button>

            </div>

            <div id="generalSet" class="tabcontent">
                <h3><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Change Password </h3>
                <br />

                <table>
                    <tr>
                        <td class="colIcon"><i class="fa fa-lock " aria-hidden="true"></i></td>
                        <td class="col-width">
                            <asp:TextBox ID="currentPassword" CssClass="line-input" placeholder="Current Password" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                        </td>
                        <td class="colwidth-icon"><i class="fa fa-info-circle" title="Enter your current password (8-20 char)"></i></td>
                        <td class="validatorMsg">

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="currentPassword" ForeColor="Red" Display="Dynamic"
                                ErrorMessage="Required." />
                        </td>
                    </tr>
                    
                    <tr>
                        <td><i class="fa fa-lock " aria-hidden="true"></i></td>
                        <td class="col-width">
                            <asp:TextBox ID="txtPassword" CssClass="line-input" placeholder="New Password" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                        </td>
                        <td class="colwidth-icon"><i class="fa fa-info-circle" title="Enter your password (8-20 char)"></i></td>
                        <td class="validatorMsg">

                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server"
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"
                                ErrorMessage="Required." />
                            <asp:RegularExpressionValidator ID="RegExp1" runat="server"
                                ErrorMessage="Invalid length."
                                ControlToValidate="txtPassword" ForeColor="Red"
                                ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,20}$" />
                        </td>
                    </tr>
                    <tr>
                        <td><i class="fa fa-lock" aria-hidden="true"></i></td>
                        <td class="col-width">
                            <asp:TextBox ID="txtPassword2" CssClass="line-input" placeholder="Re-enter Password" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                        </td>
                        <td class="colwidth-icon"><i class="fa fa-info-circle" title="Re-enter your password (8-20 char)"></i></td>
                        <td class="validatorMsg">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword2" runat="server"
                                ControlToValidate="txtPassword2" ForeColor="Red" Display="Dynamic"
                                ErrorMessage="Required." />
                        </td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td style="color: red; ">
                            <asp:CompareValidator ID="CompareValidatorPasword" runat="server"
                                ControlToValidate="txtPassword2"
                                ControlToCompare="txtPassword"
                                ErrorMessage="Password does not match." />
                        </td>
                    </tr>
                </table>
                <div class="editBtn" style="margin-top: 65px;margin-left: 250px;">
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Change Password" class="pressed-confirm-button" OnClick="btnConfirm_Click" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>
