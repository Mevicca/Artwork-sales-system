<%@ Page Language="C#" MasterPageFile="~/WebArt.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="WebApplicationAssignmnet.AboutUs" %>
<%@ Register TagPrefix="page" TagName="PageTitle" Src="~/DynamicData/FieldTemplates/PageTitle.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../lib/css/AboutUs.css" rel="stylesheet" />
    <form id="form1" runat="server">
        <page:AboutUsTemplate ID="page" runat="server"></page:AboutUsTemplate>
    </form>
</asp:Content>
