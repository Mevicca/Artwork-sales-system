<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerList.aspx.cs" MasterPageFile="~/WebUser.Master" Inherits="WebApplicationAssignmnet.SystemUser.CustomerList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #GridViewSales {
            width: 99%;
        }
    </style>
    <script src="../lib/js/jquery.js"></script>


    <div class="card input-group" style="margin-bottom: 10px;">
        <div class="card-body" style="border: solid; border-radius: 5px; border: brown 0.5px; margin-right: 5px;">
            <div class="data-field">
                <div class="row">
                    <h3 style="margin-left: 10px;">Customer report</h3>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label runat="server" Font-Bold="true">
                        Start Join Date :
                        </asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" runat="server" ID="StartDate" ClientIDMode="Static"></asp:TextBox>
                    </div>
                    <div class="col">
                        <asp:Label runat="server" Font-Bold="true">
                        Customer ID :
                        </asp:Label>
                        <br />
                        <asp:TextBox CssClass="form-control" ID="CustomerID" runat="server" ClientIDMode="Static"></asp:TextBox>
                        <br />
                        <br />
                    </div>
                </div>
                <div class="row" style="float: right;">
                    <div class="row" style="float: right;">
                        <button type="button" id="BtnSearch" class="btn btn-primary" onclick="clickSearch();">Search</button>
                    </div>
                </div>
                <div>
                </div>
            </div>
        </div>
    </div>

    <div class="card input-group">
        <div class="card-body" style="margin: auto; width: 100%;">
            <table id="GridViewCustomer" class="display nowrap responsive mdl-data-table">
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Customer name</th>
                        <th>Start join date</th>
                        <th>Total order</th>
                        <th>Total amount (RM)</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>

    <script>
        var table;
        $(document).ready(function () {
            redraw();
            var startdate = moment("01/01/2021", "DD/MM/YYYY").format("DD-MM-YYYY");
            $("input[id*='StartDate']").datepicker({
                format: "dd-mm-yyyy",
                defaultDate: startdate
            });
            $("input[id*='StartDate']").datepicker("setDate", startdate);

        }
        );

        function redraw() {
            var cust = $('#CustomerID').val();
            var startDate = $('#StartDate').val();
            if (startDate === undefined)
                startDate = '';
            var obj = {
                startTime: startDate,
                custID: cust
            };

            $.ajax({
                type: "POST",
                url: "CustomerList.aspx/BindDatatable",
                data: JSON.stringify(obj),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    $('#GridViewCustomer').dataTable({
                        dom: 'lBftrip',
                        buttons: [
                            'copy', 'csv', 'excel', 'pdf', 'print'
                        ],
                        data: JSON.parse(data.d),
                        columns: [
                            { 'data': 'custID' },
                            { 'data': 'custName' },
                            { 'data': 'startJoinDate' },
                            { 'data': 'totalOrder' },
                            { 'data': 'totalAmount' },
                        ],
                        "responsive": {
                            "details": {
                                "type": 'column'
                            }
                        },
                        "columnDefs": [
                            {
                                "targets": ['_all'],
                                "className": 'mdc-data-table__cell',
                                "language": {
                                    "infoEmpty": "Empty information.",
                                    "emptyTable": "No record.",
                                    "zeroRecords": "No record."
                                }
                            }]
                    });
                },
                error: function (e) {
                    console.log("Error :  ");
                    console.log(JSON.stringify(e));
                }
            });
        }

        function clickSearch() {
            debugger;
            var table = table = $('#GridViewCustomer').DataTable();
            table.destroy();
            redraw();
        }


    </script>
    <script src="../lib/js/Moment.js"></script>
</asp:Content>
