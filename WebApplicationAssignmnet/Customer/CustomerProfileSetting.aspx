<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="CustomerProfileSetting.aspx.cs" Inherits="WebApplicationAssignmnet.CustomerProfile" %>
<%@ Register TagPrefix="page" TagName="PageTitle" Src="~/DynamicData/FieldTemplates/PageTitle.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <link href="../lib/css/CustomerProfile.css" rel="stylesheet" />
        <div class="container h-100 d-flex justify-content-center align-items-center">
            <div class="tab">
                <button class="tablinks">General Account Settings</button>
                <a class="exBtn" href="CustomerChangePassword.aspx">Security Settings</a>

            </div>

            <div id="generalSet" class="tabcontent">
                <page:PageTitle runat="server" ID="title" PageHeader=' General Account Settings '></page:PageTitle>
                <h2>&nbsp;<i class="fa fa-pencil-square-o" aria-hidden="true" style="margin-top:5px;"></i></h2>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustFullName], [CustGender] FROM [Customer] WHERE ([CustID] = @CustID)">
                </asp:SqlDataSource>

                Current Name:
                    <asp:Label ID="LblFullName" runat="server"></asp:Label><br />
                Gender:
                    <asp:Label ID="CustGenderLabel" runat="server"></asp:Label><br />
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
                </table>
                <div class="editBtn">
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Edit" class="pressed-confirm-button" OnClick="btnConfirm_Click" />
                </div>
            </div>

        </div>

    </form>
</asp:Content>
