<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="TestingArtistProfile.aspx.cs" Inherits="WebApplicationAssignmnet.TestingArtistProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form runat="server">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ArtistProfile.aspx?id=1015">HyperLink</asp:HyperLink>
    </form>
</asp:Content>
