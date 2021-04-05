<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WebArt.Master" CodeBehind="Homepage.aspx.cs" Inherits="WebApplicationAssignmnet.Homepage" %>
<%@ Register TagPrefix="page" TagName="HomePageTemplate" Src="~/DynamicData/PageTemplates/HomePage.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">   
    <page:HomePageTemplate runat="server" ID="Homepage"></page:HomePageTemplate>
</asp:Content>
