<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="WebApplicationAssignmnet.AboutUs" %>
<%@ Register TagPrefix="page" TagName="AboutUsTemplate" Src="~/DynamicData/PageTemplates/AboutUs.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       <page:AboutUsTemplate ID="page" runat="server"></page:AboutUsTemplate>
</asp:Content>
