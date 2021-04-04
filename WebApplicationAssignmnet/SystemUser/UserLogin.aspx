<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="WebApplicationAssignmnet.SystemUser.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="width:100%">
<head runat="server">
    <title></title>
</head>
<body style="width: 100%; height:100%; background-color: brown;">
    <form id="form1" runat="server">
        <div>
            <%-- <asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="310px" TextLayout="TextOnTop" Width="396px">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <LayoutTemplate>--%>
            <div class="container h-100 d-flex justify-content-center align-items-center">
            <table cellpadding="4" cellspacing="0" style="border-collapse: collapse; margin:auto; background-color: white;">
                <tr>
                    <td>
                        <table cellpadding="0" style="height: 310px; width: 396px;">
                            <tr>
                                <td align="center" style="color: White; background-color: #990000; font-size: 0.9em; font-weight: bold;">TAYY Artwork</td>
                            </tr>
                            <tr>
                                <td align="center" style="color: darkblue; background-color: white; font-size: 0.9em; font-weight: bold;">Log In</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User ID:</asp:Label>
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
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="color: Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="LoginButton" runat="server" BackColor="White" BorderColor="#CC9966" OnClick="LoginButton_Click" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" Text="Log In" ValidationGroup="Login1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <%--</LayoutTemplate>
                <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                <TextBoxStyle Font-Size="0.8em" />
                <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
            </asp:Login>--%>
        </div>
            </div>
    </form>
</body>
</html>
