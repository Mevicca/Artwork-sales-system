<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="WebApplicationAssignmnet.ResetPassword" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <link href="lib/css/ResetPassword.css" rel="stylesheet" />
    <form runat="server">
        <div class="container h-100 d-flex justify-content-center align-items-center">
            <div class="card">
                <header class="card-header">
                    <h3 style="float: left; display: flex;">Reset Password</h3>
                    <div style="float: right; display: flex;">
                        <asp:Label runat="server">By : </asp:Label>
                        <asp:DropDownList ID="DropDownListIdentification" runat="server" CssClass="line-input ddl-id" ToolTip="Identification" AutoPostBack="True">
                            <asp:ListItem Value="Customer"></asp:ListItem>
                            <asp:ListItem>Artist</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </header>
                <article class="card-body" style="padding: 15px 20px;">
                    <div class="email">
                        <div class="row lblForgot">
                            Forgot your password ?
                        </div>
                        <div class="row" style="display: flex;">
                            <asp:TextBox class="line-input" runat="server" Placeholder="Email address" ID="txtEmail" Width="250"></asp:TextBox>
                            <asp:Button runat="server" ID="BtnSend" Text="Send" OnClick="BtnSend_Click" ClientIDMode="Static" CssClass="btn btn-outline-info" Width="150" />
                        </div>
                    </div>
                    <div class="row reset-form">
                        <asp:TextBox CssClass="line-input" runat="server" Text="" Placeholder="PIN number" ID="txtPin" Visible="false" Width="250"></asp:TextBox>
                        <asp:TextBox runat="server" ID="txtChange" Text="" Visible="false" TextMode="Password" />
                        <asp:Button runat="server" ID="BtnCheck" Text="Apply" Visible="false" OnClick="BtnCheck_Click" ClientIDMode="Static" CssClass="btn btn-outline-info" Width="150" />
                        <asp:Button runat="server" ID="BtnChange" Text="Change Password" Visible="false" OnClick="BtnChange_Click" ClientIDMode="Static" Width="150" CssClass="btn btn-outline-info" />
                    </div>
                    <div class="row">
                        <asp:Label ID="ErrorMsg" runat="server" ForeColor="red"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server"
                            ControlToValidate="txtChange" ForeColor="Red" Display="Dynamic"
                            ErrorMessage="Required." Enabled="false" />
                        <asp:RegularExpressionValidator ID="RegExp1" runat="server"
                            ErrorMessage="Invalid length."
                            ControlToValidate="txtChange"
                            ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,20}$" Enabled="false" />
                    </div>
                </article>
                <!-- card-body-->
                <div class="border-top card-body text-center bottom-card">
                    <asp:HyperLink runat="server" NavigateUrl="~/Login.aspx">Back to login page</asp:HyperLink>
                    <asp:HiddenField ID="Hidden" runat="server" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>
