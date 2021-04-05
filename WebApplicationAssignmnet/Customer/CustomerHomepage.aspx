<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Web.Master" CodeBehind="CustomerHomepage.aspx.cs" Inherits="WebApplicationAssignmnet.CustomerHomepage" %>
<%@ Register TagPrefix="page" TagName="HomePageTemplate" Src="~/DynamicData/PageTemplates/HomePage.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <page:HomePageTemplate runat="server" ID="Homepage"></page:HomePageTemplate>
</asp:Content>
