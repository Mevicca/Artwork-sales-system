<%@ Page Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="OrderPage(A).aspx.cs" Inherits="WebApplicationAssignmnet.OrderPage_A_" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder" Runat="Server">
    <link href="lib/css/OrderPage(A).css" rel="stylesheet" />
    <script src="lib/js/OrderPage(A).js"></script>
    <form id="form1" runat="server">
    <link href="lib/css/Login.css" rel="stylesheet" />
    <h1>Sales Order</h1>
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
                <th>Order Date</th>
                <th>Release Date</th>
                <th>Customer Name</th>
                <th>Total Price</th>
                <th>Status</th>
                <th>&nbsp</th>
              </tr>
            </thead>

            <tbody>
              <tr style="text-align:center">
                <td>O1001</td>
                <td>12/12/2022</td>
                <td>20/12/2022</td>
                <td>Tay</td>
                <td>RM 2022</td>
                <td>Shipping</td>
                <td style="text-align:center">
                    <button type="button" class="btn btn-outline-primary" style="cursor:pointer"><i class="fa fa-search"></i>&nbsp; View Details</button>
                     &nbsp;
                    <button type="button" class="btn btn-outline-danger" id="cancel" style="cursor:pointer" onclick="comfirmMsg()"><i class="fa fa-trash"></i>&nbsp; Cancel Order</button>
                </td>
              </tr>
              <tr style="text-align:center">
                <td>O1002</td>
                <td>13/12/2023</td>
                <td></td>
                <td>Mak</td>
                <td>RM 2023</td>
                <td>To Ship</td>
                <td style="text-align:center">
                    <button type="button" class="btn btn-outline-primary" style="cursor:pointer"><i class="fa fa-search"></i>&nbsp; View Details</button>
                     &nbsp;
                    <button type="button" class="btn btn-outline-danger" onclick="comfirmMsg()" style="cursor:pointer"><i class="fa fa-trash"></i>&nbsp; Cancel Order</button>
                </td>
              </tr>
            </tbody>
		</table>
    </div>
    </form>

</asp:Content>
