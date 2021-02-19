<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bank.aspx.cs" Inherits="WebApplicationAssignmnet.Bank" %>

<link href="lib/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" />
<!DOCTYPE html>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank</title>
</head>
<body>
    <link href="lib/css/Bank.css" rel="stylesheet" />
    <form id="formBankLogin" runat="server">
            <div class="container h-100 d-flex justify-content-center align-items-center">
                <div class="row bank-back" style="background-color:blanchedalmond;">
                    <div class="col-sm-4" style="place-self: center;margin-left: 40px;">
                        <h3>
                            <asp:Label ID="TxtBankName" runat="server" Text="" Font-Bold="true" Font-Italic="true" Font-Size="Larger" ClientIDMode="Static"></asp:Label>
                        </h3>
                    </div>
                    <table style="border-collapse: collapse;" class="col-sm-5">
                        <tr>
                            <td>
                                <table style="height: 300px; width: 400px; background-color:white; color:darkblue;">
                                    <tr>
                                        <td style="color: White; background-color: #990000; font-size: 1.5em; font-weight: bold;text-align: center;">Log In</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." Checked="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="color: Red; text-align: center;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" Height="35px" Text="Log In" ValidationGroup="Login1" Width="60px" OnClick="Login1_Authenticate" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
    </form>
</body>
</html>
