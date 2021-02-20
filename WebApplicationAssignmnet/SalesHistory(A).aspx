<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="SalesHistory(A).aspx.cs" Inherits="WebApplicationAssignmnet.SalesHistory_A_" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" runat="Server">
    <form id="form1" runat="server">
    <link href="lib/css/Login.css" rel="stylesheet" />
    <h1>Sales History</h1>
    <div class="sort">
        <a>Sort By :</a>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Selected="True">Date</asp:ListItem>
            <asp:ListItem>Total Price</asp:ListItem>
            <asp:ListItem>Customer Name</asp:ListItem>
            <asp:ListItem>Order ID</asp:ListItem>
        </asp:DropDownList>
    </div>
    <br />
    
    <div class="container bg-white table-hover" style="margin-top:30px">
		<table class="table table-striped">
            <thead>
              <tr style="text-align:center">
                <th>Order ID</th>
                <th>Delivered Date</th>
                <th>Customer Name</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>&nbsp</th>
              </tr>
            </thead>

            <tbody>
              <tr style="text-align:center">
                <td>O1001</td>
                <td>27/12/2022</td>
                <td>Tay</td>
                <td>RM 2022</td>
                <td>Delivered</td>
                <td style="text-align:center">
                    <button type="button" class="btn btn-outline-primary" style="cursor:pointer"><i class="fa fa-search"></i>&nbsp; View Details</button>
                </td>
              </tr>
              <tr style="text-align:center">
                <td>O1002</td>
                <td>13/12/2023</td>
                <td>Mak</td>
                <td>RM 2023</td>
                <td>Delivered</td>
                <td style="text-align:center">
                    <button type="button" class="btn btn-outline-primary" style="cursor:pointer"><i class="fa fa-search"></i>&nbsp; View Details </button>
                </td>
              </tr>
            </tbody>
		</table>
    </div>
    </form>
</asp:Content>
