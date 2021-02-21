<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ArtistProfileSetting.aspx.cs" Inherits="WebApplicationAssignmnet.ArtistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <link href="lib/css/CustomerProfile.css" rel="stylesheet" />
        <link href="lib/css/ArtistProfile.css" rel="stylesheet" />
        <div class="container h-100 d-flex justify-content-center align-items-center">
            <div class="tab">
                <button class="tablinks">General Account Settings</button>
                <a class="exBtn" href="ChangePassword.aspx">Security Settings</a>

            </div>

            <div id="generalSet" class="tabcontent">
                <h3><i class="fa fa-pencil-square-o" aria-hidden="true"></i> General Account Settings </h3>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ArtFullName], [ArtGender], [ArtBio] FROM [Artist]">
                </asp:SqlDataSource>

                Current Name:
                    <asp:Label ID="LblFullName" runat="server"></asp:Label><br />
                Gender:
                    <asp:Label ID="ArtGenderLabel" runat="server"></asp:Label><br />
                Bio:
                    <asp:Label ID="ArtBioLbl" runat="server" CssClass="font-italic"></asp:Label><br />
                <br />
                <table>
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
                        <td class="colIcon"><i class="fa fa-address-card" aria-hidden="true"></i></td>
                        <td class="col-width">
                            <asp:TextBox ID="TextBio" CssClass="line-input" placeholder="Add your bio" runat="server"></asp:TextBox>
                        </td>
                        
                    </tr>
                </table>
                <div class="editBtn">
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Edit" class="pressed-confirm-button" OnClick="BtnConfirm_Click" />
                </div>
            </div>

        </div>

    </form>
</asp:Content>
