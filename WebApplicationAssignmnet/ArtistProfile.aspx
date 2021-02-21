<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ArtistProfile.aspx.cs" Inherits="WebApplicationAssignmnet.ArtistProfile1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="profile" runat="server">
        <link href="lib/css/ArtProfile.css" rel="stylesheet" />
        <div class="container">
            <div class="profileCard">
                

                <div class="card">

                    <h1 style="font-family:'Century Gothic';">
                        <asp:Label ID="artist" runat="server" ></asp:Label></h1><br />
                    <asp:Label ID="artistBio" runat="server" CssClass="bio"></asp:Label><br />


                    <div class="contactButton">
                        <asp:HyperLink ID="contactLink" runat="server" CssClass="contactButton">Contact</asp:HyperLink>
                    </div>

                </div>
            </div>
            <div class="artwork">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductName], [path1] FROM [Products] WHERE ([ArtistID] = @id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="id" QueryStringField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" CellPadding="20" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" >
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td class="img">
                                    <asp:ImageButton ID="ProductImage" runat="server" Height="220px" ImageAlign="Middle" ImageUrl='<%# Eval("path1") %>' Width="220px"  /><%--PostBackUrl='<%#"ViewProduct.aspx?id="+Eval("ProductID")%>'--%>
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
