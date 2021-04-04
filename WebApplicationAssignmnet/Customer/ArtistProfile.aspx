<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="WebApplicationAssignmnet.ArtistProfile1" %>
<%@ Register TagPrefix="page" TagName="PageTitle" Src="~/DynamicData/FieldTemplates/PageTitle.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="profile" runat="server">
        <link href="../lib/css/ArtProfile.css" rel="stylesheet" />
        <div class="row" style="margin-left: 43%; margin-top: 5px;">
            <page:PageTitle runat="server" ID="title" PageHeader="Artist's Wall"></page:PageTitle>
        </div>
        <div class="container">

            <div class="card">
                <table>
                    <tr>
                        <td style="width: 60px;">
                            <asp:Image ID="artistPic" runat="server" CssClass="ArtistPP" />
                        </td>
                        <td>
                            <h1 style="font-family: 'Century Gothic';">
                                <asp:Label ID="artist" runat="server"></asp:Label></h1>

                            <asp:Label ID="artistBio" runat="server" CssClass="bio"></asp:Label><br />
                            <br />

                            <div class="contactButton">
                                <asp:HyperLink ID="contactLink" runat="server" CssClass="contactButton"><i class="fa fa-envelope-open-o" aria-hidden="true"></i>&nbsp;Contact Me</asp:HyperLink>
                                &nbsp;
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="artwork">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductID], [ProductName], [path1] FROM [Products] WHERE ([ArtistID] = @id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" CellPadding="20" DataSourceID="SqlDataSource1" RepeatColumns="5" RepeatDirection="Horizontal" HorizontalAlign="Center">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td class="img">
                                    <asp:ImageButton ID="ProductImage" runat="server" Height="160px" ImageAlign="Middle" ImageUrl='<%# Eval("path1") %>' Width="160px" PostBackUrl='<%#"Product.aspx?id="+Eval("ProductID")%>' />

                                </td>
                            </tr>
                            <tr>
                                <td class="prodName">
                                    <asp:Label ID="ProductName" runat="server" Text='<%# Eval("ProductName") %>' CssClass="artName"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </form>
</asp:Content>
