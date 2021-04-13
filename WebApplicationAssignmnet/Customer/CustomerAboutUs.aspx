<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="CustomerAboutUs.aspx.cs" Inherits="WebApplicationAssignmnet.CustomerAboutUs" %>
<%@ Register TagPrefix="page" TagName="AboutUsTemplate" Src="~/DynamicData/PageTemplates/AboutUs.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <form id="form1" runat="server">
       <page:AboutUsTemplate ID="page" runat="server"></page:AboutUsTemplate>
    </form>
</asp:Content>
