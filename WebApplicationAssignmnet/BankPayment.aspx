<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankPayment.aspx.cs" Inherits="WebApplicationAssignmnet.BankPayment" %>

<link href="lib/bootstrap-4.0.0-dist/css/bootstrap.min.css" rel="stylesheet" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bank Details</title>
</head>

<body>
    <link href="lib/css/BankPayment.css" rel="stylesheet" />
    <link href="lib/sweetAlert/sweetalert.css" rel="stylesheet" />
    <script src="lib/sweetAlert/sweetalert.js"></script>
    <script type="text/javascript">
        function successalert(stitle, stext) {
            swal({
                title: stitle,
                text: stext,
                type: 'success'
            });
        }
        function failalert(ftitle, ftext) {
            swal({
                title: ftitle,
                text: ftext,
                type: 'error'
            });
        }
    </script>
    <form id="form1" runat="server">
        <div class="container">
            <div>
                <h3>
                    <asp:Label ID="BankName" runat="server" ClientIDMode="Static"></asp:Label>
                    Payment Agent</h3>
                <div class="justify-content-center ">
                    <asp:Table ID="TablePaymentDetails" runat="server" ClientIDMode="Static" CellPadding="10" CellSpacing="10">
                        <asp:TableRow>
                            <asp:TableCell>From Account       </asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>8797321234</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell><strong>TransactionDetails</strong></asp:TableCell>
                            <asp:TableCell><strong>:- </strong> </asp:TableCell>
                            <asp:TableCell></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Transaction ID</asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>2102181757520634</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="PAC" Visible="false">
                            <asp:TableCell>PAC No</asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox runat="server" ID="TxtPAC" autocomplete="off"></asp:TextBox></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Serial Number</asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>1</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Seller ID</asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>SE00099999</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Seller Description</asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>TAYY ART (M) SDN BHD</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Order Number </asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>518142976</asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Amount </asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>MYR
                                <asp:Label ID="Amount" runat="server"></asp:Label></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell>Service Charge</asp:TableCell>
                            <asp:TableCell> : </asp:TableCell>
                            <asp:TableCell>MYR 0.00</asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <div class="row" style="display: flex; align-items: center; margin-top: 30px; margin-left: 5px;">
                        <asp:Button runat="server" ID="CancelBtn" OnClick="CancelBtn_Click" Text="Cancel" CssClass="btn btn-warning" Width="100px" />
                        <asp:Button runat="server" ID="PACBtn" OnClick="PAC_Click" Text="Request PAC Now" CssClass="btn btn-warning" Width="200px" />
                        <asp:Button runat="server" ID="AcceptBtn" OnClick="Accept_Click" Enable="False" Text="Accept" CssClass="btn btn-warning" Width="100px" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
